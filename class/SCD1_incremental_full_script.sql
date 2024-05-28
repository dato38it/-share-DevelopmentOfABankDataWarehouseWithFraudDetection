----------------------------------------------------------------------------
-- Подготока данных

create table de13ma.XXXX_source( 
	id integer,
	val varchar(50),
	update_dt timestamp(0)
);
insert into de13ma.XXXX_source ( id, val, update_dt ) values ( 1, 'A', now() );
insert into de13ma.XXXX_source ( id, val, update_dt ) values ( 2, 'B', now() );
insert into de13ma.XXXX_source ( id, val, update_dt ) values ( 3, 'C', now() );
update de13ma.XXXX_source set val = 'X', update_dt = now() where id = 3;
delete from de13ma.XXXX_source where id = 3;
create table de13ma.XXXX_stg( 
	id integer,
	val varchar(50),
	update_dt timestamp(0)
);
create table de13ma.XXXX_target (
	id integer,
	val varchar(50),
	create_dt timestamp(0),
	update_dt timestamp(0)
);
create table de13ma.XXXX_meta(
    schema_name varchar(30),
    table_name varchar(30),
    max_update_dt timestamp(0)
);
insert into de13ma.XXXX_meta( schema_name, table_name, max_update_dt )
values( 'de13ma','XXXX_SOURCE', to_timestamp('1900-01-01','YYYY-MM-DD') );
create table de13ma.XXXX_stg_del( 
	id integer
);
----------------------------------------------------------------------------
-- Инкрементальная загрузка
-- 1. Очистка стейджинговых таблиц
delete from de13ma.XXXX_stg;
delete from de13ma.XXXX_stg_del;
-- 2. Захват данных из источника (измененных с момента последней загрузки) в стейджинг
insert into de13ma.XXXX_stg( id, val, update_dt )
select id, val, update_dt from de13ma.XXXX_source
where update_dt > ( select max_update_dt from de13ma.XXXX_meta where schema_name='de13ma' and table_name='XXXX_SOURCE' );
-- 3. Захват в стейджинг ключей из источника полным срезом для вычисления удалений.
insert into de13ma.XXXX_stg_del( id )
select id from de13ma.XXXX_source;
-- 4. Загрузка в приемник "вставок" на источнике (формат SCD1).
insert into de13ma.XXXX_target( id, val, create_dt, update_dt )
select 
	stg.id, 
	stg.val, 
	stg.update_dt, 
	null 
from de13ma.XXXX_stg stg
left join de13ma.XXXX_target trg
on stg.id = trg.id
where trg.id is null;
-- 5. Обновление в приемнике "обновлений" на источнике (формат SCD1).
update de13ma.XXXX_target
set 
	val = tmp.val,
	update_dt = tmp.update_dt
from (
	select 
		stg.id, 
		stg.val, 
		stg.update_dt, 
		null 
	from de13ma.XXXX_stg stg
		inner join de13ma.XXXX_target trg on stg.id = trg.id
	where stg.val <> trg.val 
		or ( stg.val is null and trg.val is not null ) or ( stg.val is not null and trg.val is null )
) tmp
where XXXX_target.id = tmp.id; 
-- 6. Удаление в приемнике удаленных в источнике записей (формат SCD1).
delete from de13ma.XXXX_target
where id in (
	select trg.id
	from de13ma.XXXX_target trg
	left join de13ma.XXXX_stg_del stg
	on stg.id = trg.id
	where stg.id is null
);
-- 7. Обновление метаданных.
update de13ma.XXXX_meta
set max_update_dt = coalesce( (select max( update_dt ) from de13ma.XXXX_stg ), ( select max_update_dt from de13ma.XXXX_meta where schema_name='de13ma' and table_name='XXXX_SOURCE' ) )
where schema_name='de13ma' and table_name = 'XXXX_SOURCE';
-- 8. Фиксация транзакции.
commit;
SCD1_incremental_full_script.sql
SCD1_incremental_full_script.sql. На экране.
# Банковское хранилище данных с функцией обнаружения мошенничества

<p>
    # Администрирование локальных, виртуальных и облачных серверов.<br>
    # Разработка Хранилище данных.<br>
    <strong>Task:</strong><br>
    Администрирование локальных, виртуальных и облачных серверов. Docker установка<br>
    <strong>Decision:</strong><br>
    $ sudo apt update<br>
    $ sudo apt install apt-transport-https ca-certificates curl software-properties-common<br>
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg<br>
    $ echo"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"| sudo tee /etc/apt/sources.list.d/docker.list &gt; /dev/null<br>
    $ sudo apt update<br>
    $ apt-cache policy docker-ce<br>
    $ sudo apt install docker-ce<br>
    $ systemctl status docker<br>
    $ sudo docker run hello-world<br>
    $ sudo usermod -aG docker tuser<br>
    $ docker run hello-world<br>
    $ curl -SL https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose<br>
    $ chmod +x ~/.docker/cli-plugins/docker-compose<br>
    $ docker compose version<br>
    <strong>Task:</strong><br>
    Администрирование локальных, виртуальных и облачных серверов. Create Postgres Docker Image<br>
    <strong>Decision:</strong><br>
    $ mkdir docks<br>
    $ mkdir docks/postgres<br>
    $ touch docks/postgres/Dockerfile<br>
    $ vim docks/postgres/Dockerfile<br>
    $ cat docks/postgres/Dockerfile<br>
    FROM postgres:latest<br>
    ENV POSTGRES_USER YOUR-USERNAME<br>
    ENV POSTGRES_PASSWORD YOUR-PASSWORD<br>
    ENV POSTGRES_DB YOUR-DB<br>
    EXPOSE 5432&nbsp;<br>
    $ cd docks/postgres/<br>
    $ docker build -t YOUR-DB/postgres .<br>
    $ docker run -d --name postg -p 5432:5432 YOUR-DB/postgres<br>
    FULLYOUR-ID1<br>
    $ sudo netstat -tulpn | grep 5432<br>
    $ docker logs -f postg<br>
    $ docker ps<br>
    $ docker ps -a<br>
    CONTAINER ID&nbsp;&nbsp; IMAGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMMAND&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CREATED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PORTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAMES<br>
    YOUR-ID1&nbsp;&nbsp; YOUR-DB/postgres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "docker-entrypoint.s…"&nbsp;&nbsp; 10 hours ago&nbsp;&nbsp; Exited (255) 5 minutes ago&nbsp;&nbsp; 0.0.0.0:5432-&gt;5432/tcp, :::5432-&gt;5432/tcp&nbsp;&nbsp; postg<br>
    $ docker start postg<br>
    <strong>Task:</strong><br>
    Администрирование локальных, виртуальных и облачных серверов. Pgadmin Postgres Docker container<br>
    <strong>Decision:</strong><br>
    $ google-chrome https://www.pgadmin.org/download/ &amp;<br>
    $ curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg<br>
    $ sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" &gt; /etc/apt/sources.list.d/pgadmin4.list &amp;&amp; apt update'<br>
    $ sudo apt install pgadmin4<br>
    $ sudo /usr/pgadmin4/bin/setup-web.sh<br>
    $ docker ps -a<br>
    CONTAINER ID&nbsp;&nbsp; IMAGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMMAND&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CREATED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PORTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAMES<br>
    YOUR-ID&nbsp;&nbsp; YOUR-DB/postgres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "docker-entrypoint.s…"&nbsp;&nbsp; 45 hours ago&nbsp;&nbsp; Exited (255) 37 seconds ago&nbsp;&nbsp; 0.0.0.0:5432-&gt;5432/tcp, :::5432-&gt;5432/tcp&nbsp;&nbsp; postg<br>
    $ docker start postg<br>
    $ google-chrome http://YOUR-IP/pgadmin4 &amp;<br>
    <strong>Task:</strong><br>
    Администрирование локальных, виртуальных и облачных серверов. Stop, remove postgres container<br>
    <strong>Decision:</strong><br>
    $ docker stop postg<br>
    $ docker rm postg<br>
    $ docker push YOUR-DB/postgres<br>
    <strong>Task:</strong><br>
    Разработка Хранилище данных. Разработать ETL процесс, получающий ежедневную выгрузку данных (предоставляется за 3 дня), загружающий ее в хранилище данных и ежедневно строящий отчет.<br>
    Ежедневно некие информационные системы выгружают три следующих файла:<br>
    1. Список транзакций за текущий день. Формат – CSV.<br>
    2. Список терминалов полным срезом. Формат – XLSX.<br>
    3. Список паспортов, включенных в «черный список» - с накоплением с начала месяца. Формат – XLSX.<br>
    Сведения о картах, счетах и клиентах хранятся в СУБД PostgreSQL. Во вложении реквизиты для подключения.&nbsp;<br>
    Вам предоставляется выгрузка за последние три дня, ее надо обработать. В качестве хранилища выступает ваша учебная база (edu). Данные должны быть загружены в хранилище со следующей структурой (имена сущностей указаны по существу, без особенностей правил нейминга, указанных далее).<br>
    Типы данных в полях можно изменять на однородные если для этого есть необходимость. Имена полей менять нельзя. Ко всем таблицам SCD1 должны<br>
    быть добавлены технические поля create_dt, update_dt; ко всем таблицам SCD2 должны быть добавлены технические поля effective_from, effective_to, deleted_flg.<br>
    По результатам загрузки ежедневно необходимо строить витрину отчетности по мошенническим операциям. Витрина строится накоплением, каждый новый отчет укладывается в эту же таблицу с новым report_dt.<br>
    В витрине должны содержаться следующие поля:<br>
    1. event_dt - Время наступления события. Если событие наступило по результату нескольких действий – указывается время действия, по которому установлен факт мошенничества.<br>
    2. passport - Номер паспорта клиента, совершившего мошенническую операцию.<br>
    3. fio - ФИО клиента, совершившего мошенническую операцию.<br>
    4. phone - Номер телефона клиента, совершившего мошенническую операцию.<br>
    5. event_type - Описание типа мошенничества.<br>
    6. report_dt - Время построения отчета.<br>
    Признаки мошеннических операций:<br>
    1. Совершение операции при просроченном или заблокированном паспорте.<br>
    2. Совершение операции при недействующем договоре.<br>
    3. Совершение операций в разных городах в течение одного часа.<br>
    4. Попытка подбора суммы. В течение 20 минут проходит более 3х операций соследующим шаблоном – каждая последующая меньше предыдущей, при этом отклонены все кроме последней. Последняя операция (успешная) в такой цепочке считается мошеннической.<br>
    При именовании таблиц необходимо придерживаться следующих правил (для автоматизации проверки):<br>
    1. YOUR-USERNAME.&lt;CODE&gt;_STG_&lt;TABLE_NAME&gt; - Таблицы для размещения стейджинговых таблиц (первоначальная загрузка), промежуточное выделение инкремента, если требуется. Временные таблицы, если такие потребуются в расчете, можно также складывать с таким именованием. Имя таблиц можете выбирать произвольное, но смысловое.<br>
    2. YOUR-USERNAME.&lt;CODE&gt;_DWH_FACT_&lt;TABLE_NAME&gt; - Таблицы фактов, загруженных в хранилище. В качестве фактов выступают сами транзакции и «черный список» паспортов. Имя таблиц – как в ER диаграмме.<br>
    3. YOUR-USERNAME.&lt;CODE&gt;_DWH_DIM_&lt;TABLE_NAME&gt; - Таблицы измерений, хранящиеся в формате SCD1. Имя таблиц – как в ER диаграмме.<br>
    4. YOUR-USERNAME.&lt;CODE&gt;_DWH_DIM_&lt;TABLE_NAME&gt;_HIST - Таблицы измерений, хранящиеся в SCD2 формате (только для тех, кто выполняет усложненное задание). Имя таблиц – как в ER диаграмме.<br>
    5. YOUR-USERNAME.&lt;CODE&gt;_REP_FRAUD - Таблица с отчетом.<br>
    6. YOUR-USERNAME.&lt;CODE&gt;_META_&lt;TABLE_NAME&gt; - Таблицы для хранения метаданных. Имя таблиц можете выбирать произвольное, но<br>
    смысловое.<br>
    7. &lt;CODE&gt; - 4 буквы вашего персонального кода.<br>
    Выгружаемые файлы именуются согласно следующему шаблону:<br>
    1. transactions_DDMMYYYY.txt<br>
    2. passport_blacklist_DDMMYYYY.xlsx<br>
    3. terminals_DDMMYYYY.xlsx<br>
    Предполагается что в один день приходит по одному такому файлу. После загрузки соответствующего файла он должен быть переименован в файл с расширением .backup чтобы при следующем запуске файл не искался и перемещен в каталог archive:<br>
    1. transactions_DDMMYYYY.txt.backup<br>
    2. passport_blacklist_DDMMYYYY.xlsx.back<br>
    3. upterminals_DDMMYYYY.xlsx.backup<br>
    Желающие могут придумать, обосновать и реализовать более технологичные и учитывающие сбои способы обработки (за это будет повышен балл).<br>
    В classroom выкладывается zip-архив, содержащий следующие файлы и каталоги:<br>
    1. main.py - Файл, обязательный. Основной процесс обработки.<br>
    2. файлы с данными - Файл, обязательный. Те файлы, которые вы получили в качестве задания. Просто скопируйте все 9 файлов.<br>
    3. main.ddl - Файл, обязательный. Файл с SQL кодом для создания всех необходимых объектов в базе edu.<br>
    4. main.cron - Файл, обязательный. Файл для постановки вашего процесса на расписание, в формате crontab<br>
    5. archive - Каталог, обязательный. Пустой, сюда должны перемещаться отработанные файлы<br>
    6. sql_scripts - Каталог, необязательный. Если вы включаете в main.py какие-то SQL скрипты, вынесенные в отдельные файлы – помещайте их сюда.<br>
    7. py_scripts - Каталог, необязательный. Если вы включаете в main.py какие-то python скрипты, вынесенные в отдельные файлы – помещайте их сюда.<br>
    <strong>Decision:</strong><br>
    $ mkdir archive<br>
    $ touch main.py<br>
    $ chmod +x main.py<br>
    $ touch main.ddl<br>
    $ touch main.cron<br>
    $ cat snippet_pg.py<br>
    import psycopg2<br>
    import pandas as pd<br>
    # Создание подключения к PostgreSQL<br>
    conn = psycopg2.connect (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;database = "YOUR-DB",<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;host =&nbsp;&nbsp;&nbsp;&nbsp; "YOUR-IP",<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;user =&nbsp;&nbsp;&nbsp;&nbsp; "YOUR-USERNAME",<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;password = "YOUR-PASSWORD",<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;port =&nbsp;&nbsp;&nbsp;&nbsp; "5432"<br>
    &nbsp;&nbsp; &nbsp;)<br>
    # Отключение автокоммита<br>
    conn.autocommit = False<br>
    # Создание курсора<br>
    cursor = conn.cursor()<br>
    ####################################################<br>
    # Выполнение SQL кода в базе данных без возврата результата<br>
    cursor.execute( "INSERT INTO YOUR-USERNAME.testtable( id, val ) VALUES ( 1, 'ABC' )" )<br>
    conn.commit()<br>
    # Выполнение SQL кода в базе данных с возвратом результата<br>
    cursor.execute( "SELECT * FROM YOUR-USERNAME.testtable" )<br>
    records = cursor.fetchall()<br>
    for row in records:<br>
    &nbsp;&nbsp; &nbsp;print( row )<br>
    ####################################################<br>
    # Формирование DataFrame<br>
    names = [ x[0] for x in cursor.description ]<br>
    df = pd.DataFrame( records, columns = names )<br>
    # Запись в файл<br>
    df.to_excel( 'pandas_out.xlsx', sheet_name='sheet1', header=True, index=False )<br>
    ####################################################<br>
    # Чтение из файла<br>
    df = pd.read_excel( 'pandas.xlsx', sheet_name='sheet1', header=0, index_col=None )<br>
    # Запись DataFrame в таблицу базы данных<br>
    cursor.executemany( "INSERT INTO YOUR-USERNAME.testtable( id, val ) VALUES( %s, %s )", df.values.tolist() )<br>
    # Закрываем соединение<br>
    cursor.close()<br>
    conn.close()<br>
    $ /SCD1_incremental_full_script.sql&nbsp;<br>
    ----------------------------------------------------------------------------<br>
    -- Подготока данных<br>
    <br>
    create table YOUR-USERNAME.XXXX_source(&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;id integer,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;val varchar(50),<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;update_dt timestamp(0)<br>
    );<br>
    insert into YOUR-USERNAME.XXXX_source ( id, val, update_dt ) values ( 1, 'A', now() );<br>
    insert into YOUR-USERNAME.XXXX_source ( id, val, update_dt ) values ( 2, 'B', now() );<br>
    insert into YOUR-USERNAME.XXXX_source ( id, val, update_dt ) values ( 3, 'C', now() );<br>
    update YOUR-USERNAME.XXXX_source set val = 'X', update_dt = now() where id = 3;<br>
    delete from YOUR-USERNAME.XXXX_source where id = 3;<br>
    create table YOUR-USERNAME.XXXX_stg(&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;id integer,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;val varchar(50),<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;update_dt timestamp(0)<br>
    );<br>
    create table YOUR-USERNAME.XXXX_target (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;id integer,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;val varchar(50),<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;create_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;update_dt timestamp(0)<br>
    );<br>
    create table YOUR-USERNAME.XXXX_meta(<br>
    &nbsp;&nbsp; &nbsp;schema_name varchar(30),<br>
    &nbsp;&nbsp; &nbsp;table_name varchar(30),<br>
    &nbsp;&nbsp; &nbsp;max_update_dt timestamp(0)<br>
    );<br>
    insert into YOUR-USERNAME.XXXX_meta( schema_name, table_name, max_update_dt )<br>
    values( 'YOUR-USERNAME','XXXX_SOURCE', to_timestamp('1900-01-01','YYYY-MM-DD') );<br>
    create table YOUR-USERNAME.XXXX_stg_del(&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;id integer<br>
    );<br>
    ----------------------------------------------------------------------------<br>
    -- Инкрементальная загрузка<br>
    -- 1. Очистка стейджинговых таблиц<br>
    delete from YOUR-USERNAME.XXXX_stg;<br>
    delete from YOUR-USERNAME.XXXX_stg_del;<br>
    -- 2. Захват данных из источника (измененных с момента последней загрузки) в стейджинг<br>
    insert into YOUR-USERNAME.XXXX_stg( id, val, update_dt )<br>
    select id, val, update_dt from YOUR-USERNAME.XXXX_source<br>
    where update_dt &gt; ( select max_update_dt from YOUR-USERNAME.XXXX_meta where schema_name='YOUR-USERNAME' and table_name='XXXX_SOURCE' );<br>
    -- 3. Захват в стейджинг ключей из источника полным срезом для вычисления удалений.<br>
    insert into YOUR-USERNAME.XXXX_stg_del( id )<br>
    select id from YOUR-USERNAME.XXXX_source;<br>
    -- 4. Загрузка в приемник "вставок" на источнике (формат SCD1).<br>
    insert into YOUR-USERNAME.XXXX_target( id, val, create_dt, update_dt )<br>
    select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;stg.id,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;stg.val,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;stg.update_dt,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;null&nbsp;<br>
    from YOUR-USERNAME.XXXX_stg stg<br>
    left join YOUR-USERNAME.XXXX_target trg<br>
    on stg.id = trg.id<br>
    where trg.id is null;<br>
    -- 5. Обновление в приемнике "обновлений" на источнике (формат SCD1).<br>
    update YOUR-USERNAME.XXXX_target<br>
    set&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;val = tmp.val,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;update_dt = tmp.update_dt<br>
    from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;stg.id,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;stg.val,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;stg.update_dt,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;null&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME.XXXX_stg stg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;inner join YOUR-USERNAME.XXXX_target trg on stg.id = trg.id<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where stg.val &lt;&gt; trg.val&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;or ( stg.val is null and trg.val is not null ) or ( stg.val is not null and trg.val is null )<br>
    ) tmp<br>
    where XXXX_target.id = tmp.id;&nbsp;<br>
    -- 6. Удаление в приемнике удаленных в источнике записей (формат SCD1).<br>
    delete from YOUR-USERNAME.XXXX_target<br>
    where id in (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trg.id<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME.XXXX_target trg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME.XXXX_stg_del stg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on stg.id = trg.id<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where stg.id is null<br>
    );<br>
    -- 7. Обновление метаданных.<br>
    update YOUR-USERNAME.XXXX_meta<br>
    set max_update_dt = coalesce( (select max( update_dt ) from YOUR-USERNAME.XXXX_stg ), ( select max_update_dt from YOUR-USERNAME.XXXX_meta where schema_name='YOUR-USERNAME' and table_name='XXXX_SOURCE' ) )<br>
    where schema_name='YOUR-USERNAME' and table_name = 'XXXX_SOURCE';<br>
    -- 8. Фиксация транзакции.<br>
    commit;<br>
    SCD1_incremental_full_script.sql<br>
    SCD1_incremental_full_script.sql. На экране<br>
    $ wget https://drive.google.com/file/d/13WSK0C1Z36hhsopebgEv2bGLAoxEsLUp/view?usp=drive_web&amp;authuser=0<br>
    $ unzip data.zip<br>
    <strong>Task:</strong><br>
    Разработка Хранилище данных. Создадите таблицы в базе<br>
    <strong>Decision:</strong><br>
    $ vim main.ddl<br>
    $ cat main.ddl<br>
    #!/usr/bin/python3<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_stg_transactions(<br>
    &nbsp;&nbsp; &nbsp;trans_id varchar(15),<br>
    &nbsp;&nbsp; &nbsp;trans_date timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;--amt decimal(10,2),<br>
    &nbsp;&nbsp; &nbsp;amt numeric(10,2),&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;card_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;oper_type varchar(10),<br>
    &nbsp;&nbsp; &nbsp;oper_result varchar(10),<br>
    &nbsp;&nbsp; &nbsp;terminal varchar(10),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    create table YOUR-USERNAME.XXXX_dwh_fact_transactions(<br>
    &nbsp;&nbsp; &nbsp;trans_id varchar(15),<br>
    &nbsp;&nbsp; &nbsp;trans_date timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;--amt numeric(10,2),<br>
    &nbsp;&nbsp; &nbsp;amt decimal(10,2),<br>
    &nbsp;&nbsp; &nbsp;card_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;oper_type varchar(10),<br>
    &nbsp;&nbsp; &nbsp;oper_result varchar(10),<br>
    &nbsp;&nbsp; &nbsp;terminal varchar(10),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_stg_terminals(<br>
    &nbsp;&nbsp; &nbsp;terminal_id varchar(10),<br>
    &nbsp;&nbsp; &nbsp;terminal_type varchar(10),<br>
    &nbsp;&nbsp; &nbsp;terminal_city varchar(30),<br>
    &nbsp;&nbsp; &nbsp;terminal_address varchar(70),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    create table YOUR-USERNAME.XXXX_dwh_dim_terminals(<br>
    &nbsp;&nbsp; &nbsp;terminal_id varchar(10),<br>
    &nbsp;&nbsp; &nbsp;terminal_type varchar(10),<br>
    &nbsp;&nbsp; &nbsp;terminal_city varchar(30),<br>
    &nbsp;&nbsp; &nbsp;terminal_address varchar(70),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_from timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_to timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;deleted_flg char(1));<br>
    create table YOUR-USERNAME.XXXX_stg_del_terminals(<br>
    &nbsp;&nbsp; &nbsp;terminal_id varchar(10));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_stg_blacklist(<br>
    &nbsp;&nbsp; &nbsp;passport_num varchar(15),<br>
    &nbsp;&nbsp; &nbsp;--entry_dt date<br>
    &nbsp;&nbsp; &nbsp;entry_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    create table YOUR-USERNAME.XXXX_dwh_fact_passport_blacklist(<br>
    &nbsp;&nbsp; &nbsp;passport_num varchar(30),<br>
    &nbsp;&nbsp; &nbsp;--entry_dt date<br>
    &nbsp;&nbsp; &nbsp;--date timestamp(0)<br>
    &nbsp;&nbsp; &nbsp;entry_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_stg_cards(<br>
    &nbsp;&nbsp; &nbsp;card_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;account_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    create table YOUR-USERNAME.XXXX_dwh_dim_cards(<br>
    &nbsp;&nbsp; &nbsp;card_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;account_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;--create_dt date,<br>
    &nbsp;&nbsp; &nbsp;--update_dt date<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_from timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_to timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;deleted_flg char(1));<br>
    create table YOUR-USERNAME.XXXX_stg_del_cards(<br>
    &nbsp;&nbsp; &nbsp;card_num varchar(20));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_stg_accounts(<br>
    &nbsp;&nbsp; &nbsp;account_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;--valid_to date,<br>
    &nbsp;&nbsp; &nbsp;valid_to timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;client varchar(10),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    create table YOUR-USERNAME.XXXX_dwh_dim_accounts(<br>
    &nbsp;&nbsp; &nbsp;account_num varchar(20),<br>
    &nbsp;&nbsp; &nbsp;--valid_to date,<br>
    &nbsp;&nbsp; &nbsp;valid_to timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;client varchar(10),<br>
    &nbsp;&nbsp; &nbsp;--create_dt date,<br>
    &nbsp;&nbsp; &nbsp;--update_dt date<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_from timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_to timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;deleted_flg char(1));&nbsp;<br>
    create table YOUR-USERNAME.XXXX_stg_del_accounts(<br>
    &nbsp;&nbsp; &nbsp;account_num varchar(20));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_stg_clients(<br>
    &nbsp;&nbsp; &nbsp;client_id varchar(10),<br>
    &nbsp;&nbsp; &nbsp;last_name varchar(20),<br>
    &nbsp;&nbsp; &nbsp;first_name varchar(20),<br>
    &nbsp;&nbsp; &nbsp;patronymic varchar(20),<br>
    &nbsp;&nbsp; &nbsp;--date_of_birth date,<br>
    &nbsp;&nbsp; &nbsp;date_of_birth timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;passport_num varchar(15),<br>
    &nbsp;&nbsp; &nbsp;--passport_valid_to date,<br>
    &nbsp;&nbsp; &nbsp;passport_valid_to timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;phone varchar(16),<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0));<br>
    create table YOUR-USERNAME.XXXX_dwh_dim_clients(<br>
    &nbsp;&nbsp; &nbsp;client_id varchar(10),<br>
    &nbsp;&nbsp; &nbsp;last_name varchar(20),<br>
    &nbsp;&nbsp; &nbsp;first_name varchar(20),<br>
    &nbsp;&nbsp; &nbsp;patronymic varchar(20),<br>
    &nbsp;&nbsp; &nbsp;--date_of_birth date,<br>
    &nbsp;&nbsp; &nbsp;date_of_birth timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;passport_num varchar(15),<br>
    &nbsp;&nbsp; &nbsp;--passport_valid_to date,<br>
    &nbsp;&nbsp; &nbsp;passport_valid_to timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;phone varchar(16),<br>
    &nbsp;&nbsp; &nbsp;--create_dt date,<br>
    &nbsp;&nbsp; &nbsp;--update_dt date<br>
    &nbsp;&nbsp; &nbsp;create_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;update_dt timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_from timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;effective_to timestamp(0),<br>
    &nbsp;&nbsp; &nbsp;deleted_flg char(1));<br>
    create table YOUR-USERNAME.XXXX_stg_del_clients(<br>
    &nbsp;&nbsp; &nbsp;client_id varchar(10));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_rep_fraud(<br>
    &nbsp;&nbsp; &nbsp;event_dt timestamp(0),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;passport varchar(20),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;fio varchar(50),<br>
    &nbsp;&nbsp; &nbsp;phone varchar(16),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;event_type varchar(120),&nbsp;<br>
    &nbsp;&nbsp; &nbsp;--report_dt date<br>
    &nbsp;&nbsp; &nbsp;report_dt timestamp(0));<br>
    ----------------------------------<br>
    create table YOUR-USERNAME.XXXX_meta(<br>
    &nbsp;&nbsp; &nbsp;schema_name varchar(30),<br>
    &nbsp;&nbsp; &nbsp;table_name varchar(30),<br>
    &nbsp;&nbsp; &nbsp;max_update_dt timestamp(0));<br>
    ----------------------------------<br>
    <strong>Task:</strong><br>
    Разработка Хранилище данных. Алгоритм для файла main.py: Подключитесь к двум базам, Очистите весь стейджинг. Загрузите файлы transactions_01032021.txt, terminals_01032021.xlsx, passport_blacklist_01032021.xlsx в стейджинг. Загрузите таблицы clients, accounts, cards в стейджинг. Используйте следующий подход: Выполните запрос к базе 1, Сохраните полученный результат в DataFrame, Загрузите DataFrame в базу 2. Загрузите данные из стейджинга в целевую таблицу xxxx_dwh_dim_terminals, xxxx_dwh_dim_cards, xxxx_dwh_dim_accounts, xxxx_dwh_dim_clients. Загрузите данные из стейджинга в целевую таблицу xxxx_dwh_fact_passport_blacklist, xxxx_dwh_fact_transactions.. Фактовые таблицы данные перекладываются «простым инсертом», то есть необходимо выполнить один INSERT INTO ... SELECT .... Напишите скрипт, соединяющий нужные таблицы для поиска операций, совершенных при недействующем договоре. Отладьте ваш скрипт для одной даты PgAdmin, он должен выдавать результат. Результат выполнения скрипта загружайте в таблицу xxxx_rep_fraud. Незабывайте сформировать поле report_dt. Зафиксируйте изменения. Отключитесь от баз. Переименуйте обработанные файлы и перенесите их в другой каталог. отладить его работоспособность навсех трех днях загрузки.<br>
    <strong>Decision:</strong><br>
    $ vim main.py<br>
    $ cat main.py<br>
    #!/usr/bin/python3<br>
    import pandas as pd<br>
    import psycopg2<br>
    import os<br>
    ###################Подключение к базам<br>
    #conn_YOUR-DB1 = psycopg2.connect(database = "YOUR-DB",host = "YOUR-IP",user = "YOUR-USERNAME",password = "YOUR-PASSWORD",port = "5432")<br>
    conn_YOUR-DB1 = psycopg2.connect(database = "YOUR-DB1",host = "YOUR-HOST",user = "YOUR-USERNAME1",password = "YOUR-PASSWORD1",port = "5432")<br>
    conn_YOUR-DB2 = psycopg2.connect(database = "bank",host = "YOUR-HOST",user = "YOUR-USERNAME2",password = "YOUR-PASSWORD2",port = "5432")<br>
    conn_YOUR-DB1.autocommit = False<br>
    conn_YOUR-DB2.autocommit = False<br>
    cursor_YOUR-DB1 = conn_YOUR-DB1.cursor()<br>
    cursor_YOUR-DB2 = conn_YOUR-DB2.cursor()<br>
    ######################################<br>
    ###################Очистка стейджинговых таблиц<br>
    cursor_YOUR-DB1.execute("""DELETE FROM YOUR-USERNAME1.XXXX_stg_transactions;""")<br>
    ###################Загрузка данных в стейджинг<br>
    #df = pd.read_csv(f'/home/YOUR-USERNAME1/XXXX/project/data/transactions_01032021.txt', sep=';', decimal=',', header=0, index_col=None)<br>
    dirpath = "/home/YOUR-USERNAME1/XXXX/project"<br>
    project_files = os.listdir(dirpath)<br>
    for transactions in project_files:<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if transactions.endswith('.txt'):<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;df = pd.read_csv(transactions, sep=";")<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;datenow_w_txt = transactions.rsplit('_')[1]<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;datenow_str = datenow_w_txt.split('.')[0]<br>
    df['amount'] = df['amount'].map(lambda z: z.strip().replace(',', '.')).astype('float')<br>
    df['create_dt'] = datenow_str<br>
    df['update_dt'] = datenow_str<br>
    ###################<br>
    cursor_YOUR-DB1.executemany("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_stg_transactions(trans_id, trans_date, amt, card_num, oper_type, oper_result, terminal , create_dt, update_dt)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;VALUES(%s, %s , %s , %s , %s , %s , %s, to_timestamp(%s,'DDMMYYYY'), to_timestamp(%s,'DDMMYYYY'))<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""", df.values.tolist())<br>
    ###################Загрузка данных в целевые таблицы фактов<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_dwh_fact_transactions (trans_id,trans_date,card_num,oper_type,amt,oper_result,terminal,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT stg.trans_id,stg.trans_date,stg.card_num,stg.oper_type,stg.amt,stg.oper_result,stg.terminal,stg.create_dt,stg.update_dt&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FROM YOUR-USERNAME1.XXXX_stg_transactions as stg;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################<br>
    ######################################<br>
    ###################Очистка стейджинговых таблиц<br>
    cursor_YOUR-DB1.execute("""DELETE FROM YOUR-USERNAME1.XXXX_stg_terminals;""")<br>
    ###################Загрузка данных в стейджинг<br>
    #df = pd.read_excel(f'/home/YOUR-USERNAME1/XXXX/project/data/terminals_01032021.xlsx', sheet_name='terminals', header=0, index_col=None)<br>
    for terminals in project_files:<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if terminals.startswith('terminals'):<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;df = pd.read_excel(terminals, sheet_name='terminals', header=0, index_col=None )<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;datenow_w_txt = terminals.rsplit('_')[1]<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;datenow_str = datenow_w_txt.split('.')[0]<br>
    df['create_dt'] = datenow_str<br>
    df['update_dt'] = datenow_str<br>
    #df.insert(4, 'update_dt','2021-03-01')<br>
    ###################<br>
    cursor_YOUR-DB1.executemany("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_stg_terminals(terminal_id,terminal_type,terminal_city,terminal_address,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;VALUES(%s,%s,%s,%s,to_timestamp(%s,'DDMMYYYY'),to_timestamp(%s,'DDMMYYYY'));<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""", df.values.tolist())<br>
    ###################Загрузка данных в целевые таблицы измерений<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_dwh_dim_terminals (terminal_id,terminal_type,terminal_city,terminal_address,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT stg.terminal_id, stg.terminal_type, stg.terminal_city, stg.terminal_address, stg.update_dt,to_timestamp('9999-12-31', 'YYYY-MM-DD')&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_terminals as stg &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_terminals as trg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on stg.terminal_id = trg.terminal_id&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where trg.terminal_id is null;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################<br>
    ######################################<br>
    ###################Очистка стейджинговых таблиц<br>
    cursor_YOUR-DB1.execute("""DELETE FROM YOUR-USERNAME1.XXXX_stg_blacklist;""")<br>
    ###################Загрузка данных в стейджинг<br>
    #df = pd.read_excel(f'/home/YOUR-USERNAME1/XXXX/project/data/passport_blacklist_01032021.xlsx', sheet_name='blacklist', header=0, index_col=None)<br>
    for blacklist in project_files:<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if blacklist.startswith('passport_blacklist'):<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;df = pd.read_excel(blacklist, sheet_name='blacklist', header=0, index_col=None )<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;datenow_w_ext = blacklist.rsplit('blacklist_')[1]<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;datenow_str = datenow_w_ext.split('.')[0]<br>
    df['create_dt'] = datenow_str<br>
    df['update_dt'] = datenow_str<br>
    ###################<br>
    cursor_YOUR-DB1.executemany("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_stg_blacklist(entry_dt,passport_num,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;VALUES(%s, %s,to_timestamp(%s,'DDMMYYYY'),to_timestamp(%s,'DDMMYYYY'));<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""", df.values.tolist())<br>
    ###################Загрузка данных в целевые таблицы фактов<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_dwh_fact_passport_blacklist&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT stg.passport_num,stg.entry_dt,stg.create_dt,stg.update_dt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_blacklist as stg&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_fact_passport_blacklist as trg&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on stg.passport_num = trg.passport_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where trg.passport_num is null;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ######################################<br>
    ###################Очистка стейджинговых таблиц<br>
    cursor_YOUR-DB1.execute("""DELETE FROM YOUR-USERNAME1.XXXX_stg_cards;""")<br>
    ###################Загрузка данных в стейджинг<br>
    cursor_YOUR-DB2.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;--SELECT regexp_replace(card_num, '\s+$', '') as card_num,account,create_dt,update_dt&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT card_num,account,create_dt,update_dt&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FROM info.cards<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    records = cursor_YOUR-DB2.fetchall()<br>
    #for row in records:<br>
    #&nbsp;&nbsp;&nbsp; print(row)<br>
    names = [ x[0] for x in cursor_YOUR-DB2.description ]<br>
    df = pd.DataFrame( records, columns = names )<br>
    cursor_YOUR-DB1.executemany("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_stg_cards(card_num,account_num,create_dt,update_dt)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;VALUES(%s,%s,%s,%s)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""", df.values.tolist())<br>
    ###################Загрузка данных в целевые таблицы измерений<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_dwh_dim_cards (card_num,account_num,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT stg.card_num, stg.account_num, stg.create_dt, to_timestamp('9999-12-31', 'YYYY-MM-DD')<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_cards as stg&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_cards as trg&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on stg.card_num = trg.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where trg.card_num is null;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################<br>
    ######################################<br>
    ###################Очистка стейджинговых таблиц<br>
    cursor_YOUR-DB1.execute("""DELETE FROM YOUR-USERNAME1.XXXX_stg_accounts;""")<br>
    ###################Загрузка данных в стейджинг<br>
    cursor_YOUR-DB2.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT account,valid_to,client,create_dt,update_dt&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FROM info.accounts<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    records = cursor_YOUR-DB2.fetchall()<br>
    #for row in records:<br>
    #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(row)<br>
    names = [ x[0] for x in cursor_YOUR-DB2.description ]<br>
    df = pd.DataFrame( records, columns = names )<br>
    cursor_YOUR-DB1.executemany("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_stg_accounts(account_num,valid_to,client,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;VALUES( %s, %s, %s, %s, %s)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""", df.values.tolist())<br>
    ###################Загрузка данных в целевые таблицы измерений<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_dwh_dim_accounts(account_num,valid_to,client,create_dt,update_dt)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT stg.account_num,stg.valid_to,stg.client,stg.create_dt,to_timestamp('9999-12-31', 'YYYY-MM-DD')<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_accounts as stg&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_accounts as trg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on stg.account_num = trg.account_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where trg.account_num is null;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################<br>
    ######################################<br>
    ###################Очистка стейджинговых таблиц<br>
    cursor_YOUR-DB1.execute("""DELETE FROM YOUR-USERNAME1.XXXX_stg_clients;""")<br>
    ###################Загрузка данных в стейджинг<br>
    cursor_YOUR-DB2.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT client_id,last_name,first_name,patronymic,date_of_birth,passport_num,passport_valid_to,phone,create_dt,update_dt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FROM info.clients;&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    records = cursor_YOUR-DB2.fetchall()<br>
    #for row in records:<br>
    #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(row)<br>
    names = [ x[0] for x in cursor_YOUR-DB2.description ]<br>
    df = pd.DataFrame(records, columns = names)&nbsp;<br>
    cursor_YOUR-DB1.executemany("""&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_stg_clients(client_id,last_name,first_name,patronymic,date_of_birth,passport_num,passport_valid_to,phone,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""", df.values.tolist())&nbsp;<br>
    ###################Загрузка данных в целевые таблицы измерений<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_dwh_dim_clients(client_id,last_name,first_name,patronymic,date_of_birth,passport_num,passport_valid_to,phone,create_dt,update_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT stg.client_id,stg.last_name,stg.first_name,stg.patronymic,stg.date_of_birth,stg.passport_num,stg.passport_valid_to,stg.phone,stg.create_dt,now()<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_clients as stg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_clients as trg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on stg.client_id = trg.client_id&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where trg.client_id is null;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################<br>
    ######################################<br>
    ###################Выявление мошеннических операций и построение отчёта<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_rep_fraud&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;min(t2.trans_date) as trans_date,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;tgddcl.passport_num as passport_num,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(tgddcl.last_name || ' ' || tgddcl.first_name || ' ' || tgddcl.patronymic ) as fio,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;tgddcl.phone as phone,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;'1' as event_type,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;now() as report_dt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select *<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;with current_dt as (&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_transactions)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp; tgdft.*, tgddca.account_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_dwh_fact_transactions as tgdft&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_cards as tgddca<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on trim(tgdft.card_num) = trim(tgddca.card_num )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where tgdft.oper_result = 'SUCCESS'&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and tgdft.trans_date in (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from current_dt)) as t&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_accounts as gdda&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t.account_num = gdda.account_num ) as t2&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_clients as tgddcl&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t2.client = tgddcl.client_id&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where (tgddcl.passport_valid_to &lt; t2.trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;or tgddcl.passport_num in (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select passport_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_dwh_fact_passport_blacklist)) &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;group by tgddcl.passport_num, (tgddcl.last_name || ' ' || tgddcl.first_name || ' ' || tgddcl.patronymic ), tgddcl.phone;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################Совершение операции при недействующем договоре.<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_rep_fraud<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t2.trans_date as trans_date,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gddcl.passport_num as passport_num,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(gddcl.last_name || ' ' || gddcl.first_name || ' ' || gddcl.patronymic ) as fio,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gddcl.phone as phone,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;'2' as event_type,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;now() as report_dt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select min(t.trans_date) trans_date, t.account_num, gdda.client<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;with current_dt as (&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_transactions)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select gdft.trans_date, gdft.card_num, gddca.account_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_dwh_fact_transactions as gdft&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_cards as gddca<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on trim(gdft.card_num) = trim(gddca.card_num )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where gdft.oper_result = 'SUCCESS'<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and gdft.trans_date in (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from current_dt)) as t&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_accounts as gdda&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t.account_num = gdda.account_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where t.trans_date &gt; gdda.valid_to<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;group by t.account_num, gdda.client ) as t2&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_clients as gddcl&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t2.client = gddcl.client_id;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################Совершение операций в разных городах в течение одного часа<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_rep_fraud<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t3.trans_date,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t3.passport_num,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(t3.last_name || ' ' || t3.first_name || ' ' || t3.patronymic ) as fio,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t3.phone ,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;'3' as event_type,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;now() as report_dt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date, trg2.*<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select * from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select * from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;with lds as&nbsp; (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;trans_date,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;terminal_city,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;card_num,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(terminal_city) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdftr.card_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdftr.trans_date) as lag_c,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(trans_date) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by card_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdftr.trans_date) as lag_t,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lead(terminal_city) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdftr.card_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdftr.trans_date) as lead_c ,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lead(trans_date) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by card_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdftr.trans_date) as lead_t<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_dwh_fact_transactions as gdftr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_terminals as gddt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on gdftr.terminal = gddt.terminal_id<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where gdftr.oper_result = 'SUCCESS'),<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;current_dt as (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_transactions )<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;min(trans_date) as trans_date,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;card_num<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from lds<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where lag_c &lt;&gt; terminal_city<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and (trans_date-lag_t) &lt; '01:00:00'<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and trans_date&nbsp; in (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from current_dt)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;group by card_num) as trg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_cards as trg3<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on trim(trg.card_num) = trim(trg3.card_num )) as t<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_accounts as trg4<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t.account_num = trg4.account_num ) as t2<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_clients as trg2<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t2.client = trg2.client_id ) as t3;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ###################Попытка подбора суммы<br>
    cursor_YOUR-DB1.execute("""<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;INSERT INTO YOUR-USERNAME1.XXXX_rep_fraud&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t3.trans_date,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t3.passport_num ,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(t3.last_name || ' ' || t3.first_name || ' ' || t3.patronymic ) as fio,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t3.phone ,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;'4' as event_type,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;now() as report_dt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;trans_date,&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gddcl.*<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from&nbsp; (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select * from (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select * from(<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;with rj as (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;*,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(amt) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as lag_a,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(amt,2) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as lag_a2,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(amt,3) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as lag_a3,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(oper_result) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as lag_r,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(oper_result,2) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as lag_r2,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(oper_result,3) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as lag_r3,<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lag(trans_date,3) over (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;partition by gdft.card_num&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;order by gdft.trans_date) as min_t<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_dwh_fact_transactions gdft),<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;current_dt as (&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from YOUR-USERNAME1.XXXX_stg_transactions )<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select *&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from rj<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;where oper_result = 'SUCCESS'&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and lag_r = 'REJECT'&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and lag_a &gt; amt&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and lag_r2 = 'REJECT'&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and lag_a2 &gt; lag_a<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and lag_r3 = 'REJECT'&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and lag_a3 &gt; lag_a2<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and (trans_date - min_t) &lt;= '00:20:00'<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;and trans_date&nbsp; in (<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;select trans_date&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;from current_dt)) as trg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_cards as gddca<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on trim(trg.card_num) = trim(gddca.card_num )) as t&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_accounts as gdda&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t.account_num = gdda.account_num ) as t2&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;left join YOUR-USERNAME1.XXXX_dwh_dim_clients as gddcl&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on t2.client = gddcl.client_id ) as t3;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;""")<br>
    ######################################<br>
    conn_YOUR-DB2.commit()<br>
    conn_YOUR-DB1.commit()<br>
    ######################################Запись файлов в архив<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/terminals_01032021.xlsx', '/home/YOUR-USERNAME1/XXXX/project/archive/terminals_01032021.xlsx.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/transactions_01032021.txt', '/home/YOUR-USERNAME1/XXXX/project/archive/transactions_01032021.txt.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/passport_blacklist_01032021.xlsx', '/home/YOUR-USERNAME1/XXXX/project/archive/passport_blacklist_01032021.xlsx.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/terminals_02032021.xlsx', '/home/YOUR-USERNAME1/XXXX/project/archive/terminals_02032021.xlsx.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/transactions_02032021.txt', '/home/YOUR-USERNAME1/XXXX/project/archive/transactions_02032021.txt.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/passport_blacklist_02032021.xlsx', '/home/YOUR-USERNAME1/XXXX/project/archive/passport_blacklist_02032021.xlsx.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/terminals_03032021.xlsx', '/home/YOUR-USERNAME1/XXXX/project/archive/terminals_03032021.xlsx.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/transactions_03032021.txt', '/home/YOUR-USERNAME1/XXXX/project/archive/transactions_03032021.txt.backup')<br>
    os.rename('/home/YOUR-USERNAME1/XXXX/project/passport_blacklist_03032021.xlsx', '/home/YOUR-USERNAME1/XXXX/project/archive/passport_blacklist_03032021.xlsx.backup')<br>
    ######################################<br>
    cursor_YOUR-DB2.close();<br>
    cursor_YOUR-DB1.close();<br>
    $ sudo apt install python3.10-venv<br>
    $ python3.10 -m venv venv<br>
    $ source venv/bin/activate<br>
    $ pip install pandas<br>
    $ python3 main.py<br>
    $ ls archive/<br>
    passport_blacklist_01032021.xlsx.backup&nbsp; terminals_01032021.xlsx.backup&nbsp; transactions_01032021.txt.backup<br>
    $ sudo psql -U YOUR-USERNAME<br>
    YOUR-USERNAME=# select * from YOUR-USERNAME.XXXX_rep_fraud;<br>
    <strong>Task:</strong><br>
    Администрирование локальных, виртуальных и облачных серверов. Заполните файл main.cron расписанием и командой исполнения вашего скрипта. Расписание установите так, как считаете нужным чтобы ваши данные заполнились корректно.<br>
    <strong>Decision:</strong><br>
    $ vim main.cron&nbsp;<br>
    $ cat main.cron&nbsp;<br>
    0 0 * * * /home/david/project/main.py<br>
    <strong>Decision:</strong><br>
    По следующим признакам получилось выявить мошеннические транзакции: выполнение операции с просроченным или заблокированным паспортом, выполнение операции с недействительным контрактом, выполнение операций в разных городах в течение одного часа<br>
    <strong>Source:</strong><br>
    # https://dzen.ru/a/Ypr65Wh4jmLimA3o<br>
    # https://www.youtube.com/watch?v=Je3Y8up0Qbs&amp;list=LL&amp;index=5&amp;t=98s<br>
    # https://losst.pro/kak-posmotret-otkrytye-porty-v-linux?ysclid=lpe5qjsv9o445640330<br>
    # https://www.pgadmin.org/download/pgadmin-4-apt/<br>
    # https://losst.pro/spisok-kontejnerov-docker
</p>
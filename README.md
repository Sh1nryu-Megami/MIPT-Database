# MIPT-Database

## Концептуальная модель
Данная концептуальная модель представляет собой цифровизации системы строительной фирмы.

![CONCEPT](img/DB_concept.png)

## Логическая модель 
При создании логической модели была добавлена таблица с версионными данными - история изменений статуса проекта. Так же были добавлены три связующие таблицы. Данная модель соответствует третьей нормальной форме.

![LOG](img/DB_logical.png)

## Физическая модель

При формировании физической модели базы данных были указаны ограничения на поля, а также типы данных. Были написаны DDL и DML-скрипты и написаны запросы к таблицам.

![physical_model](img/DB_real.png)

### [PROJECT](src/PROJECT_DLM.sql)

| Название поля | Тип         | Ограничения                              |
| ------------- | ----------- | ---------------------------------------- |
| PROJECT_ID     | BIGSERIAL   | NOT NULL, PRIMARY KEY                    |
| PROJECT_NAME     | VARCHAR(50)      | NOT NULL |
| PROJECT_START  | DATE        | CHECK (PROJECT_END > PROJECT_START)      |
| PROJECT_END  | DATE        | CHECK (PROJECT_END > PROJECT_START)      |
| PROJECT_STATUS   | VARCHAR(50)     | NOT NULL        |
| CLIENT_ID   | INT | NOT NULL | 

### [WORKER](src/WORKER_DLM.sql)

| Название поля | Тип         | Ограничения                               |
| ------------- | ----------- | ----------------------------------------- |
| WORKER_ID    | BIGSERIAL   | NOT NULL, PRIMARY KEY                    |
| WORKER_NAME     | VARCHAR(50)      | NOT NULL |
| WORKER_SURNAME  | VARCHAR(50)        | NOT NULL       |
| WORKER_PASSPORT  | VARCHAR(10)        | NOT NULL, CHECK (LENGTH(WORKER_PASSPORT) == 10)       |
| WORKER_TITLE  | VARCHAR(100)     | NOT NULL       |

### [CLIENT](src/CLIENT_DLM.sql)

| Название поля   | Тип         | Ограничения                                     |
| --------------- | ----------- | ----------------------------------------------- |
| CLIENT_ID       | BIGSERIAL   | NOT NULL, PRIMARY KEY                           |
| CLIENT_NAME      | VARCHAR(50) | NOT NULL                                        |
| CLIENT_SURNAME     | VARCHAR(50) | NOT NULL                                        |
| CLIENT_PHONE_NUMBER       | 	VARCHAR(11) | NOT NULL, CHECK (LENGTH(CLIENT_PHONE_NUMBER) == 11)                                        |
| CLIENT_EMAIL         | VARCHAR(50)       | NOT NULL                                        |

### [MATERIAL](src/MATERIAL_DLM.sql)

| Название поля   | Тип         | Ограничения                              |
| --------------- | ----------- | ---------------------------------------- |
| MATERIAL_ID       | BIGSERIAL   | NOT NULL, PRIMARY KEY                    |
| MATERIAL_NAME     | VARCHAR(255) | NOT NULL                        |
| METERIAL_COST         | NUMERIC       | NOT NULL            |

### [ORDER](src/ORDER_DLM.sql)

| Название поля   | Тип         | Ограничения                              |
| --------------- | ----------- | ---------------------------------------- |
| ORDER_ID      | BIGSERIAL   | NOT NULL, PRIMARY KEY                    |
| PROJECT_ID    | INTEGER | NOT NULL                         |
| ORDER_DATE         | DATE       | NOT NULL            |

### [PROJECT_WORKER](src/PROJECT_WORKER_DLM.sql)

| Название поля | Тип         | Ограничения      |
| ------------- | ----------- | ---------------- |
| PROJECT_ID   | INTEGER   | NOT NULL        |
| WORKER_ID | INTEGER | NOT NULL |

### [ORDER_MATERIAL](src/ORDER_MATERIAL_DLM.sql)

| Название поля | Тип         | Ограничения      |
| ------------- | ----------- | ---------------- |
| ORDER_ID       | INTEGER       | NOT NULL         |
| MATERIAL_ID     | INTEGER        | NOT NULL         |

### [PROJECT_STATUS_HISTORY](src/ORDER_MATERIAL_DLM.sql)

| Название поля | Тип         | Ограничения      |
| ------------- | ----------- | ---------------- |
| HISTORY_ID       | BIGSERIAL       | NOT NULL, PRIMARY KEY        |
| PROJECT_ID     | INTEGER        | NOT NULL         |
| PROJECT_STATUS       | VARCHAR(50)       | NOT NULL         |
| CHANGE_DATE     | DATE        | NOT NULL         |

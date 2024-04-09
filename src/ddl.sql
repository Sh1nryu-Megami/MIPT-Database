CREATE TABLE PROJECT (
    PROJECT_ID BIGSERIAL NOT NULL PRIMARY KEY,
    PROJECT_NAME VARCHAR(50) NOT NULL,
    PROJECT_START DATE NOT NULL CHECK (PROJECT_END <= PROJECT_START),
    PROJECT_END DATE NOT NULL CHECK (PROJECT_END => PROJECT_START),
    PROJECT_STATUS VARCHAR(50) NOT NULL,
    CLIENT_ID INT NOT NULL
);

CREATE TABLE WORKER (
    WORKER_ID BIGSERIAL NOT NULL PRIMARY KEY,
    WORKER_NAME VARCHAR(50) NOT NULL,
    WORKER_SURNAME VARCHAR(50) NOT NULL,
    WORKER_PASSPORT VARCHAR(10) NOT NULL CHECK (LENGTH(WORKER_PASSPORT) == 10),
    WORKER_TITLE VARCHAR(100) NOT NULL
);

CREATE TABLE MATERIAL (
    MATERIAL_ID BIGSERIAL NOT NULL PRIMARY KEY,
    MATERIAL_NAME VARCHAR(255) NOT NULL,
    METERIAL_COST NUMERIC NOT NULL
);

CREATE TABLE CLIENT (
    CLIENT_ID BIGSERIAL NOT NULL PRIMARY KEY,
    CLIENT_NAME VARCHAR(50) NOT NULL,
    CLIENT_SURNAME VARCHAR(50) NOT NULL,
    CLIENT_PHONE_NUMBER VARCHAR(11) NOT NULL CHECK (LENGTH(CLIENT_PHONE_NUMBER) == 11),
    CLIENT_EMAIL VARCHAR(50) NOT NULL
);

CREATE TABLE ORDER (
    ORDER_ID BIGSERIAL NOT NULL PRIMARY KEY,
    PROJECT_ID INTEGER NOT NULL,
    ORDER_DATE DATE NOT NULL
);

CREATE TABLE PROJECT_WORKER (
    PROJECT_ID INTEGER NOT NULL,
    WORKER_ID INTEGER NOT NULL
);

CREATE TABLE PROJECT_MATERIAL (
    PROJECT_ID INTEGER NOT NULL,
    MATERIAL_ID INTEGER NOT NULL
);

CREATE TABLE ORDER_MATERIAL (
    ORDER_ID INTEGER NOT NULL,
    MATERIAL_ID INTEGER NOT NULL
);
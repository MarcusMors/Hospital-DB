-- enter the data base
\ c hospital -- @block Init Data
CREATE TABLE "access" (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER,
    username VARCHAR(30),
    password TEXT,
    role VARCHAR(30)
);
-- @block Insert Data
INSERT INTO access (doctor_id, username, password, role)
VALUES (1, 'drstrange', 'p4ssw0rd', 'physician');
-- @block Insert Data
INSERT INTO access (username, password, role)
VALUES ('admin', 'admin', 'admin');
SELECT *
FROM "access";
-- @block Create Table
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER,
    name VARCHAR(30),
    age INTEGER,
    birthday DATE,
    phone INTEGER
);
SELECT *
FROM "patients";
-- @block Insert Data
INSERT INTO patients (doctor_id, name, age, birthday, phone)
VALUES(1, 'Patient 1', 20, '04-04-2000', 999123456);
-- @block Insert Data
INSERT INTO patients (doctor_id, name, age, birthday, phone)
VALUES(1, 'Patient 2', 30, '04-04-2001', 977892775);

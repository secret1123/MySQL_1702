SHOW DATABASES ;

CREATE DATABASE db_1702;

DROP DATABASE db_1702;

USE db_1702;

SHOW TABLES ;

CREATE TABLE student (
  id  VARCHAR(255),
  name VARCHAR(255),
  gender CHAR(1),
  age  INT(2)
);

SELECT *
FROM student;

INSERT INTO student
    VALUES ('2017001','张三','男',20);


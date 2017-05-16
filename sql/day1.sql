SHOW DATABASES ;

CREATE DATABASE db_1702;

DROP DATABASE db_1702;

SHOW TABLES ;

CREATE TABLE db_1702.student (
  id  VARCHAR(255),
  name VARCHAR(255),
  gender CHAR(1),
  age  INT(2),
  intro TEXT
);

SELECT *
FROM db_1702.student;

INSERT INTO db_1702.student
    VALUES ('2017001','张三','男',20,'');


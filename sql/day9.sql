SELECT *
FROM mysql.user;

SELECT *
FROM scott.emp;

GRANT CREATE ON scott.* TO 'tester'@'localhost';
GRANT SELECT ON scott.* TO 'tester'@'localhost';
GRANT DROP ON scott.* TO 'tester'@'localhost';
GRANT ALL ON scott.* TO 'tester'@'localhost';

REVOKE SELECT ON scott.* FROM 'tester'@'localhost';
REVOKE DROP ON scott.* FROM 'tester'@'localhost';

RENAME USER tester@'localhost' TO tester_new;

DROP USER tester_new@'%';

CREATE DATABASE db_test;
CREATE USER 'tester'@'localhost'
IDENTIFIED BY 'test123';
GRANT ALL ON db_test.* TO 'tester'@'localhost';
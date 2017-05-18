SHOW FULL COLUMNS FROM db_1702.student;

SELECT *
FROM db_1702.student;

INSERT INTO db_1702.student
    VALUES (NULL ,'Ann','girl','F',22,1.6,12.34,'1998-02-3','2017-5-18 10:1:1');

INSERT INTO db_1702.student(name)
    VALUES ('Joan'),('Sunnuy');

ALTER TABLE db_1702.student
    ALTER age SET DEFAULT '19';

UPDATE db_1702.student
    SET intro = 'leo'
WHERE id = 4;

UPDATE db_1702.student
    SET intro = 'Pisces',gender = '女'
WHERE id = 5;

DELETE FROM db_1702.student
WHERE age BETWEEN 19 AND 21;

SELECT *
FROM scott.dept;

SELECT *
FROM scott.emp;

SELECT
   DISTINCT JOB
FROM scott.emp;


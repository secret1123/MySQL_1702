SELECT *
FROM scott.dept;

CREATE VIEW scott.v_emp_10
AS
  SELECT *
  FROM scott.emp
  WHERE DEPTNO = 10;

SHOW FULL TABLES IN scott
WHERE table_type LIKE 'view';

SHOW FULL TABLES IN scott;

DROP VIEW scott.v_emp_10;

DESC scott.dept;
SHOW FULL COLUMNS FROM scott.dept;
SHOW TABLE STATUS FROM db_exam;
SHOW CREATE TABLE db_exam.student;

SHOW CREATE VIEW scott.v_emp_10;

SELECT *
FROM v_emp_10
WHERE JOB = 'manager';

SELECT *
FROM scott.emp
WHERE DEPTNO = 10 AND JOB = 'manager';

CREATE OR REPLACE VIEW scott.v_emp_dept
AS
  SELECT
    e.ENAME,
    d.DNAME
  FROM scott.emp e LEFT JOIN scott.dept d
      ON e.DEPTNO = d.DEPTNO;

SELECT *
FROM scott.v_emp_dept;

UPDATE scott.v_emp_dept
SET scott.v_emp_dept.ENAME = 'scott'
WHERE scott.v_emp_dept.ENAME = 'scott new';

CREATE VIEW scott.v_max
AS
  SELECT max(SAL) max_sal
  FROM scott.emp;

SELECT *
FROM scott.v_max;

DROP VIEW scott.v_union;
CREATE VIEW scott.v_union
AS
  SELECT ENAME
  FROM scott.emp
  WHERE DEPTNO = 10

  UNION

  SELECT ENAME
  FROM scott.emp
  WHERE DEPTNO = 20;

SELECT *
FROM scott.v_union;

UPDATE scott.v_union
SET scott.v_union.ENAME = 'SCOTT'
WHERE scott.v_union.ENAME = 'scott';


-- 子查询
SELECT *
FROM scott.emp
WHERE SAL > (
  SELECT SAL
  FROM scott.emp
  WHERE ENAME = 'scott'
);

SELECT
  EMPNO,
  ENAME
FROM scott.emp e
WHERE SAL > (
  SELECT avg(SAL)
  FROM scott.emp
  WHERE e.DEPTNO = e.DEPTNO
);

-- 开启一次事务
START TRANSACTION ;
SELECT *
FROM scott.emp;
DELETE FROM scott.emp;
ROLLBACK ;

START TRANSACTION;

UPDATE scott.emp
    SET SAL = SAL - 1000
WHERE ENAME = 'allen';

UPDATE scott.emp
    SET SAL = SAL + 1000
WHERE ENAME = 'ward';

COMMIT;

ROLLBACK;

SELECT *
FROM scott.emp;


-- save point  保留点
START TRANSACTION ;

UPDATE scott.emp
    SET ENAME = 'ALLEN'
WHERE EMPNO = 7499;

SAVEPOINT a;

DELETE FROM scott.emp
WHERE EMPNO = 7499;

SAVEPOINT b;

INSERT INTO scott.emp(EMPNO,ENAME)
    VALUES (123,'Tom');

SAVEPOINT c;

DELETE FROM scott.emp;

COMMIT ;
ROLLBACK TO c;
ROLLBACK ;

SELECT *
FROM scott.emp;
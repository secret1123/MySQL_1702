SELECT *
FROM scott.emp;

SELECT *
FROM emp
LIMIT 5,3;

SELECT *
FROM emp
ORDER BY DEPTNO
LIMIT 2,4;

SELECT *
FROM emp
WHERE ENAME LIKE '%\_%' ESCAPE '\\';

SELECT *
FROM emp
WHERE ENAME RLIKE '[b,k]+';

INSERT INTO scott.emp (ENAME,EMPNO) VALUES ('A_A',111);

SELECT *
FROM emp
WHERE JOB IN ('manager') AND DEPTNO IN (10) OR JOB IN ('clerk')AND DEPTNO IN (20);
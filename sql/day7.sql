USE scott;
SHOW TABLES ;

CREATE VIEW scott.v_emp
  AS
  SELECT
    ENAME,
    JOB,
    HIREDATE
  FROM scott.emp;

DROP VIEW v_emp;

SELECT*
FROM v_emp;

UPDATE emp
SET HIREDATE='1981-5-5'
WHERE HIREDATE='1981-2-20';

UPDATE emp
SET ENAME='ALL'
WHERE ENAME='allen';
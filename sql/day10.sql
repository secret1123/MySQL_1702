SELECT
  count(SAL),
  min(SAL),
  max(SAL),
  avg(SAL)
FROM scott.emp
WHERE SAL;

SELECT
  JOB,
  max(SAL)
FROM scott.emp
GROUP BY JOB;

SELECT
  JOB,
  DEPTNO,
  max(SAL)
FROM scott.emp
GROUP BY JOB,DEPTNO;

SELECT
  DEPTNO,
  count(*)
FROM scott.emp
GROUP BY DEPTNO
HAVING avg(SAL) > 2000;
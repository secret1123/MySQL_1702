SELECT *
FROM scott.emp;

SELECT *
FROM scott.dept;

SELECT
  DISTINCT
  d.DNAME,
  d.DEPTNO
FROM scott.emp e
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e LEFT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;


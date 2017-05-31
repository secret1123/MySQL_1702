SELECT *
FROM scott.emp;

SELECT *
FROM scott.dept;

/*
--------------------
id|name|   info    |
  |    |gender|age |
--------------------
 1 Tom | M    | 18 |
--------------------
id int auto_increment primary key comment 'ID PK',
 */

SELECT *
FROM scott.salgrade;

SHOW FULL COLUMNS FROM scott.salgrade;

/*
冗余 多余
table student
id | name  | gender | age | departmentId |
1  | Tom1  | M      | 18  | 1            |
2  | Tom2  | M      | 18  | 1            |
3  | Tom3  | M      | 18  | 1            |
4  | Tom4  | M      | 18  | 1            |
table department
id | dName | dTel |
1  | CS    | 123  |
2  | SS    | 456  |
 */
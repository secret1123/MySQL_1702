DROP DATABASE IF EXISTS db_exam;
CREATE DATABASE db_exam;

DROP TABLE IF EXISTS db_exam.student;
CREATE TABLE db_exam.student(
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name  VARCHAR(255) NOT NULL
  COMMENT '姓名',
  age  INT  COMMENT '年龄',
  gender  CHAR(2) COMMENT '性别',
  dob  DATE COMMENT '出生日期',
  departmentId INT UNIQUE COMMENT '系别'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_exam.department;
CREATE TABLE db_exam.department(
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '系名称',
  tel INT COMMENT '电话'
)
  COMMENT '系别表';

DROP TABLE IF EXISTS db_exam.course;
CREATE TABLE db_exam.course(
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '课程名称',
  credit  DOUBLE  COMMENT '学分'
)
  COMMENT '课程表';

DROP TABLE IF EXISTS db_exam.student_course;
CREATE TABLE db_exam.student_course(
  id INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  grade  DOUBLE COMMENT '考试成绩'
)
  COMMENT '选课表';

USE db_exam;
SHOW CREATE TABLE db_exam.student;
SHOW FULL COLUMNS FROM db_exam.student;

SHOW CREATE TABLE db_exam.department;
SHOW FULL COLUMNS FROM db_exam.department;

SHOW CREATE TABLE db_exam.course;
SHOW FULL COLUMNS FROM db_exam.course;

SHOW CREATE TABLE db_exam.student_course;
SHOW FULL COLUMNS FROM db_exam.student_course;

ALTER TABLE db_exam.student
    ADD CONSTRAINT
fk_student_departmentId
FOREIGN KEY (departmentId)
  REFERENCES db_exam.department(id);

ALTER TABLE db_exam.student_course
    ADD CONSTRAINT
fk_student_course_studentId
FOREIGN KEY (studentId)
  REFERENCES db_exam.student(id);

ALTER TABLE db_exam.student_course
    ADD CONSTRAINT
fk_student_course_courseId
FOREIGN KEY (courseId)
  REFERENCES db_exam.student(id);

SELECT *
  FROM db_exam.student;
SELECT *
  FROM db_exam.department;
SELECT *
  FROM db_exam.course;
SELECT *
FROM db_exam.student_course;

INSERT INTO db_exam.student VALUES (NULL ,'A',18,'M','1990-1-1',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'B',19,'M','1991-1-1',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'C',20,'M','1992-1-1',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'D',21,'M','1993-1-1',NULL );
INSERT INTO db_exam.student VALUES (NULL ,'E',22,'M','1994-1-1',NULL );

INSERT INTO db_exam.department VALUES (NULL ,'chinese' ,001);
INSERT INTO db_exam.department VALUES (NULL ,'ph' ,002 );
INSERT INTO db_exam.department VALUES (NULL ,'soc' ,003 );
INSERT INTO db_exam.department VALUES (NULL ,'cs' ,004 );
INSERT INTO db_exam.department VALUES (NULL ,'ch' ,005 );

INSERT INTO db_exam.course VALUES (NULL ,'语文' ,NULL );
INSERT INTO db_exam.course VALUES (NULL ,'数学' ,NULL );
INSERT INTO db_exam.course VALUES (NULL ,'英语' ,NULL );
INSERT INTO db_exam.course VALUES (NULL ,'物理' ,NULL );
INSERT INTO db_exam.course VALUES (NULL ,'化学' ,NULL );

INSERT INTO db_exam.student_course VALUES (NULL ,1,1,55 );
INSERT INTO db_exam.student_course VALUES (NULL ,1,2,60 );
INSERT INTO db_exam.student_course VALUES (NULL ,2,3,40 );
INSERT INTO db_exam.student_course VALUES (NULL ,2,1,70 );
INSERT INTO db_exam.student_course VALUES (NULL ,3,2,80 );

ALTER TABLE db_exam.student_course
    CHANGE grade score DOUBLE COMMENT '考试成绩';

SELECT *
FROM db_exam.student
WHERE name REGEXP '王%';

DROP TABLE db_exam.student;
DROP TABLE db_exam.department;
DROP TABLE db_exam.course;
DROP TABLE db_exam.student_course;

DROP DATABASE db_exam;

/*
学生选了哪些课？
课被哪些学生选了？
学生的总学分
*/
SELECT
  DISTINCT
  s.name,
  c.courseId
FROM student s INNER JOIN department d INNER JOIN student_course c
ON s.id = c.studentId;

SELECT
  DISTINCT
  e.courseId,
  s.name
FROM student s INNER JOIN course c INNER JOIN student_course e
ON s.id = e.studentId;



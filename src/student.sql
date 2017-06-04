# 创建student和score表
DROP DATABASE IF EXISTS db_1700;
CREATE DATABASE db_1700;

DROP TABLE IF EXISTS db_1700.student;
CREATE TABLE db_1700.student (
  id         INT          AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name       VARCHAR(255) NOT NULL
  COMMENT '姓名',
  gender     VARCHAR(255) DEFAULT 'M'
  COMMENT '性别',
  dob        DATE COMMENT '出生日期',
  department VARCHAR(255) NOT NULL
  COMMENT '系别',
  address    VARCHAR(255) COMMENT '住址'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_1700.score;
CREATE TABLE db_1700.score (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT NOT NULL
  COMMENT '学生ID FK',
  course    VARCHAR(255) COMMENT '课程名',
  grade     VARCHAR(255) COMMENT '成绩'
)
  COMMENT '评分表';

# 创建合理的外键关联
ALTER TABLE db_1700.score
  ADD CONSTRAINT
  score_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_1700.score (id);
# 为student表和score表各增加5条记录
INSERT INTO db_1700.student(name, dob, department, address) VALUES ('张xx','1999-9-1','en','湖南');
INSERT INTO db_1700.student(name, dob, department, address) VALUES ('Bxx','1996-9-1','com','xxx');
INSERT INTO db_1700.student(name, dob, department, address) VALUES ('李四','1997-6-5','el','xxxx');
INSERT INTO db_1700.student(name, dob, department, address) VALUES ('Dxx','1998-8-9','com','xxx');
INSERT INTO db_1700.student(name, dob, department, address) VALUES ('王xx','1995-3-4','el','湖南');

INSERT INTO db_1700.score(studentId, course, grade) VALUES (1,'CS',65);
INSERT INTO db_1700.score(studentId, course, grade) VALUES (1,'YY',85);
INSERT INTO db_1700.score(studentId, course, grade) VALUES (3,'CS',77);
INSERT INTO db_1700.score(studentId, course, grade) VALUES (3,'YY',90);
INSERT INTO db_1700.score(studentId, course, grade) VALUES (5,'YY',60);
# 查询student表的所有记录
SELECT *
FROM db_1700.student;
# 查询student表的第2条到4条记录
SELECT *
FROM db_1700.student
LIMIT 1,3;
# 从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息
SELECT
  id,
  name,
  department
FROM db_1700.student;
# 从student表中查询计算机系和电子系的学生的信息
SELECT *
FROM db_1700.student
WHERE department = 'com' OR department = 'el';
# 从student表中查询年龄18~22岁的学生信息
SELECT *
FROM db_1700.student
WHERE dob BETWEEN 1998-1-1 AND 1996-1-1;
# 从student表中查询每个院系有多少人
SELECT count(*)
FROM db_1700.student
WHERE department = 'com';

SELECT count(*)
FROM db_1700.student
WHERE department = 'el';
# 从score表中查询每个科目的最高分
SELECT max(grade) cs
FROM db_1700.score
  WHERE course = 'CS';

SELECT max(grade) yy
FROM db_1700.score
WHERE course = 'YY';
# 查询李四的考试科目（c_name）和考试成绩（grade）
SELECT
  s.name,
  c.course,
  c.grade
FROM db_1700.student s INNER JOIN db_1700.score c
ON s.id = c.studentId
WHERE s.name = '李四';
# 用连接的方式查询所有学生的信息和考试信息
SELECT
  s.*,
  c.course,
  c.grade
FROM db_1700.student s LEFT JOIN db_1700.score c
ON s.id = c.studentId;
# 计算每个学生的总成绩
SELECT
  s.name,
  sum(c.grade)
FROM db_1700.student s LEFT JOIN db_1700.score c
ON s.id = c.studentId
GROUP BY grade;
# 计算每个考试科目的平均成绩
SELECT avg(grade)
FROM db_1700.score
WHERE grade;
# 查询计算机成绩低于95的学生信息
SELECT DISTINCT
  s.*,
  c.course,
  c.grade
FROM db_1700.student s INNER JOIN db_1700.score c
  ON s.id = c.studentId
WHERE course = 'CS'
ORDER BY grade < 95;
# 查询同时参加计算机和英语考试的学生的信息
SELECT s.*,
  c.course
FROM db_1700.student s INNER JOIN db_1700.score c
  ON s.id = c.studentId
 WHERE c.course IN ('CS','YY');
# 将计算机考试成绩按从高到低进行排序
SELECT *
FROM db_1700.score
  WHERE course = 'CS'
ORDER BY grade DESC ;
# 从student表和score表中查询出学生的学号，然后合并查询结果
SELECT group_concat(s.id c.studentId)
FROM db_1700.student s INNER JOIN db_1700.score c;
# 查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
SELECT
  s.name,
  s.department,
  c.course,
  c.grade
FROM db_1700.student s INNER JOIN db_1700.score c
  ON s.id = c.studentId
WHERE s.name REGEXP '张' OR s.name REGEXP '王';
# 查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
SELECT
  s.name,
  s.dob,
  s.department,
  c.course,
  c.grade
FROM db_1700.student s INNER JOIN db_1700.score c
  ON s.id = c.studentId
WHERE s.address = '湖南';

DROP DATABASE IF EXISTS db_1702;
CREATE DATABASE db_1702;

DROP TABLE IF EXISTS db_1702.student;
CREATE TABLE db_1702.student (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name   VARCHAR(255) COMMENT '名字',
  intro  TEXT COMMENT '简介',
  gender CHAR(2) COMMENT '性别',
  age    INT COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '身高',
  price  DECIMAL COMMENT '价格',
  dob    DATE COMMENT '出生日期',
  time   DATETIME COMMENT '时间'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_1702.course;
CREATE TABLE db_1702.course (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name     VARCHAR(255) COMMENT '课程名',
  time     DATETIME COMMENT '课时',
  courseId INT COMMENT 'FK'
)
  COMMENT '课程表';

DROP TABLE IF EXISTS db_1702.choose;
CREATE TABLE db_1702.choose (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name     VARCHAR(255) COMMENT '选课名',
  time     DATETIME COMMENT '选课时间',
  chooseId INT COMMENT 'FK'
)
  COMMENT '选课表';

INSERT INTO db_1702.student VALUES (NULL, 'Tom', 'intro', 'M', 21, 1.8, 123.654, '1999-1-1', '2017-1-1 11:11:11'
);
INSERT INTO db_1702.course VALUES (NULL ,'english','2017-6-1 9:10:10',1);
INSERT INTO db_1702.choose VALUES (NULL ,'java','2017-9-9 14:00:00',2);

SELECT *
FROM db_1702.course;

SELECT *
FROM db_1702.choose;

SELECT *
FROM db_1702.student;

# SHOW FULL COLUMNS FROM db_1702.student;
# TRUNCATE TABLE db_1702.student;
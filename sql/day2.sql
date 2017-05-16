DROP TABLE db_1702.student;

CREATE TABLE db_1702.student(
  name VARCHAR(255)  COMMENT '名字',
  intro TEXT  COMMENT '简介',
  gender CHAR(2)  COMMENT '性别',
  age INT  COMMENT '年龄',
  height DOUBLE(3,2)  COMMENT '身高',
  price DECIMAL(6,2)  COMMENT '价格',
  dob DATE COMMENT '出生日期',
  time  DATETIME COMMENT '时间'
)
COMMENT '学生表';

SHOW FULL COLUMNS FROM db_1702.student;

INSERT INTO db_1702.student VALUES ('Tom','intro','M',2147483647,1.7,123.456,'1999-1-1','2017-1-1 11:11:11');

SELECT *
FROM db_1702.student;
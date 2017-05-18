SHOW DATABASES;
USE db_1702;
SHOW TABLES;

SHOW FULL COLUMNS FROM db_1702.student;
SHOW FULL COLUMNS FROM db_1702.course;
SHOW FULL COLUMNS FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

SELECT *
FROM db_1702.course;

SELECT *
FROM db_1702.student_course;

TRUNCATE TABLE db_1702.student_course;

DELETE FROM db_1702.course
WHERE id >2;

DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
)
  COMMENT '学生选课表';

ALTER TABLE db_1702.student_course
    ADD CONSTRAINT
fk_student_course_studentId
FOREIGN KEY (studentId)
  REFERENCES db_1702.student(id)
  ON DELETE SET NULL;

ALTER TABLE db_1702.student_course
    ADD CONSTRAINT
fk_student_course_courseId
FOREIGN KEY (courseId)
  REFERENCES db_1702.course(id);

SHOW FULL COLUMNS FROM db_1702.student_course;

INSERT INTO db_1702.student_course
    VALUES (NULL ,1,1,NULL );

INSERT INTO db_1702.student_course
    VALUES (NULL ,1,2,NULL );

SELECT *
FROM student_course;


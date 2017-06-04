DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;

DROP TABLE IF EXISTS db_work.user;
CREATE TABLE db_work.user (
  id       INT          AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name     VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) COMMENT '密码',
  team     VARCHAR(255) NOT NULL
  COMMENT '组别',
  role     VARCHAR(255) DEFAULT 'staff'
  COMMENT '角色：staff-员工；leader-组长'
)
  COMMENT '用户注册表';

DROP TABLE IF EXISTS db_work.log;
CREATE TABLE db_work.log (
  id      INT                AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content TEXT      NOT NULL
  COMMENT '内容',
  time    TIMESTAMP NOT NULL DEFAULT current_timestamp
  COMMENT '发布时间',
  userId  INT COMMENT 'FK'
)
  COMMENT '日志表';

ALTER TABLE db_work.log
  ADD CONSTRAINT
  log_fk_userId
FOREIGN KEY (userId)
REFERENCES db_work.user (id);

INSERT INTO db_work.user (name, password, team) VALUES ('staff-1', '123', 'one');
INSERT INTO db_work.user (name, password, team) VALUES ('staff-2', '123', 'one');
INSERT INTO db_work.user (name, password, team) VALUES ('staff-3', '123', 'two');
INSERT INTO db_work.user (name, password, team) VALUES ('staff-4', '123', 'one');
INSERT INTO db_work.user (name, password, team, role) VALUES ('leader-1', '123', 'one', 'leader');
INSERT INTO db_work.user (name, password, team, role) VALUES ('leader-2', '123', 'two', 'leader');

INSERT INTO db_work.log (content, time, userId) VALUES ('content-1-1', NULL, 1);
INSERT INTO db_work.log (content, time, userId) VALUES ('content-1-2', NULL, 1);
INSERT INTO db_work.log (content, time, userId) VALUES ('content-2-1', NULL, 2);
INSERT INTO db_work.log (content, time, userId) VALUES ('content-2-2', NULL, 2);
INSERT INTO db_work.log (content, time, userId) VALUES ('content-3-1', NULL, 3);
INSERT INTO db_work.log (content, time, userId) VALUES ('content-4-1', NULL, 4);
INSERT INTO db_work.log (content, time, userId) VALUES ('content-5-1', NULL, 5);

-- 登录
SELECT *
FROM db_work.user
WHERE name = '' AND password = '';

-- 员工查看自己的日志
SELECT
  content,
  time
FROM db_work.log
WHERE userId=1;

-- 组长查看本组的日志
SELECT
  u.name,
  l.content,
  l.time
FROM db_work.user u LEFT JOIN db_work.log l
ON u.id = l.userId
WHERE u.team = 'one';

SELECT
  u.name,
  l.content,
  l.time
FROM db_work.user u LEFT JOIN db_work.log l
ON u.id = l.userId
WHERE u.team = 'one' AND u.name = 'staff-4';

SELECT
  u.name,
  l.content,
  l.time
FROM db_work.user u INNER JOIN db_work.log l
ON u.id = l.userId
WHERE u.team = 'two';

SELECT *
FROM db_work.user u INNER JOIN db_work.log l
ON u.id = l.userId
WHERE u.team = 'one' AND u.name = 'staff-2';

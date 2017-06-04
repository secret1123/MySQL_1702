# 设计个人好友管理系统，包含以下核心功能：
DROP DATABASE IF EXISTS db_friend;
CREATE DATABASE db_friend;

DROP TABLE IF EXISTS db_friend.info;
CREATE TABLE db_friend.info (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name    VARCHAR(255) NOT NULL
  COMMENT '姓名',
  gender  VARCHAR(255) COMMENT '性别',
  dob     VARCHAR(255) COMMENT '生日',
  tel     VARCHAR(255) COMMENT '电话',
  address VARCHAR(255) COMMENT '住址',
  wechat  VARCHAR(255) COMMENT '微信',
  qq      VARCHAR(255) COMMENT 'QQ',
  study   VARCHAR(255) COMMENT '学习地点',
  hobby   VARCHAR(255) COMMENT '爱好'
)
  COMMENT '个人信息表';

DROP TABLE IF EXISTS db_friend.intimacy;
CREATE TABLE db_friend.intimacy (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  time   DATE COMMENT '认识时间',
  way    VARCHAR(255) COMMENT '认识方式',
  type   VARCHAR(255) COMMENT '特点',
  levle  INT COMMENT '亲密程度 1-10',
  infoId INT COMMENT '个人信息 ID FK'
)
  COMMENT '亲密度表';

DROP TABLE IF EXISTS db_friend.link;
CREATE TABLE db_friend.link (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  time       DATETIME DEFAULT now() NOT NULL
  COMMENT '沟通时间',
  mode       VARCHAR(255)           NOT NULL
  COMMENT '沟通方式',
  content    VARCHAR(255)           NOT NULL
  COMMENT '沟通内容',
  infoId    INT COMMENT '学习地点 ID FK',
  intimacyId INT COMMENT '当前亲密度 ID FK'
)
  COMMENT '沟通信息表';
# 显示所有好友基本信息，包括：
# 姓名
# 性别
# 生日
# 手机
# 住址
# 微信
# QQ
# 工作或学习的地点
# 爱好
# 认识时间
# 认识方式
# 特点
# 亲密程度 （亲密-一般：1-10）
# 记录每一次与朋友沟通时的信息，包括：
# 沟通时间
# 沟通方式
# 沟通内容
# TA 当前的工作或学习的地点
# 当前的亲密程度
# 创建表和关联
ALTER TABLE db_friend.intimacy
    ADD CONSTRAINT
intimacy_fk_infoId
FOREIGN KEY (infoId)
  REFERENCES db_friend.info(id);

ALTER TABLE db_friend.link
    ADD CONSTRAINT
link_fk_infoId
FOREIGN KEY (infoId)
  REFERENCES db_friend.info(id);

ALTER TABLE db_friend.link
    ADD CONSTRAINT
link_fk_intimacyId
FOREIGN KEY (intimacyId)
  REFERENCES db_friend.intimacy(id);
# 添加样本数据
INSERT INTO db_friend.info(name, gender, wechat, qq, study) VALUES ('tom','M','111','1001','Axx');
INSERT INTO db_friend.info(name, gender, wechat, qq, study) VALUES ('ann','M','222','1002','Bxx');

INSERT INTO db_friend.intimacy(time, way, type, levle, infoId) VALUES ('2017-1-1','study','xx1','2',2);
INSERT INTO db_friend.intimacy(time, way, type, levle, infoId) VALUES ('2016-1-1','study','xx2','5',1);

INSERT INTO db_friend.link(mode, content, infoId, intimacyId) VALUES ('tel','content...',2,1);
INSERT INTO db_friend.link(mode, content, infoId, intimacyId) VALUES ('tel','content...',1,2);
# 查询所有朋友及每次沟通记录
SELECT *
FROM db_friend.info i LEFT JOIN db_friend.link l
ON i.id = l.infoId;
# 列出一个朋友的工作或学习的变迁
UPDATE db_friend.info
    SET study = 'cxx'
WHERE id = 1;

SELECT *
FROM db_friend.info;
# 计算每个朋友的平均亲密程度，降序排序
SELECT
  i.name,
  avg(intimacyId)
FROM db_friend.info i INNER JOIN db_friend.link l
ON i.id = l.infoId
GROUP BY i.name
ORDER BY 1 DESC ;
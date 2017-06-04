-- 核心功能
/*
1，用户表 注册 登录
2，文章
3，文集
4，评论
5，关注 collection
6，专题 bookmarks
7，收藏
8，打赏
 */

DROP DATABASE IF EXISTS db_js;
CREATE DATABASE db_js;

DROP TABLE IF EXISTS db_js.user;
CREATE TABLE db_js.user (
  id       INT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  nick     VARCHAR(191)  NOT NULL UNIQUE
  COMMENT '昵称',
  mobile   VARCHAR(191) UNIQUE
  COMMENT '手机号',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  avater   VARCHAR(255) NOT NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               DEFAULT 'default.png'
  COMMENT '头像',
  pay      INT COMMENT '打赏金额，默认-2元；null-关闭打赏' DEFAULT 2,
  money    DECIMAL(8, 2) NOT NULL DEFAULT 0
  COMMENT '账户余额'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_js.notebook;
CREATE TABLE db_js.notebook (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) NOT NULL
  COMMENT '文集名',
  userId INT COMMENT '用户名 ID FK'
)
  COMMENT '文集表';

DROP TABLE IF EXISTS db_js.note;
CREATE TABLE db_js.note (
  id         INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) NOT NULL
  COMMENT '标题',
  content TEXT       NOT NULL
  COMMENT '内容',
  time    DATETIME DEFAULT now()
  COMMENT '时间',
  views   INT      DEFAULT 0
  COMMENT '阅读次数',
  notebookId INT COMMENT '文集 ID FK'
)
  COMMENT '文章集';

DROP TABLE IF EXISTS db_js.comment;
CREATE TABLE db_js.comment (
  id        INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content TEXT NOT NULL
  COMMENT '内容',
  time    DATETIME DEFAULT now()
  COMMENT '时间',
  noteId  INT COMMENT '文章 ID FK',
  userId  INT COMMENT '用户 ID FK',
  commentId INT COMMENT '评论 ID FK'
)
  COMMENT '评论表';

DROP TABLE IF EXISTS db_js.collection;
CREATE TABLE db_js.collection (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) NOT NULL
  COMMENT '名称',
  userId INT COMMENT '用户 ID FK'
)
  COMMENT '专题表';

DROP TABLE IF EXISTS db_js.collection_note;
CREATE TABLE db_js.collection_note (
  collectionId INT COMMENT 'PK FK',
  noteId       INT COMMENT 'PK FK',
  PRIMARY KEY (collectionId, noteId)
)
  COMMENT '专题-文章 表';

DROP TABLE IF EXISTS db_js.follow;
CREATE TABLE db_js.follow (
  id                   INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  time DATETIME NOT NULL DEFAULT now()
  COMMENT '时间',
  userId INT COMMENT '关注者 ID FK',
  followedUserId INT COMMENT '被关注者 ID FK',
  followedNotebookId INT COMMENT '被关注文集 ID FK',
  followedCollectionId INT COMMENT '被关注专题 ID FK'
)
  COMMENT '关注表';

DROP TABLE IF EXISTS db_js.bookmark;
CREATE TABLE db_js.bookmark (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  userId INT COMMENT '收藏者 ID FK',
  noteId INT COMMENT '被收藏文章 ID FK'
)
  COMMENT '收藏表';

DROP TABLE IF EXISTS db_js.pay;
CREATE TABLE db_js.pay (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  amount INT           NOT NULL
  COMMENT '金额',
  message VARCHAR(255) COMMENT '留言',
  method  VARCHAR(255) NOT NULL
  COMMENT '支付方式',
  userId  INT COMMENT '打赏用户 ID FK',
  noteId  INT COMMENT '文章 ID FK'
)
  COMMENT '打赏表';

ALTER TABLE db_js.notebook
  ADD CONSTRAINT
  notebook_fk_userId
FOREIGN KEY (userId)
REFERENCES db_js.user (id);

ALTER TABLE db_js.note
  ADD CONSTRAINT
  note_fk_notebookId
FOREIGN KEY (notebookId)
REFERENCES db_js.notebook (id);

ALTER TABLE db_js.comment
  ADD CONSTRAINT
  comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_js.note (id);

ALTER TABLE db_js.comment
  ADD CONSTRAINT
  comment_fk_userId
FOREIGN KEY (userId)
REFERENCES db_js.user (id);

ALTER TABLE db_js.comment
  ADD CONSTRAINT
  comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_js.comment (id);

ALTER TABLE db_js.collection
  ADD CONSTRAINT
  collection_fk_userId
FOREIGN KEY (userId)
REFERENCES db_js.user (id);

ALTER TABLE db_js.collection_note
    ADD CONSTRAINT
collection_note_fk_collectionId
FOREIGN KEY (collectionId)
  REFERENCES db_js.collection(id);

ALTER TABLE db_js.collection_note
    ADD CONSTRAINT
collection_note_fk_noteId
FOREIGN KEY (noteId)
  REFERENCES db_js.note(id);

ALTER TABLE db_js.follow
    ADD CONSTRAINT
follow_fk_followuserId
FOREIGN KEY (followedUserId)
  REFERENCES db_js.user(id);

ALTER TABLE db_js.follow
    ADD CONSTRAINT
follow_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_js.user(id);

ALTER TABLE db_js.follow
    ADD CONSTRAINT
follow_fk_followNotebookId
FOREIGN KEY (followedNotebookId)
  REFERENCES db_js.notebook(id);

ALTER TABLE db_js.follow
    ADD CONSTRAINT
follow_fk_followCollectionId
FOREIGN KEY (followedCollectionId)
  REFERENCES db_js.collection(id);

ALTER TABLE db_js.bookmark
    ADD CONSTRAINT
bookmark_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_js.user(id);

ALTER TABLE db_js.bookmark
    ADD CONSTRAINT
bookmark_fk_noteId
FOREIGN KEY (noteId)
  REFERENCES db_js.note(id);

ALTER TABLE db_js.pay
    ADD CONSTRAINT
pay_fk_userId
FOREIGN KEY (userId)
  REFERENCES db_js.user(id);

ALTER TABLE db_js.pay
    ADD CONSTRAINT
pay_fk_noteId
FOREIGN KEY (noteId)
  REFERENCES db_js.note(id);


-- 样本数据
INSERT INTO db_js.user(nick, mobile, password) VALUES ('Tom','123','abc');
INSERT INTO db_js.user(nick, mobile, password) VALUES ('Jerry','456','abc');

INSERT INTO db_js.notebook VALUE (NULL, 'Tom notebook', 1); -- 1
INSERT INTO db_js.notebook VALUE (NULL, 'Jerry notebook', 2); -- 2

INSERT INTO db_js.note (title, content, notebookId) VALUE ('tom title...', 'tom note content...', 1); -- 1

INSERT INTO db_js.comment VALUE (NULL, 'Jerry COMMENT ', '2017-6-2 10:00:00', 1, 2, NULL); -- 1

INSERT INTO db_js.comment VALUE (NULL, 'Jerry COMMENT ', '2017-6-2 10:01:00', 1, 2, 1); -- 2

INSERT INTO db_js.follow (userId, followedUserId) VALUE (2, 1);

INSERT INTO db_js.bookmark VALUE (NULL, 2, 1);

SELECT *
FROM db_js.user;

SELECT *
FROM db_js.notebook;

SELECT *
FROM db_js.note;

SELECT *
FROM db_js.comment;

SELECT *
FROM db_js.follow;

SELECT count(*)
FROM db_js.follow
WHERE followedUserId = 1;

SELECT *
FROM db_js.bookmark;

SELECT
  u.avater,
  u.nick,
  n.title,
  n.content,
  n.time,
  n.views,
  count(*)
FROM db_js.bookmark b INNER JOIN db_js.note n
INNER JOIN db_js.notebook nb
INNER JOIN db_js.user u
INNER JOIN db_js.comment c
ON b.noteId = n.id AND n.notebookId = nb.id AND nb.userId = u.id AND n.id = c.noteId
WHERE b.userId = 2;

SELECT count(*)
FROM db_js.note n INNER JOIN db_js.comment c
ON n.id = c.noteId
WHERE n.id = 1;

SELECT *
FROM db_js.user;

START TRANSACTION ;

INSERT INTO db_js.pay VALUE (NULL ,2,'message...','wechat',2,1);

UPDATE db_js.user
    SET money = money+2
WHERE id = 1;

COMMIT ;
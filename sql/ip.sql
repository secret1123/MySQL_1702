DROP TABLE IF EXISTS db_1702.ip;
CREATE TABLE db_1702.ip(
  id INT AUTO_INCREMENT PRIMARY KEY 
  COMMENT 'ID PK',
  min VARCHAR(255) COMMENT '起始 IP 地址',
  max VARCHAR(255) COMMENT '终止 IP 地址',
  geo VARCHAR(255) COMMENT '地理位置'
);

SELECT count(*)
FROM db_1702.ip;

SELECT *
FROM db_1702.ip WHERE inet_aton('127.0.0.1') BETWEEN inet_aton(min) AND inet_aton(max);
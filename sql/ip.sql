DROP TABLE IF EXISTS db_1702.ip;
CREATE TABLE db_1702.ip (
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  min VARCHAR(255) COMMENT '起始 IP 地址',
  max VARCHAR(255) COMMENT '终止 IP 地址',
  geo VARCHAR(255) COMMENT '地理位置'
)
  COMMENT 'IP 表';

SELECT count(*)
FROM db_1702.ip;

SELECT *
FROM db_1702.ip
WHERE inet_aton('127.0.0.1') BETWEEN inet_aton(min) AND inet_aton(max);

-- 166.111.123.45 A.B.C.D [0, 255] 59.66
-- ip Internet Protocol 互联网协议
-- https Hyper text transfer protocol secure
-- tcp/ip
-- ssh
-- telnet
-- ftp File transfer protocol

DROP TABLE IF EXISTS db_1702.city;
CREATE TABLE db_1702.city (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  city  VARCHAR(255) COMMENT '城市名',
  lon   VARCHAR(255) COMMENT '经度',
  lat   VARCHAR(255) COMMENT '纬度',
  zoom  INT COMMENT '放大级别',
  count INT COMMENT 'IP 地址数量'
)
  COMMENT '城市表';

TRUNCATE TABLE db_1702.city;

LOAD DATA LOCAL INFILE '/Users/anlu/IdeaProjects/MySQL_1702/echartsMapDemo/js/BaiduMap_cityCenter.txt'
    INTO TABLE db_1702.city
FIELDS TERMINATED BY ','(city,lon,lat,zoom)
SET id = NULL ,count = NULL ;

SELECT *
FROM db_1702.ip;
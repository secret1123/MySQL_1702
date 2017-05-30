DROP TABLE IF EXISTS db_1702.ipMap;
CREATE TABLE db_1702.ipMap (
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  city  VARCHAR(255) COMMENT '城市',
  longitude   DOUBLE COMMENT '经度',
  latitude   DOUBLE COMMENT '纬度',
  zoom  INT COMMENT '放大级别',
  count   INT COMMENT 'IP 地址数量'
)
  COMMENT '城市表';

LOAD DATA LOCAL INFILE '/Users/anlu/IdeaProjects/MySQL_1702/echartsMapDemo/js/BaiduMap_cityCenter.txt'
    INTO TABLE db_1702.ipMap
FIELDS TERMINATED BY ','(city,longitude,latitude,zoom)
SET id = NULL ;

SELECT *
FROM db_1702.ipMap;
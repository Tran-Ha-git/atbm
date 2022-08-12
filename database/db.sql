 DROP database IF EXISTS `atbm`;
 Create database atbm;
 use atbm;
 
 DROP TABLE IF EXISTS `user`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `public_key` text COLLATE utf8_unicode_ci,
  `fullname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` VALUES (1,'a@gmail.com','123456',1,1,'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCgFGVfrY4jQSoZQWWygZ83roKXWD4YeT2x2p41dGkPixe73rT2IW04glagN2vgoZoHuOPqa5and6kAmK2ujmCHu6D1auJhE2tXP+yLkpSiYMQucDKmCsWMnW9XlC5K7OSL77TXXcfvTvyZcjObEz6LIBRzs6+FqpFbUO9SJEfh6wIDAQAB','Trần Thị Thu Hà','650/649 ấp 7, Xuân Thới Thượng, Hóc Môn','+103752627204'),(2,'a1@gmail.com','123456',0,0,NULL,'Huynh Dong','154 Xô Viết Nghệ Tĩnh','0124578934'),(3,'a2@gmail.com','123456',1,1,NULL,NULL,NULL,NULL),(4,'b@gmail.com','123456',1,1,NULL,'Tran Van Ba','1 Cát Lái','0123456789');

DROP TABLE IF EXISTS `category`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `category` VALUES (1,'Trà Thái Nguyên','Sản phẩm trà'),(2,'Trà Shan Tuyết','Sản phẩm trà'),(3,'Trà ướp hoa','Sản phẩm trà'),(4,'Trà ô long','Sản phẩm trà'),(5,'Trà thảo dược','Sản phẩm trà'),(6,'Ấm chén thưởng trà','Dụng cụ trà'),(7,'Bàn trà - khay trà','Dụng cụ trà'),(8,'Dụng cụ khác','Dụng cụ trà');


DROP TABLE IF EXISTS `product`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priceKg` int(11) DEFAULT NULL,
  `soldProduct` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category1_idx` (`category_id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `product` VALUES (1,'Trà Đinh Thái Nguyên',NULL,1,1,NULL,650000,15),(2,'Trà Nõn Tôm Thái Nguyên',NULL,1,1,NULL,600000,15),(3,'Trà Móc Câu Thái Nguyên',NULL,1,1,NULL,600000,15),(4,'Trà Búp Thái Nguyên',NULL,1,1,NULL,520000,20),(5,'Bạch Trà Shan Tuyết',NULL,1,2,NULL,500000,20),(6,'Hồng Shan Trà Hà Giang',NULL,1,2,NULL,500000,20),(7,'Trà shan tuyết cổ thụ',NULL,1,2,NULL,430000,20),(8,'Trà sen',NULL,1,3,NULL,430000,20),(9,'Trà lài',NULL,1,3,NULL,430000,20),(10,'Trà ướp hoa bưởi',NULL,1,3,NULL,850000,10),(11,'Trà oolong Lâm Đồng',NULL,1,4,NULL,750000,10),(12,'Trà Nụ Vối',NULL,1,5,NULL,640000,10),(13,'Ấm Chén Bát Tràng',NULL,1,6,NULL,NULL,10),(14,'Bàn – Khay trà tre, gỗ',NULL,1,7,NULL,NULL,10),(15,'Tống Trà Trắng Viền Giả Đá',NULL,1,8,NULL,NULL,10),(16,'Lọc Trà Trắng Nhũ Bạc',NULL,1,8,NULL,NULL,10);

DROP TABLE IF EXISTS `type`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Type_product1_idx` (`product_id`),
  CONSTRAINT `fk_Type_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `type` VALUES (1,'Gói 100 g',152000,5,1),(2,'10 tép 25 g',400000,5,1),(3,'Hộp 200g',740000,5,1),(4,'Gói 100 g',120000,5,2),(5,'10 tép 25 g',200000,5,2),(6,'Hộp 200g',540000,5,2),(7,'Gói 100 g',110000,5,3),(8,'10 tép 25 g',500000,5,3),(9,'Hộp 200g',620000,5,3),(10,'Gói 100 g',90000,5,4),(11,'10 tép 25 g',100000,5,4),(12,'Hộp 200g',320000,5,4),(13,'Gói 100 g',80000,5,5),(14,'Gói 200 g',160000,5,5),(15,'Hộp 200g',320000,5,5),(16,'Gói 100 g',60000,5,6),(17,'Gói 200 g',110000,5,6),(18,'Gói 100 g',50000,5,7),(19,'Gói 200 g',100000,5,7),(20,'Gói 100 g',150000,5,8),(21,'Gói 200 g',300000,5,8),(22,'Hộp 200g',580000,5,8),(23,'Gói 100 g',190000,5,9),(24,'Gói 200 g',350000,5,9),(25,'Gói 100 g',130000,5,10),(26,'Gói 200 g',450000,5,10),(27,'Gói 50 g',60000,5,11),(28,'Gói 100 g',150000,5,11),(29,'Gói 100 g',150000,5,12),(30,'Một bộ',150000,5,13),(31,'Một chiếc',150000,5,14),(32,'Một chiếc',150000,5,15),(33,'Một chiếc',150000,5,16);


DROP TABLE IF EXISTS `order`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `shipcost` int(11) DEFAULT NULL,
  `infor_bill` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  `verified` bit(1) DEFAULT b'0',
  `date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `order` VALUES (21,1140000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(22,740000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(23,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(24,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(25,740000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(26,1080000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(27,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(28,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(29,177000,25000,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(30,552000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(31,552000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(32,552000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(33,552000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(34,552000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(35,552000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(36,177000,25000,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(37,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(38,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(39,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(40,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(41,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(42,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(43,740000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(44,740000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(45,225000,25000,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(46,225000,25000,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(47,145000,25000,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(48,540000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(49,740000,0,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(50,400000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(51,740000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(52,540000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(53,225000,25000,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(54,145000,25000,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(55,225000,25000,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(56,540000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(57,175000,25000,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(58,225000,25000,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(59,450000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao'),(60,125000,25000,NULL,1,_binary '\0','12-08-2022',NULL,NULL),(61,320000,0,NULL,1,_binary '\0','12-08-2022',NULL,'Đang giao');


DROP TABLE IF EXISTS `order_detail`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_detail_product1_idx` (`product_id`),
  KEY `fk_order_detail_order1_idx` (`order_id`),
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_order_detail_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `order_detail` VALUES (7,'1',21,1),(8,'1',21,1),(9,'1',22,1),(10,'1',44,1),(11,'1',46,2),(12,'1',50,1),(13,'1',51,1),(14,'1',52,2),(15,'1',53,2),(16,'1',54,2),(17,'1',55,2),(18,'1',56,2),(19,'1',57,12),(20,'1',58,2),(21,'1',59,10),(22,'1',61,5);



DROP TABLE IF EXISTS `image`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_product1_idx` (`product_id`),
  CONSTRAINT `fk_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `image` VALUES (1,'p-1.jpg',1),(2,'p-2.jpg',2),(3,'p-3.jpg',3),(4,'p-4.jpg',4),(5,'p-5.jpg',5),(6,'p-6.jpg',6),(7,'p-7.jpg',7),(8,'p-8.jpg',8),(9,'p-9.jpg',9),(10,'p-10.jpg',10),(11,'p-11.jpg',11),(12,'p-12.jpg',12),(13,'p-13.jpg',13),(14,'p-14.jpg',14),(15,'p-15.jpg',15),(16,'p-16.jpg',16),(17,'p-17.jpg',1),(18,'p-18.jpg',2),(19,'p-19.jpg',3),(20,'p-20.jpg',4),(21,'p-21.jpg',5),(22,'p-22.jpg',6),(23,'p-23.jpg',7),(24,'p-24.jpg',8),(25,'p-25.jpg',9),(26,'p-26.jpg',10),(27,'p-27.jpg',11),(28,'p-28.jpg',12),(29,'p-29.jpg',13),(30,'p-30.jpg',14),(31,'p-31.jpg',15),(32,'p-32.jpg',16),(33,'p-33.jpg',1),(34,'p-34.jpg',2),(35,'p-35.jpg',3),(36,'p-36.jpg',4),(37,'p-37.jpg',5),(38,'p-38.jpg',6),(39,'p-39.jpg',7),(40,'p-40.jpg',8),(41,'p-41.jpg',9),(42,'p-42.jpg',10),(43,'p-43.jpg',11),(44,'p-44.jpg',12),(45,'p-45.jpg',13),(46,'p-46.jpg',14),(47,'p-47.jpg',15),(48,'p-48.jpg',16),(49,'p-49.jpg',1),(50,'p-50.jpg',2),(51,'p-51.jpg',3),(52,'p-52.jpg',4),(53,'p-53.jpg',5),(54,'p-54.jpg',6),(55,'p-55.jpg',7),(56,'p-56.jpg',8),(57,'p-57.jpg',9),(58,'p-58.jpg',10),(59,'p-59.jpg',11),(60,'p-60.jpg',12),(61,'p-61.jpg',13),(62,'p-62.jpg',14),(63,'p-63.jpg',15),(64,'p-64.jpg',16);


DROP TABLE IF EXISTS `key`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `key` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `public_key` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_key_user_idx` (`user_id`),
  CONSTRAINT `fk_key_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


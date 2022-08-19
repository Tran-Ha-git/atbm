/*
 Navicat Premium Data Transfer

 Source Server         : mysql_xampp
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3308
 Source Schema         : atbm

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 20/08/2022 06:17:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `group` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Trà Thái Nguyên', 'Sản phẩm trà');
INSERT INTO `category` VALUES (2, 'Trà Shan Tuyết', 'Sản phẩm trà');
INSERT INTO `category` VALUES (3, 'Trà ướp hoa', 'Sản phẩm trà');
INSERT INTO `category` VALUES (4, 'Trà ô long', 'Sản phẩm trà');
INSERT INTO `category` VALUES (5, 'Trà thảo dược', 'Sản phẩm trà');
INSERT INTO `category` VALUES (6, 'Ấm chén thưởng trà', 'Dụng cụ trà');
INSERT INTO `category` VALUES (7, 'Bàn trà - khay trà', 'Dụng cụ trà');
INSERT INTO `category` VALUES (8, 'Dụng cụ khác', 'Dụng cụ trà');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` int NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_image_product1_idx`(`product_id`) USING BTREE,
  CONSTRAINT `fk_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, 'p-1.jpg', 1);
INSERT INTO `image` VALUES (2, 'p-2.jpg', 2);
INSERT INTO `image` VALUES (3, 'p-3.jpg', 3);
INSERT INTO `image` VALUES (4, 'p-4.jpg', 4);
INSERT INTO `image` VALUES (5, 'p-5.jpg', 5);
INSERT INTO `image` VALUES (6, 'p-6.jpg', 6);
INSERT INTO `image` VALUES (7, 'p-7.jpg', 7);
INSERT INTO `image` VALUES (8, 'p-8.jpg', 8);
INSERT INTO `image` VALUES (9, 'p-9.jpg', 9);
INSERT INTO `image` VALUES (10, 'p-10.jpg', 10);
INSERT INTO `image` VALUES (11, 'p-11.jpg', 11);
INSERT INTO `image` VALUES (12, 'p-12.jpg', 12);
INSERT INTO `image` VALUES (13, 'p-13.jpg', 13);
INSERT INTO `image` VALUES (14, 'p-14.jpg', 14);
INSERT INTO `image` VALUES (15, 'p-15.jpg', 15);
INSERT INTO `image` VALUES (16, 'p-16.jpg', 16);
INSERT INTO `image` VALUES (17, 'p-17.jpg', 1);
INSERT INTO `image` VALUES (18, 'p-18.jpg', 2);
INSERT INTO `image` VALUES (19, 'p-19.jpg', 3);
INSERT INTO `image` VALUES (20, 'p-20.jpg', 4);
INSERT INTO `image` VALUES (21, 'p-21.jpg', 5);
INSERT INTO `image` VALUES (22, 'p-22.jpg', 6);
INSERT INTO `image` VALUES (23, 'p-23.jpg', 7);
INSERT INTO `image` VALUES (24, 'p-24.jpg', 8);
INSERT INTO `image` VALUES (25, 'p-25.jpg', 9);
INSERT INTO `image` VALUES (26, 'p-26.jpg', 10);
INSERT INTO `image` VALUES (27, 'p-27.jpg', 11);
INSERT INTO `image` VALUES (28, 'p-28.jpg', 12);
INSERT INTO `image` VALUES (29, 'p-29.jpg', 13);
INSERT INTO `image` VALUES (30, 'p-30.jpg', 14);
INSERT INTO `image` VALUES (31, 'p-31.jpg', 15);
INSERT INTO `image` VALUES (32, 'p-32.jpg', 16);
INSERT INTO `image` VALUES (33, 'p-33.jpg', 1);
INSERT INTO `image` VALUES (34, 'p-34.jpg', 2);
INSERT INTO `image` VALUES (35, 'p-35.jpg', 3);
INSERT INTO `image` VALUES (36, 'p-36.jpg', 4);
INSERT INTO `image` VALUES (37, 'p-37.jpg', 5);
INSERT INTO `image` VALUES (38, 'p-38.jpg', 6);
INSERT INTO `image` VALUES (39, 'p-39.jpg', 7);
INSERT INTO `image` VALUES (40, 'p-40.jpg', 8);
INSERT INTO `image` VALUES (41, 'p-41.jpg', 9);
INSERT INTO `image` VALUES (42, 'p-42.jpg', 10);
INSERT INTO `image` VALUES (43, 'p-43.jpg', 11);
INSERT INTO `image` VALUES (44, 'p-44.jpg', 12);
INSERT INTO `image` VALUES (45, 'p-45.jpg', 13);
INSERT INTO `image` VALUES (46, 'p-46.jpg', 14);
INSERT INTO `image` VALUES (47, 'p-47.jpg', 15);
INSERT INTO `image` VALUES (48, 'p-48.jpg', 16);
INSERT INTO `image` VALUES (49, 'p-49.jpg', 1);
INSERT INTO `image` VALUES (50, 'p-50.jpg', 2);
INSERT INTO `image` VALUES (51, 'p-51.jpg', 3);
INSERT INTO `image` VALUES (52, 'p-52.jpg', 4);
INSERT INTO `image` VALUES (53, 'p-53.jpg', 5);
INSERT INTO `image` VALUES (54, 'p-54.jpg', 6);
INSERT INTO `image` VALUES (55, 'p-55.jpg', 7);
INSERT INTO `image` VALUES (56, 'p-56.jpg', 8);
INSERT INTO `image` VALUES (57, 'p-57.jpg', 9);
INSERT INTO `image` VALUES (58, 'p-58.jpg', 10);
INSERT INTO `image` VALUES (59, 'p-59.jpg', 11);
INSERT INTO `image` VALUES (60, 'p-60.jpg', 12);
INSERT INTO `image` VALUES (61, 'p-61.jpg', 13);
INSERT INTO `image` VALUES (62, 'p-62.jpg', 14);
INSERT INTO `image` VALUES (63, 'p-63.jpg', 15);
INSERT INTO `image` VALUES (64, 'p-64.jpg', 16);

-- ----------------------------
-- Table structure for key
-- ----------------------------
DROP TABLE IF EXISTS `key`;
CREATE TABLE `key`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint NULL DEFAULT NULL,
  `public_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_key_user_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_key_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key
-- ----------------------------
INSERT INTO `key` VALUES (1, 0, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCgFGVfrY4jQSoZQWWygZ83roKXWD4YeT2x2p41dGkPixe73rT2IW04glagN2vgoZoHuOPqa5and6kAmK2ujmCHu6D1auJhE2tXP+yLkpSiYMQucDKmCsWMnW9XlC5K7OSL77TXXcfvTvyZcjObEz6LIBRzs6+FqpFbUO9SJEfh6wIDAQAB', 1);
INSERT INTO `key` VALUES (2, 0, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCP5oamhvLQDSaelt29QoW9hbarATB5zrSFaftagf5NWumDev4N/b/cg3Z3k8FAOjTty4oRohd8W/+h0VpDctLKb4Mly5Wn9ynNapnW3SqhdkWPKPdBi1v27DvLGVZb/2ghnXgZtckKbNaBuNfINDK17Aic5m6xSl9i1X+2l12iewIDAQAB', 1);
INSERT INTO `key` VALUES (3, 0, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCf5Egro13ZRN5zUGIEqlfG6DJoUcqSQD5A6Hu5nD2zjxCLlF+OxiK7zk4K+b8L/4z56e+OhmGhIjVJGvOxZno0dHLookJ0bSSXq58CzU0DOM/57maiMzrsscP03Ozs1vnU2KKCoiFQ4EnA6s7wICxhMqRcKKMg1IkzjFeDuU7t2QIDAQAB', 1);
INSERT INTO `key` VALUES (10, 1, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCkQaAFX8MXyLWjrOM+xmEkXQuZ2TJpBOgXbYKmiZhbnICTPC6PIDsbvpNuGw5TsX8IsQSbF5vJPQMYfTdBYrm3lozyCmWRYRcm31OkIVM8DLDy238RsjMEOZUE59VxnK8DgT2MVTiE1qtHrbec7oGvI28LqSCdiUMGCcKMNhD56QIDAQAB', 4);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NULL DEFAULT NULL,
  `shipcost` int NULL DEFAULT NULL,
  `infor_bill` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `user_id` int NOT NULL,
  `verified` bit(1) NULL DEFAULT b'0',
  `date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_detail_product1_idx`(`product_id`) USING BTREE,
  INDEX `fk_order_detail_order1_idx`(`order_id`) USING BTREE,
  INDEX `fk_order_detail_type1`(`type_id`) USING BTREE,
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_detail_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_detail_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` tinyint NULL DEFAULT NULL,
  `category_id` int NOT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `priceKg` int NULL DEFAULT NULL,
  `soldProduct` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category1_idx`(`category_id`) USING BTREE,
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Trà Đinh Thái Nguyên', NULL, 1, 1, NULL, 650000, 15);
INSERT INTO `product` VALUES (2, 'Trà Nõn Tôm Thái Nguyên', NULL, 1, 1, NULL, 600000, 15);
INSERT INTO `product` VALUES (3, 'Trà Móc Câu Thái Nguyên', NULL, 1, 1, NULL, 600000, 15);
INSERT INTO `product` VALUES (4, 'Trà Búp Thái Nguyên', NULL, 1, 1, NULL, 520000, 20);
INSERT INTO `product` VALUES (5, 'Bạch Trà Shan Tuyết', NULL, 1, 2, NULL, 500000, 20);
INSERT INTO `product` VALUES (6, 'Hồng Shan Trà Hà Giang', NULL, 1, 2, NULL, 500000, 20);
INSERT INTO `product` VALUES (7, 'Trà shan tuyết cổ thụ', NULL, 1, 2, NULL, 430000, 20);
INSERT INTO `product` VALUES (8, 'Trà sen', NULL, 1, 3, NULL, 430000, 20);
INSERT INTO `product` VALUES (9, 'Trà lài', NULL, 1, 3, NULL, 430000, 20);
INSERT INTO `product` VALUES (10, 'Trà ướp hoa bưởi', NULL, 1, 3, NULL, 850000, 10);
INSERT INTO `product` VALUES (11, 'Trà oolong Lâm Đồng', NULL, 1, 4, NULL, 750000, 10);
INSERT INTO `product` VALUES (12, 'Trà Nụ Vối', NULL, 1, 5, NULL, 640000, 10);
INSERT INTO `product` VALUES (13, 'Ấm Chén Bát Tràng', NULL, 1, 6, NULL, NULL, 10);
INSERT INTO `product` VALUES (14, 'Bàn – Khay trà tre, gỗ', NULL, 1, 7, NULL, NULL, 10);
INSERT INTO `product` VALUES (15, 'Tống Trà Trắng Viền Giả Đá', NULL, 1, 8, NULL, NULL, 10);
INSERT INTO `product` VALUES (16, 'Lọc Trà Trắng Nhũ Bạc', NULL, 1, 8, NULL, NULL, 10);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_Type_product1_idx`(`product_id`) USING BTREE,
  CONSTRAINT `fk_Type_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'Gói 100 g', 152000, 221, 1);
INSERT INTO `type` VALUES (2, '10 tép 25 g', 400000, 121, 1);
INSERT INTO `type` VALUES (3, 'Hộp 200g', 740000, 121, 1);
INSERT INTO `type` VALUES (4, 'Gói 100 g', 120000, 321, 2);
INSERT INTO `type` VALUES (5, '10 tép 25 g', 200000, 114, 2);
INSERT INTO `type` VALUES (6, 'Hộp 200g', 540000, 121, 2);
INSERT INTO `type` VALUES (7, 'Gói 100 g', 110000, 232, 3);
INSERT INTO `type` VALUES (8, '10 tép 25 g', 500000, 121, 3);
INSERT INTO `type` VALUES (9, 'Hộp 200g', 620000, 636, 3);
INSERT INTO `type` VALUES (10, 'Gói 100 g', 90000, 53, 4);
INSERT INTO `type` VALUES (11, '10 tép 25 g', 100000, 32, 4);
INSERT INTO `type` VALUES (12, 'Hộp 200g', 320000, 32, 4);
INSERT INTO `type` VALUES (13, 'Gói 100 g', 80000, 663, 5);
INSERT INTO `type` VALUES (14, 'Gói 200 g', 160000, 212, 5);
INSERT INTO `type` VALUES (15, 'Hộp 200g', 320000, 31, 5);
INSERT INTO `type` VALUES (16, 'Gói 100 g', 60000, 32, 6);
INSERT INTO `type` VALUES (17, 'Gói 200 g', 110000, 34, 6);
INSERT INTO `type` VALUES (18, 'Gói 100 g', 50000, 63, 7);
INSERT INTO `type` VALUES (19, 'Gói 200 g', 100000, 36, 7);
INSERT INTO `type` VALUES (20, 'Gói 100 g', 150000, 636, 8);
INSERT INTO `type` VALUES (21, 'Gói 200 g', 300000, 366, 8);
INSERT INTO `type` VALUES (22, 'Hộp 200g', 580000, 43, 8);
INSERT INTO `type` VALUES (23, 'Gói 100 g', 190000, 43, 9);
INSERT INTO `type` VALUES (24, 'Gói 200 g', 350000, 43, 9);
INSERT INTO `type` VALUES (25, 'Gói 100 g', 130000, 43, 10);
INSERT INTO `type` VALUES (26, 'Gói 200 g', 450000, 36, 10);
INSERT INTO `type` VALUES (27, 'Gói 50 g', 60000, 36, 11);
INSERT INTO `type` VALUES (28, 'Gói 100 g', 150000, 63, 11);
INSERT INTO `type` VALUES (29, 'Gói 100 g', 150000, 25, 12);
INSERT INTO `type` VALUES (30, 'Một bộ', 150000, 36, 13);
INSERT INTO `type` VALUES (31, 'Một chiếc', 150000, 63, 14);
INSERT INTO `type` VALUES (32, 'Một chiếc', 150000, 36, 15);
INSERT INTO `type` VALUES (33, 'Một chiếc', 150000, 366, 16);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `role` tinyint NULL DEFAULT NULL,
  `public_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `fullname` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'a@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCgFGVfrY4jQSoZQWWygZ83roKXWD4YeT2x2p41dGkPixe73rT2IW04glagN2vgoZoHuOPqa5and6kAmK2ujmCHu6D1auJhE2tXP+yLkpSiYMQucDKmCsWMnW9XlC5K7OSL77TXXcfvTvyZcjObEz6LIBRzs6+FqpFbUO9SJEfh6wIDAQAB', 'Nguyễn Văn A', 'TP. Thủ Đức, TP. HCM', '098123765');
INSERT INTO `user` VALUES (2, 'a1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, NULL, 'Huynh Dong', '154 Xô Viết Nghệ Tĩnh', '0124578934');
INSERT INTO `user` VALUES (3, 'a2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL, 'Lê Nguyễn Thiên Âm', '144 Nam Kỳ Khởi Nghĩa, TP. HCM', NULL);
INSERT INTO `user` VALUES (4, 'b@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL, 'Tran Van Ba', '1 Cát Lái', '0123456789');

SET FOREIGN_KEY_CHECKS = 1;

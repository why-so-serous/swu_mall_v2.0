/*
 Navicat Premium Data Transfer

 Source Server         : new
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : tmall_ssm

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 13/06/2019 10:42:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类的名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '女装 /时尚');
INSERT INTO `category` VALUES (2, '男装 /运动户外');
INSERT INTO `category` VALUES (3, '女鞋 /男鞋 /箱包');
INSERT INTO `category` VALUES (4, '美妆 /个人护理');
INSERT INTO `category` VALUES (5, '腕表 /眼镜 /珠宝饰品');
INSERT INTO `category` VALUES (6, '手机 /数码 /电脑办公');
INSERT INTO `category` VALUES (7, '母婴玩具');
INSERT INTO `category` VALUES (8, '零食 /茶酒 /进口食品');
INSERT INTO `category` VALUES (9, '生鲜水果');
INSERT INTO `category` VALUES (10, '大家电 /生活电器');
INSERT INTO `category` VALUES (11, '家具建材');
INSERT INTO `category` VALUES (12, '汽车 /配件 /用品');
INSERT INTO `category` VALUES (13, '家纺 /家饰 /鲜花');
INSERT INTO `category` VALUES (14, '医药保健');
INSERT INTO `category` VALUES (15, '厨具 /收纳 /宠物');
INSERT INTO `category` VALUES (16, '图书音像');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮编',
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `user_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户备注的信息',
  `create_date` datetime NOT NULL COMMENT '订单创建时间',
  `pay_date` datetime NULL DEFAULT NULL COMMENT '订单支付时间',
  `delivery_date` datetime NULL DEFAULT NULL COMMENT '发货日期',
  `confirm_date` datetime NULL DEFAULT NULL COMMENT '确认收货日期',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '对应的用户id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES (1, '123456', '地球村', '', 'XY', '', '', '1998-01-05 00:00:00', '2019-04-29 00:00:00', '2019-04-29 00:00:00', '2019-04-29 00:00:00', 1, 'delete');
INSERT INTO `order_` VALUES (10, '20190506143826504', '123123', '', 'XY', '12345678910', '', '2019-05-06 00:00:00', '2019-05-06 00:00:00', NULL, NULL, 1, 'delete');
INSERT INTO `order_` VALUES (11, '20190507092435428', '详细地址', '', 'XY', '12345678910', '卖家留言', '2019-05-07 00:00:00', '2019-05-07 00:00:00', NULL, NULL, 1, 'finish');
INSERT INTO `order_` VALUES (12, '20190507180327444', '123', '', 'XY', '12345678910', '', '2019-05-07 00:00:00', '2019-05-07 00:00:00', '2019-05-07 00:00:00', '2019-05-07 00:00:00', 1, 'finish');
INSERT INTO `order_` VALUES (13, '20190507205110309', '', '', '', '', '', '2019-05-07 00:00:00', '2019-06-07 20:51:56', NULL, NULL, 1, 'waitDelivery');
INSERT INTO `order_` VALUES (14, '20190716093257383', '', '', '', '', '', '2019-07-16 00:00:00', '2019-06-08 09:32:59', NULL, NULL, 4, 'waitDelivery');
INSERT INTO `order_` VALUES (15, '20190612223627348', '', '', '', '', '', '2019-06-12 00:00:00', '2019-06-12 22:36:32', NULL, NULL, 5, 'waitDelivery');
INSERT INTO `order_` VALUES (16, '20190612225226876', '', '', '', '', '', '2019-06-12 00:00:00', NULL, NULL, NULL, 5, 'delete');
INSERT INTO `order_` VALUES (17, '20190612225600474', '', '', '', '', '', '2019-06-12 22:56:00', NULL, NULL, NULL, 5, 'waitPay');
INSERT INTO `order_` VALUES (18, '20190612225840953', '', '', '', '', '', '2019-06-12 22:58:40', NULL, NULL, NULL, 5, 'waitPay');
INSERT INTO `order_` VALUES (19, '20190612230104206', '', '', '', '', '', '2019-06-12 23:01:04', NULL, NULL, NULL, 5, 'waitPay');
INSERT INTO `order_` VALUES (20, '20190612230235987', '', '', '', '', '', '2019-06-12 23:02:35', NULL, NULL, NULL, 5, 'waitPay');
INSERT INTO `order_` VALUES (21, '20190613094636988', '', '', '', '', '', '2019-06-13 00:00:00', '2019-06-13 09:48:06', NULL, NULL, 5, 'waitDelivery');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NOT NULL COMMENT '对应产品id',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单id',
  `user_id` int(11) NOT NULL COMMENT '对应用户id',
  `number` int(11) NULL DEFAULT NULL COMMENT '对应产品购买的数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_item_product`(`product_id`) USING BTREE,
  INDEX `fk_order_item_order`(`order_id`) USING BTREE,
  INDEX `fk_order_item_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_item_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (14, 5, 11, 1, 1);
INSERT INTO `order_item` VALUES (15, 6, 11, 1, 1);
INSERT INTO `order_item` VALUES (16, 4, NULL, 1, 5);
INSERT INTO `order_item` VALUES (17, 4, 12, 1, 1);
INSERT INTO `order_item` VALUES (18, 8, 13, 1, 1);
INSERT INTO `order_item` VALUES (19, 5, 14, 4, 1);
INSERT INTO `order_item` VALUES (20, 4, 15, 5, 4);
INSERT INTO `order_item` VALUES (21, 4, 16, 5, 1);
INSERT INTO `order_item` VALUES (22, 4, 17, 5, 1);
INSERT INTO `order_item` VALUES (23, 5, 18, 5, 2);
INSERT INTO `order_item` VALUES (24, 4, 19, 5, 1);
INSERT INTO `order_item` VALUES (25, 5, 20, 5, 1);
INSERT INTO `order_item` VALUES (26, 8, 21, 5, 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品的名称',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小标题',
  `price` float NULL DEFAULT NULL COMMENT '价格',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (4, '女装 (UT) UTGP2019 Pokémon印花T恤(短袖) 422648 优衣库UNIQLO', '初上市价格99元', 99, 666, 25, 1);
INSERT INTO `product` VALUES (5, '女装 休闲连帽运动衫(长袖) 418236 优衣库UNIQLO', '此商品不支持优惠券', 199, 23, 25, 1);
INSERT INTO `product` VALUES (6, '女装 高弹力牛仔紧身长裤(水洗产品) 421747 优衣库UNIQLO', '贴身感 舒适穿着感 舒适好穿', 199, 12, 645, 1);
INSERT INTO `product` VALUES (7, '女装 麻棉窄口裤 414522 优衣库UNIQLO', '质感自然 穿着感舒爽 利落有型', 149, 3306, 125, 1);
INSERT INTO `product` VALUES (8, '男装/女装 (UT) KAWS印花T恤(短袖) 421771 优衣库UNIQLO', '此商品每个用户ID限购2件', 99, 998, 2, 1);
INSERT INTO `product` VALUES (9, '产品6', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (10, '产品7', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (11, '产品8', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (12, '产品9', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (13, '产品10', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (14, '产品11', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (15, '产品12', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (16, '产品13', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (17, '产品14', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (18, '产品15', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (19, '产品16', '', NULL, NULL, NULL, 1);
INSERT INTO `product` VALUES (20, '产品17', '', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '对应的产品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_image_product`(`product_id`) USING BTREE,
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES (11, 4);
INSERT INTO `product_image` VALUES (12, 4);
INSERT INTO `product_image` VALUES (13, 4);
INSERT INTO `product_image` VALUES (14, 4);
INSERT INTO `product_image` VALUES (15, 4);
INSERT INTO `product_image` VALUES (16, 5);
INSERT INTO `product_image` VALUES (17, 5);
INSERT INTO `product_image` VALUES (18, 5);
INSERT INTO `product_image` VALUES (19, 5);
INSERT INTO `product_image` VALUES (20, 5);
INSERT INTO `product_image` VALUES (21, 6);
INSERT INTO `product_image` VALUES (22, 6);
INSERT INTO `product_image` VALUES (23, 6);
INSERT INTO `product_image` VALUES (24, 6);
INSERT INTO `product_image` VALUES (25, 6);
INSERT INTO `product_image` VALUES (26, 7);
INSERT INTO `product_image` VALUES (27, 7);
INSERT INTO `product_image` VALUES (28, 7);
INSERT INTO `product_image` VALUES (29, 7);
INSERT INTO `product_image` VALUES (30, 7);
INSERT INTO `product_image` VALUES (31, 8);
INSERT INTO `product_image` VALUES (32, 8);
INSERT INTO `product_image` VALUES (33, 8);
INSERT INTO `product_image` VALUES (34, 8);
INSERT INTO `product_image` VALUES (35, 8);
INSERT INTO `product_image` VALUES (36, 9);
INSERT INTO `product_image` VALUES (37, 9);
INSERT INTO `product_image` VALUES (38, 9);
INSERT INTO `product_image` VALUES (39, 9);
INSERT INTO `product_image` VALUES (40, 9);
INSERT INTO `product_image` VALUES (41, 10);
INSERT INTO `product_image` VALUES (42, 10);
INSERT INTO `product_image` VALUES (43, 10);
INSERT INTO `product_image` VALUES (44, 10);
INSERT INTO `product_image` VALUES (45, 10);
INSERT INTO `product_image` VALUES (46, 11);
INSERT INTO `product_image` VALUES (47, 11);
INSERT INTO `product_image` VALUES (48, 11);
INSERT INTO `product_image` VALUES (49, 11);
INSERT INTO `product_image` VALUES (50, 11);
INSERT INTO `product_image` VALUES (51, 12);
INSERT INTO `product_image` VALUES (52, 12);
INSERT INTO `product_image` VALUES (53, 12);
INSERT INTO `product_image` VALUES (54, 12);
INSERT INTO `product_image` VALUES (55, 12);
INSERT INTO `product_image` VALUES (56, 13);
INSERT INTO `product_image` VALUES (57, 13);
INSERT INTO `product_image` VALUES (58, 13);
INSERT INTO `product_image` VALUES (59, 13);
INSERT INTO `product_image` VALUES (60, 13);
INSERT INTO `product_image` VALUES (61, 14);
INSERT INTO `product_image` VALUES (62, 14);
INSERT INTO `product_image` VALUES (63, 14);
INSERT INTO `product_image` VALUES (64, 14);
INSERT INTO `product_image` VALUES (65, 14);
INSERT INTO `product_image` VALUES (66, 15);
INSERT INTO `product_image` VALUES (67, 15);
INSERT INTO `product_image` VALUES (68, 15);
INSERT INTO `product_image` VALUES (69, 15);
INSERT INTO `product_image` VALUES (70, 15);
INSERT INTO `product_image` VALUES (71, 16);
INSERT INTO `product_image` VALUES (72, 16);
INSERT INTO `product_image` VALUES (73, 16);
INSERT INTO `product_image` VALUES (74, 16);
INSERT INTO `product_image` VALUES (75, 16);
INSERT INTO `product_image` VALUES (76, 17);
INSERT INTO `product_image` VALUES (77, 17);
INSERT INTO `product_image` VALUES (78, 17);
INSERT INTO `product_image` VALUES (79, 17);
INSERT INTO `product_image` VALUES (80, 17);
INSERT INTO `product_image` VALUES (81, 18);
INSERT INTO `product_image` VALUES (82, 18);
INSERT INTO `product_image` VALUES (83, 18);
INSERT INTO `product_image` VALUES (84, 18);
INSERT INTO `product_image` VALUES (85, 18);
INSERT INTO `product_image` VALUES (86, 19);
INSERT INTO `product_image` VALUES (87, 19);
INSERT INTO `product_image` VALUES (88, 19);
INSERT INTO `product_image` VALUES (89, 19);
INSERT INTO `product_image` VALUES (90, 19);
INSERT INTO `product_image` VALUES (91, 20);
INSERT INTO `product_image` VALUES (92, 20);
INSERT INTO `product_image` VALUES (93, 20);
INSERT INTO `product_image` VALUES (94, 20);
INSERT INTO `product_image` VALUES (95, 20);

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `category_id` int(11) NOT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_property_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_property_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES (1, '尺寸', 1);
INSERT INTO `property` VALUES (2, '厚薄', 1);
INSERT INTO `property` VALUES (3, '材质成分', 1);
INSERT INTO `property` VALUES (4, '货号', 1);
INSERT INTO `property` VALUES (5, '基础风格', 1);
INSERT INTO `property` VALUES (6, '品牌', 1);

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NOT NULL COMMENT '对应产品id',
  `property_id` int(11) NOT NULL COMMENT '对应属性id',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体的属性值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_property_value_property`(`property_id`) USING BTREE,
  INDEX `fk_property_value_product`(`product_id`) USING BTREE,
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of property_value
-- ----------------------------
INSERT INTO `property_value` VALUES (1, 4, 1, 'L M XL XLL');
INSERT INTO `property_value` VALUES (2, 4, 2, '常规');
INSERT INTO `property_value` VALUES (3, 4, 3, '棉66% 聚酯纤维34%');
INSERT INTO `property_value` VALUES (4, 4, 4, 'UQ404133000');
INSERT INTO `property_value` VALUES (5, 4, 5, '其他');
INSERT INTO `property_value` VALUES (6, 4, 6, 'Uniqlo/优衣库');

-- ----------------------------
-- Table structure for referal_link
-- ----------------------------
DROP TABLE IF EXISTS `referal_link`;
CREATE TABLE `referal_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '超链显示的文字',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '超链的地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of referal_link
-- ----------------------------
INSERT INTO `referal_link` VALUES (1, '天猫会员', '#nowhere');
INSERT INTO `referal_link` VALUES (2, '电器城', '#nowhere');
INSERT INTO `referal_link` VALUES (3, '喵鲜生', '#nowhere');
INSERT INTO `referal_link` VALUES (4, '医药馆', '#nowhere');
INSERT INTO `referal_link` VALUES (5, '营业厅', '#nowhere');
INSERT INTO `referal_link` VALUES (6, '魅力惠', '#nowhere');
INSERT INTO `referal_link` VALUES (7, '飞猪旅游', '#nowhere');
INSERT INTO `referal_link` VALUES (8, '苏宁易购', '#nowhere');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `user_id` int(11) NOT NULL COMMENT '对应的用户id',
  `product_id` int(11) NOT NULL COMMENT '对应的产品id',
  `createDate` datetime NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_review_product`(`product_id`) USING BTREE,
  INDEX `fk_review_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (2, '这款短袖T恤不错哦，没想到买的号码挺准。上身效果好看，特别时尚休闲。和图片上的一样，没色差，衣服料子很好，没线头，布料是棉的，摸起来舒服，比想象的要厚实。朋友们都说好看，款式简洁大方。真的是超级赞，以后就认准这家啦，有想买的亲赶快下手哦。我是这的老顾客了，这家产品确实一直棒棒的哦。', 1, 4, '2019-05-02 10:24:02');
INSERT INTO `review` VALUES (3, '比较轻薄，质量蛮好的，穿起来还是比较舒适，很合身，价格也实惠！', 1, 4, '2019-05-02 10:42:07');
INSERT INTO `review` VALUES (6, '上身效果很好', 3, 6, '2019-05-07 10:49:09');
INSERT INTO `review` VALUES (7, '评价一个', 1, 6, '2019-05-07 11:01:06');
INSERT INTO `review` VALUES (8, 'qw54e5qwe4qw6eq4eqewq', 1, 4, '2019-05-07 18:05:09');
INSERT INTO `review` VALUES (9, '当评价完成之后，可以看到其他用户的评价信息', 1, 4, '2019-05-07 20:59:49');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'XY', '123');
INSERT INTO `user` VALUES (2, 'XYQ', '123');
INSERT INTO `user` VALUES (3, 'XYQ005', '123');
INSERT INTO `user` VALUES (4, 'XY025', '123');
INSERT INTO `user` VALUES (5, '1', '1');

SET FOREIGN_KEY_CHECKS = 1;

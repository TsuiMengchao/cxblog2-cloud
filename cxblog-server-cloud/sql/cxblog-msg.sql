/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : cxblog-msg

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/05/2024 22:41:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for msg_email_config
-- ----------------------------
DROP TABLE IF EXISTS `msg_email_config`;
CREATE TABLE `msg_email_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '发件者用户名',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '邮箱配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msg_email_config
-- ----------------------------
INSERT INTO `msg_email_config` VALUES (1, 'tsuimengchao@163.com', 'smtp.163.com', 'AEA12EEBB34214BE102BA0648F3B2713405D952834C75749', '465', '梦辰雪', null, null, null, null, null);

-- ----------------------------
-- Table structure for payment_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `payment_alipay_config`;
CREATE TABLE `payment_alipay_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '异步回调',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '私钥',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '公钥',
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商户号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '支付宝配置类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_alipay_config
-- ----------------------------
INSERT INTO `payment_alipay_config` VALUES (1, '9021000134676453', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://xn--zfr188b.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/api/aliPay/notify', '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', 'http://xn--zfr188b.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/api/aliPay/return', 'RSA2', '2088721030642173', null, null, null, null, null);

SET FOREIGN_KEY_CHECKS = 1;

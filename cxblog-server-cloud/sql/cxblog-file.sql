/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : cxblog-file

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/05/2024 22:29:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_local_config
-- ----------------------------
DROP TABLE IF EXISTS `file_local_config`;
CREATE TABLE `file_local_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `local_file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外链域名',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '本地配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_local_config
-- ----------------------------
INSERT INTO `file_local_config` VALUES (1, 'http://localhost:8000/file/');

-- ----------------------------
-- Table structure for file_local_content
-- ----------------------------
DROP TABLE IF EXISTS `file_local_content`;
CREATE TABLE `file_local_content`  (
  `storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大小',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '本地存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_local_content
-- ----------------------------

-- ----------------------------
-- Table structure for file_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `file_qiniu_config`;
CREATE TABLE `file_qiniu_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `access_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'accessKey',
  `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外链域名',
  `secret_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'secretKey',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机房',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '七牛云配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_qiniu_config
-- ----------------------------
INSERT INTO `file_qiniu_config` VALUES (1, 'AWmtGNZuK4WJ1oCP9ScfgdaLQoIUbeEZGAVDmHs5', 'mcx-blog', 'https://cxblog.qiniu.zhaohaoyue.love', 'pqrEyEp3ngG62J7X1pfKy9R0eUuBEBQAwFOvOOZY', '公开', '华南', null, null, null, null, null);

-- ----------------------------
-- Table structure for file_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `file_qiniu_content`;
CREATE TABLE `file_qiniu_content`  (
  `content_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型：私有或公开',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`content_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4387 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '七牛云文件存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (9, 'file_local_config', '本地配置', NULL, NULL, 'FileLocalConfig', 'crud', '', 'me.mcx.file', 'file', 'config', '本地配置', 'mcx', '0', '/', NULL, 'admin', '2024-05-03 20:10:03', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'file_local_content', '本地存储', NULL, NULL, 'FileLocalContent', 'crud', 'element-plus', 'me.mcx.file', 'file', 'content', '本地存储', 'mcx', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00', NULL);
INSERT INTO `gen_table` VALUES (11, 'file_qiniu_config', '七牛云配置', NULL, NULL, 'FileQiniuConfig', 'crud', 'element-plus', 'me.mcx.file', 'file', 'qiniuConfig', '七牛云配置', 'mcx', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03', NULL);
INSERT INTO `gen_table` VALUES (12, 'file_qiniu_content', '七牛云文件存储', NULL, NULL, 'FileQiniuContent', 'crud', 'element-plus', 'me.mcx.file', 'file', 'qiniuContent', '七牛云文件存储', 'mcx', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (57, 9, 'config_id', 'ID', 'bigint(20)', 'Long', 'configId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-03 20:10:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 9, 'local_file_url', '外链域名', 'varchar(255)', 'String', 'localFileUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-03 20:10:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 10, 'storage_id', 'ID', 'bigint(20)', 'Long', 'storageId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (60, 10, 'real_name', '文件真实的名称', 'varchar(255)', 'String', 'realName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (61, 10, 'name', '文件名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (62, 10, 'suffix', '后缀', 'varchar(255)', 'String', 'suffix', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (63, 10, 'path', '路径', 'varchar(255)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (64, 10, 'type', '类型', 'varchar(255)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (65, 10, 'size', '大小', 'varchar(100)', 'String', 'size', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (66, 10, 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (67, 10, 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (68, 10, 'create_time', '创建日期', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (69, 10, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-05-03 20:10:03', '', '2024-05-04 19:29:00');
INSERT INTO `gen_table_column` VALUES (70, 11, 'config_id', 'ID', 'bigint(20)', 'Long', 'configId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (71, 11, 'access_key', 'accessKey', 'text', 'String', 'accessKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 2, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (72, 11, 'bucket', 'Bucket 识别符', 'varchar(255)', 'String', 'bucket', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (73, 11, 'host', '外链域名', 'varchar(255)', 'String', 'host', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (74, 11, 'secret_key', 'secretKey', 'text', 'String', 'secretKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (75, 11, 'type', '空间类型', 'varchar(255)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (76, 11, 'zone', '机房', 'varchar(255)', 'String', 'zone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:03');
INSERT INTO `gen_table_column` VALUES (77, 12, 'content_id', 'ID', 'bigint(20)', 'Long', 'contentId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (78, 12, 'bucket', 'Bucket 识别符', 'varchar(255)', 'String', 'bucket', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 2, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (79, 12, 'name', '文件名称', 'varchar(180)', 'String', 'name', '0', '0', NULL, '0', '0', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (80, 12, 'size', '文件大小', 'varchar(255)', 'String', 'size', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (81, 12, 'type', '文件类型：私有或公开', 'varchar(255)', 'String', 'type', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'select', '', 5, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (82, 12, 'url', '文件url', 'varchar(255)', 'String', 'url', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (83, 12, 'suffix', '文件后缀', 'varchar(255)', 'String', 'suffix', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');
INSERT INTO `gen_table_column` VALUES (84, 12, 'update_time', '上传或同步的时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-05-03 20:10:03', '', '2024-05-03 21:38:16');

SET FOREIGN_KEY_CHECKS = 1;

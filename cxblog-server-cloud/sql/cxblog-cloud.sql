/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : cxblog-cloud

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/04/2024 22:27:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-04-28 14:02:41', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-04-28 14:02:41', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-04-28 14:02:41', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-04-28 14:02:41', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-28 14:02:41', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '辰雪科技', 0, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '河北总公司', 1, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '重庆分公司', 2, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '梦辰雪', '15888888888', 'mcx@qq.com', '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-28 14:02:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2229 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-04-28 14:02:41', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-04-28 14:02:41', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-04-28 14:02:41', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-04-28 14:02:41', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-28 14:02:41', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-28 14:02:41', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-28 14:02:41', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-28 14:02:41', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-28 14:02:41', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-28 14:02:41', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-28 14:02:41', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-28 14:02:41', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-04-28 14:02:41', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-28 14:02:41', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-28 14:02:41', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2024-04-28 14:02:41', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2024-04-28 14:02:41', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-28 14:02:41', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-04-28 14:02:41', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-04-28 14:02:41', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-04-28 14:02:41', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2024-04-28 14:02:41', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2024-04-28 14:02:41', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '博客管理', 0, 3, 'blogs', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-04-28 16:16:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '博客文章', 2000, 1, 'article', 'blog/article/index', NULL, 1, 0, 'C', '0', '0', 'blog:article:list', '#', 'admin', '2024-04-28 15:39:14', '', NULL, '博客文章菜单');
INSERT INTO `sys_menu` VALUES (2002, '博客文章查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:query', '#', 'admin', '2024-04-28 15:39:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '博客文章新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:add', '#', 'admin', '2024-04-28 15:39:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '博客文章修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:edit', '#', 'admin', '2024-04-28 15:39:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '博客文章删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:remove', '#', 'admin', '2024-04-28 15:39:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '博客文章导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:export', '#', 'admin', '2024-04-28 15:39:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '文章收藏', 2228, 1, 'articleCollect', 'blog/articleCollect/index', NULL, 1, 0, 'C', '0', '0', 'blog:articleCollect:list', '#', 'admin', '2024-04-28 15:39:30', '', NULL, '文章收藏菜单');
INSERT INTO `sys_menu` VALUES (2008, '文章收藏查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleCollect:query', '#', 'admin', '2024-04-28 15:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '文章收藏新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleCollect:add', '#', 'admin', '2024-04-28 15:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '文章收藏修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleCollect:edit', '#', 'admin', '2024-04-28 15:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '文章收藏删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleCollect:remove', '#', 'admin', '2024-04-28 15:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '文章收藏导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleCollect:export', '#', 'admin', '2024-04-28 15:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '评论', 2227, 1, 'articleComment', 'blog/articleComment/index', NULL, 1, 0, 'C', '0', '0', 'blog:articleComment:list', '#', 'admin', '2024-04-28 15:39:42', '', NULL, '评论菜单');
INSERT INTO `sys_menu` VALUES (2014, '评论查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleComment:query', '#', 'admin', '2024-04-28 15:39:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '评论新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleComment:add', '#', 'admin', '2024-04-28 15:39:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '评论修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleComment:edit', '#', 'admin', '2024-04-28 15:39:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '评论删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleComment:remove', '#', 'admin', '2024-04-28 15:39:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '评论导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleComment:export', '#', 'admin', '2024-04-28 15:39:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '文章收藏', 2228, 1, 'articleLike', 'blog/articleLike/index', NULL, 1, 0, 'C', '0', '0', 'blog:articleLike:list', '#', 'admin', '2024-04-28 15:40:00', '', NULL, '文章收藏菜单');
INSERT INTO `sys_menu` VALUES (2020, '文章收藏查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleLike:query', '#', 'admin', '2024-04-28 15:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '文章收藏新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleLike:add', '#', 'admin', '2024-04-28 15:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '文章收藏修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleLike:edit', '#', 'admin', '2024-04-28 15:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '文章收藏删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleLike:remove', '#', 'admin', '2024-04-28 15:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '文章收藏导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleLike:export', '#', 'admin', '2024-04-28 15:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '文章标签', 2000, 5, 'articleTag', 'blog/articleTag/index', NULL, 1, 0, 'C', '0', '0', 'blog:articleTag:list', '#', 'admin', '2024-04-28 15:40:11', '', NULL, '文章标签菜单');
INSERT INTO `sys_menu` VALUES (2026, '文章标签查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleTag:query', '#', 'admin', '2024-04-28 15:40:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '文章标签新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleTag:add', '#', 'admin', '2024-04-28 15:40:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '文章标签修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleTag:edit', '#', 'admin', '2024-04-28 15:40:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '文章标签删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleTag:remove', '#', 'admin', '2024-04-28 15:40:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '文章标签导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:articleTag:export', '#', 'admin', '2024-04-28 15:40:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '博客分类', 2000, 6, 'category', 'blog/category/index', NULL, 1, 0, 'C', '0', '0', 'blog:category:list', '#', 'admin', '2024-04-28 15:40:22', '', NULL, '博客分类菜单');
INSERT INTO `sys_menu` VALUES (2032, '博客分类查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:query', '#', 'admin', '2024-04-28 15:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '博客分类新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:add', '#', 'admin', '2024-04-28 15:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '博客分类修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:edit', '#', 'admin', '2024-04-28 15:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '博客分类删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:remove', '#', 'admin', '2024-04-28 15:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '博客分类导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:export', '#', 'admin', '2024-04-28 15:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '情', 2228, 1, 'emoji', 'blog/emoji/index', NULL, 1, 0, 'C', '0', '0', 'blog:emoji:list', '#', 'admin', '2024-04-28 15:40:35', '', NULL, '情菜单');
INSERT INTO `sys_menu` VALUES (2038, '情查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:emoji:query', '#', 'admin', '2024-04-28 15:40:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '情新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:emoji:add', '#', 'admin', '2024-04-28 15:40:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '情修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:emoji:edit', '#', 'admin', '2024-04-28 15:40:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '情删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:emoji:remove', '#', 'admin', '2024-04-28 15:40:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '情导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:emoji:export', '#', 'admin', '2024-04-28 15:40:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '问题反馈', 2225, 1, 'feedBack', 'blog/feedBack/index', NULL, 1, 0, 'C', '0', '0', 'blog:feedBack:list', '#', 'admin', '2024-04-28 15:40:47', '', NULL, '问题反馈菜单');
INSERT INTO `sys_menu` VALUES (2044, '问题反馈查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:feedBack:query', '#', 'admin', '2024-04-28 15:40:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '问题反馈新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:feedBack:add', '#', 'admin', '2024-04-28 15:40:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '问题反馈修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:feedBack:edit', '#', 'admin', '2024-04-28 15:40:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '问题反馈删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:feedBack:remove', '#', 'admin', '2024-04-28 15:40:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '问题反馈导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:feedBack:export', '#', 'admin', '2024-04-28 15:40:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '用户关注', 2228, 1, 'followed', 'blog/followed/index', NULL, 1, 0, 'C', '0', '0', 'blog:followed:list', '#', 'admin', '2024-04-28 15:41:03', '', NULL, '用户关注菜单');
INSERT INTO `sys_menu` VALUES (2050, '用户关注查询', 2049, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:followed:query', '#', 'admin', '2024-04-28 15:41:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '用户关注新增', 2049, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:followed:add', '#', 'admin', '2024-04-28 15:41:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '用户关注修改', 2049, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:followed:edit', '#', 'admin', '2024-04-28 15:41:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '用户关注删除', 2049, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:followed:remove', '#', 'admin', '2024-04-28 15:41:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '用户关注导出', 2049, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:followed:export', '#', 'admin', '2024-04-28 15:41:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '圈子话题', 2000, 2, 'forum', 'blog/forum/index', NULL, 1, 0, 'C', '0', '0', 'blog:forum:list', '#', 'admin', '2024-04-28 15:41:15', '', NULL, '圈子话题菜单');
INSERT INTO `sys_menu` VALUES (2056, '圈子话题查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forum:query', '#', 'admin', '2024-04-28 15:41:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '圈子话题新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forum:add', '#', 'admin', '2024-04-28 15:41:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '圈子话题修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forum:edit', '#', 'admin', '2024-04-28 15:41:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '圈子话题删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forum:remove', '#', 'admin', '2024-04-28 15:41:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '圈子话题导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forum:export', '#', 'admin', '2024-04-28 15:41:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '圈子评论', 2227, 1, 'forumComment', 'blog/forumComment/index', NULL, 1, 0, 'C', '0', '0', 'blog:forumComment:list', '#', 'admin', '2024-04-28 15:41:27', '', NULL, '圈子评论菜单');
INSERT INTO `sys_menu` VALUES (2062, '圈子评论查询', 2061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumComment:query', '#', 'admin', '2024-04-28 15:41:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '圈子评论新增', 2061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumComment:add', '#', 'admin', '2024-04-28 15:41:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '圈子评论修改', 2061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumComment:edit', '#', 'admin', '2024-04-28 15:41:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '圈子评论删除', 2061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumComment:remove', '#', 'admin', '2024-04-28 15:41:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '圈子评论导出', 2061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumComment:export', '#', 'admin', '2024-04-28 15:41:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '圈子内容点赞', 2228, 1, 'forumLike', 'blog/forumLike/index', NULL, 1, 0, 'C', '0', '0', 'blog:forumLike:list', '#', 'admin', '2024-04-28 15:41:43', '', NULL, '圈子内容点赞菜单');
INSERT INTO `sys_menu` VALUES (2068, '圈子内容点赞查询', 2067, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumLike:query', '#', 'admin', '2024-04-28 15:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '圈子内容点赞新增', 2067, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumLike:add', '#', 'admin', '2024-04-28 15:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '圈子内容点赞修改', 2067, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumLike:edit', '#', 'admin', '2024-04-28 15:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '圈子内容点赞删除', 2067, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumLike:remove', '#', 'admin', '2024-04-28 15:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '圈子内容点赞导出', 2067, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:forumLike:export', '#', 'admin', '2024-04-28 15:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '友情链接', 2226, 1, 'friendLink', 'blog/friendLink/index', NULL, 1, 0, 'C', '0', '0', 'blog:friendLink:list', '#', 'admin', '2024-04-28 15:41:54', '', NULL, '友情链接菜单');
INSERT INTO `sys_menu` VALUES (2074, '友情链接查询', 2073, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:friendLink:query', '#', 'admin', '2024-04-28 15:41:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '友情链接新增', 2073, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:friendLink:add', '#', 'admin', '2024-04-28 15:41:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '友情链接修改', 2073, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:friendLink:edit', '#', 'admin', '2024-04-28 15:41:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '友情链接删除', 2073, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:friendLink:remove', '#', 'admin', '2024-04-28 15:41:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '友情链接导出', 2073, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:friendLink:export', '#', 'admin', '2024-04-28 15:41:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '即时消息', 2228, 1, 'imMessage', 'blog/imMessage/index', NULL, 1, 0, 'C', '0', '0', 'blog:imMessage:list', '#', 'admin', '2024-04-28 15:42:04', '', NULL, '即时消息菜单');
INSERT INTO `sys_menu` VALUES (2080, '即时消息查询', 2079, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imMessage:query', '#', 'admin', '2024-04-28 15:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '即时消息新增', 2079, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imMessage:add', '#', 'admin', '2024-04-28 15:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '即时消息修改', 2079, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imMessage:edit', '#', 'admin', '2024-04-28 15:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '即时消息删除', 2079, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imMessage:remove', '#', 'admin', '2024-04-28 15:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '即时消息导出', 2079, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imMessage:export', '#', 'admin', '2024-04-28 15:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '用户消息房间', 2228, 1, 'imRoom', 'blog/imRoom/index', NULL, 1, 0, 'C', '0', '0', 'blog:imRoom:list', '#', 'admin', '2024-04-28 15:42:20', '', NULL, '用户消息房间菜单');
INSERT INTO `sys_menu` VALUES (2086, '用户消息房间查询', 2085, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imRoom:query', '#', 'admin', '2024-04-28 15:42:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '用户消息房间新增', 2085, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imRoom:add', '#', 'admin', '2024-04-28 15:42:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '用户消息房间修改', 2085, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imRoom:edit', '#', 'admin', '2024-04-28 15:42:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '用户消息房间删除', 2085, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imRoom:remove', '#', 'admin', '2024-04-28 15:42:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '用户消息房间导出', 2085, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:imRoom:export', '#', 'admin', '2024-04-28 15:42:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '留言', 2225, 1, 'message', 'blog/message/index', NULL, 1, 0, 'C', '0', '0', 'blog:message:list', '#', 'admin', '2024-04-28 15:42:31', '', NULL, '留言菜单');
INSERT INTO `sys_menu` VALUES (2092, '留言查询', 2091, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:message:query', '#', 'admin', '2024-04-28 15:42:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '留言新增', 2091, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:message:add', '#', 'admin', '2024-04-28 15:42:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '留言修改', 2091, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:message:edit', '#', 'admin', '2024-04-28 15:42:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '留言删除', 2091, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:message:remove', '#', 'admin', '2024-04-28 15:42:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '留言导出', 2091, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:message:export', '#', 'admin', '2024-04-28 15:42:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '网站导航', 2226, 1, 'navigation', 'blog/navigation/index', NULL, 1, 0, 'C', '0', '0', 'blog:navigation:list', '#', 'admin', '2024-04-28 15:42:43', '', NULL, '网站导航菜单');
INSERT INTO `sys_menu` VALUES (2098, '网站导航查询', 2097, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:navigation:query', '#', 'admin', '2024-04-28 15:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '网站导航新增', 2097, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:navigation:add', '#', 'admin', '2024-04-28 15:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '网站导航修改', 2097, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:navigation:edit', '#', 'admin', '2024-04-28 15:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '网站导航删除', 2097, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:navigation:remove', '#', 'admin', '2024-04-28 15:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '网站导航导出', 2097, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:navigation:export', '#', 'admin', '2024-04-28 15:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '道具', 2228, 1, 'prop', 'blog/prop/index', NULL, 1, 0, 'C', '0', '0', 'blog:prop:list', '#', 'admin', '2024-04-28 15:42:55', '', NULL, '道具菜单');
INSERT INTO `sys_menu` VALUES (2104, '道具查询', 2103, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:prop:query', '#', 'admin', '2024-04-28 15:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '道具新增', 2103, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:prop:add', '#', 'admin', '2024-04-28 15:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '道具修改', 2103, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:prop:edit', '#', 'admin', '2024-04-28 15:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '道具删除', 2103, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:prop:remove', '#', 'admin', '2024-04-28 15:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '道具导出', 2103, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:prop:export', '#', 'admin', '2024-04-28 15:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '说说', 2000, 3, 'say', 'blog/say/index', NULL, 1, 0, 'C', '0', '0', 'blog:say:list', '#', 'admin', '2024-04-28 15:43:09', '', NULL, '说说菜单');
INSERT INTO `sys_menu` VALUES (2110, '说说查询', 2109, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:say:query', '#', 'admin', '2024-04-28 15:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '说说新增', 2109, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:say:add', '#', 'admin', '2024-04-28 15:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '说说修改', 2109, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:say:edit', '#', 'admin', '2024-04-28 15:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2113, '说说删除', 2109, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:say:remove', '#', 'admin', '2024-04-28 15:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '说说导出', 2109, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:say:export', '#', 'admin', '2024-04-28 15:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '说说评论', 2227, 1, 'sayComment', 'blog/sayComment/index', NULL, 1, 0, 'C', '0', '0', 'blog:sayComment:list', '#', 'admin', '2024-04-28 15:43:24', '', NULL, '说说评论菜单');
INSERT INTO `sys_menu` VALUES (2116, '说说评论查询', 2115, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sayComment:query', '#', 'admin', '2024-04-28 15:43:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '说说评论新增', 2115, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sayComment:add', '#', 'admin', '2024-04-28 15:43:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2118, '说说评论修改', 2115, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sayComment:edit', '#', 'admin', '2024-04-28 15:43:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '说说评论删除', 2115, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sayComment:remove', '#', 'admin', '2024-04-28 15:43:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '说说评论导出', 2115, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sayComment:export', '#', 'admin', '2024-04-28 15:43:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '签到', 2228, 1, 'sign', 'blog/sign/index', NULL, 1, 0, 'C', '0', '0', 'blog:sign:list', '#', 'admin', '2024-04-28 15:43:37', '', NULL, '签到菜单');
INSERT INTO `sys_menu` VALUES (2122, '签到查询', 2121, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sign:query', '#', 'admin', '2024-04-28 15:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '签到新增', 2121, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sign:add', '#', 'admin', '2024-04-28 15:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '签到修改', 2121, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sign:edit', '#', 'admin', '2024-04-28 15:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '签到删除', 2121, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sign:remove', '#', 'admin', '2024-04-28 15:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '签到导出', 2121, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sign:export', '#', 'admin', '2024-04-28 15:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '网址分类', 2226, 1, 'siteClass', 'blog/siteClass/index', NULL, 1, 0, 'C', '0', '0', 'blog:siteClass:list', '#', 'admin', '2024-04-28 15:43:52', '', NULL, '网址分类菜单');
INSERT INTO `sys_menu` VALUES (2128, '网址分类查询', 2127, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:siteClass:query', '#', 'admin', '2024-04-28 15:43:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '网址分类新增', 2127, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:siteClass:add', '#', 'admin', '2024-04-28 15:43:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '网址分类修改', 2127, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:siteClass:edit', '#', 'admin', '2024-04-28 15:43:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '网址分类删除', 2127, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:siteClass:remove', '#', 'admin', '2024-04-28 15:43:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '网址分类导出', 2127, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:siteClass:export', '#', 'admin', '2024-04-28 15:43:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '打赏记录', 2226, 1, 'sponsor', 'blog/sponsor/index', NULL, 1, 0, 'C', '0', '0', 'blog:sponsor:list', '#', 'admin', '2024-04-28 15:44:04', '', NULL, '打赏记录菜单');
INSERT INTO `sys_menu` VALUES (2134, '打赏记录查询', 2133, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sponsor:query', '#', 'admin', '2024-04-28 15:44:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '打赏记录新增', 2133, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sponsor:add', '#', 'admin', '2024-04-28 15:44:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '打赏记录修改', 2133, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sponsor:edit', '#', 'admin', '2024-04-28 15:44:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '打赏记录删除', 2133, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sponsor:remove', '#', 'admin', '2024-04-28 15:44:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '打赏记录导出', 2133, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:sponsor:export', '#', 'admin', '2024-04-28 15:44:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '系统配置', 2226, 1, 'systemConfig', 'blog/systemConfig/index', NULL, 1, 0, 'C', '0', '0', 'blog:systemConfig:list', '#', 'admin', '2024-04-28 15:44:20', '', NULL, '系统配置菜单');
INSERT INTO `sys_menu` VALUES (2140, '系统配置查询', 2139, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:systemConfig:query', '#', 'admin', '2024-04-28 15:44:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '系统配置新增', 2139, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:systemConfig:add', '#', 'admin', '2024-04-28 15:44:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '系统配置修改', 2139, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:systemConfig:edit', '#', 'admin', '2024-04-28 15:44:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2143, '系统配置删除', 2139, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:systemConfig:remove', '#', 'admin', '2024-04-28 15:44:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2144, '系统配置导出', 2139, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:systemConfig:export', '#', 'admin', '2024-04-28 15:44:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, '博客标签', 2000, 7, 'tags', 'blog/tags/index', NULL, 1, 0, 'C', '0', '0', 'blog:tags:list', '#', 'admin', '2024-04-28 15:44:30', '', NULL, '博客标签菜单');
INSERT INTO `sys_menu` VALUES (2146, '博客标签查询', 2145, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tags:query', '#', 'admin', '2024-04-28 15:44:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '博客标签新增', 2145, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tags:add', '#', 'admin', '2024-04-28 15:44:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '博客标签修改', 2145, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tags:edit', '#', 'admin', '2024-04-28 15:44:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2149, '博客标签删除', 2145, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tags:remove', '#', 'admin', '2024-04-28 15:44:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2150, '博客标签导出', 2145, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tags:export', '#', 'admin', '2024-04-28 15:44:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '话题圈子', 2000, 8, 'talk', 'blog/talk/index', NULL, 1, 0, 'C', '0', '0', 'blog:talk:list', '#', 'admin', '2024-04-28 15:44:44', '', NULL, '话题圈子菜单');
INSERT INTO `sys_menu` VALUES (2152, '话题圈子查询', 2151, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:talk:query', '#', 'admin', '2024-04-28 15:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2153, '话题圈子新增', 2151, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:talk:add', '#', 'admin', '2024-04-28 15:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2154, '话题圈子修改', 2151, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:talk:edit', '#', 'admin', '2024-04-28 15:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2155, '话题圈子删除', 2151, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:talk:remove', '#', 'admin', '2024-04-28 15:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2156, '话题圈子导出', 2151, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:talk:export', '#', 'admin', '2024-04-28 15:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2157, '简讯', 2000, 4, 'tipsoon', 'blog/tipsoon/index', NULL, 1, 0, 'C', '0', '0', 'blog:tipsoon:list', '#', 'admin', '2024-04-28 15:44:57', '', NULL, '简讯菜单');
INSERT INTO `sys_menu` VALUES (2158, '简讯查询', 2157, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoon:query', '#', 'admin', '2024-04-28 15:44:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2159, '简讯新增', 2157, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoon:add', '#', 'admin', '2024-04-28 15:44:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2160, '简讯修改', 2157, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoon:edit', '#', 'admin', '2024-04-28 15:44:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2161, '简讯删除', 2157, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoon:remove', '#', 'admin', '2024-04-28 15:44:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2162, '简讯导出', 2157, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoon:export', '#', 'admin', '2024-04-28 15:44:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2163, '用户信息', 2228, 1, 'userInfo', 'blog/userInfo/index', NULL, 1, 0, 'C', '0', '0', 'blog:userInfo:list', '#', 'admin', '2024-04-28 15:45:15', '', NULL, '用户信息菜单');
INSERT INTO `sys_menu` VALUES (2164, '用户信息查询', 2163, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:userInfo:query', '#', 'admin', '2024-04-28 15:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2165, '用户信息新增', 2163, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:userInfo:add', '#', 'admin', '2024-04-28 15:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '用户信息修改', 2163, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:userInfo:edit', '#', 'admin', '2024-04-28 15:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2167, '用户信息删除', 2163, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:userInfo:remove', '#', 'admin', '2024-04-28 15:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '用户信息导出', 2163, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:userInfo:export', '#', 'admin', '2024-04-28 15:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2169, '网站配置', 2226, 1, 'webConfig', 'blog/webConfig/index', NULL, 1, 0, 'C', '0', '0', 'blog:webConfig:list', '#', 'admin', '2024-04-28 15:45:31', '', NULL, '网站配置菜单');
INSERT INTO `sys_menu` VALUES (2170, '网站配置查询', 2169, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:webConfig:query', '#', 'admin', '2024-04-28 15:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '网站配置新增', 2169, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:webConfig:add', '#', 'admin', '2024-04-28 15:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '网站配置修改', 2169, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:webConfig:edit', '#', 'admin', '2024-04-28 15:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2173, '网站配置删除', 2169, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:webConfig:remove', '#', 'admin', '2024-04-28 15:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2174, '网站配置导出', 2169, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:webConfig:export', '#', 'admin', '2024-04-28 15:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2175, '简讯收藏', 2228, 1, 'tipsoonCollect', 'blog/tipsoonCollect/index', NULL, 1, 0, 'C', '0', '0', 'blog:tipsoonCollect:list', '#', 'admin', '2024-04-28 15:45:46', '', NULL, '简讯收藏菜单');
INSERT INTO `sys_menu` VALUES (2176, '简讯收藏查询', 2175, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonCollect:query', '#', 'admin', '2024-04-28 15:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2177, '简讯收藏新增', 2175, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonCollect:add', '#', 'admin', '2024-04-28 15:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '简讯收藏修改', 2175, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonCollect:edit', '#', 'admin', '2024-04-28 15:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2179, '简讯收藏删除', 2175, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonCollect:remove', '#', 'admin', '2024-04-28 15:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2180, '简讯收藏导出', 2175, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonCollect:export', '#', 'admin', '2024-04-28 15:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2181, '简讯评论', 2227, 1, 'tipsoonComment', 'blog/tipsoonComment/index', NULL, 1, 0, 'C', '0', '0', 'blog:tipsoonComment:list', '#', 'admin', '2024-04-28 15:45:57', '', NULL, '简讯评论菜单');
INSERT INTO `sys_menu` VALUES (2182, '简讯评论查询', 2181, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonComment:query', '#', 'admin', '2024-04-28 15:45:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2183, '简讯评论新增', 2181, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonComment:add', '#', 'admin', '2024-04-28 15:45:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2184, '简讯评论修改', 2181, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonComment:edit', '#', 'admin', '2024-04-28 15:45:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2185, '简讯评论删除', 2181, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonComment:remove', '#', 'admin', '2024-04-28 15:45:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2186, '简讯评论导出', 2181, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonComment:export', '#', 'admin', '2024-04-28 15:45:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2187, '简讯点赞', 2228, 1, 'tipsoonLike', 'blog/tipsoonLike/index', NULL, 1, 0, 'C', '0', '0', 'blog:tipsoonLike:list', '#', 'admin', '2024-04-28 15:46:08', '', NULL, '简讯点赞菜单');
INSERT INTO `sys_menu` VALUES (2188, '简讯点赞查询', 2187, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonLike:query', '#', 'admin', '2024-04-28 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2189, '简讯点赞新增', 2187, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonLike:add', '#', 'admin', '2024-04-28 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '简讯点赞修改', 2187, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonLike:edit', '#', 'admin', '2024-04-28 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '简讯点赞删除', 2187, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonLike:remove', '#', 'admin', '2024-04-28 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2192, '简讯点赞导出', 2187, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonLike:export', '#', 'admin', '2024-04-28 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2193, '简讯已读', 2228, 1, 'tipsoonReaded', 'blog/tipsoonReaded/index', NULL, 1, 0, 'C', '0', '0', 'blog:tipsoonReaded:list', '#', 'admin', '2024-04-28 15:46:22', '', NULL, '简讯已读菜单');
INSERT INTO `sys_menu` VALUES (2194, '简讯已读查询', 2193, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonReaded:query', '#', 'admin', '2024-04-28 15:46:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2195, '简讯已读新增', 2193, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonReaded:add', '#', 'admin', '2024-04-28 15:46:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2196, '简讯已读修改', 2193, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonReaded:edit', '#', 'admin', '2024-04-28 15:46:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2197, '简讯已读删除', 2193, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonReaded:remove', '#', 'admin', '2024-04-28 15:46:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2198, '简讯已读导出', 2193, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tipsoonReaded:export', '#', 'admin', '2024-04-28 15:46:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2199, '文章批量删除', 2001, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:article:deleteBatch', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2200, '文章爬虫', 2001, 7, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:article:reptile', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2201, '文章置顶文章', 2001, 8, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:article:top', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2202, '文章详情', 2001, 9, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:article:info', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2203, '文章SEO', 2001, 10, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:article:baiduSeo', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2204, '文章发布或下架文章', 2001, 11, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:article:pubOrShelf', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2205, '标签详情', 2025, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:tag:info', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2206, '标签批量删除', 2025, 7, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:tag:deleteBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2207, '标签置顶', 2025, 8, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:tag:top', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2208, '分类详情', 2031, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:category:info', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2209, '分类批量删除', 2031, 7, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:category:deleteBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2210, '分类置顶', 2031, 8, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:category:top', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2211, '网址批量删除', 2097, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:navigation:deleteBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2212, '友情链接置顶', 2073, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:friendLink:top', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2213, '系统配置查询', 2139, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:systemConfig:getConfig', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2214, '评论批量删除评论', 2013, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:comment:deleteBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2215, '留言回复', 2091, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:message:test', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2216, '留言批量通过', 2091, 7, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:message:passBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2217, '留言批量删除', 2091, 8, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:message:deleteBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2218, '反馈批量删除', 2043, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:feedback:deleteBatch', '#', 'admin', '2024-01-25 18:58:57', 'admin', '2024-01-25 18:58:57', NULL);
INSERT INTO `sys_menu` VALUES (2219, '说说详情', 2109, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:say:info', '#', 'admin', '2019-10-29 10:59:46', 'admin', '2024-01-19 18:41:53', NULL);
INSERT INTO `sys_menu` VALUES (2220, '删除网址分类', 2127, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:siteClass:deleteBatch', '#', 'admin', '2024-01-18 14:11:38', 'admin', '2024-01-18 14:11:38', NULL);
INSERT INTO `sys_menu` VALUES (2221, '圈子详情', 2151, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:talk:info', '#', 'admin', '2024-01-18 14:11:38', 'admin', '2024-01-18 14:11:38', NULL);
INSERT INTO `sys_menu` VALUES (2222, '讨论详情', 2055, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:forum:info', '#', 'admin', '2024-03-13 22:45:16', 'admin', '2024-03-13 22:45:16', NULL);
INSERT INTO `sys_menu` VALUES (2223, '简讯详情', 2157, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'blog:tipsoon:info', '#', 'admin', '2024-03-13 22:45:16', 'admin', '2024-03-13 22:45:16', NULL);
INSERT INTO `sys_menu` VALUES (2225, '消息管理', 0, 4, 'news', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-04-28 16:16:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2226, '网站管理', 0, 5, 'site', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-04-28 16:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2227, '评论管理', 2225, 1, 'comment', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-04-28 16:24:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2228, '其它管理', 0, 5, 'other', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-04-28 16:27:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 辰雪博客新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-28 14:02:41', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 辰雪博客系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-04-28 14:02:41', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-28 14:02:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-28 14:02:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-04-28 14:02:41', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '梦辰雪', '00', 'tsuimengchao@163.com', NULL, '男', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/avatar-20240302042334316.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', NULL, NULL, '2018-08-23 09:11:56', 'admin', '2020-09-05 10:43:31', '管理员');
INSERT INTO `sys_user` VALUES (2, 2, 'test', '测试用户', '00', 'tsuimengchao@qq.com', '15600618521', '男', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/1645512111007.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.0.177', NULL, 'admin', '2020-05-05 11:15:49', 'admin', '2020-09-05 10:43:38', '测试员');
INSERT INTO `sys_user` VALUES (3, 5, 'common', '普通用户', '00', 'tsuimengchao@foxmail.com', '15600168521', '男', '', '$2a$10$QN4tYvXkX2ZOIjRoYnSQEe.4/vR4eTevMwJZ0Eok0cl8uuYxaU5bK', '0', '0', NULL, '2024-01-25 21:17:20', 'admin', '2020-05-05 11:15:49', 'admin', '2020-09-05 10:43:38', NULL);

-- ----------------------------
-- Table structure for sys_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_oauth`;
CREATE TABLE `sys_user_oauth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '唯一ID',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `country` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '国家',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '\0' COMMENT '省份',
  `privilege` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户特权信息',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `auth_time` datetime NOT NULL COMMENT '授权时间',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `oauth_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '授权方名称',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `os` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录系统',
  `last_login_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`openid`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`openid`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`user_id`) USING BTREE,
  INDEX `inx_enabled`(`privilege`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统用户第三方授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 2);
INSERT INTO `sys_user_post` VALUES (4, 1);
INSERT INTO `sys_user_post` VALUES (5, 2);
INSERT INTO `sys_user_post` VALUES (6, 2);
INSERT INTO `sys_user_post` VALUES (9, 2);
INSERT INTO `sys_user_post` VALUES (10, 2);
INSERT INTO `sys_user_post` VALUES (11, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 1);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (10, 2);
INSERT INTO `sys_user_role` VALUES (11, 2);

SET FOREIGN_KEY_CHECKS = 1;

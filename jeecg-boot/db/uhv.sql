/*
 Navicat Premium Data Transfer

 Source Server         : MySQL0721
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : uhv

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 27/06/2022 00:21:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for construction_message
-- ----------------------------
DROP TABLE IF EXISTS `construction_message`;
CREATE TABLE `construction_message`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `tower_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '杆塔id',
  `subcontractor` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '施工分包单位',
  `plan_start_time` datetime NULL DEFAULT NULL COMMENT '计划开工时间',
  `actual_start_time` datetime NULL DEFAULT NULL COMMENT '实际开工时间',
  `repeat_pit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否完成复测分坑',
  `lofting` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否完成放样',
  `excavate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否完成基础开挖',
  `pouring` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否完成基础浇筑',
  `group_tower` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否完成组塔',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前状态',
  `plan_over_time` datetime NULL DEFAULT NULL COMMENT '计划竣工时间',
  `actual_over_time` datetime NULL DEFAULT NULL COMMENT '实际竣工时间',
  `block_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否受阻',
  `block_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '受阻原因分类',
  `block_detail` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '具体问题',
  `other_issue` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他需要说明的问题',
  `report_time` datetime NULL DEFAULT NULL COMMENT '填报时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of construction_message
-- ----------------------------

-- ----------------------------
-- Table structure for construction_unit
-- ----------------------------
DROP TABLE IF EXISTS `construction_unit`;
CREATE TABLE `construction_unit`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '施工单位(全称)',
  `detail` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of construction_unit
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_dict
-- ----------------------------
DROP TABLE IF EXISTS `jimu_dict`;
CREATE TABLE `jimu_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` int NULL DEFAULT NULL COMMENT '删除状态',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '字典类型0为string,1为number',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `indextable_dict_code`(`dict_code`) USING BTREE,
  UNIQUE INDEX `uk_sd_dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_dict
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `jimu_dict_item`;
CREATE TABLE `jimu_dict_item`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项文本',
  `item_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_order` int NULL DEFAULT NULL COMMENT '排序',
  `status` int NULL DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_dict_id`(`dict_id`) USING BTREE,
  INDEX `index_table_sort_order`(`sort_order`) USING BTREE,
  INDEX `index_table_dict_status`(`status`) USING BTREE,
  INDEX `idx_sdi_role_dict_id`(`dict_id`) USING BTREE,
  INDEX `idx_sdi_role_sort_order`(`sort_order`) USING BTREE,
  INDEX `idx_sdi_status`(`status`) USING BTREE,
  INDEX `idx_sdi_dict_val`(`dict_id`, `item_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report`;
CREATE TABLE `jimu_report`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `json_str` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json字符串',
  `api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `thumb` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '缩略图',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识0-正常,1-已删除',
  `api_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法0-get,1-post',
  `api_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求编码',
  `template` tinyint(1) NULL DEFAULT NULL COMMENT '是否是模板 0不是,1是',
  `view_count` bigint NULL DEFAULT 0 COMMENT '浏览次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_jmreport_code`(`code`) USING BTREE,
  INDEX `uniq_jmreport_createby`(`create_by`) USING BTREE,
  INDEX `uniq_jmreport_delflag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线excel设计器' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_data_source
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_data_source`;
CREATE TABLE `jimu_report_data_source`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `report_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报表_id',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `db_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `db_driver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驱动类',
  `db_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源地址',
  `db_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `db_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `connect_times` int UNSIGNED NULL DEFAULT 0 COMMENT '连接失败次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jmdatasource_report_id`(`report_id`) USING BTREE,
  INDEX `idx_jmdatasource_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_db
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_db`;
CREATE TABLE `jimu_report_db`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `jimu_report_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键字段',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `db_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集编码',
  `db_ch_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集名字',
  `db_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源类型',
  `db_table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库表名',
  `db_dyn_sql` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '动态查询SQL',
  `db_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源KEY',
  `tb_db_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填报数据源',
  `tb_db_table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填报数据表',
  `java_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'java类数据集  类型（spring:springkey,class:java类名）',
  `java_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'java类数据源  数值（bean key/java类名）',
  `api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `api_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法0-get,1-post',
  `is_list` int NULL DEFAULT 0 COMMENT '是否是列表0否1是 默认0',
  `is_page` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否作为分页,0:不分页，1:分页',
  `db_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `db_source_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型 MYSQL ORACLE SQLSERVER',
  `json_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json数据，直接解析json内容',
  `api_convert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api转换器',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jmreportdb_db_key`(`db_key`) USING BTREE,
  INDEX `idx_jimu_report_id`(`jimu_report_id`) USING BTREE,
  INDEX `idx_db_source_id`(`db_source`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_db
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_db_field
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_db_field`;
CREATE TABLE `jimu_report_db_field`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `jimu_report_db_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源ID',
  `field_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `field_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段文本',
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件类型',
  `widget_width` int NULL DEFAULT NULL COMMENT '控件宽度',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `search_flag` int NULL DEFAULT 0 COMMENT '查询标识0否1是 默认0',
  `search_mode` int NULL DEFAULT NULL COMMENT '查询模式1简单2范围',
  `dict_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码支持从表中取数据',
  `search_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询默认值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jrdf_jimu_report_db_id`(`jimu_report_db_id`) USING BTREE,
  INDEX `idx_dbfield_order_num`(`order_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_db_field
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_db_param
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_db_param`;
CREATE TABLE `jimu_report_db_param`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jimu_report_head_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态报表ID',
  `param_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数字段',
  `param_txt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数文本',
  `param_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数默认值',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `search_flag` int NULL DEFAULT NULL COMMENT '查询标识0否1是 默认0',
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询控件类型',
  `search_mode` int NULL DEFAULT NULL COMMENT '查询模式1简单2范围',
  `dict_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jmrheadid`(`jimu_report_head_id`) USING BTREE,
  INDEX `idx_jrdp_jimu_report_head_id`(`jimu_report_head_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_db_param
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_link
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_link`;
CREATE TABLE `jimu_report_link`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `report_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '积木设计器id',
  `parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `eject_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '弹出方式（0 当前页面 1 新窗口）',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接名称',
  `api_method` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法0-get,1-post',
  `link_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接方式(0 网络报表 1 网络连接 2 图表联动)',
  `api_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外网api',
  `link_chart_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联动图表的ID',
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表达式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniq_link_reportid`(`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '超链接配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_link
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_map
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_map`;
CREATE TABLE `jimu_report_map`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `label` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图名称',
  `name` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图编码',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地图数据',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0表示未删除,1表示删除',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_jmreport_map_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地图配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_map
-- ----------------------------

-- ----------------------------
-- Table structure for jimu_report_share
-- ----------------------------
DROP TABLE IF EXISTS `jimu_report_share`;
CREATE TABLE `jimu_report_share`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `report_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线excel设计器id',
  `preview_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览地址',
  `preview_lock` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码锁',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `term_of_validity` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效期(0:永久有效，1:1天，2:7天)',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否过期(0未过期，1已过期)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积木报表预览权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jimu_report_share
-- ----------------------------

-- ----------------------------
-- Table structure for onl_auth_data
-- ----------------------------
DROP TABLE IF EXISTS `onl_auth_data`;
CREATE TABLE `onl_auth_data`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `cgform_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'online表ID',
  `rule_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名',
  `rule_column` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则列',
  `rule_operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则条件 大于小于like',
  `rule_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则值',
  `status` int NULL DEFAULT NULL COMMENT '1有效 0无效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_auth_data
-- ----------------------------

-- ----------------------------
-- Table structure for onl_auth_page
-- ----------------------------
DROP TABLE IF EXISTS `onl_auth_page`;
CREATE TABLE `onl_auth_page`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT ' 主键',
  `cgform_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'online表id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段名/按钮编码',
  `type` int NULL DEFAULT NULL COMMENT '1字段 2按钮',
  `control` int NULL DEFAULT NULL COMMENT '3可编辑 5可见(仅支持两种状态值3,5)',
  `page` int NULL DEFAULT NULL COMMENT '3列表 5表单(仅支持两种状态值3,5)',
  `status` int NULL DEFAULT NULL COMMENT '1有效 0无效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_auth_page
-- ----------------------------

-- ----------------------------
-- Table structure for onl_auth_relation
-- ----------------------------
DROP TABLE IF EXISTS `onl_auth_relation`;
CREATE TABLE `onl_auth_relation`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `auth_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `type` int NULL DEFAULT NULL COMMENT '1字段 2按钮 3数据权限',
  `cgform_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'online表单ID',
  `auth_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权方式role角色，depart部门，user人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_auth_relation
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgform_button
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_button`;
CREATE TABLE `onl_cgform_button`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `BUTTON_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮编码',
  `BUTTON_ICON` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮图标',
  `BUTTON_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮名称',
  `BUTTON_STATUS` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮状态',
  `BUTTON_STYLE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮样式',
  `EXP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表达式',
  `CGFORM_HEAD_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `OPT_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮类型',
  `ORDER_NUM` int NULL DEFAULT NULL COMMENT '排序',
  `OPT_POSITION` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮位置1侧面 2底部',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_formid`(`CGFORM_HEAD_ID`) USING BTREE,
  INDEX `index_button_code`(`BUTTON_CODE`) USING BTREE,
  INDEX `index_button_status`(`BUTTON_STATUS`) USING BTREE,
  INDEX `index_button_order`(`ORDER_NUM`) USING BTREE,
  INDEX `idx_ocb_CGFORM_HEAD_ID`(`CGFORM_HEAD_ID`) USING BTREE,
  INDEX `idx_ocb_BUTTON_CODE`(`BUTTON_CODE`) USING BTREE,
  INDEX `idx_ocb_BUTTON_STATUS`(`BUTTON_STATUS`) USING BTREE,
  INDEX `idx_ocb_ORDER_NUM`(`ORDER_NUM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Online表单自定义按钮' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_button
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgform_enhance_java
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_enhance_java`;
CREATE TABLE `onl_cgform_enhance_java`  (
  `ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BUTTON_CODE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮编码',
  `CG_JAVA_TYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `CG_JAVA_VALUE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数值',
  `CGFORM_HEAD_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `ACTIVE_STATUS` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '生效状态',
  `EVENT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'end' COMMENT '事件状态(end:结束，start:开始)',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_buttoncode`(`BUTTON_CODE`) USING BTREE,
  INDEX `index_status`(`ACTIVE_STATUS`) USING BTREE,
  INDEX `idx_ejava_cgform_head_id`(`CGFORM_HEAD_ID`) USING BTREE,
  INDEX `idx_ocej_BUTTON_CODE`(`BUTTON_CODE`) USING BTREE,
  INDEX `idx_ocej_ACTIVE_STATUS`(`ACTIVE_STATUS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_enhance_java
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgform_enhance_js
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_enhance_js`;
CREATE TABLE `onl_cgform_enhance_js`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `CG_JS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'JS增强内容',
  `CG_JS_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CGFORM_HEAD_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_fmid`(`CGFORM_HEAD_ID`) USING BTREE,
  INDEX `index_jstype`(`CG_JS_TYPE`) USING BTREE,
  INDEX `idx_ejs_cgform_head_id`(`CGFORM_HEAD_ID`) USING BTREE,
  INDEX `idx_ejs_cg_js_type`(`CG_JS_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_enhance_js
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgform_enhance_sql
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_enhance_sql`;
CREATE TABLE `onl_cgform_enhance_sql`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `BUTTON_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮编码',
  `CGB_SQL` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SQL内容',
  `CGB_SQL_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Sql名称',
  `CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CGFORM_HEAD_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_formid`(`CGFORM_HEAD_ID`) USING BTREE,
  INDEX `idx_oces_CGFORM_HEAD_ID`(`CGFORM_HEAD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_enhance_sql
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgform_field
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_field`;
CREATE TABLE `onl_cgform_field`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `cgform_head_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表ID',
  `db_field_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名字',
  `db_field_txt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段备注',
  `db_field_name_old` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原字段名',
  `db_is_key` tinyint(1) NULL DEFAULT NULL COMMENT '是否主键 0否 1是',
  `db_is_null` tinyint(1) NULL DEFAULT NULL COMMENT '是否允许为空0否 1是',
  `db_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库字段类型',
  `db_length` int NOT NULL COMMENT '数据库字段长度',
  `db_point_length` int NULL DEFAULT NULL COMMENT '小数点',
  `db_default_val` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表字段默认值',
  `dict_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典code',
  `dict_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典表',
  `dict_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典Text',
  `field_show_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单控件类型',
  `field_href` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转URL',
  `field_length` int NULL DEFAULT NULL COMMENT '表单控件长度',
  `field_valid_type` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单字段校验规则',
  `field_must_input` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段是否必填',
  `field_extend_json` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展参数JSON',
  `field_default_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件默认值，不同的表达式展示不同的结果。\r\n1. 纯字符串直接赋给默认值；\r\n2. #{普通变量}；\r\n3. {{ 动态JS表达式 }}；\r\n4. ${填值规则编码}；\r\n填值规则表达式只允许存在一个，且不能和其他规则混用。',
  `is_query` tinyint(1) NULL DEFAULT NULL COMMENT '是否查询条件0否 1是',
  `is_show_form` tinyint(1) NULL DEFAULT NULL COMMENT '表单是否显示0否 1是',
  `is_show_list` tinyint(1) NULL DEFAULT NULL COMMENT '列表是否显示0否 1是',
  `is_read_only` tinyint(1) NULL DEFAULT 0 COMMENT '是否是只读（1是 0否）',
  `query_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询模式',
  `main_table` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键主表名',
  `main_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键主键字段',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `converter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义值转换器',
  `query_def_val` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询默认值',
  `query_dict_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询配置字典text',
  `query_dict_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询配置字典code',
  `query_dict_table` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询配置字典table',
  `query_show_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询显示控件',
  `query_config_flag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用查询配置1是0否',
  `query_valid_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询字段校验类型',
  `query_must_input` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询字段是否必填1是0否',
  `sort_flag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否支持排序1是0否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inex_table_id`(`cgform_head_id`) USING BTREE,
  INDEX `idx_ocf_cgform_head_id`(`cgform_head_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_field
-- ----------------------------
INSERT INTO `onl_cgform_field` VALUES ('00ca5e70ac2c95a1ea46836802fafc9e', '4d413963b6a84dc18ad1bd04f2c33908', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('01ee5e44da915e8df4bb873dd5db856a', '4028d88181a067f70181a068cc430001', 'base_land_status', '塔基交地情况', 'base_land_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 17, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('02b7fabd585423f382f0b82bc955d8cf', 'd4868e819712424dba89f0c2d1e829e0', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('02c342c185711a29236742a3d9891089', '7005bab7c6c84d218f2ee37104c538c6', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('054412119ceb07b35c6fcb81a4bfe954', '7005bab7c6c84d218f2ee37104c538c6', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('06af1457e25344a7a8158b41cc3f5211', '7005bab7c6c84d218f2ee37104c538c6', 'construction_unit', '施单位（全称）', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 13, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('07212ecaf30377f6e2cf50914f966462', '7005bab7c6c84d218f2ee37104c538c6', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('08a933a9d930c239883f1d1e59cd403c', '6eeb15d00bac4d6d900bbc6396ce7351', 'test', '测试字段', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 7, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('0ac44c8006b0650b9349d2a3b330303b', '4028d88181a067f70181a068cc430001', 'filling_time', '填报时间', 'filling_time', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 40, 'admin', '2022-06-26 22:28:29', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('0b1b0757ce8962a2cf350d84ee38242a', '4d413963b6a84dc18ad1bd04f2c33908', 'base_land_status', '塔基交地情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 17, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('0d06098af7f29fd5369e2cdd8c03d950', 'd4868e819712424dba89f0c2d1e829e0', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'sel_depart', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('0db7e0c40080e188ac33d31b469074bf', '7005bab7c6c84d218f2ee37104c538c6', 'ascription_town', '交界塔基归属乡镇', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('106fe61ce6af28dd76a0486c26d97362', '4028d88181a067f70181a068cc430001', 'update_by', '更新人', 'update_by', 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('10fb432d0eae5db34cd74e8757796998', '7005bab7c6c84d218f2ee37104c538c6', 'coordinate_n', 'N坐标N/X(米)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 10, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('118ea00ef5fbd8196123d08e47b5e767', '4028d88181a067f70181a067f78b0000', 'plan_over_time', '计划竣工时间', 'plan_over_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 17, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('121ab9c16656425bc9fb4c8324b1a926', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_pay_status', '便道付款情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 24, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('12c218843c83d1baf3d57f7ec13f6f46', '4028d88181a067f70181a067f78b0000', 'block_detail', '具体问题', 'block_detail', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 21, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('13a342e83cfec9cb4ee1cccf89d2aa38', '4028d88181a067f70181a067f78b0000', 'id', 'id', 'id', 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('13ed17dc00bfa8d67bce4dd7322ca57d', '4028d88181a067f70181a068cc430001', 'sys_org_code', '所属部门', 'sys_org_code', 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('148d0dda682ebd62024017f0d54d996d', '4028d88181a067f70181a067f78b0000', 'plan_start_time', '计划开工时间', 'plan_start_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('1502972c17e9d9ca9747b19f2f964070', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('158d74f3e2c1ed3603924a539e147d6d', '4d413963b6a84dc18ad1bd04f2c33908', 'filling_time', '填报时间', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 40, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('16457dd224ab51aa8d3ccd4eac62090e', '4028d88181a067f70181a068cc430001', 'easy_pay_status', '便道付款情况', 'easy_pay_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 24, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('18d6a4aa7c3b29b1cb1a337b4fd8afb0', 'ab3b97384d124e408b50f2ead96bb8a6', 'other_issue', '其他需要说明的问题', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 22, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('1966f323cce619c700f41909655f8604', '6eeb15d00bac4d6d900bbc6396ce7351', 'construction_unit', '施工单位', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('1d0118affe048dd2b8751feabc8ad6ee', 'd92dbf6720344235aaf825dceade1f21', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, 'admin', '2022-06-26 20:30:25', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('1dcac9aba649edb0b4703ff1e5fe9a6f', '4d413963b6a84dc18ad1bd04f2c33908', 'base_plan_time', '塔基计划交地时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 20, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('1ff8928a15813bb461cdc18489e2d8ad', '7005bab7c6c84d218f2ee37104c538c6', 'territorial_id', '属地供电所id', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 12, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('20905a3a18db8369db6a34537d7867c7', '4028d88181a067f70181a067f78b0000', 'excavate', '是否完成基础开挖', 'excavate', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 13, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('209ca7c15c03fc09ef6c296c162d8bc6', '4028d88181a067f70181a067f78b0000', 'create_time', '创建日期', 'create_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('217e884191c3e3f6f4679e17fb1006d3', '4028d88181a067f70181a068cc430001', 'light_status', '是否亮红灯', 'light_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 38, 'admin', '2022-06-26 22:28:29', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('2574c4e9dfb600823af1a47b376a0240', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'address', '塔地址', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('25d95000a4e4f2957e59f0391bc2ae39', '6eeb15d00bac4d6d900bbc6396ce7351', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('25f53a914752cf3660e23e7b3ba94c7c', 'd4868e819712424dba89f0c2d1e829e0', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('26a1a00f9b048ba123ac8245874a2a05', '6eeb15d00bac4d6d900bbc6396ce7351', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('26f122ed93aaed37a746dd9d1adf6e29', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_actual_time', '便道实际交地时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 29, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('275e6102e64951d9c7e4c1ce24ea3457', '4d413963b6a84dc18ad1bd04f2c33908', 'house_status', '房屋拆迁', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 34, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('27f10fb46f18b93616252c547261d193', '4d413963b6a84dc18ad1bd04f2c33908', 'base_actual_time', '塔基实际交地时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 21, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('2b69a7582da5a85d1fc677e347d434e9', 'ab3b97384d124e408b50f2ead96bb8a6', 'block_status', '是否受阻', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 19, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('2e1fb74fad2f4ec7abf5858b1995d8b3', '4d413963b6a84dc18ad1bd04f2c33908', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('2fa36ccc673f5265080b45aca4d37e8a', 'ab3b97384d124e408b50f2ead96bb8a6', 'report_time', '填报时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 23, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('31d7614392ec147ccc6c4e1febb6b875', '4028d88181a067f70181a067f78b0000', 'lofting', '是否完成放样', 'lofting', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 12, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3639cdda94f2d1052c544d3637168b9b', 'f6ac62dae4df41cf85381985d637e428', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('36888af39e88130c61fed6f1a2f24135', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'territorial_id', '属地供电所', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'territorial_station', 'id', 12, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3698bb1042fbd7f9ddcf7d4e46eddb5a', '4d413963b6a84dc18ad1bd04f2c33908', 'base_clear_table', '塔基是否清表', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 19, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('384372c0199aa2ff5490b5d251d70e89', '4028d88181a067f70181a068cc430001', 'acquisition_people_electricity', '村民（承包人、经营人）用电户号', 'acquisition_people_electricity', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 16, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('385002b8a7c0044cad1640b170df2715', '4d413963b6a84dc18ad1bd04f2c33908', 'block_status', '是否受阻', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 35, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3a58d9c5b7b7ee34feca27e95a580a50', '4d413963b6a84dc18ad1bd04f2c33908', 'acquisition_people_pay', '付款至村民（承包人、经营人）情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 13, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3b272c2132af13913bb45cde8717a49c', '4d413963b6a84dc18ad1bd04f2c33908', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3b38d292243a91718e524f74c5b5ab3d', '4028d88181a067f70181a068cc430001', 'easy_land_status', '便道是否交地', 'easy_land_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 25, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3c17de18a6b07f0183e7e67d4959b20f', 'ab3b97384d124e408b50f2ead96bb8a6', 'block_detail', '具体问题', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 21, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3cbf7b052a556a989ff84daa6d3dc999', '4028d88181a067f70181a068cc430001', 'pipe_line_status', '管线迁移', 'pipe_line_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 33, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3d14bec104d1a845aaae911d0af0f9f2', '4028d88181a067f70181a067f78b0000', 'repeat_pit', '是否完成复测分坑', 'repeat_pit', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 11, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('3f6dca2a616c42c4ca82ea1fc9032f49', 'ab3b97384d124e408b50f2ead96bb8a6', 'plan_start_time', '计划开工时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('425b93cb0011a0e0e55ea5c94ce6aad3', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'construction_unti', '施工单位(全称)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 13, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('42d7d6fac49702919c9379e4d2eded7b', 'ab3b97384d124e408b50f2ead96bb8a6', 'actual_over_time', '实际竣工时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 18, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4336ddc8402b4d46c437bacd265afd51', '4028d88181a067f70181a068cc430001', 'block_reason_type', '受阻原因分类', 'block_reason_type', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 36, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4367f0e284590b9c865b29ae730028d1', '4028d88181a067f70181a068cc430001', 'create_time', '创建日期', 'create_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4699759553738eb1888425ae88a318c5', '4d413963b6a84dc18ad1bd04f2c33908', 'acquisition_people_name', '村民（承包人、经营人）姓名', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 14, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('470e8ac49152035273c3f5163f399a14', 'f6ac62dae4df41cf85381985d637e428', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('47150bb89650acc56904c60593b4e8f8', '4028d88181a067f70181a068cc430001', 'stretch_sign_status', '牵张场签订情况', 'stretch_sign_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 30, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('488457e9704dabe9b32c56ceec169bea', '4028d88181a067f70181a068cc430001', 'acquisition_measure_home', '丈量到户', 'acquisition_measure_home', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 11, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('49dc44aeb882cb8858109cf315429802', '4d413963b6a84dc18ad1bd04f2c33908', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4b21576bce9b9be4a4bef8a31ca19568', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_plan_time', ' 便道计划交地时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 28, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4b45cd860e39d23f66f0b2c18dbebe48', '4028d88181a067f70181a067f78b0000', 'update_by', '更新人', 'update_by', 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4b5772a3f1f7905331b62650c90357a7', '4028d88181a067f70181a068cc430001', 'easy_sign_status', '便道签订情况', 'easy_sign_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 23, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4b91bc44bc91443ebf1a6edd37f70d97', 'ab3b97384d124e408b50f2ead96bb8a6', 'lofting', '是否完成放样', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 12, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('4d01aa6e3c1a0c13b493bef3b7e83671', '4028d88181a067f70181a068cc430001', 'base_reasons', '塔基未交地原因', 'base_reasons', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 18, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('50ab7550c1b9be3d29b428e89c6faf2d', '4028d88181a067f70181a067f78b0000', 'actual_start_time', '实际开工时间', 'actual_start_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 10, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('531a42eed008f56df14a82e716c98cb6', '4028d88181a067f70181a068cc430001', 'acquisition_people_phone', '村民（承包人、经营人）电话', 'acquisition_people_phone', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 15, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('556b91af52d326deda11099be92dd1af', 'f6ac62dae4df41cf85381985d637e428', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('574939283998a31047cc09eb643f1096', '4028d88181a067f70181a068cc430001', 'acquisition_people_name', '村民（承包人、经营人）姓名', 'acquisition_people_name', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 14, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('59546d7f9257d8f1705b45f89f7eda6c', '4028d88181a067f70181a067f78b0000', 'block_type', '受阻原因分类', 'block_type', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 20, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('598bcf742ffae3c6540f410ba8368556', '4028d88181a067f70181a068cc430001', 'tower_id', '杆塔id', 'tower_id', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'tower', 'id', 7, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5a630e6754be6735a12516d975a971f5', 'd92dbf6720344235aaf825dceade1f21', 'test', '测试字段', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, 'admin', '2022-06-26 20:30:26', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5b83631db7c3ea48145eab2b67f9ead3', '4028d88181a067f70181a068cc430001', 'update_time', '更新日期', 'update_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5d0b1036feb8f6b65b203d771cf0397e', '4028d88181a067f70181a068cc430001', 'base_sign_status', '与乡镇签订情况', 'base_sign_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5debd5d8cd760d46d7531bffdfb93a2e', '4028d88181a067f70181a068cc430001', 'stretch_land_status', '牵张场交地情况', 'stretch_land_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 32, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5f6c780ef64614e998805320ffdde608', 'ab3b97384d124e408b50f2ead96bb8a6', 'block_type', '受阻原因分类', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 20, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5f902a366611c58542ca7fc09668f6cc', '6eeb15d00bac4d6d900bbc6396ce7351', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('5fa0c478d2d2ac9de45eb4601a1383ef', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_land_status', '便道是否交地', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 25, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('61ffb73704b7795fc2ad3b4e411507a5', 'd4868e819712424dba89f0c2d1e829e0', 'detail', '详细信息', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('69166f186ec95212e2316acedb2d5684', '4028d88181a067f70181a068cc430001', 'acquisition_people_pay', '付款至村民（承包人、经营人）情况', 'acquisition_people_pay', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 13, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('69efaebc9fa3e7d7c1b793c04404efbc', '4028d88181a067f70181a067f78b0000', 'other_issue', '其他需要说明的问题', 'other_issue', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 22, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('6c4d907c61203dcdda0b4e2a2d46166a', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'coordinate_e', 'E坐标E/X(米)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 11, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('7100f9913d7f74e2cd67cc98eb4381ca', '6eeb15d00bac4d6d900bbc6396ce7351', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('71d756c9a68c2d47c6ac589d34eda3ba', '4028d88181a067f70181a067f78b0000', 'report_time', '填报时间', 'report_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 23, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('723cb291933eda1f403763675a68c330', 'ab3b97384d124e408b50f2ead96bb8a6', 'repeat_pit', '是否完成复测分坑', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 11, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('74947bc672847a70ac6098f5b7bcbe54', 'd4868e819712424dba89f0c2d1e829e0', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('75d7fd9b80e6bf33098488ff0c0ac1e9', 'f6ac62dae4df41cf85381985d637e428', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('79a90150a862bdf738caafa8c315d804', '4028d88181a067f70181a068cc430001', 'easy_plan_time', ' 便道计划交地时间', 'easy_plan_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 28, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('7a82b1146701d36ad34c83eafd951145', '7005bab7c6c84d218f2ee37104c538c6', 'overseer_unit', '监理单位（全称）', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 14, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('7bb40c7904ad23dee25fe5c12b6e537a', '4028d88181a067f70181a067f78b0000', 'actual_over_time', '实际竣工时间', 'actual_over_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 18, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('7bbcae49aca62f125f212bb77d7ef9e9', '4028d88181a067f70181a068cc430001', 'house_status', '房屋拆迁', 'house_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 34, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('7c2aa42b3db2416028cc770aa453b821', '4d413963b6a84dc18ad1bd04f2c33908', 'block_reason_type', '受阻原因分类', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 36, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('826afb603912e73e84cef5c9f97b4740', '6eeb15d00bac4d6d900bbc6396ce7351', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('85257ea7dbdb3dd9d04a8656f44c7814', '4d413963b6a84dc18ad1bd04f2c33908', 'base_reasons', '塔基未交地原因', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 18, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('8588439091c4753492a11d065c69e00e', '4028d88181a067f70181a067f78b0000', 'create_by', '创建人', 'create_by', 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('877a154fbec4e3aa12e8542c5dde62f0', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'coordinate_n', 'N坐标N/X(米)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 10, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('891660c6b440eb8bb6340d3bc49ef9e7', 'ab3b97384d124e408b50f2ead96bb8a6', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('899bfa7ab270b082085b0074a4f72df5', '4028d88181a067f70181a068cc430001', 'easy_reason', '便道未交地原因', 'easy_reason', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 26, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('8a45931859f8609e765fe8d87551cf02', 'd92dbf6720344235aaf825dceade1f21', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, 'admin', '2022-06-26 20:30:25', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('8ad9e88ce5676e93c09130675ca117b8', 'f6ac62dae4df41cf85381985d637e428', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('8c175920e84ead3512919d75b3013705', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_clear_table', '便道是否清表', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 27, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('8d4171f969d67d60ce4216cd3c2d4f81', '4d413963b6a84dc18ad1bd04f2c33908', 'base_sign_status', '与乡镇签订情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('8fe660cb5aeda8a3b323f1438286c892', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('902b28f6d256a73cb78cf8f4185fe279', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('91af38438e5b90137c6b5da7a836831a', 'ab3b97384d124e408b50f2ead96bb8a6', 'sys_org_code', '所属部门', NULL, 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('933559a762c7178a60f65d5eec438682', 'ab3b97384d124e408b50f2ead96bb8a6', 'pouring', '是否完成基础浇筑', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 14, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('966ae124be60f57858e09c2f4db75927', '4028d88181a067f70181a068cc430001', 'base_plan_time', '塔基计划交地时间', 'base_plan_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 20, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9aa6f72e25d7de3f155a012951854e64', '4d413963b6a84dc18ad1bd04f2c33908', 'tower_id', '杆塔id', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'tower', 'id', 7, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9ac7418c2ad2abd64b63ec8b0cf76aa2', 'd92dbf6720344235aaf825dceade1f21', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, 'admin', '2022-06-26 20:30:25', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9bed1ff3e7d08eb6ce584b0786b5911d', '4028d88181a067f70181a067f78b0000', 'tower_id', '杆塔id', 'tower_id', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'tower', 'id', 7, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9d1c8eed6725f52139531dd93e88b0a0', 'f6ac62dae4df41cf85381985d637e428', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9d6283f0d2250b25b293a3280a9c5ec9', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_range', '施工便道用地范围确认', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 22, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9eca76b8dd4464cc5e82db09de5dd3c2', 'ab3b97384d124e408b50f2ead96bb8a6', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('9ed588c3268cd35f45a8bb3abe1fd30b', '4d413963b6a84dc18ad1bd04f2c33908', 'registration', '塔基林木采伐证办理情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a1f6d60cc179ee84b2727713b982ac49', 'ab3b97384d124e408b50f2ead96bb8a6', 'excavate', '是否完成基础开挖', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 13, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a39f78d9c52f848327ec3348414bf028', '4028d88181a067f70181a067f78b0000', 'subcontractor', '施工分包单位', 'subcontractor', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a3f27e16215c262f48e06bcb739b02ef', '4d413963b6a84dc18ad1bd04f2c33908', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a3f2b1c06acd0b5445f7e00b8643eefd', '6eeb15d00bac4d6d900bbc6396ce7351', 'test_tower_id', '塔杆id', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'test_tower', 'id', 8, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a507d96ee72b117e6bad8c8c1db08c7f', '4028d88181a067f70181a067f78b0000', 'group_tower', '是否完成组塔', 'group_tower', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 15, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a720acfbd2b8f9c1c9a2f13e06c1c41a', 'd92dbf6720344235aaf825dceade1f21', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, 'admin', '2022-06-26 20:30:25', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('a9071d34501e1df24337e89f3898277d', 'd4868e819712424dba89f0c2d1e829e0', 'name', '施工单位(全称)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 7, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('aaac9b434a2be504e18f2f740ad781eb', '4028d88181a067f70181a067f78b0000', 'block_status', '是否受阻', 'block_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 19, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ae1d5e3588c9cba3611fe681b8adc07a', '4028d88181a067f70181a067f78b0000', 'pouring', '是否完成基础浇筑', 'pouring', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 14, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('aebeb4f81418574f71f0677e5fc3e631', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'number', '塔杆号', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 7, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('b23e37a8b890d9c1a9149203fc73c287', '4028d88181a067f70181a068cc430001', 'base_pay_status', '付款至乡镇情况', 'base_pay_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 10, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('b50a2fae5e68a3e516d2ae157abf67b7', '4028d88181a067f70181a068cc430001', 'easy_actual_time', '便道实际交地时间', 'easy_actual_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 29, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('b56d782e6cc7ca96a3889ff3c88f3fa3', 'f6ac62dae4df41cf85381985d637e428', 'detail', '备注', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ba7bc1612a177f62e50eef4eb4847eac', '6eeb15d00bac4d6d900bbc6396ce7351', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, NULL, NULL, '2022-06-26 20:32:46', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('bb7eb410f7eaf01a61b39a23a662d175', '4d413963b6a84dc18ad1bd04f2c33908', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('bd7bc4976c5424ee5385d1692d22036d', 'ab3b97384d124e408b50f2ead96bb8a6', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('bf285f1adb2ac20dedd0917d9be6bd0c', 'f6ac62dae4df41cf85381985d637e428', 'name', '属地供电所名称', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 7, NULL, NULL, '2022-06-26 12:21:48', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c1ecf65ef437bac9760502fc3dc951ac', 'ab3b97384d124e408b50f2ead96bb8a6', 'status', '当前状态', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 16, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c28bdf5c155494f52ec8fa05d0be3575', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_reason', '便道未交地原因', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 26, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c2b5ec7fd63044b4f81c851e8768d9b8', '4028d88181a067f70181a068cc430001', 'id', 'id', 'id', 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c2e1608ffa1b794c9df84a9c1f0c96a3', '4028d88181a067f70181a068cc430001', 'create_by', '创建人', 'create_by', 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c41f5827310ed77f01e2aab781e11b32', '4d413963b6a84dc18ad1bd04f2c33908', 'light_day', '亮灯天数', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 39, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c4bb86146e3e5ca307ba896862034fe5', 'd4868e819712424dba89f0c2d1e829e0', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c68a89a7a4211b3986cd820f249438e9', '4d413963b6a84dc18ad1bd04f2c33908', 'light_status', '是否亮红灯', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 38, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c6e3e16698cdcf46883a273bed737268', 'd4868e819712424dba89f0c2d1e829e0', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, 'admin', '2022-06-25 22:13:18', '2022-06-25 16:34:05', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c72457bc5c02a162d401139ee285a21a', '4d413963b6a84dc18ad1bd04f2c33908', 'stretch_sign_status', '牵张场签订情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 30, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c7c588789e68ebae1bf8e63bf9c6df32', '7005bab7c6c84d218f2ee37104c538c6', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c805966fcbebc47e86924b7fee3239ef', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('c8c7547163b3f4be7b01a8e4093b1085', 'ab3b97384d124e408b50f2ead96bb8a6', 'group_tower', '是否完成组塔', NULL, 0, 1, 'string', 32, 0, '', 'is_open', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 15, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ca31a1b7ba539204bedc514b2b1ebf6a', '4028d88181a067f70181a068cc430001', 'base_actual_time', '塔基实际交地时间', 'base_actual_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 21, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('cc69be6315d3d5880d19810976bb31dd', '4028d88181a067f70181a068cc430001', 'light_day', '亮灯天数', 'light_day', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 39, 'admin', '2022-06-26 22:28:29', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ccfcecc9af4315747afa22a82d2a4b28', '4d413963b6a84dc18ad1bd04f2c33908', 'block_detail', '具体问题', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 37, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('cd90c5502d87be325d1582cacd7fd419', 'ab3b97384d124e408b50f2ead96bb8a6', 'plan_over_time', '计划竣工时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 17, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('cecf2fdbd706e9a179a2c129e7bed41c', '4028d88181a067f70181a068cc430001', 'easy_range', '施工便道用地范围确认', 'easy_range', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 22, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('cee1c14039ee017b916c8f6ad22a83f2', '4028d88181a067f70181a067f78b0000', 'sys_org_code', '所属部门', 'sys_org_code', 0, 1, 'string', 64, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 6, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d0a2b904fea35ca1e4112431709224cd', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d5c44be024ec9074a578560c318c311a', '4d413963b6a84dc18ad1bd04f2c33908', 'acquisition_measure_home', '丈量到户', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 11, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d67a6630a7a4ee57f56639797e6a6623', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'ascription_town', '交界塔基归属乡镇', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 9, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d736dd7a744da7a9292867af077d172a', '7005bab7c6c84d218f2ee37104c538c6', 'address', '塔地址', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d83c579efcf3ae664d4207d46375a3e8', '4028d88181a067f70181a068cc430001', 'block_status', '是否受阻', 'block_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 35, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d87c32bf39e86c4abaa1f06dfa015a8e', 'ab3b97384d124e408b50f2ead96bb8a6', 'tower_id', '杆塔id', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'tower', 'id', 7, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d9767d2fa7e6c199e1c5ca9d039359b6', 'ab3b97384d124e408b50f2ead96bb8a6', 'actual_start_time', '实际开工时间', NULL, 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 10, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('d9f00e21467bb79224f258830cf96c6b', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'overseer_unit', '监理单位(全程)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 14, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('db5d27c9b76e22fe6f3393bf5f65331d', '4028d88181a067f70181a067f78b0000', 'status', '当前状态', 'status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 16, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('dc72c3042678b03426473b8a850d9a97', '4028d88181a067f70181a067f78b0000', 'update_time', '更新日期', 'update_time', 0, 1, 'Date', 0, 0, '', '', '', '', 'date', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, 'admin', '2022-06-26 22:28:40', '2022-06-26 22:26:17', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('dd38b2ed4e846b2c12f611a2ef0971b3', '4bc0fd4b7fb64a7a912a5a6287bbca01', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, NULL, NULL, '2022-06-26 20:39:01', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('dd45913a1fbb1410ab8a384f24784c6f', '4d413963b6a84dc18ad1bd04f2c33908', 'stretch_pay_status', '牵张场付款情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 31, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ddddf092386fce2930362d4a0c059f84', '7005bab7c6c84d218f2ee37104c538c6', 'number', '杆塔号', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 7, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('de7e7cd444dc1a7f1168d201b19b1d39', '4d413963b6a84dc18ad1bd04f2c33908', 'acquisition_people_phone', '村民（承包人、经营人）电话', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 15, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('df069f8c3271c9b8f2a3dda1633d7a52', '7005bab7c6c84d218f2ee37104c538c6', 'coordinate_b', 'E坐标E/Y(米)', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 11, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e19dd72040bf34fba540bebfe1354be8', '4d413963b6a84dc18ad1bd04f2c33908', 'stretch_land_status', '牵张场交地情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 32, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e37274da5a42328abdbd361df165a12c', '7005bab7c6c84d218f2ee37104c538c6', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e3c7be8461a7a9ecf0a0da382f950a3e', '4028d88181a067f70181a068cc430001', 'easy_clear_table', '便道是否清表', 'easy_clear_table', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 27, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e4fdd35ffa072c3a083cc845b81bad7f', 'd92dbf6720344235aaf825dceade1f21', 'construction_unit', '属地供电所', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', 'construction_unit', 'name', 7, 'admin', '2022-06-26 20:30:26', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e5b0582f37cd839565e15f1b54ddbf4d', 'ab3b97384d124e408b50f2ead96bb8a6', 'subcontractor', '施工分包单位', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e5c237447c46805862b156fc1c7de5c6', '4028d88181a067f70181a068cc430001', 'registration', '塔基林木采伐证办理情况', 'registration', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 8, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e6812c9bfa8020e4ba73763f663cbe03', '4d413963b6a84dc18ad1bd04f2c33908', 'pipe_line_status', '管线迁移', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 33, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e79047c5260d985f74f75ac5d94e051c', '4028d88181a067f70181a068cc430001', 'acquisition_people_sign', '与村民（承包人、经营人）签定情况', 'acquisition_people_sign', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 12, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('e9ff7c57faff547d6aa40e9bf355efe1', '4028d88181a067f70181a068cc430001', 'base_clear_table', '塔基是否清表', 'base_clear_table', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 19, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('edd80b67e9c3aa5f00015dcc25702b6f', '4028d88181a067f70181a068cc430001', 'stretch_pay_status', '牵张场付款情况', 'stretch_pay_status', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 31, 'admin', '2022-06-26 22:28:28', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ef4dc642a058a372d73303a86bc9099e', 'd92dbf6720344235aaf825dceade1f21', 'update_time', '更新日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 5, 'admin', '2022-06-26 20:30:25', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('f440253c42b1fdfc853f4afc2fcfdb43', '4d413963b6a84dc18ad1bd04f2c33908', 'acquisition_people_electricity', '村民（承包人、经营人）用电户号', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 16, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('f60609abb67615da413e5a0c98270617', 'ab3b97384d124e408b50f2ead96bb8a6', 'update_by', '更新人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 4, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('f6f034069eb6a09342d55321572818f1', '7005bab7c6c84d218f2ee37104c538c6', 'id', '主键', NULL, 1, 0, 'string', 36, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 1, 'single', '', '', 1, NULL, NULL, '2022-06-26 22:22:57', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('f9fa5c8e4b430ceafcd5e9b5ac3e97cc', '4d413963b6a84dc18ad1bd04f2c33908', 'base_pay_status', '付款至乡镇情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 10, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('fa67d554b3bd3ce384d572ccc0a8543b', '4d413963b6a84dc18ad1bd04f2c33908', 'acquisition_people_sign', '与村民（承包人、经营人）签定情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 12, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('fb175c12e9aee5faeb6a04d61f759603', 'ab3b97384d124e408b50f2ead96bb8a6', 'create_by', '创建人', NULL, 0, 1, 'string', 50, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 2, 'admin', '2022-06-26 22:14:00', '2022-06-26 20:54:51', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('fbc9d8b51a0e11c6737579a2f57d0da6', 'd92dbf6720344235aaf825dceade1f21', 'create_time', '创建日期', NULL, 0, 1, 'Date', 20, 0, '', '', '', '', 'datetime', '', 120, NULL, '0', '', '', 0, 0, 0, 0, 'single', '', '', 3, 'admin', '2022-06-26 20:30:25', '2022-06-26 20:04:03', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('fcb31b1f1ad9ae27d0afe925a823e0ec', '4d413963b6a84dc18ad1bd04f2c33908', 'easy_sign_status', '便道签订情况', NULL, 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 23, 'admin', '2022-06-26 22:19:37', '2022-06-26 21:06:24', 'admin', '', '', '', '', '', 'text', '0', NULL, NULL, '0');
INSERT INTO `onl_cgform_field` VALUES ('ffcab48e6415eef5d29a6dadf60a3639', '4028d88181a067f70181a068cc430001', 'block_detail', '具体问题', 'block_detail', 0, 1, 'string', 32, 0, '', '', '', '', 'text', '', 120, NULL, '0', '', '', 0, 1, 1, 0, 'single', '', '', 37, 'admin', '2022-06-26 22:28:29', '2022-06-26 22:27:12', 'admin', '', '', '', '', '', NULL, '0', NULL, NULL, '0');

-- ----------------------------
-- Table structure for onl_cgform_head
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_head`;
CREATE TABLE `onl_cgform_head`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `table_type` int NOT NULL COMMENT '表类型: 0单表、1主表、2附表',
  `table_version` int NULL DEFAULT 1 COMMENT '表版本',
  `table_txt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表说明',
  `is_checkbox` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否带checkbox',
  `is_db_synch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '同步数据库状态',
  `is_page` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否分页',
  `is_tree` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是树',
  `id_sequence` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键生成序列',
  `id_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键类型',
  `query_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询模式',
  `relation_type` int NULL DEFAULT NULL COMMENT '映射关系 0一对多  1一对一',
  `sub_table_str` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表',
  `tab_order_num` int NULL DEFAULT NULL COMMENT '附表排序序号',
  `tree_parent_id_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树形表单父id',
  `tree_id_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树表主键字段',
  `tree_fieldname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树开表单列字段',
  `form_category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'bdfl_ptbd' COMMENT '表单分类',
  `form_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC表单模板',
  `form_template_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单模板样式(移动端)',
  `scroll` int NULL DEFAULT 0 COMMENT '是否有横向滚动条',
  `copy_version` int NULL DEFAULT NULL COMMENT '复制版本号',
  `copy_type` int NULL DEFAULT 0 COMMENT '复制表类型1为复制表 0为原始表',
  `physic_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始表ID',
  `ext_config_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展JSON',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `theme_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题模板',
  `is_des_form` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否用设计器表单',
  `des_form_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设计器表单编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_onlineform_table_name`(`table_name`) USING BTREE,
  INDEX `index_form_templdate`(`form_template`) USING BTREE,
  INDEX `index_templdate_mobile`(`form_template_mobile`) USING BTREE,
  INDEX `index_onlineform_table_version`(`table_version`) USING BTREE,
  INDEX `idx_och_cgform_head_id`(`table_name`) USING BTREE,
  INDEX `idx_och_table_name`(`form_template`) USING BTREE,
  INDEX `idx_och_form_template_mobile`(`form_template_mobile`) USING BTREE,
  INDEX `idx_och_table_version`(`table_version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_head
-- ----------------------------
INSERT INTO `onl_cgform_head` VALUES ('4028d88181a067f70181a067f78b0000', 'construction_message', 3, 3, '施工填报', 'Y', 'Y', 'Y', 'N', NULL, 'UUID', 'group', 0, NULL, 1, NULL, NULL, NULL, 'bdfl_include', '1', NULL, 1, NULL, 0, NULL, '{\"reportPrintShow\":0,\"reportPrintUrl\":\"\",\"joinQuery\":0,\"modelFullscreen\":0,\"modalMinWidth\":\"\"}', 'admin', '2022-06-26 22:28:44', 'admin', '2022-06-26 22:26:17', 'normal', 'N', '');
INSERT INTO `onl_cgform_head` VALUES ('4028d88181a067f70181a068cc430001', 'territorial_message', 3, 3, '属地供电所填报', 'Y', 'Y', 'Y', 'N', NULL, 'UUID', 'group', 0, NULL, 1, NULL, NULL, NULL, 'bdfl_include', '1', NULL, 1, NULL, 0, NULL, '{\"reportPrintShow\":0,\"reportPrintUrl\":\"\",\"joinQuery\":0,\"modelFullscreen\":0,\"modalMinWidth\":\"\"}', 'admin', '2022-06-26 22:28:33', 'admin', '2022-06-26 22:27:12', 'normal', 'N', '');
INSERT INTO `onl_cgform_head` VALUES ('7005bab7c6c84d218f2ee37104c538c6', 'tower', 2, 2, '塔杆信息', 'Y', 'Y', 'Y', 'N', NULL, 'UUID', 'single', NULL, 'territorial_message,construction_message', NULL, NULL, NULL, NULL, 'temp', '1', NULL, 1, NULL, 0, NULL, '{\"reportPrintShow\":0,\"reportPrintUrl\":\"\",\"joinQuery\":0,\"modelFullscreen\":0,\"modalMinWidth\":\"\"}', 'admin', '2022-06-26 22:28:40', 'admin', '2022-06-26 22:22:57', 'erp', 'N', '');
INSERT INTO `onl_cgform_head` VALUES ('d4868e819712424dba89f0c2d1e829e0', 'construction_unit', 1, 4, '施工单位', 'Y', 'Y', 'Y', 'N', NULL, 'UUID', 'single', NULL, '', NULL, NULL, NULL, NULL, 'temp', '1', NULL, 1, NULL, 0, NULL, '{\"reportPrintShow\":0,\"reportPrintUrl\":\"\",\"joinQuery\":0,\"modelFullscreen\":0,\"modalMinWidth\":\"\"}', 'admin', '2022-06-26 20:30:26', 'admin', '2022-06-25 16:34:05', 'normal', 'N', '');
INSERT INTO `onl_cgform_head` VALUES ('f6ac62dae4df41cf85381985d637e428', 'territorial_station', 1, 2, '属地供电所', 'Y', 'Y', 'Y', 'N', NULL, 'UUID', 'single', NULL, NULL, NULL, NULL, NULL, NULL, 'temp', '1', NULL, 1, NULL, 0, NULL, '{\"reportPrintShow\":0,\"reportPrintUrl\":\"\",\"joinQuery\":0,\"modelFullscreen\":0,\"modalMinWidth\":\"\"}', 'admin', '2022-06-26 12:21:58', 'admin', '2022-06-26 12:21:48', 'normal', 'N', '');

-- ----------------------------
-- Table structure for onl_cgform_index
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_index`;
CREATE TABLE `onl_cgform_index`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `cgform_head_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主表id',
  `index_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引名称',
  `index_field` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引栏位',
  `index_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引类型',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `is_db_synch` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否同步数据库 N未同步 Y已同步',
  `del_flag` int NULL DEFAULT 0 COMMENT '是否删除 0未删除 1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_id`(`cgform_head_id`) USING BTREE,
  INDEX `idx_oci_cgform_head_id`(`cgform_head_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgform_index
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgreport_head
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgreport_head`;
CREATE TABLE `onl_cgreport_head`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表名字',
  `cgr_sql` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表SQL',
  `return_val_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回值字段',
  `return_txt_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回文本字段',
  `return_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '返回类型，单选或多选',
  `db_source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动态数据源',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `low_app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的应用ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_onlinereport_code`(`code`) USING BTREE,
  INDEX `idx_och_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgreport_head
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgreport_item
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgreport_item`;
CREATE TABLE `onl_cgreport_item`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cgrhead_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表ID',
  `field_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名字',
  `field_txt` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段文本',
  `field_width` int NULL DEFAULT NULL,
  `field_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `search_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询模式',
  `is_order` int NULL DEFAULT 0 COMMENT '是否排序  0否,1是',
  `is_search` int NULL DEFAULT 0 COMMENT '是否查询  0否,1是',
  `dict_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典CODE',
  `field_href` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段跳转URL',
  `is_show` int NULL DEFAULT 1 COMMENT '是否显示  0否,1显示',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `replace_val` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取值表达式',
  `is_total` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否合计 0否,1是（仅对数值有效）',
  `group_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组标题',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_CGRHEAD_ID`(`cgrhead_id`) USING BTREE,
  INDEX `index_isshow`(`is_show`) USING BTREE,
  INDEX `index_order_num`(`order_num`) USING BTREE,
  INDEX `idx_oci_cgrhead_id`(`cgrhead_id`) USING BTREE,
  INDEX `idx_oci_is_show`(`is_show`) USING BTREE,
  INDEX `idx_oci_order_num`(`order_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgreport_item
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgreport_param
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgreport_param`;
CREATE TABLE `onl_cgreport_param`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cgrhead_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态报表ID',
  `param_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数字段',
  `param_txt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数文本',
  `param_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数默认值',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cgrheadid`(`cgrhead_id`) USING BTREE,
  INDEX `idx_ocp_cgrhead_id`(`cgrhead_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of onl_cgreport_param
-- ----------------------------

-- ----------------------------
-- Table structure for oss_file
-- ----------------------------
DROP TABLE IF EXISTS `oss_file`;
CREATE TABLE `oss_file`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Oss File' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oss_file
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MyScheduler', 'Janice1656254777162', 1656260048265, 10000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 504832 kB; (`SCHED_NAME` `JOB_NAME` `JOB_GROUP`' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '消息类型1:通知公告2:系统消息',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '撤销时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `bus_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型(email:邮件 bpm:流程)',
  `bus_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `open_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式(组件：component 路由：url)',
  `open_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件/路由 地址',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  `msg_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  `dt_task_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉task_id，用于撤回消息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_send`;
CREATE TABLE `sys_announcement_send`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通告阅读标记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement_send
-- ----------------------------

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级节点',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `has_child` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有子节点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE,
  INDEX `idx_sc_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_category
-- ----------------------------

-- ----------------------------
-- Table structure for sys_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_check_rule`;
CREATE TABLE `sys_check_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则Code',
  `rule_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则JSON',
  `rule_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则描述',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_sys_check_rule_code`(`rule_code`) USING BTREE,
  UNIQUE INDEX `uk_scr_rule_code`(`rule_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_check_rule
-- ----------------------------
INSERT INTO `sys_check_rule` VALUES ('1224980593992388610', '通用编码规则', 'common', '[{\"digits\":\"1\",\"pattern\":\"^[a-z|A-Z]$\",\"message\":\"第一位只能是字母\"},{\"digits\":\"*\",\"pattern\":\"^[0-9|a-z|A-Z|_]{0,}$\",\"message\":\"只能填写数字、大小写字母、下划线\"},{\"digits\":\"*\",\"pattern\":\"^.{3,}$\",\"message\":\"最少输入3位数\"},{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"最多输入12位数\"}]', '规则：1、首位只能是字母；2、只能填写数字、大小写字母、下划线；3、最少3位数，最多12位数。', 'admin', '2020-02-07 11:25:48', 'admin', '2020-02-05 16:58:27');
INSERT INTO `sys_check_rule` VALUES ('1225001845524004866', '负责的功能测试', 'test', '[{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"只能输入3-12位字符\"},{\"digits\":\"3\",\"pattern\":\"^\\\\d{3}$\",\"message\":\"前3位必须是数字\"},{\"digits\":\"*\",\"pattern\":\"^[^pP]*$\",\"message\":\"不能输入P\"},{\"digits\":\"4\",\"pattern\":\"^@{4}$\",\"message\":\"第4-7位必须都为 @\"},{\"digits\":\"2\",\"pattern\":\"^#=$\",\"message\":\"第8-9位必须是 #=\"},{\"digits\":\"1\",\"pattern\":\"^O$\",\"message\":\"第10位必须为大写的O\"},{\"digits\":\"*\",\"pattern\":\"^.*。$\",\"message\":\"必须以。结尾\"}]', '包含长度校验、特殊字符校验等', 'admin', '2020-02-07 11:57:31', 'admin', '2020-02-05 18:22:54');

-- ----------------------------
-- Table structure for sys_data_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_log`;
CREATE TABLE `sys_data_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `data_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据ID',
  `data_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据内容',
  `data_version` int NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sindex`(`data_table`, `data_id`) USING BTREE,
  INDEX `idx_sdl_data_table_id`(`data_table`, `data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_data_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_data_source
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_source`;
CREATE TABLE `sys_data_source`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `db_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `db_driver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驱动类',
  `db_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源地址',
  `db_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `db_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `db_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_data_source_code_uni`(`code`) USING BTREE,
  UNIQUE INDEX `uk_sdc_rule_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `depart_name_en` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `depart_name_abbr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `depart_order` int NULL DEFAULT 0 COMMENT '排序',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `org_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '机构类别 1公司，2组织机构，2岗位',
  `org_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型 1一级部门 2子部门',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `qywx_identifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接企业微信的ID',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_depart_org_code`(`org_code`) USING BTREE,
  INDEX `index_depart_parent_id`(`parent_id`) USING BTREE,
  INDEX `index_depart_depart_order`(`depart_order`) USING BTREE,
  INDEX `index_depart_org_code`(`org_code`) USING BTREE,
  INDEX `idx_sd_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_sd_depart_order`(`depart_order`) USING BTREE,
  INDEX `idx_sd_org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO `sys_depart` VALUES ('57197590443c44f083d42ae24ef26a2c', 'c6d7cb4deeac411cb3384b1b31278596', '研发部', NULL, NULL, 0, NULL, '1', '2', 'A01A05', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-21 16:14:41', 'admin', '2019-03-27 19:05:49');
INSERT INTO `sys_depart` VALUES ('67fc001af12a4f9b8458005d3f19934a', 'c6d7cb4deeac411cb3384b1b31278596', '测试部', NULL, NULL, 0, NULL, '1', '2', 'A01A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-21 16:14:35', 'admin', '2019-02-25 12:49:41');
INSERT INTO `sys_depart` VALUES ('6d35e179cd814e3299bd588ea7daed3f', '', 'XX农信社', NULL, NULL, 0, NULL, '1', '1', 'A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-26 16:36:39', 'admin', '2020-05-02 18:21:22');
INSERT INTO `sys_depart` VALUES ('c6d7cb4deeac411cb3384b1b31278596', '', '叁拾科技', NULL, NULL, 0, NULL, '1', '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'admin', '2019-02-11 14:21:51', 'admin', '2020-05-02 18:21:27');

-- ----------------------------
-- Table structure for sys_depart_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_permission`;
CREATE TABLE `sys_depart_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据规则id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_depart_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_depart_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role`;
CREATE TABLE `sys_depart_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_depart_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_depart_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role_permission`;
CREATE TABLE `sys_depart_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限ids',
  `operate_date` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE,
  INDEX `idx_sdrp_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `idx_sdrp_role_id`(`role_id`) USING BTREE,
  INDEX `idx_sdrp_per_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_depart_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_depart_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart_role_user`;
CREATE TABLE `sys_depart_role_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `drole_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门角色用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_depart_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` int NULL DEFAULT NULL COMMENT '删除状态',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '字典类型0为string,1为number',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `indextable_dict_code`(`dict_code`) USING BTREE,
  UNIQUE INDEX `uk_sd_dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0b5d19e1fce4b2e6647e6b4a17760c14', '通告类型', 'msg_category', '消息类型1:通知公告2:系统消息', 0, 'admin', '2019-04-22 18:01:35', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1174509082208395266', '职务职级', 'position_rank', '职务表职级字典', 0, 'admin', '2019-09-19 10:22:41', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1174511106530525185', '机构类型', 'org_category', '机构类型 1公司，2部门 3岗位', 0, 'admin', '2019-09-19 10:30:43', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1178295274528845826', '表单权限策略', 'form_perms_type', '', 0, 'admin', '2019-09-29 21:07:39', 'admin', '2019-09-29 21:08:26', NULL);
INSERT INTO `sys_dict` VALUES ('1199517671259906049', '紧急程度', 'urgent_level', '日程计划紧急程度', 0, 'admin', '2019-11-27 10:37:53', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1199518099888414722', '日程计划类型', 'eoa_plan_type', '', 0, 'admin', '2019-11-27 10:39:36', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1199520177767587841', '分类栏目类型', 'eoa_cms_menu_type', '', 0, 'admin', '2019-11-27 10:47:51', 'admin', '2019-11-27 10:49:35', 0);
INSERT INTO `sys_dict` VALUES ('1199525215290306561', '日程计划状态', 'eoa_plan_status', '', 0, 'admin', '2019-11-27 11:07:52', 'admin', '2019-11-27 11:10:11', 0);
INSERT INTO `sys_dict` VALUES ('1209733563293962241', '数据库类型', 'database_type', '', 0, 'admin', '2019-12-25 15:12:12', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1232913193820581889', 'Online表单业务分类', 'ol_form_biz_type', '', 0, 'admin', '2020-02-27 14:19:46', 'admin', '2020-02-27 14:20:23', 0);
INSERT INTO `sys_dict` VALUES ('1250687930947620866', '定时任务状态', 'quartz_status', '', 0, 'admin', '2020-04-16 15:30:14', '', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1280401766745718786', '租户状态', 'tenant_status', '租户状态', 0, 'admin', '2020-07-07 15:22:25', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1356445645198135298', '开关', 'is_open', '', 0, 'admin', '2021-02-02 11:33:38', 'admin', '2021-02-02 15:28:12', 0);
INSERT INTO `sys_dict` VALUES ('236e8a4baff0db8c62c00dd95632834f', '同步工作流引擎', 'activiti_sync', '同步工作流引擎', 0, 'admin', '2019-05-15 15:27:33', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2e02df51611a4b9632828ab7e5338f00', '权限策略', 'perms_type', '权限策略', 0, 'admin', '2019-04-26 18:26:55', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2f0320997ade5dd147c90130f7218c3e', '推送类别', 'msg_type', '', 0, 'admin', '2019-03-17 21:21:32', 'admin', '2019-03-26 19:57:45', 0);
INSERT INTO `sys_dict` VALUES ('3486f32803bb953e7155dab3513dc68b', '删除状态', 'del_flag', NULL, 0, 'admin', '2019-01-18 21:46:26', 'admin', '2019-03-30 11:17:11', 0);
INSERT INTO `sys_dict` VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, 0, NULL, '2019-01-04 14:56:32', 'admin', '2019-03-30 11:28:27', 1);
INSERT INTO `sys_dict` VALUES ('4274efc2292239b6f000b153f50823ff', '全局权限策略', 'global_perms_type', '全局权限策略', 0, 'admin', '2019-05-10 17:54:05', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4c03fca6bf1f0299c381213961566349', 'Online图表展示模板', 'online_graph_display_template', 'Online图表展示模板', 0, 'admin', '2019-04-12 17:28:50', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4c753b5293304e7a445fd2741b46529d', '字典状态', 'dict_item_status', NULL, 0, 'admin', '2020-06-18 23:18:42', 'admin', '2019-03-30 19:33:52', 1);
INSERT INTO `sys_dict` VALUES ('4d7fec1a7799a436d26d02325eff295e', '优先级', 'priority', '优先级', 0, 'admin', '2019-03-16 17:03:34', 'admin', '2019-04-16 17:39:23', 0);
INSERT INTO `sys_dict` VALUES ('4e4602b3e3686f0911384e188dc7efb4', '条件规则', 'rule_conditions', '', 0, 'admin', '2019-04-01 10:15:03', 'admin', '2019-04-01 10:30:47', 0);
INSERT INTO `sys_dict` VALUES ('4f69be5f507accea8d5df5f11346181a', '发送消息类型', 'msgType', NULL, 0, 'admin', '2019-04-11 14:27:09', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('68168534ff5065a152bfab275c2136f8', '有效无效状态', 'valid_status', '有效无效状态', 0, 'admin', '2020-09-26 19:21:14', 'admin', '2019-04-26 19:21:23', 0);
INSERT INTO `sys_dict` VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, 0, NULL, '2019-01-04 14:59:01', 'admin', '2019-03-18 23:28:18', 0);
INSERT INTO `sys_dict` VALUES ('72cce0989df68887546746d8f09811aa', 'Online表单类型', 'cgform_table_type', '', 0, 'admin', '2019-01-27 10:13:02', 'admin', '2019-03-30 11:37:36', 0);
INSERT INTO `sys_dict` VALUES ('78bda155fe380b1b3f175f1e88c284c6', '流程状态', 'bpm_status', '流程状态', 0, 'admin', '2019-05-09 16:31:52', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('83bfb33147013cc81640d5fd9eda030c', '日志类型', 'log_type', NULL, 0, 'admin', '2019-03-18 23:22:19', NULL, NULL, 1);
INSERT INTO `sys_dict` VALUES ('845da5006c97754728bf48b6a10f79cc', '状态', 'status', NULL, 0, 'admin', '2019-03-18 21:45:25', 'admin', '2019-03-18 21:58:25', 0);
INSERT INTO `sys_dict` VALUES ('880a895c98afeca9d9ac39f29e67c13e', '操作类型', 'operate_type', '操作类型', 0, 'admin', '2019-07-22 10:54:29', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('8dfe32e2d29ea9430a988b3b558bf233', '发布状态', 'send_status', '发布状态', 0, 'admin', '2019-04-16 17:40:42', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a7adbcd86c37f7dbc9b66945c82ef9e6', '1是0否', 'yn', '', 0, 'admin', '2019-05-22 19:29:29', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a9d9942bd0eccb6e89de92d130ec4c4a', '消息发送状态', 'msgSendStatus', NULL, 0, 'admin', '2019-04-12 18:18:17', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('ac2f7c0c5c5775fcea7e2387bcb22f01', '菜单类型', 'menu_type', NULL, 0, 'admin', '2020-12-18 23:24:32', 'admin', '2019-04-01 15:27:06', 1);
INSERT INTO `sys_dict` VALUES ('ad7c65ba97c20a6805d5dcdf13cdaf36', 'onlineT类型', 'ceshi_online', NULL, 0, 'admin', '2019-03-22 16:31:49', 'admin', '2019-03-22 16:34:16', 0);
INSERT INTO `sys_dict` VALUES ('bd1b8bc28e65d6feefefb6f3c79f42fd', 'Online图表数据类型', 'online_graph_data_type', 'Online图表数据类型', 0, 'admin', '2019-04-12 17:24:24', 'admin', '2019-04-12 17:24:57', 0);
INSERT INTO `sys_dict` VALUES ('c36169beb12de8a71c8683ee7c28a503', '部门状态', 'depart_status', NULL, 0, 'admin', '2019-03-18 21:59:51', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('c5a14c75172783d72cbee6ee7f5df5d1', 'Online图表类型', 'online_graph_type', 'Online图表类型', 0, 'admin', '2019-04-12 17:04:06', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('d6e1152968b02d69ff358c75b48a6ee1', '流程类型', 'bpm_process_type', NULL, 0, 'admin', '2021-02-22 19:26:54', 'admin', '2019-03-30 18:14:44', 0);
INSERT INTO `sys_dict` VALUES ('fc6cd58fde2e8481db10d3a1e68ce70c', '用户状态', 'user_status', NULL, 0, 'admin', '2019-03-18 21:57:25', 'admin', '2019-03-18 23:11:58', 1);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项文本',
  `item_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_order` int NULL DEFAULT NULL COMMENT '排序',
  `status` int NULL DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_dict_id`(`dict_id`) USING BTREE,
  INDEX `index_table_sort_order`(`sort_order`) USING BTREE,
  INDEX `index_table_dict_status`(`status`) USING BTREE,
  INDEX `idx_sdi_role_dict_id`(`dict_id`) USING BTREE,
  INDEX `idx_sdi_role_sort_order`(`sort_order`) USING BTREE,
  INDEX `idx_sdi_status`(`status`) USING BTREE,
  INDEX `idx_sdi_dict_val`(`dict_id`, `item_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('0072d115e07c875d76c9b022e2179128', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', '低', 3, 1, 'admin', '2019-04-16 17:04:59', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('05a2e732ce7b00aa52141ecc3e330b4e', '3486f32803bb953e7155dab3513dc68b', '已删除', '1', NULL, NULL, 1, 'admin', '2025-10-18 21:46:56', 'admin', '2019-03-28 22:23:20');
INSERT INTO `sys_dict_item` VALUES ('096c2e758d823def3855f6376bc736fb', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'SQL', 'sql', NULL, 1, 1, 'admin', '2019-04-12 17:26:26', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('0c9532916f5cd722017b46bc4d953e41', '2f0320997ade5dd147c90130f7218c3e', '指定用户', 'USER', NULL, NULL, 1, 'admin', '2019-03-17 21:22:19', 'admin', '2019-03-17 21:22:28');
INSERT INTO `sys_dict_item` VALUES ('0ca4beba9efc4f9dd54af0911a946d5c', '72cce0989df68887546746d8f09811aa', '附表', '3', NULL, 3, 1, 'admin', '2019-03-27 10:13:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1030a2652608f5eac3b49d70458b8532', '2e02df51611a4b9632828ab7e5338f00', '禁用', '2', '禁用', 2, 1, 'admin', '2021-03-26 18:27:28', 'admin', '2019-04-26 18:39:11');
INSERT INTO `sys_dict_item` VALUES ('1174509082208395266', '1174511106530525185', '岗位', '3', '岗位', 1, 1, 'admin', '2019-09-19 10:31:16', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1174509601047994369', '1174509082208395266', '员级', '1', '', 1, 1, 'admin', '2019-09-19 10:24:45', 'admin', '2019-09-23 11:46:39');
INSERT INTO `sys_dict_item` VALUES ('1174509667297026049', '1174509082208395266', '助级', '2', '', 2, 1, 'admin', '2019-09-19 10:25:01', 'admin', '2019-09-23 11:46:47');
INSERT INTO `sys_dict_item` VALUES ('1174509713568587777', '1174509082208395266', '中级', '3', '', 3, 1, 'admin', '2019-09-19 10:25:12', 'admin', '2019-09-23 11:46:56');
INSERT INTO `sys_dict_item` VALUES ('1174509788361416705', '1174509082208395266', '副高级', '4', '', 4, 1, 'admin', '2019-09-19 10:25:30', 'admin', '2019-09-23 11:47:06');
INSERT INTO `sys_dict_item` VALUES ('1174509835803189250', '1174509082208395266', '正高级', '5', '', 5, 1, 'admin', '2019-09-19 10:25:41', 'admin', '2019-09-23 11:47:12');
INSERT INTO `sys_dict_item` VALUES ('1174511197735665665', '1174511106530525185', '公司', '1', '公司', 1, 1, 'admin', '2019-09-19 10:31:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1174511244036587521', '1174511106530525185', '部门', '2', '部门', 1, 1, 'admin', '2019-09-19 10:31:16', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1178295553450061826', '1178295274528845826', '可编辑(未授权禁用)', '2', '', 2, 1, 'admin', '2019-09-29 21:08:46', 'admin', '2019-09-29 21:09:18');
INSERT INTO `sys_dict_item` VALUES ('1178295639554928641', '1178295274528845826', '可见(未授权不可见)', '1', '', 1, 1, 'admin', '2019-09-29 21:09:06', 'admin', '2019-09-29 21:09:24');
INSERT INTO `sys_dict_item` VALUES ('1199517884758368257', '1199517671259906049', '一般', '1', '', 1, 1, 'admin', '2019-11-27 10:38:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517914017832962', '1199517671259906049', '重要', '2', '', 1, 1, 'admin', '2019-11-27 10:38:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517941339529217', '1199517671259906049', '紧急', '3', '', 1, 1, 'admin', '2019-11-27 10:38:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518186144276482', '1199518099888414722', '日常记录', '1', '', 1, 1, 'admin', '2019-11-27 10:39:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518214858481666', '1199518099888414722', '本周工作', '2', '', 1, 1, 'admin', '2019-11-27 10:40:03', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518235943247874', '1199518099888414722', '下周计划', '3', '', 1, 1, 'admin', '2019-11-27 10:40:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520817285701634', '1199520177767587841', '列表', '1', '', 1, 1, 'admin', '2019-11-27 10:50:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520835035996161', '1199520177767587841', '链接', '2', '', 1, 1, 'admin', '2019-11-27 10:50:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525468672405505', '1199525215290306561', '未开始', '0', '', 1, 1, 'admin', '2019-11-27 11:08:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525490575060993', '1199525215290306561', '进行中', '1', '', 1, 1, 'admin', '2019-11-27 11:08:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525506429530114', '1199525215290306561', '已完成', '2', '', 1, 1, 'admin', '2019-11-27 11:09:02', 'admin', '2019-11-27 11:10:02');
INSERT INTO `sys_dict_item` VALUES ('1199607547704647681', '4f69be5f507accea8d5df5f11346181a', '系统', '4', '', 1, 1, 'admin', '2019-11-27 16:35:02', 'admin', '2019-11-27 19:37:46');
INSERT INTO `sys_dict_item` VALUES ('1209733775114702850', '1209733563293962241', 'MySQL5.5', '1', '', 1, 1, 'admin', '2019-12-25 15:13:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1209733839933476865', '1209733563293962241', 'Oracle', '2', '', 3, 1, 'admin', '2019-12-25 15:13:18', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1209733903020003330', '1209733563293962241', 'SQLServer', '3', '', 4, 1, 'admin', '2019-12-25 15:13:33', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1232913424813486081', '1232913193820581889', '官方示例', 'demo', '', 1, 1, 'admin', '2020-02-27 14:20:42', 'admin', '2020-02-27 14:21:37');
INSERT INTO `sys_dict_item` VALUES ('1232913493717512194', '1232913193820581889', '流程表单', 'bpm', '', 2, 1, 'admin', '2020-02-27 14:20:58', 'admin', '2020-02-27 14:22:20');
INSERT INTO `sys_dict_item` VALUES ('1232913605382467585', '1232913193820581889', '测试表单', 'temp', '', 4, 1, 'admin', '2020-02-27 14:21:25', 'admin', '2020-02-27 14:22:16');
INSERT INTO `sys_dict_item` VALUES ('1232914232372195330', '1232913193820581889', '导入表单', 'bdfl_include', '', 5, 1, 'admin', '2020-02-27 14:23:54', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234371726545010689', '4e4602b3e3686f0911384e188dc7efb4', '左模糊', 'LEFT_LIKE', '左模糊', 7, 1, 'admin', '2020-03-02 14:55:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234371809495760898', '4e4602b3e3686f0911384e188dc7efb4', '右模糊', 'RIGHT_LIKE', '右模糊', 7, 1, 'admin', '2020-03-02 14:55:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1250688147579228161', '1250687930947620866', '正常', '0', '', 1, 1, 'admin', '2020-04-16 15:31:05', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1250688201064992770', '1250687930947620866', '停止', '-1', '', 1, 1, 'admin', '2020-04-16 15:31:18', '', NULL);
INSERT INTO `sys_dict_item` VALUES ('1280401815068295170', '1280401766745718786', '正常', '1', '', 1, 1, 'admin', '2020-07-07 15:22:36', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1280401847607705602', '1280401766745718786', '冻结', '0', '', 1, 1, 'admin', '2020-07-07 15:22:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1305827309355302914', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'API', 'api', '', 3, 1, 'admin', '2020-09-15 19:14:26', 'admin', '2020-09-15 19:14:41');
INSERT INTO `sys_dict_item` VALUES ('1334440962954936321', '1209733563293962241', 'MYSQL5.7', '6', NULL, 1, 1, 'admin', '2020-12-03 18:16:02', 'admin', '2020-12-03 18:16:02');
INSERT INTO `sys_dict_item` VALUES ('1356445705549975553', '1356445645198135298', '是', 'Y', '', 1, 1, 'admin', '2021-02-02 11:33:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1356445754212290561', '1356445645198135298', '否', 'N', '', 1, 1, 'admin', '2021-02-02 11:34:04', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1414837074500976641', '1209733563293962241', 'Postgresql', '6', '', 5, 1, 'admin', '2021-07-13 14:40:20', 'admin', '2021-07-15 13:44:15');
INSERT INTO `sys_dict_item` VALUES ('1415547541091504129', '1209733563293962241', 'MarialDB', '5', '', 6, 1, 'admin', '2021-07-15 13:43:28', 'admin', '2021-07-15 13:44:23');
INSERT INTO `sys_dict_item` VALUES ('1418049969003089922', '1209733563293962241', '达梦', '7', '', 7, 1, 'admin', '2021-07-22 11:27:13', 'admin', '2021-07-22 11:27:30');
INSERT INTO `sys_dict_item` VALUES ('1418050017053036545', '1209733563293962241', '人大金仓', '8', '', 8, 1, 'admin', '2021-07-22 11:27:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050075555188737', '1209733563293962241', '神通', '9', '', 9, 1, 'admin', '2021-07-22 11:27:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050110669901826', '1209733563293962241', 'SQLite', '10', '', 10, 1, 'admin', '2021-07-22 11:27:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050149475602434', '1209733563293962241', 'DB2', '11', '', 11, 1, 'admin', '2021-07-22 11:27:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418050209823248385', '1209733563293962241', 'Hsqldb', '12', '', 12, 1, 'admin', '2021-07-22 11:28:11', 'admin', '2021-07-22 11:28:27');
INSERT INTO `sys_dict_item` VALUES ('1418050323111399425', '1209733563293962241', 'Derby', '13', '', 13, 1, 'admin', '2021-07-22 11:28:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418117316707590146', '1209733563293962241', 'H2', '14', '', 14, 1, 'admin', '2021-07-22 15:54:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1418491604048449537', '1209733563293962241', '其他数据库', '15', '', 15, 1, 'admin', '2021-07-23 16:42:07', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('147c48ff4b51545032a9119d13f3222a', 'd6e1152968b02d69ff358c75b48a6ee1', '测试流程', 'test', NULL, 1, 1, 'admin', '2019-03-22 19:27:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1543fe7e5e26fb97cdafe4981bedc0c8', '4c03fca6bf1f0299c381213961566349', '单排布局', 'single', NULL, 2, 1, 'admin', '2022-07-12 17:43:39', 'admin', '2019-04-12 17:43:57');
INSERT INTO `sys_dict_item` VALUES ('1ce390c52453891f93514c1bd2795d44', 'ad7c65ba97c20a6805d5dcdf13cdaf36', '000', '00', NULL, 1, 1, 'admin', '2019-03-22 16:34:34', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1db531bcff19649fa82a644c8a939dc4', '4c03fca6bf1f0299c381213961566349', '组合布局', 'combination', '', 4, 1, 'admin', '2019-05-11 16:07:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('222705e11ef0264d4214affff1fb4ff9', '4f69be5f507accea8d5df5f11346181a', '短信', '1', '', 1, 1, 'admin', '2023-02-28 10:50:36', 'admin', '2019-04-28 10:58:11');
INSERT INTO `sys_dict_item` VALUES ('23a5bb76004ed0e39414e928c4cde155', '4e4602b3e3686f0911384e188dc7efb4', '不等于', '!=', '不等于', 3, 1, 'admin', '2019-04-01 16:46:15', 'admin', '2019-04-01 17:48:40');
INSERT INTO `sys_dict_item` VALUES ('25847e9cb661a7c711f9998452dc09e6', '4e4602b3e3686f0911384e188dc7efb4', '小于等于', '<=', '小于等于', 6, 1, 'admin', '2019-04-01 16:44:34', 'admin', '2019-04-01 17:49:10');
INSERT INTO `sys_dict_item` VALUES ('2d51376643f220afdeb6d216a8ac2c01', '68168534ff5065a152bfab275c2136f8', '有效', '1', '有效', 2, 1, 'admin', '2019-04-26 19:22:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('308c8aadf0c37ecdde188b97ca9833f5', '8dfe32e2d29ea9430a988b3b558bf233', '已发布', '1', '已发布', 2, 1, 'admin', '2019-04-16 17:41:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('333e6b2196e01ef9a5f76d74e86a6e33', '8dfe32e2d29ea9430a988b3b558bf233', '未发布', '0', '未发布', 1, 1, 'admin', '2019-04-16 17:41:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('337ea1e401bda7233f6258c284ce4f50', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'JSON', 'json', NULL, 1, 1, 'admin', '2019-04-12 17:26:33', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('33bc9d9f753cf7dc40e70461e50fdc54', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送失败', '2', NULL, 3, 1, 'admin', '2019-04-12 18:20:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('3fbc03d6c994ae06d083751248037c0e', '78bda155fe380b1b3f175f1e88c284c6', '已完成', '3', '已完成', 3, 1, 'admin', '2019-05-09 16:33:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41d7aaa40c9b61756ffb1f28da5ead8e', '0b5d19e1fce4b2e6647e6b4a17760c14', '通知公告', '1', NULL, 1, 1, 'admin', '2019-04-22 18:01:57', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41fa1e9571505d643aea87aeb83d4d76', '4e4602b3e3686f0911384e188dc7efb4', '等于', '=', '等于', 4, 1, 'admin', '2019-04-01 16:45:24', 'admin', '2019-04-01 17:49:00');
INSERT INTO `sys_dict_item` VALUES ('43d2295b8610adce9510ff196a49c6e9', '845da5006c97754728bf48b6a10f79cc', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 21:45:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('4f05fb5376f4c61502c5105f52e4dd2b', '83bfb33147013cc81640d5fd9eda030c', '操作日志', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:22:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('50223341bfb5ba30bf6319789d8d17fe', 'd6e1152968b02d69ff358c75b48a6ee1', '业务办理', 'business', NULL, 3, 1, 'admin', '2023-04-22 19:28:05', 'admin', '2019-03-22 23:24:39');
INSERT INTO `sys_dict_item` VALUES ('51222413e5906cdaf160bb5c86fb827c', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '是', '1', '', 1, 1, 'admin', '2019-05-22 19:29:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('538fca35afe004972c5f3947c039e766', '2e02df51611a4b9632828ab7e5338f00', '显示', '1', '显示', 1, 1, 'admin', '2025-03-26 18:27:13', 'admin', '2019-04-26 18:39:07');
INSERT INTO `sys_dict_item` VALUES ('5584c21993bde231bbde2b966f2633ac', '4e4602b3e3686f0911384e188dc7efb4', '自定义SQL表达式', 'USE_SQL_RULES', '自定义SQL表达式', 9, 1, 'admin', '2019-04-01 10:45:24', 'admin', '2019-04-01 17:49:27');
INSERT INTO `sys_dict_item` VALUES ('58b73b344305c99b9d8db0fc056bbc0a', '72cce0989df68887546746d8f09811aa', '主表', '2', NULL, 2, 1, 'admin', '2019-03-27 10:13:36', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('5b65a88f076b32e8e69d19bbaadb52d5', '2f0320997ade5dd147c90130f7218c3e', '全体用户', 'ALL', NULL, NULL, 1, 'admin', '2020-10-17 21:22:43', 'admin', '2019-03-28 22:17:09');
INSERT INTO `sys_dict_item` VALUES ('5d833f69296f691843ccdd0c91212b6b', '880a895c98afeca9d9ac39f29e67c13e', '修改', '3', '', 3, 1, 'admin', '2019-07-22 10:55:07', 'admin', '2019-07-22 10:55:41');
INSERT INTO `sys_dict_item` VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 2, 1, NULL, '2019-01-04 14:56:56', NULL, '2019-01-04 17:38:12');
INSERT INTO `sys_dict_item` VALUES ('66c952ae2c3701a993e7db58f3baf55e', '4e4602b3e3686f0911384e188dc7efb4', '大于', '>', '大于', 1, 1, 'admin', '2019-04-01 10:45:46', 'admin', '2019-04-01 17:48:29');
INSERT INTO `sys_dict_item` VALUES ('6937c5dde8f92e9a00d4e2ded9198694', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'easyui', '3', NULL, 1, 1, 'admin', '2019-03-22 16:32:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('69cacf64e244100289ddd4aa9fa3b915', 'a9d9942bd0eccb6e89de92d130ec4c4a', '未发送', '0', NULL, 1, 1, 'admin', '2019-04-12 18:19:23', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6a7a9e1403a7943aba69e54ebeff9762', '4f69be5f507accea8d5df5f11346181a', '邮件', '2', '', 2, 1, 'admin', '2031-02-28 10:50:44', 'admin', '2019-04-28 10:59:03');
INSERT INTO `sys_dict_item` VALUES ('6c682d78ddf1715baf79a1d52d2aa8c2', '72cce0989df68887546746d8f09811aa', '单表', '1', NULL, 1, 1, 'admin', '2019-03-27 10:13:29', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6d404fd2d82311fbc87722cd302a28bc', '4e4602b3e3686f0911384e188dc7efb4', '模糊', 'LIKE', '模糊', 7, 1, 'admin', '2019-04-01 16:46:02', 'admin', '2019-04-01 17:49:20');
INSERT INTO `sys_dict_item` VALUES ('6d4e26e78e1a09699182e08516c49fc4', '4d7fec1a7799a436d26d02325eff295e', '高', 'H', '高', 1, 1, 'admin', '2019-04-16 17:04:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7050c1522702bac3be40e3b7d2e1dfd8', 'c5a14c75172783d72cbee6ee7f5df5d1', '柱状图', 'bar', NULL, 1, 1, 'admin', '2019-04-12 17:05:17', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('71b924faa93805c5c1579f12e001c809', 'd6e1152968b02d69ff358c75b48a6ee1', 'OA办公', 'oa', NULL, 2, 1, 'admin', '2021-03-22 19:27:17', 'admin', '2019-03-22 23:24:36');
INSERT INTO `sys_dict_item` VALUES ('75b260d7db45a39fc7f21badeabdb0ed', 'c36169beb12de8a71c8683ee7c28a503', '不启用', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:29:41', 'admin', '2019-03-18 23:29:54');
INSERT INTO `sys_dict_item` VALUES ('7688469db4a3eba61e6e35578dc7c2e5', 'c36169beb12de8a71c8683ee7c28a503', '启用', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:29:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('78ea6cadac457967a4b1c4eb7aaa418c', 'fc6cd58fde2e8481db10d3a1e68ce70c', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:30:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7ccf7b80c70ee002eceb3116854b75cb', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '按钮权限', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:25:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('81fb2bb0e838dc68b43f96cc309f8257', 'fc6cd58fde2e8481db10d3a1e68ce70c', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:30:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('83250269359855501ec4e9c0b7e21596', '4274efc2292239b6f000b153f50823ff', '可见/可访问(授权后可见/可访问)', '1', '', 1, 1, 'admin', '2019-05-10 17:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84778d7e928bc843ad4756db1322301f', '4e4602b3e3686f0911384e188dc7efb4', '大于等于', '>=', '大于等于', 5, 1, 'admin', '2019-04-01 10:46:02', 'admin', '2019-04-01 17:49:05');
INSERT INTO `sys_dict_item` VALUES ('848d4da35ebd93782029c57b103e5b36', 'c5a14c75172783d72cbee6ee7f5df5d1', '饼图', 'pie', NULL, 3, 1, 'admin', '2019-04-12 17:05:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84dfc178dd61b95a72900fcdd624c471', '78bda155fe380b1b3f175f1e88c284c6', '处理中', '2', '处理中', 2, 1, 'admin', '2019-05-09 16:33:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('86f19c7e0a73a0bae451021ac05b99dd', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '子菜单', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:25:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8bccb963e1cd9e8d42482c54cc609ca2', '4f69be5f507accea8d5df5f11346181a', '微信', '3', NULL, 3, 1, 'admin', '2021-05-11 14:29:12', 'admin', '2019-04-11 14:29:31');
INSERT INTO `sys_dict_item` VALUES ('8c618902365ca681ebbbe1e28f11a548', '4c753b5293304e7a445fd2741b46529d', '启用', '1', '', 0, 1, 'admin', '2020-07-18 23:19:27', 'admin', '2019-05-17 14:51:18');
INSERT INTO `sys_dict_item` VALUES ('8cdf08045056671efd10677b8456c999', '4274efc2292239b6f000b153f50823ff', '可编辑(未授权时禁用)', '2', '', 2, 1, 'admin', '2019-05-10 17:55:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8ff48e657a7c5090d4f2a59b37d1b878', '4d7fec1a7799a436d26d02325eff295e', '中', 'M', '中', 2, 1, 'admin', '2019-04-16 17:04:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('948923658baa330319e59b2213cda97c', '880a895c98afeca9d9ac39f29e67c13e', '添加', '2', '', 2, 1, 'admin', '2019-07-22 10:54:59', 'admin', '2019-07-22 10:55:36');
INSERT INTO `sys_dict_item` VALUES ('9a96c4a4e4c5c9b4e4d0cbf6eb3243cc', '4c753b5293304e7a445fd2741b46529d', '不启用', '0', NULL, 1, 1, 'admin', '2019-03-18 23:19:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a1e7d1ca507cff4a480c8caba7c1339e', '880a895c98afeca9d9ac39f29e67c13e', '导出', '6', '', 6, 1, 'admin', '2019-07-22 12:06:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2be752dd4ec980afaec1efd1fb589af', '8dfe32e2d29ea9430a988b3b558bf233', '已撤销', '2', '已撤销', 3, 1, 'admin', '2019-04-16 17:41:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('aa0d8a8042a18715a17f0a888d360aa4', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '一级菜单', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:24:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('adcf2a1fe93bb99a84833043f475fe0b', '4e4602b3e3686f0911384e188dc7efb4', '包含', 'IN', '包含', 8, 1, 'admin', '2019-04-01 16:45:47', 'admin', '2019-04-01 17:49:24');
INSERT INTO `sys_dict_item` VALUES ('b029a41a851465332ee4ee69dcf0a4c2', '0b5d19e1fce4b2e6647e6b4a17760c14', '系统消息', '2', NULL, 1, 1, 'admin', '2019-02-22 18:02:08', 'admin', '2019-04-22 18:02:13');
INSERT INTO `sys_dict_item` VALUES ('b2a8b4bb2c8e66c2c4b1bb086337f393', '3486f32803bb953e7155dab3513dc68b', '正常', '0', NULL, NULL, 1, 'admin', '2022-10-18 21:46:48', 'admin', '2019-03-28 22:22:20');
INSERT INTO `sys_dict_item` VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, 0, 'admin', '2019-02-21 19:59:43', 'admin', '2019-03-11 21:23:27');
INSERT INTO `sys_dict_item` VALUES ('b5f3bd5f66bb9a83fecd89228c0d93d1', '68168534ff5065a152bfab275c2136f8', '无效', '0', '无效', 1, 1, 'admin', '2019-04-26 19:21:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('b9fbe2a3602d4a27b45c100ac5328484', '78bda155fe380b1b3f175f1e88c284c6', '待提交', '1', '待提交', 1, 1, 'admin', '2019-05-09 16:32:35', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('ba27737829c6e0e582e334832703d75e', '236e8a4baff0db8c62c00dd95632834f', '同步', '1', '同步', 1, 1, 'admin', '2019-05-15 15:28:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('bcec04526b04307e24a005d6dcd27fd6', '880a895c98afeca9d9ac39f29e67c13e', '导入', '5', '', 5, 1, 'admin', '2019-07-22 12:06:41', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c53da022b9912e0aed691bbec3c78473', '880a895c98afeca9d9ac39f29e67c13e', '查询', '1', '', 1, 1, 'admin', '2019-07-22 10:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c5700a71ad08994d18ad1dacc37a71a9', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '否', '0', '', 1, 1, 'admin', '2019-05-22 19:29:55', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('cbfcc5b88fc3a90975df23ffc8cbe29c', 'c5a14c75172783d72cbee6ee7f5df5d1', '曲线图', 'line', NULL, 2, 1, 'admin', '2019-05-12 17:05:30', 'admin', '2019-04-12 17:06:06');
INSERT INTO `sys_dict_item` VALUES ('d217592908ea3e00ff986ce97f24fb98', 'c5a14c75172783d72cbee6ee7f5df5d1', '数据列表', 'table', NULL, 4, 1, 'admin', '2019-04-12 17:05:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1, 1, NULL, '2027-08-04 14:56:49', 'admin', '2019-03-23 22:44:44');
INSERT INTO `sys_dict_item` VALUES ('e6329e3a66a003819e2eb830b0ca2ea0', '4e4602b3e3686f0911384e188dc7efb4', '小于', '<', '小于', 2, 1, 'admin', '2019-04-01 16:44:15', 'admin', '2019-04-01 17:48:34');
INSERT INTO `sys_dict_item` VALUES ('e94eb7af89f1dbfa0d823580a7a6e66a', '236e8a4baff0db8c62c00dd95632834f', '不同步', '0', '不同步', 2, 1, 'admin', '2019-05-15 15:28:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f0162f4cc572c9273f3e26b2b4d8c082', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'booostrap', '1', NULL, 1, 1, 'admin', '2021-08-22 16:32:04', 'admin', '2019-03-22 16:33:57');
INSERT INTO `sys_dict_item` VALUES ('f16c5706f3ae05c57a53850c64ce7c45', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送成功', '1', NULL, 2, 1, 'admin', '2019-04-12 18:19:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f2a7920421f3335afdf6ad2b342f6b5d', '845da5006c97754728bf48b6a10f79cc', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 21:46:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f37f90c496ec9841c4c326b065e00bb2', '83bfb33147013cc81640d5fd9eda030c', '登录日志', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:22:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f753aff60ff3931c0ecb4812d8b5e643', '4c03fca6bf1f0299c381213961566349', '双排布局', 'double', NULL, 3, 1, 'admin', '2019-04-12 17:43:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f80a8f6838215753b05e1a5ba3346d22', '880a895c98afeca9d9ac39f29e67c13e', '删除', '4', '', 4, 1, 'admin', '2019-07-22 10:55:14', 'admin', '2019-07-22 10:55:30');
INSERT INTO `sys_dict_item` VALUES ('fcec03570f68a175e1964808dc3f1c91', '4c03fca6bf1f0299c381213961566349', 'Tab风格', 'tab', NULL, 1, 1, 'admin', '2019-04-12 17:43:31', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('fe50b23ae5e68434def76f67cef35d2d', '78bda155fe380b1b3f175f1e88c284c6', '已作废', '4', '已作废', 4, 1, 'admin', '2021-09-09 16:33:43', 'admin', '2019-05-09 16:34:40');

-- ----------------------------
-- Table structure for sys_fill_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_fill_rule`;
CREATE TABLE `sys_fill_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则Code',
  `rule_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则实现类',
  `rule_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则参数',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_sys_fill_rule_code`(`rule_code`) USING BTREE,
  UNIQUE INDEX `uk_sfr_rule_code`(`rule_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_fill_rule
-- ----------------------------
INSERT INTO `sys_fill_rule` VALUES ('1202551334738382850', '机构编码生成', 'org_num_role', 'org.jeecg.modules.system.rule.OrgCodeRule', '{\"parentId\":\"c6d7cb4deeac411cb3384b1b31278596\"}', 'admin', '2019-12-09 10:37:06', 'admin', '2019-12-05 19:32:35');
INSERT INTO `sys_fill_rule` VALUES ('1202787623203065858', '分类字典编码生成', 'category_code_rule', 'org.jeecg.modules.system.rule.CategoryCodeRule', '{\"pid\":\"\"}', 'admin', '2019-12-09 10:36:54', 'admin', '2019-12-06 11:11:31');
INSERT INTO `sys_fill_rule` VALUES ('1260134137920090113', '订单流水号', 'shop_order_num', 'org.jeecg.modules.online.cgform.rule.OrderNumberRule', '{}', 'admin', '2020-12-07 18:29:50', 'admin', '2020-05-12 17:06:05');

-- ----------------------------
-- Table structure for sys_gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_route`;
CREATE TABLE `sys_gateway_route`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `router_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `uri` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务地址',
  `predicates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '断言',
  `filters` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '过滤器',
  `retryable` int NULL DEFAULT NULL COMMENT '是否重试:0-否 1-是',
  `strip_prefix` int NULL DEFAULT NULL COMMENT '是否忽略前缀0-否 1-是',
  `persistable` int NULL DEFAULT NULL COMMENT '是否为保留数据:0-否 1-是',
  `show_api` int NULL DEFAULT NULL COMMENT '是否在接口文档中展示:0-否 1-是',
  `status` int NULL DEFAULT NULL COMMENT '状态:0-无效 1-有效',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_gateway_route
-- ----------------------------
INSERT INTO `sys_gateway_route` VALUES ('1331051599401857026', 'jeecg-demo-websocket', 'jeecg-demo-websocket', 'lb:ws://jeecg-demo', '[{\"args\":[\"/vxeSocket/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-24 09:46:46', NULL, NULL, NULL);
INSERT INTO `sys_gateway_route` VALUES ('jeecg-cloud-websocket', 'jeecg-system-websocket', 'jeecg-system-websocket', 'lb:ws://jeecg-system', '[{\"args\":[\"/websocket/**\",\"/eoaSocket/**\",\"/newsWebsocket/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-16 19:41:51', NULL, NULL, NULL);
INSERT INTO `sys_gateway_route` VALUES ('jeecg-demo', 'jeecg-demo', 'jeecg-demo', 'lb://jeecg-demo', '[{\"args\":[\"/mock/**\",\"/test/**\",\"/bigscreen/template1/**\",\"/bigscreen/template2/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-16 19:41:51', NULL, NULL, NULL);
INSERT INTO `sys_gateway_route` VALUES ('jeecg-system', 'jeecg-system', 'jeecg-system', 'lb://jeecg-system', '[{\"args\":[\"/sys/**\",\"/eoa/**\",\"/joa/**\",\"/online/**\",\"/bigscreen/**\",\"/jmreport/**\",\"/desform/**\",\"/process/**\",\"/act/**\",\"/plug-in/***/\",\"/druid/**\",\"/generic/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-16 19:41:51', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `log_type` int NULL DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `log_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `operate_type` int NULL DEFAULT NULL COMMENT '操作类型',
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `request_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '耗时',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_userid`(`userid`) USING BTREE,
  INDEX `index_logt_ype`(`log_type`) USING BTREE,
  INDEX `index_operate_type`(`operate_type`) USING BTREE,
  INDEX `index_log_type`(`log_type`) USING BTREE,
  INDEX `idx_sl_userid`(`userid`) USING BTREE,
  INDEX `idx_sl_log_type`(`log_type`) USING BTREE,
  INDEX `idx_sl_operate_type`(`operate_type`) USING BTREE,
  INDEX `idx_sl_create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1539940999000784898', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-23 19:58:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540608707031728129', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-25 16:11:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540613394711740418', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-25 16:30:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540613694784827393', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-25 16:31:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540614827842498561', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@46734d6', NULL, 13, NULL, '2022-06-25 16:36:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540614955026378753', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2cca81b0', NULL, 5, NULL, '2022-06-25 16:36:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540615030330912770', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@23e7c93c', NULL, 4, NULL, '2022-06-25 16:37:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540691953664946178', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-25 21:42:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540692017036685314', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-25 21:42:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540692021079994369', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4130cd47', NULL, 15, NULL, '2022-06-25 21:42:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540692036120768514', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@1194b8db', NULL, 5, NULL, '2022-06-25 21:43:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540692296117284866', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@51dee2d2', NULL, 6, NULL, '2022-06-25 21:44:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540693026458857474', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@66f499b4', NULL, 6, NULL, '2022-06-25 21:46:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540695288333746177', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3d0f61eb', NULL, 73, NULL, '2022-06-25 21:55:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540695778878578689', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5ca4aa0d', NULL, 61, NULL, '2022-06-25 21:57:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540697300987322369', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@288bacbf', NULL, 74, NULL, '2022-06-25 22:03:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540698471885983746', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5377217f', NULL, 60, NULL, '2022-06-25 22:08:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540698666975645697', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4573dce9', NULL, 9, NULL, '2022-06-25 22:09:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540699692705271809', 2, 'online列表加载,表名:construction_unit,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 96, NULL, '2022-06-25 22:13:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540699692772380674', 2, 'online表单加载,表名:construction_unit,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 112, NULL, '2022-06-25 22:13:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540699693313445889', 2, 'online列表数据查询,表名:construction_unit,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 56, NULL, '2022-06-25 22:13:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540888650345209858', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 10:44:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540888775343857665', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 10:44:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540891557899657217', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 10:55:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540891741639532545', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 10:56:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540910214394523650', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 12:09:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540910277850148866', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 12:10:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540910411023495170', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@5835894e', NULL, 57, NULL, '2022-06-26 12:10:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540915753883062273', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 12:31:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540915789530451969', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@34934bb0', NULL, 14, NULL, '2022-06-26 12:32:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540917910589956098', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@151bae05', NULL, 74, NULL, '2022-06-26 12:40:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540919426289786881', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@694b22f6', NULL, 8, NULL, '2022-06-26 12:46:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540920124641402881', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6bfa2b1f', NULL, 12, NULL, '2022-06-26 12:49:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540921686767984641', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@780bf5eb', NULL, 5, NULL, '2022-06-26 12:55:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540921741126164482', 2, '施工单位-添加', 2, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1656219346645,\"id\":\"1540921740970975234\",\"name\":\"1\",\"sysOrgCode\":\"A01\"}]', NULL, 10, NULL, '2022-06-26 12:55:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540921741423960065', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@63db1e1a', NULL, 24, NULL, '2022-06-26 12:55:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540921771375484929', 2, '施工单位-通过id删除', 4, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.delete()', NULL, '  id: 1540921740970975234', NULL, 40, NULL, '2022-06-26 12:55:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540921771543257090', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 0  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6d1857f3', NULL, 3, NULL, '2022-06-26 12:55:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540932864546217986', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 13:39:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540932884121034753', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 13:40:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540932914382938113', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@78b70f75', NULL, 81, NULL, '2022-06-26 13:40:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540932929323048961', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@d1ff0d0', NULL, 16, NULL, '2022-06-26 13:40:14', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540933036919529474', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@4212c8db', NULL, 7, NULL, '2022-06-26 13:40:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540933260643704833', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@3d09bcf4', NULL, 7, NULL, '2022-06-26 13:41:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540974772190486530', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 16:26:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540974792776130561', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 16:26:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540974794923614210', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@182372a4', NULL, 9, NULL, '2022-06-26 16:26:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540974835054714882', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@233b7d4e', NULL, 5, NULL, '2022-06-26 16:26:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540974855178985474', 2, '属地供电所-添加', 2, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1656232010000,\"id\":\"1540974854935715842\",\"name\":\"1\",\"sysOrgCode\":\"A01\"}]', NULL, 34, NULL, '2022-06-26 16:26:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540974855376117761', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@627fcba7', NULL, 11, NULL, '2022-06-26 16:26:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540975017880231937', 2, '属地供电所-通过id删除', 4, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.delete()', NULL, '  id: 1540974854935715842', NULL, 33, NULL, '2022-06-26 16:27:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1540975018027032578', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 0  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@53516249', NULL, 4, NULL, '2022-06-26 16:27:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541011860076142593', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 18:53:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541011879537713154', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 18:53:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541011881806831618', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@12220aad', NULL, 11, NULL, '2022-06-26 18:53:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036777106612225', 2, 'online列表加载,表名:test_tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 45, NULL, '2022-06-26 20:32:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036777307938817', 2, 'online表单加载,表名:test_tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 92, NULL, '2022-06-26 20:32:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036777710592001', 2, 'online列表数据查询,表名:test_tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 57, NULL, '2022-06-26 20:32:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036848564969473', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@2f78572a', NULL, 6, NULL, '2022-06-26 20:33:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036854772539393', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@6e55e22f', NULL, 5, NULL, '2022-06-26 20:33:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036872581554177', 2, 'online列表加载,表名:test_tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 19, NULL, '2022-06-26 20:33:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036872648663041', 2, 'online列表数据查询,表名:test_tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 36, NULL, '2022-06-26 20:33:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541036873177145345', 2, 'online列表数据查询,表名:test_tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 36, NULL, '2022-06-26 20:33:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541042872436957186', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 24, NULL, '2022-06-26 20:57:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541042872583757825', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 48, NULL, '2022-06-26 20:57:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541042872768307201', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 25, NULL, '2022-06-26 20:57:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541043487753936897', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@806fff8', NULL, 4, NULL, '2022-06-26 20:59:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541043496226430977', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 15, NULL, '2022-06-26 20:59:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541043496318705666', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 34, NULL, '2022-06-26 20:59:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541043496582946817', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 30, NULL, '2022-06-26 20:59:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541046726952001538', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 15, NULL, '2022-06-26 21:12:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541046727086219266', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 55, NULL, '2022-06-26 21:12:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541046727216242690', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 20, NULL, '2022-06-26 21:12:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048006286020609', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 21:17:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048883092688897', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 34, NULL, '2022-06-26 21:21:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048883294015490', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 87, NULL, '2022-06-26 21:21:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048883629559809', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 41, NULL, '2022-06-26 21:21:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048925530656771', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 17, NULL, '2022-06-26 21:21:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048925530656770', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 17, NULL, '2022-06-26 21:21:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541048925996224514', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 28, NULL, '2022-06-26 21:21:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541049009391570946', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 18, NULL, '2022-06-26 21:21:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541049009517400066', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 60, NULL, '2022-06-26 21:21:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541049009785835521', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 25, NULL, '2022-06-26 21:21:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541049117361344513', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 14, NULL, '2022-06-26 21:21:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541049117495562241', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 54, NULL, '2022-06-26 21:21:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541049117696888833', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 25, NULL, '2022-06-26 21:21:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541050874497896449', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@31883de7', NULL, 253, NULL, '2022-06-26 21:28:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541051219185799169', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@7e0c0f08', NULL, 8, NULL, '2022-06-26 21:30:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541051365101441025', 2, '职务表-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.system.controller.SysPositionController.queryPageList()', NULL, '  sysPosition: SysPosition(id=null, code=null, name=null, postRank=null, companyId=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@60b84c09', NULL, 16, NULL, '2022-06-26 21:30:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541064782600241153', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 28, NULL, '2022-06-26 22:24:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541064782679932929', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 54, NULL, '2022-06-26 22:24:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541064783015477249', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 53, NULL, '2022-06-26 22:24:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065333815672833', 2, 'online列表加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 18, NULL, '2022-06-26 22:26:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065333815672834', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 25, NULL, '2022-06-26 22:26:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065334281240577', 2, 'online列表数据查询,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 30, NULL, '2022-06-26 22:26:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065352941699074', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 15, NULL, '2022-06-26 22:26:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065352941699075', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 23, NULL, '2022-06-26 22:26:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065353273049089', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 24, NULL, '2022-06-26 22:26:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065482419863554', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 18, NULL, '2022-06-26 22:26:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065482419863555', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 29, NULL, '2022-06-26 22:26:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065483011260417', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 42, NULL, '2022-06-26 22:26:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065483011260418', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 41, NULL, '2022-06-26 22:26:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065555551748097', 2, 'online列表加载,表名:territorial_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 19, NULL, '2022-06-26 22:27:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065555551748098', 2, 'online表单加载,表名:territorial_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 21, NULL, '2022-06-26 22:27:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065556013121538', 2, 'online列表数据查询,表名:territorial_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 29, NULL, '2022-06-26 22:27:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065564082962433', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 13, NULL, '2022-06-26 22:27:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065564145876993', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 25, NULL, '2022-06-26 22:27:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065564544335874', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 7, NULL, '2022-06-26 22:27:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065564674359297', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 30, NULL, '2022-06-26 22:27:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065567404851201', 2, 'online列表加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 11, NULL, '2022-06-26 22:27:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065567404851202', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.b()', NULL, '', NULL, 15, NULL, '2022-06-26 22:27:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065567803310081', 2, 'online列表数据查询,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 21, NULL, '2022-06-26 22:27:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065767452180482', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 16, NULL, '2022-06-26 22:28:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065767519289345', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 36, NULL, '2022-06-26 22:28:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065768114880514', 2, 'online表单加载,表名:territorial_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 34, NULL, '2022-06-26 22:28:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065768114880515', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 35, NULL, '2022-06-26 22:28:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541065768181989378', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 42, NULL, '2022-06-26 22:28:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541066216871854081', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 19, NULL, '2022-06-26 22:29:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541066216938962945', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 42, NULL, '2022-06-26 22:29:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541066217605857281', 2, 'online表单加载,表名:territorial_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 31, NULL, '2022-06-26 22:29:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541066217605857282', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 40, NULL, '2022-06-26 22:29:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541066217672966146', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 37, NULL, '2022-06-26 22:29:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069168781127681', 1, '用户名: 管理员,退出成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 22:41:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069231808933889', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 22:41:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069247877312513', 2, '塔杆信息-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.tower.controller.TowerController.queryPageList()', NULL, '  tower: Tower(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, number=null, address=null, ascriptionTown=null, coordinateN=null, coordinateB=null, territorialId=null, constructionUnit=null, overseerUnit=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@582f87b7', NULL, 43, NULL, '2022-06-26 22:41:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069284107710466', 2, 'online表单加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 30, NULL, '2022-06-26 22:42:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069284367757313', 2, 'online列表加载,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.c()', NULL, '', NULL, 99, NULL, '2022-06-26 22:42:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069285097566209', 2, 'online表单加载,表名:construction_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 9, NULL, '2022-06-26 22:42:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069285164675073', 2, 'online表单加载,表名:territorial_message,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.e()', NULL, '', NULL, 8, NULL, '2022-06-26 22:42:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541069285433110529', 2, 'online列表数据查询,表名:tower,操作成功！', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.online.cgform.c.a.a()', NULL, '', NULL, 56, NULL, '2022-06-26 22:42:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541070539211165697', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-26 22:47:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541070548736430082', 2, '塔杆信息-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.tower.controller.TowerController.queryPageList()', NULL, '  tower: Tower(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, number=null, address=null, ascriptionTown=null, coordinateN=null, coordinateB=null, territorialId=null, constructionUnit=null, overseerUnit=null)  pageNo: 1  pageSize: 5  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@74e755f7', NULL, 15, NULL, '2022-06-26 22:47:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541070898893705217', 2, '属地供电所-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.territorial.controller.TerritorialStationController.queryPageList()', NULL, '  territorialStation: TerritorialStation(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@323a7c7c', NULL, 11, NULL, '2022-06-26 22:48:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1541070902974763010', 2, '施工单位-分页列表查询', 1, 'admin', '管理员', '0:0:0:0:0:0:0:1', 'org.jeecg.modules.sanshi.uhv.constructionUnit.controller.ConstructionUnitController.queryPageList()', NULL, '  constructionUnit: ConstructionUnit(id=null, createBy=null, createTime=null, updateBy=null, updateTime=null, sysOrgCode=null, name=null, detail=null)  pageNo: 1  pageSize: 10  req: org.apache.shiro.web.servlet.ShiroHttpServletRequest@37a159de', NULL, 8, NULL, '2022-06-26 22:48:30', NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `component_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名字',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级菜单跳转地址',
  `menu_type` int NULL DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `perms_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '权限策略1显示2禁用',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '菜单排序',
  `always_show` tinyint(1) NULL DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `is_route` tinyint(1) NULL DEFAULT 1 COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `is_leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存该页面:    1:是   0:不是',
  `hidden` int NULL DEFAULT 0 COMMENT '是否隐藏路由: 0否,1是',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除状态 0正常 1已删除',
  `rule_flag` int NULL DEFAULT 0 COMMENT '是否添加数据权限1是0否',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮权限状态(0无效1有效)',
  `internal_or_external` tinyint(1) NULL DEFAULT NULL COMMENT '外链菜单打开方式 0/内部打开 1/外部打开',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_prem_pid`(`parent_id`) USING BTREE,
  INDEX `index_prem_is_route`(`is_route`) USING BTREE,
  INDEX `index_prem_is_leaf`(`is_leaf`) USING BTREE,
  INDEX `index_prem_sort_no`(`sort_no`) USING BTREE,
  INDEX `index_prem_del_flag`(`del_flag`) USING BTREE,
  INDEX `index_menu_type`(`menu_type`) USING BTREE,
  INDEX `index_menu_hidden`(`hidden`) USING BTREE,
  INDEX `index_menu_status`(`status`) USING BTREE,
  INDEX `idx_sp_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_sp_is_route`(`is_route`) USING BTREE,
  INDEX `idx_sp_is_leaf`(`is_leaf`) USING BTREE,
  INDEX `idx_sp_sort_no`(`sort_no`) USING BTREE,
  INDEX `idx_sp_del_flag`(`del_flag`) USING BTREE,
  INDEX `idx_sp_menu_type`(`menu_type`) USING BTREE,
  INDEX `idx_sp_hidden`(`hidden`) USING BTREE,
  INDEX `idx_sp_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('00a2a0ae65cdca5e93209cdbde97cbe6', '2e42e3835c2b44ec9f7bc26c146ee531', '成功', '/result/success', 'result/Success', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('020b06793e4de2eee0007f603000c769', 'f0675b52d89100ee88472b6800754a08', 'ViserChartDemo', '/report/ViserChartDemo', 'jeecg/report/ViserChartDemo', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-03 19:08:53', 'admin', '2019-04-03 19:08:53', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('024f1fd1283dc632458976463d8984e1', '700b7f95165c46cc7a78bf227aa8fed3', 'Tomcat信息', '/monitor/TomcatInfo', 'modules/monitor/TomcatInfo', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 09:44:29', 'admin', '2019-05-07 15:19:10', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('08e6b9dc3c04489c8e1ff2ce6f105aa4', '', '系统监控', '/dashboard3', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 6.00, 0, 'dashboard', 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-03-31 22:19:58', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('0ac2ad938963b6c6d1af25477d5b8b51', '8d4683aacaa997ab86b966b464360338', '代码生成按钮', NULL, NULL, NULL, NULL, 2, 'online:goGenerateCode', '1', 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-06-11 14:20:09', NULL, NULL, 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('109c78a583d4693ce2f16551b7786786', 'e41b69c57a941a3bbcce45032fe57605', 'Online报表配置', '/online/cgreport', 'modules/online/cgreport/OnlCgreportHeadList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-08 10:51:07', 'admin', '2019-03-30 19:04:28', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1166535831146504193', '2a470fc0c3954d9dbb61de6d80846549', '对象存储', '/oss/file', 'modules/oss/OSSFileList', NULL, NULL, 1, NULL, '1', 1.00, 0, '', 1, 1, 0, 0, NULL, 'admin', '2019-08-28 02:19:50', 'admin', '2019-08-28 02:20:57', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('1174506953255182338', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '职务管理', '/isystem/position', 'system/SysPositionList', NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-19 10:14:13', 'admin', '2019-09-19 10:15:22', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1174590283938041857', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '通讯录', '/isystem/addressList', 'system/AddressList', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-19 15:45:21', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1192318987661234177', 'e41b69c57a941a3bbcce45032fe57605', '系统编码规则', '/isystem/fillRule', 'system/SysFillRuleList', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-11-07 13:52:53', 'admin', '2020-07-10 16:55:03', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1205097455226462210', '', '报表设计', '/big/screen', 'layouts/RouteView', NULL, NULL, 0, NULL, '1', 1.10, 0, 'area-chart', 1, 0, 0, 0, NULL, 'admin', '2019-12-12 20:09:58', 'admin', '2021-01-22 17:18:48', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1209731624921534465', 'e41b69c57a941a3bbcce45032fe57605', '多数据源管理', '/isystem/dataSource', 'system/SysDataSourceList', NULL, NULL, 1, NULL, '1', 6.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-12-25 15:04:30', 'admin', '2020-02-23 22:43:37', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1224641973866467330', 'e41b69c57a941a3bbcce45032fe57605', '系统校验规则', '/isystem/checkRule', 'system/SysCheckRuleList', NULL, NULL, 1, NULL, '1', 5.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-11-07 13:52:53', 'admin', '2020-07-10 16:55:12', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1229674163694841857', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线表单ERP', '/online/cgformErpList/:code', 'modules/online/cgform/auto/erp/OnlCgformErpList', NULL, NULL, 1, NULL, '1', 5.00, 0, NULL, 1, 1, 0, 1, NULL, 'admin', '2020-02-18 15:49:00', 'admin', '2020-02-18 15:52:25', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1235823781053313025', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线内嵌子表', '/online/cgformInnerTableList/:code', 'modules/online/cgform/auto/innerTable/OnlCgformInnerTableList', NULL, NULL, 1, NULL, '1', 999.00, 0, NULL, 1, 1, 0, 1, NULL, 'admin', '2020-03-06 15:05:24', 'admin', '2020-03-06 15:07:42', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1260928341675982849', '3f915b2769fc80648e92d04e84ca059d', '添加按钮', NULL, NULL, NULL, NULL, 2, 'user:add', '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-05-14 21:41:58', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1260929666434318338', '3f915b2769fc80648e92d04e84ca059d', '用户编辑', NULL, NULL, NULL, NULL, 2, 'user:edit', '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-05-14 21:47:14', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1260931366557696001', '3f915b2769fc80648e92d04e84ca059d', '表单性别可见', '', NULL, NULL, NULL, 2, 'user:sex', '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-05-14 21:53:59', 'admin', '2020-05-14 21:57:00', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1260933542969458689', '3f915b2769fc80648e92d04e84ca059d', '禁用生日字段', NULL, NULL, NULL, NULL, 2, 'user:form:birthday', '2', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-05-14 22:02:38', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1265162119913824258', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '路由网关', '/isystem/gatewayroute', 'system/SysGatewayRouteList', NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 1, 0, 1, NULL, NULL, '2020-05-26 14:05:30', 'admin', '2021-09-23 12:35:43', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1280350452934307841', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '租户管理', '/isys/tenant', 'system/TenantList', NULL, NULL, 1, NULL, '1', 10.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-07-07 11:58:30', 'admin', '2020-07-10 15:46:35', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1280464606292099074', '2a470fc0c3954d9dbb61de6d80846549', '图片裁剪', '/jeecg/ImagCropper', 'jeecg/ImagCropper', NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-07-07 19:32:06', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1304032910990495745', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线表单TAB', '/online/cgformTabList/:code', 'modules/online/cgform/auto/tab/OnlCgformTabList', NULL, NULL, 1, NULL, '1', 8.00, 0, NULL, 1, 1, 0, 1, NULL, 'admin', '2020-09-10 20:24:08', 'admin', '2020-09-10 20:36:37', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('13212d3416eb690c2e1d5033166ff47a', '2e42e3835c2b44ec9f7bc26c146ee531', '失败', '/result/fail', 'result/Error', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1335960713267093506', '1205097455226462210', '积木报表设计', '{{ window._CONFIG[\'domianURL\'] }}/jmreport/list?token=${token}', 'layouts/IframePageView', NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-12-07 22:53:50', 'admin', '2020-12-08 09:28:06', 0, 0, '1', 1);
INSERT INTO `sys_permission` VALUES ('1367a93f2c410b169faa7abcbad2f77c', '6e73eb3c26099c191bf03852ee1310a1', '基本设置', '/account/settings/BaseSetting', 'account/settings/BaseSetting', 'account-settings-base', NULL, 1, 'BaseSettings', NULL, NULL, 0, NULL, 1, 1, NULL, 1, NULL, NULL, '2018-12-26 18:58:35', 'admin', '2019-03-20 12:57:31', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1387612436586065922', '2a470fc0c3954d9dbb61de6d80846549', '第三方APP消息测试', '/jeecg/ThirdAppMessageTest', 'jeecg/ThirdAppMessageTest', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2021-04-29 11:39:20', 'admin', '2021-04-29 11:39:27', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1404684556047024130', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '在线用户', '/isystem/online', 'system/SysUserOnlineList', NULL, NULL, 1, NULL, '1', NULL, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2021-06-15 14:17:51', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1540614747211198466', NULL, '施工单位', '/construction/constructionUnit/vue', 'construction/constructionUnit/vue/ConstructionUnitList', NULL, NULL, 0, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2022-06-25 16:35:54', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1540915449657667585', NULL, '属地供电所', '/territorial/vue', 'territorial/vue/TerritorialStationList', NULL, NULL, 0, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2022-06-26 12:30:47', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1541047683161038850', NULL, '塔杆信息', '/tower/vue', 'tower/vue/TowerList', NULL, NULL, 0, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2022-06-26 21:16:14', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('190c2b43bec6a5f7a4194a85db67d96a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/isystem/roleUserList', 'system/RoleUserList', NULL, NULL, 1, NULL, NULL, 1.20, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-17 15:13:56', 'admin', '2019-12-25 09:36:31', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('1a0811914300741f4e11838ff37a1d3a', '3f915b2769fc80648e92d04e84ca059d', '手机号禁用', NULL, NULL, NULL, NULL, 2, 'user:form:phone', '2', 1.00, 0, NULL, 0, 1, NULL, 0, NULL, 'admin', '2019-05-11 17:19:30', 'admin', '2019-05-11 18:00:22', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('22d6a3d39a59dd7ea9a30acfa6bfb0a5', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO动态表单', '/online/df/:table/:id', 'modules/online/cgform/auto/OnlineDynamicForm', NULL, NULL, 1, NULL, NULL, 9.00, 0, NULL, 0, 1, NULL, 1, NULL, 'admin', '2019-04-22 15:15:43', 'admin', '2019-04-30 18:18:26', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('265de841c58907954b8877fb85212622', '2a470fc0c3954d9dbb61de6d80846549', '图片拖拽排序', '/jeecg/imgDragSort', 'jeecg/ImgDragSort', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 10:43:08', 'admin', '2019-04-25 10:46:26', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('277bfabef7d76e89b33062b16a9a5020', 'e3c13679c73a4f829bcff2aba8fd68b1', '基础表单', '/form/base-form', 'examples/form/BasicForm', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-26 17:02:08', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('2a470fc0c3954d9dbb61de6d80846549', '', '常见案例', '/jeecg', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 7.00, 0, 'qrcode', 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-04-02 11:46:42', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('2dbbafa22cda07fa5d169d741b81fe12', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '在线文档', '{{ window._CONFIG[\'domianURL\'] }}/doc.html', 'layouts/IframePageView', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-01-30 10:00:01', 'admin', '2020-09-09 14:48:58', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('2e42e3835c2b44ec9f7bc26c146ee531', '2a470fc0c3954d9dbb61de6d80846549', '结果页', '/result', 'layouts/PageView', NULL, NULL, 1, NULL, NULL, 10.00, 0, 'check-circle-o', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2021-09-23 12:44:18', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户管理', '/isystem/user', 'system/UserList', NULL, NULL, 1, NULL, NULL, 1.10, 0, NULL, 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-12-25 09:36:24', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('3fac0d3c9cd40fa53ab70d4c583821f8', '2a470fc0c3954d9dbb61de6d80846549', '分屏', '/jeecg/splitPanel', 'jeecg/SplitPanel', NULL, NULL, 1, NULL, NULL, 6.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 16:27:06', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('45c966826eeff4c99b8f8ebfe74511fc', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '部门管理', '/isystem/depart', 'system/DepartList', NULL, NULL, 1, NULL, NULL, 1.40, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-01-29 18:47:40', 'admin', '2019-12-25 09:36:47', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('4875ebe289344e14844d8e3ea1edd73f', '2a470fc0c3954d9dbb61de6d80846549', '详情页', '/profile', 'layouts/RouteView', NULL, NULL, 1, NULL, NULL, 11.00, 0, 'profile', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2021-09-23 12:46:25', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('4f66409ef3bbd69c1d80469d6e2a885e', '6e73eb3c26099c191bf03852ee1310a1', '账户绑定', '/account/settings/binding', 'account/settings/Binding', NULL, NULL, 1, 'BindingSettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 19:01:20', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('53a9230444d33de28aa11cc108fb1dba', '5c8042bd6c601270b2bbd9b20bccc68b', '我的消息', '/isps/userAnnouncement', 'system/UserAnnouncementList', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-19 10:16:00', 'admin', '2019-12-25 09:54:34', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('54097c6a3cf50fad0793a34beff1efdf', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线表单', '/online/cgformList/:code', 'modules/online/cgform/auto/OnlCgformAutoList', NULL, NULL, 1, NULL, NULL, 9.00, 0, NULL, 1, 1, NULL, 1, NULL, 'admin', '2019-03-19 16:03:06', 'admin', '2019-04-30 18:19:03', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('540a2936940846cb98114ffb0d145cb8', '2a470fc0c3954d9dbb61de6d80846549', '列表页', '/list', 'layouts/PageView', NULL, '/list/query-list', 1, NULL, NULL, 13.00, 0, 'table', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2021-09-23 12:46:42', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('54dd5457a3190740005c1bfec55b1c34', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/isystem/permission', 'system/PermissionList', NULL, NULL, 1, NULL, NULL, 1.30, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-12-25 09:36:39', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('58857ff846e61794c69208e9d3a85466', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '日志管理', '/isystem/log', 'system/LogList', NULL, NULL, 1, NULL, NULL, 2.00, 0, '', 1, 1, 0, 0, NULL, NULL, '2018-12-26 10:11:18', 'admin', '2020-09-09 14:48:25', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('58b9204feaf07e47284ddb36cd2d8468', '2a470fc0c3954d9dbb61de6d80846549', '图片翻页', '/jeecg/imgTurnPage', 'jeecg/ImgTurnPage', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 11:36:42', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('5c2f42277948043026b7a14692456828', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '我的部门', '/isystem/departUserList', 'system/DepartUserList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-17 15:12:24', 'admin', '2019-12-25 09:35:26', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('5c8042bd6c601270b2bbd9b20bccc68b', '', '消息中心', '/message', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 6.10, 0, 'message', 1, 0, 0, 0, NULL, 'admin', '2019-04-09 11:05:04', 'admin', '2021-09-23 12:37:47', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('6531cf3421b1265aeeeabaab5e176e6d', 'e3c13679c73a4f829bcff2aba8fd68b1', '分步表单', '/form/step-form', 'examples/form/stepForm/StepForm', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('655563cd64b75dcf52ef7bcdd4836953', '2a470fc0c3954d9dbb61de6d80846549', '图片预览', '/jeecg/ImagPreview', 'jeecg/ImagPreview', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-17 11:18:45', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('65a8f489f25a345836b7f44b1181197a', 'c65321e57b7949b7a975313220de0422', '403', '/exception/403', 'exception/403', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('6e73eb3c26099c191bf03852ee1310a1', '717f6bee46f44a3897eca9abd6e2ec44', '个人设置', '/account/settings/BaseSetting', 'account/settings/Index', NULL, NULL, 1, NULL, NULL, 2.00, 1, NULL, 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-04-19 09:41:05', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('700b7f95165c46cc7a78bf227aa8fed3', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '性能监控', '/monitor', 'layouts/RouteView', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2019-04-02 11:34:34', 'admin', '2020-09-09 14:48:51', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('717f6bee46f44a3897eca9abd6e2ec44', '', '个人页', '/account', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 9.00, 0, 'user', 1, 0, 0, 1, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-02-23 22:41:37', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('7960961b0063228937da5fa8dd73d371', '2a470fc0c3954d9dbb61de6d80846549', 'JEditableTable示例', '/jeecg/JEditableTable', 'jeecg/JeecgEditableTableExample', NULL, NULL, 1, NULL, NULL, 2.10, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-03-22 15:22:18', 'admin', '2019-12-25 09:48:16', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('7ac9eb9ccbde2f7a033cd4944272bf1e', '540a2936940846cb98114ffb0d145cb8', '卡片列表', '/list/card', 'examples/list/CardList', NULL, NULL, 1, NULL, NULL, 7.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('841057b8a1bef8f6b4b20f9a618a7fa6', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '数据日志', '/sys/dataLog-list', 'system/DataLogList', NULL, NULL, 1, NULL, NULL, 2.10, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-03-11 19:26:49', 'admin', '2020-09-09 14:48:32', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('882a73768cfd7f78f3a37584f7299656', '6e73eb3c26099c191bf03852ee1310a1', '个性化设置', '/account/settings/custom', 'account/settings/Custom', NULL, NULL, 1, 'CustomSettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 19:00:46', NULL, '2018-12-26 21:13:25', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8b3bff2eee6f1939147f5c68292a1642', '700b7f95165c46cc7a78bf227aa8fed3', '服务器信息', '/monitor/SystemInfo', 'modules/monitor/SystemInfo', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 11:39:19', 'admin', '2019-04-02 15:40:02', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8d1ebd663688965f1fd86a2f0ead3416', '700b7f95165c46cc7a78bf227aa8fed3', 'Redis监控', '/monitor/redis/info', 'modules/monitor/RedisInfo', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 13:11:33', 'admin', '2019-05-07 15:18:54', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8d4683aacaa997ab86b966b464360338', 'e41b69c57a941a3bbcce45032fe57605', 'Online表单开发', '/online/cgform', 'modules/online/cgform/OnlCgformHeadList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 0, NULL, 0, NULL, 'admin', '2019-03-12 15:48:14', 'admin', '2019-06-11 14:19:17', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8fb8172747a78756c11916216b8b8066', '717f6bee46f44a3897eca9abd6e2ec44', '工作台', '/dashboard/workplace', 'dashboard/Workplace', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-04-02 11:45:02', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('944abf0a8fc22fe1f1154a389a574154', '5c8042bd6c601270b2bbd9b20bccc68b', '消息管理', '/modules/message/sysMessageList', 'modules/message/SysMessageList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-09 11:27:53', 'admin', '2019-04-09 19:31:23', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9502685863ab87f0ad1134142788a385', '', '首页', '/dashboard/analysis', 'dashboard/Analysis', NULL, NULL, 0, NULL, NULL, 0.00, 0, 'home', 1, 1, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-03-29 11:04:13', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('97c8629abc7848eccdb6d77c24bb3ebb', '700b7f95165c46cc7a78bf227aa8fed3', '磁盘监控', '/monitor/Disk', 'modules/monitor/DiskMonitoring', NULL, NULL, 1, NULL, NULL, 6.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 14:30:06', 'admin', '2019-05-05 14:37:14', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9a90363f216a6a08f32eecb3f0bf12a3', '2a470fc0c3954d9dbb61de6d80846549', '自定义组件', '/jeecg/SelectDemo', 'jeecg/SelectDemo', NULL, NULL, 1, NULL, NULL, 0.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-03-19 11:19:05', 'admin', '2019-12-25 09:47:04', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('9cb91b8851db0cf7b19d7ecc2a8193dd', '1939e035e803a99ceecb6f5563570fb2', '我的任务表单', '/modules/bpm/task/form/FormModule', 'modules/bpm/task/form/FormModule', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-08 16:49:05', 'admin', '2019-03-08 18:37:56', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9fe26464838de2ea5e90f2367e35efa0', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线报表', '/online/cgreport/:code', 'modules/online/cgreport/auto/OnlCgreportAutoList', 'onlineAutoList', NULL, 1, NULL, NULL, 9.00, 0, NULL, 1, 1, NULL, 1, NULL, 'admin', '2019-03-12 11:06:48', 'admin', '2019-04-30 18:19:10', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('aedbf679b5773c1f25e9f7b10111da73', '08e6b9dc3c04489c8e1ff2ce6f105aa4', 'SQL监控', '{{ window._CONFIG[\'domianURL\'] }}/druid/', 'layouts/IframePageView', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-01-30 09:43:22', 'admin', '2020-09-09 14:48:38', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('b1cb0a3fedf7ed0e4653cb5a229837ee', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '定时任务', '/isystem/QuartzJobList', 'system/QuartzJobList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2019-01-03 09:38:52', 'admin', '2020-09-09 14:48:16', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('b3c824fc22bd953e2eb16ae6914ac8f9', '4875ebe289344e14844d8e3ea1edd73f', '高级详情页', '/profile/advanced', 'examples/profile/advanced/Advanced', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b4dfc7d5dd9e8d5b6dd6d4579b1aa559', 'c65321e57b7949b7a975313220de0422', '500', '/exception/500', 'exception/500', NULL, NULL, 1, NULL, NULL, 3.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b6bcee2ccc854052d3cc3e9c96d90197', '71102b3b87fb07e5527bbd2c530dd90a', '加班申请', '/modules/extbpm/joa/JoaOvertimeList', 'modules/extbpm/joa/JoaOvertimeList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-03 15:33:10', 'admin', '2019-04-03 15:34:48', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('c65321e57b7949b7a975313220de0422', '2a470fc0c3954d9dbb61de6d80846549', '异常页', '/exception', 'layouts/RouteView', NULL, NULL, 1, NULL, NULL, 12.00, 0, 'warning', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2021-09-23 12:46:33', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('c6cf95444d80435eb37b2f9db3971ae6', '2a470fc0c3954d9dbb61de6d80846549', '数据回执模拟', '/jeecg/InterfaceTest', 'jeecg/InterfaceTest', NULL, NULL, 1, NULL, NULL, 6.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-19 16:02:23', 'admin', '2019-02-21 16:25:45', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('cc50656cf9ca528e6f2150eba4714ad2', '4875ebe289344e14844d8e3ea1edd73f', '基础详情页', '/profile/basic', 'examples/profile/basic/Index', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d07a2c87a451434c99ab06296727ec4f', '700b7f95165c46cc7a78bf227aa8fed3', 'JVM信息', '/monitor/JvmInfo', 'modules/monitor/JvmInfo', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-01 23:07:48', 'admin', '2019-04-02 11:37:16', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d2bbf9ebca5a8fa2e227af97d2da7548', 'c65321e57b7949b7a975313220de0422', '404', '/exception/404', 'exception/404', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d7d6e2e4e2934f2c9385a623fd98c6f3', '', '系统管理', '/isystem', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 4.00, 0, 'setting', 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-03-31 22:19:52', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d86f58e7ab516d3bc6bfb1fe10585f97', '717f6bee46f44a3897eca9abd6e2ec44', '个人中心', '/account/center', 'account/center/Index', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e08cb190ef230d5d4f03824198773950', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '系统通告', '/isystem/annountCement', 'system/SysAnnouncementList', NULL, NULL, 1, 'annountCement', NULL, 6.00, NULL, '', 1, 1, NULL, NULL, NULL, NULL, '2019-01-02 17:23:01', NULL, '2019-01-02 17:31:23', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e1979bb53e9ea51cecc74d86fd9d2f64', '2a470fc0c3954d9dbb61de6d80846549', 'PDF预览', '/jeecg/jeecgPdfView', 'jeecg/JeecgPdfView', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 10:39:35', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e3c13679c73a4f829bcff2aba8fd68b1', '2a470fc0c3954d9dbb61de6d80846549', '表单页', '/form', 'layouts/PageView', NULL, NULL, 1, NULL, NULL, 14.00, 0, 'form', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2021-09-23 12:47:33', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('e41b69c57a941a3bbcce45032fe57605', '', '在线开发', '/online', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 2.00, 0, 'cloud', 1, 0, 0, 0, NULL, 'admin', '2019-03-08 10:43:10', 'admin', '2021-01-24 14:15:12', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('e5973686ed495c379d829ea8b2881fc6', 'e3c13679c73a4f829bcff2aba8fd68b1', '高级表单', '/form/advanced-form', 'examples/form/advancedForm/AdvancedForm', NULL, NULL, 1, NULL, NULL, 3.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e6bfd1fcabfd7942fdd05f076d1dad38', '2a470fc0c3954d9dbb61de6d80846549', '打印测试', '/jeecg/PrintDemo', 'jeecg/PrintDemo', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-19 15:58:48', 'admin', '2019-05-07 20:14:39', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('ebb9d82ea16ad864071158e0c449d186', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '分类字典', '/isys/category', 'system/SysCategoryList', NULL, NULL, 1, NULL, '1', 5.20, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-05-29 18:48:07', 'admin', '2020-02-23 22:45:33', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('ec8d607d0156e198b11853760319c646', '6e73eb3c26099c191bf03852ee1310a1', '安全设置', '/account/settings/security', 'account/settings/Security', NULL, NULL, 1, 'SecuritySettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 18:59:52', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('f0675b52d89100ee88472b6800754a08', '', '统计报表', '/report', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 1.00, 0, 'bar-chart', 1, 0, NULL, 0, NULL, 'admin', '2019-04-03 18:32:02', 'admin', '2019-05-19 18:34:13', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('f1cb187abf927c88b89470d08615f5ac', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '数据字典', '/isystem/dict', 'system/DictList', NULL, NULL, 1, NULL, NULL, 5.00, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2018-12-28 13:54:43', 'admin', '2020-02-23 22:45:25', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('f23d9bfff4d9aa6b68569ba2cff38415', '540a2936940846cb98114ffb0d145cb8', '标准列表', '/list/basic-list', 'examples/list/StandardList', NULL, NULL, 1, NULL, NULL, 6.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('f2849d3814fc97993bfc519ae6bbf049', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO复制表单', '/online/copyform/:code', 'modules/online/cgform/OnlCgformCopyList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 1, NULL, 'admin', '2019-08-29 16:05:37', NULL, NULL, 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('f780d0d3083d849ccbdb1b1baee4911d', '5c8042bd6c601270b2bbd9b20bccc68b', '模板管理', '/modules/message/sysMessageTemplateList', 'modules/message/SysMessageTemplateList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-09 11:50:31', 'admin', '2019-04-12 10:16:34', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('fba41089766888023411a978d13c0aa4', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO树表单列表', '/online/cgformTreeList/:code', 'modules/online/cgform/auto/OnlCgformTreeList', NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 1, NULL, 1, NULL, 'admin', '2019-05-21 14:46:50', 'admin', '2019-06-11 13:52:52', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('fc810a2267dd183e4ef7c71cc60f4670', '700b7f95165c46cc7a78bf227aa8fed3', '请求追踪', '/monitor/HttpTrace', 'modules/monitor/HttpTrace', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 09:46:19', 'admin', '2019-04-02 11:37:27', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('fedfbf4420536cacc0218557d263dfea', '6e73eb3c26099c191bf03852ee1310a1', '新消息通知', '/account/settings/notification', 'account/settings/Notification', NULL, NULL, 1, 'NotificationSettings', NULL, NULL, NULL, '', 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 19:02:05', NULL, NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_data_rule`;
CREATE TABLE `sys_permission_data_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_column` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `rule_conditions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件',
  `rule_value` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则值',
  `status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限有效状态1有0否',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_fucntionid`(`permission_id`) USING BTREE,
  INDEX `idx_spdr_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission_data_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务名称',
  `post_rank` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职级',
  `company_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES ('1256485574212153345', '总经理', 'laozong', '5', NULL, 'admin', '2020-05-02 15:28:00', 'admin', '2020-05-02 15:28:03', '北京国炬公司');

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int NULL DEFAULT NULL COMMENT '删除状态',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` int NULL DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO `sys_quartz_job` VALUES ('5b3d2c087ad41aa755fc4f89697b01e7', 'admin', '2019-04-11 19:04:21', 0, 'admin', '2020-05-02 15:48:48', 'org.jeecg.modules.message.job.SendMsgJob', '0/50 * * * * ? *', NULL, NULL, -1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_sys_role_role_code`(`role_code`) USING BTREE,
  INDEX `idx_sr_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1169504891467464705', '第三方登录角色', 'third_role', '第三方登录角色', 'admin', '2019-09-05 14:57:49', 'admin', '2020-05-02 18:20:58');
INSERT INTO `sys_role` VALUES ('f6817f48af4fb3af11b9e8bf182f618b', '管理员', 'admin', '管理员', NULL, '2018-12-21 18:03:39', 'admin', '2019-05-20 11:40:26');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限ids',
  `operate_date` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE,
  INDEX `idx_srp_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `idx_srp_role_id`(`role_id`) USING BTREE,
  INDEX `idx_srp_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1440901140174934017', 'f6817f48af4fb3af11b9e8bf182f618b', '1404684556047024130', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140174934018', 'f6817f48af4fb3af11b9e8bf182f618b', '1367a93f2c410b169faa7abcbad2f77c', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140174934019', 'f6817f48af4fb3af11b9e8bf182f618b', '4f66409ef3bbd69c1d80469d6e2a885e', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322626', 'f6817f48af4fb3af11b9e8bf182f618b', '882a73768cfd7f78f3a37584f7299656', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322627', 'f6817f48af4fb3af11b9e8bf182f618b', 'ec8d607d0156e198b11853760319c646', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322628', 'f6817f48af4fb3af11b9e8bf182f618b', 'fedfbf4420536cacc0218557d263dfea', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322629', 'f6817f48af4fb3af11b9e8bf182f618b', '1265162119913824258', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322630', 'f6817f48af4fb3af11b9e8bf182f618b', '1335960713267093506', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322631', 'f6817f48af4fb3af11b9e8bf182f618b', '9502685863ab87f0ad1134142788a385', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322632', 'f6817f48af4fb3af11b9e8bf182f618b', '9a90363f216a6a08f32eecb3f0bf12a3', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322633', 'f6817f48af4fb3af11b9e8bf182f618b', '1166535831146504193', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322634', 'f6817f48af4fb3af11b9e8bf182f618b', '1260928341675982849', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322635', 'f6817f48af4fb3af11b9e8bf182f618b', '1260929666434318338', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140183322636', 'f6817f48af4fb3af11b9e8bf182f618b', '1260931366557696001', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711234', 'f6817f48af4fb3af11b9e8bf182f618b', '1260933542969458689', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711235', 'f6817f48af4fb3af11b9e8bf182f618b', '00a2a0ae65cdca5e93209cdbde97cbe6', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711236', 'f6817f48af4fb3af11b9e8bf182f618b', '0ac2ad938963b6c6d1af25477d5b8b51', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711237', 'f6817f48af4fb3af11b9e8bf182f618b', '1a0811914300741f4e11838ff37a1d3a', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711238', 'f6817f48af4fb3af11b9e8bf182f618b', '277bfabef7d76e89b33062b16a9a5020', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711239', 'f6817f48af4fb3af11b9e8bf182f618b', '655563cd64b75dcf52ef7bcdd4836953', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711240', 'f6817f48af4fb3af11b9e8bf182f618b', '65a8f489f25a345836b7f44b1181197a', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711241', 'f6817f48af4fb3af11b9e8bf182f618b', '8d1ebd663688965f1fd86a2f0ead3416', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140191711242', 'f6817f48af4fb3af11b9e8bf182f618b', '8d4683aacaa997ab86b966b464360338', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099842', 'f6817f48af4fb3af11b9e8bf182f618b', '944abf0a8fc22fe1f1154a389a574154', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099843', 'f6817f48af4fb3af11b9e8bf182f618b', '9cb91b8851db0cf7b19d7ecc2a8193dd', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099844', 'f6817f48af4fb3af11b9e8bf182f618b', 'b1cb0a3fedf7ed0e4653cb5a229837ee', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099845', 'f6817f48af4fb3af11b9e8bf182f618b', 'b6bcee2ccc854052d3cc3e9c96d90197', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099846', 'f6817f48af4fb3af11b9e8bf182f618b', 'cc50656cf9ca528e6f2150eba4714ad2', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099847', 'f6817f48af4fb3af11b9e8bf182f618b', 'd86f58e7ab516d3bc6bfb1fe10585f97', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099848', 'f6817f48af4fb3af11b9e8bf182f618b', 'f0675b52d89100ee88472b6800754a08', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099849', 'f6817f48af4fb3af11b9e8bf182f618b', 'f2849d3814fc97993bfc519ae6bbf049', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099850', 'f6817f48af4fb3af11b9e8bf182f618b', 'f780d0d3083d849ccbdb1b1baee4911d', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099851', 'f6817f48af4fb3af11b9e8bf182f618b', '1205097455226462210', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099852', 'f6817f48af4fb3af11b9e8bf182f618b', '3f915b2769fc80648e92d04e84ca059d', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099853', 'f6817f48af4fb3af11b9e8bf182f618b', '190c2b43bec6a5f7a4194a85db67d96a', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099854', 'f6817f48af4fb3af11b9e8bf182f618b', '54dd5457a3190740005c1bfec55b1c34', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140200099855', 'f6817f48af4fb3af11b9e8bf182f618b', '45c966826eeff4c99b8f8ebfe74511fc', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488449', 'f6817f48af4fb3af11b9e8bf182f618b', '1174506953255182338', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488450', 'f6817f48af4fb3af11b9e8bf182f618b', '109c78a583d4693ce2f16551b7786786', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488451', 'f6817f48af4fb3af11b9e8bf182f618b', '13212d3416eb690c2e1d5033166ff47a', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488452', 'f6817f48af4fb3af11b9e8bf182f618b', '58857ff846e61794c69208e9d3a85466', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488453', 'f6817f48af4fb3af11b9e8bf182f618b', '5c2f42277948043026b7a14692456828', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488454', 'f6817f48af4fb3af11b9e8bf182f618b', '6531cf3421b1265aeeeabaab5e176e6d', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488455', 'f6817f48af4fb3af11b9e8bf182f618b', '6e73eb3c26099c191bf03852ee1310a1', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488456', 'f6817f48af4fb3af11b9e8bf182f618b', 'b3c824fc22bd953e2eb16ae6914ac8f9', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488457', 'f6817f48af4fb3af11b9e8bf182f618b', 'd2bbf9ebca5a8fa2e227af97d2da7548', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488458', 'f6817f48af4fb3af11b9e8bf182f618b', 'e41b69c57a941a3bbcce45032fe57605', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488459', 'f6817f48af4fb3af11b9e8bf182f618b', '7960961b0063228937da5fa8dd73d371', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488460', 'f6817f48af4fb3af11b9e8bf182f618b', '841057b8a1bef8f6b4b20f9a618a7fa6', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488461', 'f6817f48af4fb3af11b9e8bf182f618b', '1174590283938041857', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488462', 'f6817f48af4fb3af11b9e8bf182f618b', '1192318987661234177', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140208488463', 'f6817f48af4fb3af11b9e8bf182f618b', '1387612436586065922', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877058', 'f6817f48af4fb3af11b9e8bf182f618b', '020b06793e4de2eee0007f603000c769', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877059', 'f6817f48af4fb3af11b9e8bf182f618b', '53a9230444d33de28aa11cc108fb1dba', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877060', 'f6817f48af4fb3af11b9e8bf182f618b', '700b7f95165c46cc7a78bf227aa8fed3', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877061', 'f6817f48af4fb3af11b9e8bf182f618b', '8fb8172747a78756c11916216b8b8066', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877062', 'f6817f48af4fb3af11b9e8bf182f618b', 'aedbf679b5773c1f25e9f7b10111da73', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877063', 'f6817f48af4fb3af11b9e8bf182f618b', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877064', 'f6817f48af4fb3af11b9e8bf182f618b', 'e1979bb53e9ea51cecc74d86fd9d2f64', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877065', 'f6817f48af4fb3af11b9e8bf182f618b', 'e5973686ed495c379d829ea8b2881fc6', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877066', 'f6817f48af4fb3af11b9e8bf182f618b', 'e6bfd1fcabfd7942fdd05f076d1dad38', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877067', 'f6817f48af4fb3af11b9e8bf182f618b', '024f1fd1283dc632458976463d8984e1', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877068', 'f6817f48af4fb3af11b9e8bf182f618b', '265de841c58907954b8877fb85212622', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877069', 'f6817f48af4fb3af11b9e8bf182f618b', '2dbbafa22cda07fa5d169d741b81fe12', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877070', 'f6817f48af4fb3af11b9e8bf182f618b', '58b9204feaf07e47284ddb36cd2d8468', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877071', 'f6817f48af4fb3af11b9e8bf182f618b', '8b3bff2eee6f1939147f5c68292a1642', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877072', 'f6817f48af4fb3af11b9e8bf182f618b', 'd07a2c87a451434c99ab06296727ec4f', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140216877073', 'f6817f48af4fb3af11b9e8bf182f618b', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265666', 'f6817f48af4fb3af11b9e8bf182f618b', 'fc810a2267dd183e4ef7c71cc60f4670', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265667', 'f6817f48af4fb3af11b9e8bf182f618b', '1224641973866467330', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265668', 'f6817f48af4fb3af11b9e8bf182f618b', '1229674163694841857', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265669', 'f6817f48af4fb3af11b9e8bf182f618b', 'f1cb187abf927c88b89470d08615f5ac', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265670', 'f6817f48af4fb3af11b9e8bf182f618b', 'ebb9d82ea16ad864071158e0c449d186', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265671', 'f6817f48af4fb3af11b9e8bf182f618b', '1209731624921534465', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265672', 'f6817f48af4fb3af11b9e8bf182f618b', '08e6b9dc3c04489c8e1ff2ce6f105aa4', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265673', 'f6817f48af4fb3af11b9e8bf182f618b', '3fac0d3c9cd40fa53ab70d4c583821f8', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265674', 'f6817f48af4fb3af11b9e8bf182f618b', '97c8629abc7848eccdb6d77c24bb3ebb', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265675', 'f6817f48af4fb3af11b9e8bf182f618b', 'c6cf95444d80435eb37b2f9db3971ae6', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265676', 'f6817f48af4fb3af11b9e8bf182f618b', 'e08cb190ef230d5d4f03824198773950', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265677', 'f6817f48af4fb3af11b9e8bf182f618b', 'f23d9bfff4d9aa6b68569ba2cff38415', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265678', 'f6817f48af4fb3af11b9e8bf182f618b', '5c8042bd6c601270b2bbd9b20bccc68b', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265679', 'f6817f48af4fb3af11b9e8bf182f618b', '2a470fc0c3954d9dbb61de6d80846549', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265680', 'f6817f48af4fb3af11b9e8bf182f618b', '7ac9eb9ccbde2f7a033cd4944272bf1e', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265681', 'f6817f48af4fb3af11b9e8bf182f618b', '1304032910990495745', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265682', 'f6817f48af4fb3af11b9e8bf182f618b', '1280464606292099074', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140225265683', 'f6817f48af4fb3af11b9e8bf182f618b', '22d6a3d39a59dd7ea9a30acfa6bfb0a5', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654274', 'f6817f48af4fb3af11b9e8bf182f618b', '54097c6a3cf50fad0793a34beff1efdf', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654275', 'f6817f48af4fb3af11b9e8bf182f618b', '717f6bee46f44a3897eca9abd6e2ec44', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654276', 'f6817f48af4fb3af11b9e8bf182f618b', '9fe26464838de2ea5e90f2367e35efa0', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654277', 'f6817f48af4fb3af11b9e8bf182f618b', 'fba41089766888023411a978d13c0aa4', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654278', 'f6817f48af4fb3af11b9e8bf182f618b', '1280350452934307841', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654279', 'f6817f48af4fb3af11b9e8bf182f618b', '2e42e3835c2b44ec9f7bc26c146ee531', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654280', 'f6817f48af4fb3af11b9e8bf182f618b', '4875ebe289344e14844d8e3ea1edd73f', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654281', 'f6817f48af4fb3af11b9e8bf182f618b', 'c65321e57b7949b7a975313220de0422', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654282', 'f6817f48af4fb3af11b9e8bf182f618b', '540a2936940846cb98114ffb0d145cb8', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654283', 'f6817f48af4fb3af11b9e8bf182f618b', 'e3c13679c73a4f829bcff2aba8fd68b1', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1440901140233654284', 'f6817f48af4fb3af11b9e8bf182f618b', '1235823781053313025', NULL, '2021-09-23 12:49:37', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1540614802836058114', 'f6817f48af4fb3af11b9e8bf182f618b', '1540614747211198466', NULL, '2022-06-25 16:36:07', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1540915502837248002', 'f6817f48af4fb3af11b9e8bf182f618b', '1540915449657667585', NULL, '2022-06-26 12:30:59', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_permission` VALUES ('1541047714446352386', 'f6817f48af4fb3af11b9e8bf182f618b', '1541047683161038850', NULL, '2022-06-26 21:16:21', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `es_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `es_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送方式：1短信 2邮件 3微信',
  `es_receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人',
  `es_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送所需参数Json格式',
  `es_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推送内容',
  `es_send_time` datetime NULL DEFAULT NULL COMMENT '推送时间',
  `es_send_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `es_send_num` int NULL DEFAULT NULL COMMENT '发送次数 超过5次不再发送',
  `es_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送失败原因',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_type`(`es_type`) USING BTREE,
  INDEX `index_receiver`(`es_receiver`) USING BTREE,
  INDEX `index_sendtime`(`es_send_time`) USING BTREE,
  INDEX `index_status`(`es_send_status`) USING BTREE,
  INDEX `idx_ss_es_type`(`es_type`) USING BTREE,
  INDEX `idx_ss_es_receiver`(`es_receiver`) USING BTREE,
  INDEX `idx_ss_es_send_time`(`es_send_time`) USING BTREE,
  INDEX `idx_ss_es_send_status`(`es_send_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_template`;
CREATE TABLE `sys_sms_template`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板标题',
  `template_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板CODE',
  `template_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板类型：1短信 2邮件 3微信',
  `template_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板内容',
  `template_test_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板测试json',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_templatecode`(`template_code`) USING BTREE,
  UNIQUE INDEX `uk_sst_template_code`(`template_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_sms_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` int NOT NULL COMMENT '租户编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `begin_date` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` int NULL DEFAULT NULL COMMENT '状态 1正常 0冻结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '多租户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '租户001', '2020-07-10 15:43:32', 'admin', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_third_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_third_account`;
CREATE TABLE `sys_third_account`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `sys_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方登录id',
  `third_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录来源',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态(1-正常,2-冻结)',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态(0-正常,1-已删除)',
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `third_user_uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方账号',
  `third_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方app用户账号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_sys_third_account_third_type_third_user_id`(`third_type`, `third_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别(0-默认未知,1-男,2-女)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '性别(1-正常,2-冻结)',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态(0-正常,1-已删除)',
  `third_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方登录的唯一标识',
  `third_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方类型',
  `activiti_sync` tinyint(1) NULL DEFAULT NULL COMMENT '同步工作流引擎(1-同步,0-不同步)',
  `work_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号，唯一键',
  `post` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务，关联职务表',
  `telephone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_identity` tinyint(1) NULL DEFAULT NULL COMMENT '身份（1普通成员 2上级）',
  `depart_ids` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '负责部门',
  `rel_tenant_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多租户标识',
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `role_status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_work_no`(`work_no`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_phone`(`phone`) USING BTREE,
  UNIQUE INDEX `uniq_sys_user_email`(`email`) USING BTREE,
  INDEX `index_user_status`(`status`) USING BTREE,
  INDEX `index_user_del_flag`(`del_flag`) USING BTREE,
  INDEX `idx_su_username`(`username`) USING BTREE,
  INDEX `idx_su_status`(`status`) USING BTREE,
  INDEX `idx_su_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('e9ca23d68d884d4ebb19d07889727dae', 'admin', NULL, '管理员', 'cb362cfeefbf3d8d', 'RCGTeGiH', 'http://git.sanskj.cn/ljb/admin-template-jeecg/raw/commit/743fa5557fcc1d3c9e85d2b5111c6e71d687949e/logo.jpg', '2018-12-05 00:00:00', 1, 'sanshi_lin@163.com', '18650000000', 'A01', 1, 0, NULL, NULL, 1, '00001', 'ZJL', NULL, NULL, '2019-06-21 17:54:10', 'admin', '2021-08-25 17:59:06', 2, 'c6d7cb4deeac411cb3384b1b31278596', '', NULL, 1);

-- ----------------------------
-- Table structure for sys_user_agent
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_agent`;
CREATE TABLE `sys_user_agent`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `agent_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人用户名',
  `start_time` datetime NULL DEFAULT NULL COMMENT '代理开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '代理结束时间',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态0无效1有效',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`user_name`) USING BTREE,
  UNIQUE INDEX `uk_sug_user_name`(`user_name`) USING BTREE,
  INDEX `statux_index`(`status`) USING BTREE,
  INDEX `begintime_index`(`start_time`) USING BTREE,
  INDEX `endtime_index`(`end_time`) USING BTREE,
  INDEX `idx_sug_status`(`status`) USING BTREE,
  INDEX `idx_sug_start_time`(`start_time`) USING BTREE,
  INDEX `idx_sug_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户代理人设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_agent
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_depart`;
CREATE TABLE `sys_user_depart`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `dep_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_depart_groupk_userid`(`user_id`) USING BTREE,
  INDEX `index_depart_groupkorgid`(`dep_id`) USING BTREE,
  INDEX `index_depart_groupk_uidanddid`(`user_id`, `dep_id`) USING BTREE,
  INDEX `idx_sud_user_id`(`user_id`) USING BTREE,
  INDEX `idx_sud_dep_id`(`dep_id`) USING BTREE,
  INDEX `idx_sud_user_dep_id`(`user_id`, `dep_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO `sys_user_depart` VALUES ('1281490128540393474', 'e9ca23d68d884d4ebb19d07889727dae', 'c6d7cb4deeac411cb3384b1b31278596');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index2_groupuu_user_id`(`user_id`) USING BTREE,
  INDEX `index2_groupuu_ole_id`(`role_id`) USING BTREE,
  INDEX `index2_groupuu_useridandroleid`(`user_id`, `role_id`) USING BTREE,
  INDEX `idx_sur_user_id`(`user_id`) USING BTREE,
  INDEX `idx_sur_role_id`(`role_id`) USING BTREE,
  INDEX `idx_sur_user_role_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1281490128242597889', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b');

-- ----------------------------
-- Table structure for territorial_message
-- ----------------------------
DROP TABLE IF EXISTS `territorial_message`;
CREATE TABLE `territorial_message`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `tower_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '杆塔id',
  `registration` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '塔基林木采伐证办理情况',
  `base_sign_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '与乡镇签订情况',
  `base_pay_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款至乡镇情况',
  `acquisition_measure_home` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '丈量到户',
  `acquisition_people_sign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '与村民（承包人、经营人）签定情况',
  `acquisition_people_pay` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款至村民（承包人、经营人）情况',
  `acquisition_people_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '村民（承包人、经营人）姓名',
  `acquisition_people_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '村民（承包人、经营人）电话',
  `acquisition_people_electricity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '村民（承包人、经营人）用电户号',
  `base_land_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '塔基交地情况',
  `base_reasons` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '塔基未交地原因',
  `base_clear_table` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '塔基是否清表',
  `base_plan_time` datetime NULL DEFAULT NULL COMMENT '塔基计划交地时间',
  `base_actual_time` datetime NULL DEFAULT NULL COMMENT '塔基实际交地时间',
  `easy_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '施工便道用地范围确认',
  `easy_sign_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '便道签订情况',
  `easy_pay_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '便道付款情况',
  `easy_land_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '便道是否交地',
  `easy_reason` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '便道未交地原因',
  `easy_clear_table` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '便道是否清表',
  `easy_plan_time` datetime NULL DEFAULT NULL COMMENT ' 便道计划交地时间',
  `easy_actual_time` datetime NULL DEFAULT NULL COMMENT '便道实际交地时间',
  `stretch_sign_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '牵张场签订情况',
  `stretch_pay_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '牵张场付款情况',
  `stretch_land_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '牵张场交地情况',
  `pipe_line_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管线迁移',
  `house_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋拆迁',
  `block_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否受阻',
  `block_reason_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '受阻原因分类',
  `block_detail` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '具体问题',
  `light_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否亮红灯',
  `light_day` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '亮灯天数',
  `filling_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '填报时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of territorial_message
-- ----------------------------

-- ----------------------------
-- Table structure for territorial_station
-- ----------------------------
DROP TABLE IF EXISTS `territorial_station`;
CREATE TABLE `territorial_station`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属地供电所名称',
  `detail` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of territorial_station
-- ----------------------------

-- ----------------------------
-- Table structure for tower
-- ----------------------------
DROP TABLE IF EXISTS `tower`;
CREATE TABLE `tower`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '杆塔号',
  `address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '塔地址',
  `ascription_town` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交界塔基归属乡镇',
  `coordinate_n` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'N坐标N/X(米)',
  `coordinate_b` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'E坐标E/Y(米)',
  `territorial_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属地供电所id',
  `construction_unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '施单位（全称）',
  `overseer_unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监理单位（全称）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tower
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

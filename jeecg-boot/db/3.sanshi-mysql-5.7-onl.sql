SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


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
  `status` int(1) NULL DEFAULT NULL COMMENT '1有效 0无效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for onl_auth_page
-- ----------------------------
DROP TABLE IF EXISTS `onl_auth_page`;
CREATE TABLE `onl_auth_page`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT ' 主键',
  `cgform_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'online表id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段名/按钮编码',
  `type` int(1) NULL DEFAULT NULL COMMENT '1字段 2按钮',
  `control` int(1) NULL DEFAULT NULL COMMENT '3可编辑 5可见(仅支持两种状态值3,5)',
  `page` int(1) NULL DEFAULT NULL COMMENT '3列表 5表单(仅支持两种状态值3,5)',
  `status` int(1) NULL DEFAULT NULL COMMENT '1有效 0无效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for onl_auth_relation
-- ----------------------------
DROP TABLE IF EXISTS `onl_auth_relation`;
CREATE TABLE `onl_auth_relation`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `auth_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限id',
  `type` int(1) NULL DEFAULT NULL COMMENT '1字段 2按钮 3数据权限',
  `cgform_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'online表单ID',
  `auth_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权方式role角色，depart部门，user人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `ORDER_NUM` int(11) NULL DEFAULT NULL COMMENT '排序',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Online表单自定义按钮' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `db_length` int(11) NOT NULL COMMENT '数据库字段长度',
  `db_point_length` int(11) NULL DEFAULT NULL COMMENT '小数点',
  `db_default_val` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表字段默认值',
  `dict_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典code',
  `dict_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典表',
  `dict_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典Text',
  `field_show_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单控件类型',
  `field_href` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转URL',
  `field_length` int(11) NULL DEFAULT NULL COMMENT '表单控件长度',
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
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of onl_cgform_field
-- ----------------------------

-- ----------------------------
-- Table structure for onl_cgform_head
-- ----------------------------
DROP TABLE IF EXISTS `onl_cgform_head`;
CREATE TABLE `onl_cgform_head`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `table_type` int(11) NOT NULL COMMENT '表类型: 0单表、1主表、2附表',
  `table_version` int(11) NULL DEFAULT 1 COMMENT '表版本',
  `table_txt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表说明',
  `is_checkbox` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否带checkbox',
  `is_db_synch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '同步数据库状态',
  `is_page` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否分页',
  `is_tree` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是树',
  `id_sequence` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键生成序列',
  `id_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键类型',
  `query_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询模式',
  `relation_type` int(11) NULL DEFAULT NULL COMMENT '映射关系 0一对多  1一对一',
  `sub_table_str` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表',
  `tab_order_num` int(11) NULL DEFAULT NULL COMMENT '附表排序序号',
  `tree_parent_id_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树形表单父id',
  `tree_id_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树表主键字段',
  `tree_fieldname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树开表单列字段',
  `form_category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'bdfl_ptbd' COMMENT '表单分类',
  `form_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC表单模板',
  `form_template_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单模板样式(移动端)',
  `scroll` int(3) NULL DEFAULT 0 COMMENT '是否有横向滚动条',
  `copy_version` int(11) NULL DEFAULT NULL COMMENT '复制版本号',
  `copy_type` int(3) NULL DEFAULT 0 COMMENT '复制表类型1为复制表 0为原始表',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of onl_cgform_head
-- ----------------------------

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
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除 1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_table_id`(`cgform_head_id`) USING BTREE,
  INDEX `idx_oci_cgform_head_id`(`cgform_head_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `field_width` int(3) NULL DEFAULT NULL,
  `field_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `search_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询模式',
  `is_order` int(2) NULL DEFAULT 0 COMMENT '是否排序  0否,1是',
  `is_search` int(2) NULL DEFAULT 0 COMMENT '是否查询  0否,1是',
  `dict_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典CODE',
  `field_href` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段跳转URL',
  `is_show` int(2) NULL DEFAULT 1 COMMENT '是否显示  0否,1显示',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cgrheadid`(`cgrhead_id`) USING BTREE,
  INDEX `idx_ocp_cgrhead_id`(`cgrhead_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

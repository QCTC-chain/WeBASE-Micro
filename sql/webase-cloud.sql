/*
 Navicat Premium Data Transfer

 Source Server         : zy-vm-5.7
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : 192.168.12.164:23306
 Source Schema         : webase-cloud

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 05/09/2023 18:19:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint(20) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-09-05 01:28:45', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-09-05 01:28:45', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-09-05 01:28:45', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-09-05 01:28:45', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2023-09-05 01:28:45', '', NULL, 'true:开启, false:关闭');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
insert into sys_dept values(100,  0,   '0',          '清大科越',   0, '', '', '', '0', '0', 'admin', sysdate(), '', null);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知公告', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '问题帮助', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '帮助');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '其他操作');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-09-05 01:28:45', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 5, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-08-21 15:46:54', 'admin', '2023-09-25 11:27:47', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', 1, 0, 'M', '1', '1', '', 'monitor', 'admin', '2023-08-21 15:46:54', 'admin', '2023-09-25 11:28:01', '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-08-21 15:46:54', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-08-21 15:46:54', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-08-21 15:46:54', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-08-21 15:46:54', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-08-21 15:46:54', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-08-21 15:46:54', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-08-21 15:46:54', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-08-21 15:46:54', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 0, 7, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-08-21 15:46:54', 'admin', '2023-10-20 14:22:05', '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-08-21 15:46:55', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, 'XxlJob控制台', 2, 2, 'http://192.168.12.115:9900', '', '', 0, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-08-21 15:46:55', 'admin', '2023-09-05 17:45:06', '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, 'Sentinel控制台', 2, 3, 'http://192.168.12.115:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-08-21 15:46:55', 'admin', '2023-09-05 17:46:08', '流量控制菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-08-21 15:46:55', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-08-21 15:46:55', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2023-08-21 15:46:55', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-08-21 15:46:55', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-08-21 15:46:55', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-08-21 15:46:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-08-21 15:46:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2023-08-21 15:46:57', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2000, '主机管理', 0, 1, 'server', 'host/index', NULL, 1, 0, 'C', '0', '0', 'host:list', 'server', 'admin', '2023-09-01 10:31:59', 'admin', '2023-10-20 14:10:17', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3000, '长安链', 0, 2, 'cm', NULL, NULL, 1, 0, 'M', '0', '1', NULL, 'guide', 'admin', '2023-09-01 10:35:42', 'admin', '2024-05-17 09:50:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3001, '链账户管理', 3000, 2, 'account', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-09-01 10:42:57', 'admin', '2023-09-25 14:50:31', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3002, '证书账户', 3001, 1, 'certificates', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:account:permissionedWithCert', '#', 'admin', '2023-09-01 10:44:43', 'admin', '2023-10-16 14:24:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3003, '公钥账户', 3001, 2, 'public', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:account:public', '#', 'admin', '2023-09-04 16:08:07', 'admin', '2023-09-25 14:19:55', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3004, '区块链管理', 3000, 3, 'chains', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:chains', 'swagger', 'admin', '2023-09-04 16:15:57', 'admin', '2023-09-25 14:23:23', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3005, '区块链概览', 3000, 1, 'overview', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:overview', 'dashboard', 'admin', '2023-09-04 16:22:49', 'admin', '2023-09-25 18:40:05', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3006, '合约管理', 3000, 4, 'contracts', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:contracts', 'skill', 'admin', '2023-09-04 16:23:29', 'admin', '2023-09-25 14:49:43', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3007, '上链管理', 3000, 5, 'invoke-contracts', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:invoke:list', 'log', 'admin', '2023-09-04 16:24:07', 'admin', '2023-10-17 10:42:34', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3008, '投票管理', 3000, 6, 'votes', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:votes', 'logininfor', 'admin', '2023-09-04 16:24:30', 'admin', '2023-09-25 15:52:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3009, '节点管理', 3000, 8, 'nodes', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:nodes', 'component', 'admin', '2023-09-04 16:25:08', 'admin', '2023-10-16 17:33:25', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3011, '组织信息', 3000, 7, 'organizations', 'blank', NULL, 1, 0, 'C', '0', '0', 'cm:organizations', 'tree', 'admin', '2023-09-04 16:31:06', 'admin', '2023-09-25 14:54:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3012, '订阅区块链', 3004, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'cm:chains:subscribe', '#', 'admin', '2023-09-04 16:31:56', 'admin', '2023-09-25 15:05:27', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4000, 'Bcos 3.4.0', 0, 4, 'bcos3', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'example', 'admin', '2023-09-04 16:10:04', 'admin', '2023-09-25 11:27:38', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4001, '数据概览', 4000, 1, 'home', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:home', 'dashboard', 'admin', '2023-09-08 10:19:34', 'admin', '2023-09-18 17:16:37', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4002, '群组管理', 4000, 2, 'groupManagement', 'blank', NULL, 1, 0, 'C', '0', '1', 'bcos3:groups', 'swagger', 'admin', '2023-09-11 13:42:07', 'admin', '2023-09-15 00:59:03', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4003, '合约管理', 4000, 5, 'contract', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-09-11 13:45:18', 'admin', '2023-09-12 18:11:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4004, '合约IDE', 4003, 1, 'ide', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:contract:ide', '#', 'admin', '2023-09-11 13:46:43', 'admin', '2023-09-11 16:37:21', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4005, '合约列表', 4003, 2, 'List', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:contract:List', '#', 'admin', '2023-09-11 13:47:32', 'admin', '2023-09-11 16:37:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4006, '合约仓库', 4003, 3, 'Warehouse', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:contract:Warehouse', '#', 'admin', '2023-09-11 16:38:29', 'admin', '2023-09-11 16:39:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4007, 'CNS查询', 4003, 4, 'cnsManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:contract:cnsManagement', '#', 'admin', '2023-09-11 16:39:32', 'admin', '2023-09-14 17:58:05', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4008, 'Event查看', 4003, 5, 'eventCheck', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:contract:eventCheck', '#', 'admin', '2023-09-11 16:41:12', 'admin', '2023-09-11 16:41:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4009, '私钥管理', 4000, 4, 'privateKeyManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:privateKeyManagement', 'lock', 'admin', '2023-09-11 16:44:13', 'admin', '2023-09-25 11:26:02', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4010, 'BFS', 4003, 6, 'BFS', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:contract:BFS', '#', 'admin', '2023-09-11 16:53:13', 'admin', '2023-09-14 14:50:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4011, '链管理', 4000, 4, 'chain', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:chains', 'build', 'admin', '2023-09-12 18:10:48', 'admin', '2023-10-20 14:20:00', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4012, '节点管理', 4000, 3, 'front', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:chain:front', 'build', 'admin', '2023-09-12 18:13:13', 'admin', '2023-10-11 17:20:15', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4013, '系统监控', 4000, 8, 'monitor', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2023-09-14 09:37:40', 'admin', '2023-09-14 15:35:38', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4014, '节点监控', 4013, 1, 'nodesMetric', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:monitor:nodeMetric', '#', 'admin', '2023-09-14 09:50:44', 'admin', '2023-09-14 09:51:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4015, '主机监控', 4013, 2, 'hostMetric', 'blank', NULL, 1, 0, 'C', '0', '1', 'bcos3:monitor:hostMetric', '#', 'admin', '2023-09-14 09:56:18', 'admin', '2023-10-20 09:25:17', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4016, '邮件告警配置', 4013, 3, 'emailAlarm', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:monitor:emailAlarm', '#', 'admin', '2023-09-14 10:31:57', 'admin', '2023-09-14 10:31:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4017, '告警类型配置', 4013, 4, 'emailAlarmType', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:monitor:emailAlarmType', '#', 'admin', '2023-09-14 10:33:07', 'admin', '2023-09-14 10:33:07', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4018, '更新告警日志', 4017, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:updateAlertLog', '#', 'admin', '2023-09-14 13:52:37', 'admin', '2023-09-14 13:52:37', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4019, '获取某条告警日志', 4017, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:getAlertLog', '#', 'admin', '2023-09-14 13:54:12', 'admin', '2023-09-14 13:54:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4020, '修改邮件服务配置', 4016, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:updateMailConfig', '#', 'admin', '2023-09-14 14:01:30', 'admin', '2023-09-14 14:01:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4021, '获取某个邮件服务配置', 4016, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:getMailConfig', '#', 'admin', '2023-09-14 14:04:55', 'admin', '2023-09-14 14:04:55', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4022, '测试邮件发送', 4016, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:sendMailTest', '#', 'admin', '2023-09-14 14:10:12', 'admin', '2023-09-14 14:10:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4023, '获取某条规则', 4017, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:getAlertRule', '#', 'admin', '2023-09-14 14:16:08', 'admin', '2023-09-14 14:16:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4024, '更新某条告警规则', 4017, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:updateAlertRule', '#', 'admin', '2023-09-14 14:18:04', 'admin', '2023-09-14 14:18:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4025, '启用或关闭某条告警', 4017, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:monitor:toggleAlertRule', '#', 'admin', '2023-09-14 14:22:03', 'admin', '2023-09-14 14:22:03', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4026, '应用管理', 4000, 7, 'appManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:appManagement', 'dict', 'admin', '2023-09-14 15:15:28', 'admin', '2023-09-14 15:35:43', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4027, '新建应用', 4026, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:appManagement:newApp', '#', 'admin', '2023-09-14 15:18:06', 'admin', '2023-09-14 15:18:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4028, '删除某个应用', 4026, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:appManagement:deleteApp', '#', 'admin', '2023-09-14 15:18:54', 'admin', '2023-09-14 15:18:54', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4029, '系统管理', 4000, 6, 'sys', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'system', 'admin', '2023-09-14 15:36:10', 'admin', '2023-09-14 15:36:10', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4030, '权限管理', 4029, 1, 'newPermission', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:sys:newPermission', '#', 'admin', '2023-09-14 15:40:53', 'admin', '2023-09-14 15:43:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4031, '配置管理', 4029, 2, 'configManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:sys:configManagement', '#', 'admin', '2023-09-14 15:41:55', 'admin', '2023-09-14 15:43:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4032, '证书管理', 4029, 3, 'certificate', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:sys:certificate', '#', 'admin', '2023-09-14 15:42:27', 'admin', '2023-09-14 15:43:23', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4033, '下载sdk证书', 4032, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:downloadSdkCert', '#', 'admin', '2023-09-14 16:32:33', 'admin', '2023-09-14 16:32:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4034, '添加证书', 4032, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:addCert', '#', 'admin', '2023-09-14 17:06:27', 'admin', '2023-09-14 17:06:27', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4035, '删除证书', 4032, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:deleteCert', '#', 'admin', '2023-09-14 17:08:33', 'admin', '2023-09-14 17:08:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4036, '添加abi', 4005, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:contract:addAbi', '#', 'admin', '2023-09-14 17:35:08', 'admin', '2023-09-14 17:35:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4037, '修改abi', 4005, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:contract:updateAbi', '#', 'admin', '2023-09-14 17:36:06', 'admin', '2023-09-14 17:36:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4038, '删除abi', 4005, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:contract:deleteAbi', '#', 'admin', '2023-09-14 17:36:32', 'admin', '2023-09-14 17:36:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4039, '初始化主机和docker', 4012, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:initHost', '#', 'admin', '2023-09-14 19:48:35', 'admin', '2023-09-14 19:48:35', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4040, '检查主机初始化状态', 4012, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:checkHostInit', '#', 'admin', '2023-09-14 19:53:16', 'admin', '2023-09-14 19:53:16', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4041, '配置链和主机', 4012, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:configChainAndHost', '#', 'admin', '2023-09-14 19:54:50', 'admin', '2023-09-14 19:54:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4042, '检查主机端口', 4012, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:checkPort', '#', 'admin', '2023-09-14 19:55:41', 'admin', '2023-09-14 19:55:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4043, '扩容节点', 4012, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:addNode', '#', 'admin', '2023-09-14 19:56:32', 'admin', '2023-09-14 19:56:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4044, '启动节点', 4012, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:startNode', '#', 'admin', '2023-09-14 19:57:09', 'admin', '2023-09-14 19:57:09', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4045, '停止节点', 4012, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:stopNode', '#', 'admin', '2023-09-14 19:57:43', 'admin', '2023-09-14 19:57:43', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4046, '强制停止节点', 4012, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:stopNodeForce', '#', 'admin', '2023-09-14 19:58:34', 'admin', '2023-09-14 19:58:34', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4047, '重启节点', 4012, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:restartNode', '#', 'admin', '2023-09-14 19:59:06', 'admin', '2023-09-14 19:59:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4048, '删除节点', 4012, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:deleteNode', '#', 'admin', '2023-09-14 19:59:50', 'admin', '2023-09-14 19:59:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4049, '升级链', 4012, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:upgradeChain', '#', 'admin', '2023-09-14 20:00:41', 'admin', '2023-09-14 20:00:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4050, '获取部署进度', 4012, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:progress', '#', 'admin', '2023-09-14 20:01:42', 'admin', '2023-09-14 20:01:42', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4051, '启动链', 4012, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:startChain', '#', 'admin', '2023-09-14 20:02:46', 'admin', '2023-09-14 20:02:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4052, '停止链', 4012, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:stopChain', '#', 'admin', '2023-09-14 20:03:14', 'admin', '2023-09-14 20:03:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4053, '重启链', 4012, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:restartChain', '#', 'admin', '2023-09-14 20:03:41', 'admin', '2023-09-14 20:03:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4054, '删除链', 4012, 16, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:deleteChain', '#', 'admin', '2023-09-14 20:04:19', 'admin', '2023-09-14 20:04:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4055, '异常用户信息', 4063, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:transAudit:externalAccount', '#', 'admin', '2023-09-14 20:15:56', 'admin', '2023-09-14 22:37:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4056, '外部合约信息', 4064, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:transAudit:externalContract', '#', 'admin', '2023-09-14 20:16:47', 'admin', '2023-09-14 22:38:07', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4057, '群组相关信息查询', 4002, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:groups:query', '#', 'admin', '2023-09-14 22:10:36', 'admin', '2023-09-14 22:10:36', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4058, '群组操作', 4002, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:groups:operate', '#', 'admin', '2023-09-14 22:12:18', 'admin', '2023-09-14 22:12:34', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4059, '获取某个合约方法', 4005, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:contract:getMethod', '#', 'admin', '2023-09-14 22:19:42', 'admin', '2023-09-14 22:19:42', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4060, '添加合约方法', 4005, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:contract:addMethod', '#', 'admin', '2023-09-14 22:20:18', 'admin', '2023-09-14 22:20:18', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4061, '交易审计', 4000, 9, 'audit', NULL, NULL, 1, 0, 'M', '0', '0', 'bcos3:transAudit', 'validCode', 'admin', '2023-09-14 22:29:26', 'admin', '2023-09-14 22:34:27', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4062, '用户交易', 4061, 1, 'transactionCharts', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:transAudit:userTrans', '#', 'admin', '2023-09-14 22:31:35', 'admin', '2023-09-14 22:31:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4063, '异常用户', 4061, 2, 'unusualUser', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:transAudit:unusualUser', '#', 'admin', '2023-09-14 22:32:55', 'admin', '2023-09-14 22:32:55', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4064, '异常合约', 4061, 3, 'unusualContract', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:transAudit:unusualContract', '#', 'admin', '2023-09-14 22:33:30', 'admin', '2023-09-14 22:33:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4065, '更新节点描述', 4012, 17, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:updateNodeDesc', '#', 'admin', '2023-09-14 22:46:51', 'admin', '2023-09-14 22:47:00', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4066, '获取委员会投票列表', 4030, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:listGovernVote', '#', 'admin', '2023-09-14 23:09:02', 'admin', '2023-09-14 23:09:16', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4067, '删除合约状态记录', 4030, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:delContractStatusRec', '#', 'admin', '2023-09-14 23:10:18', 'admin', '2023-09-14 23:10:18', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4068, '新增委员投票', 4030, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:grantCommittee', '#', 'admin', '2023-09-14 23:19:50', 'admin', '2023-09-14 23:19:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4069, '撤销委员投票', 4030, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:revokeCommittee', '#', 'admin', '2023-09-14 23:21:14', 'admin', '2023-09-14 23:21:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4070, '修改投票权重', 4030, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:updateCommitteeWeight', '#', 'admin', '2023-09-14 23:22:56', 'admin', '2023-09-14 23:22:56', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4071, '修改投票阈值', 4030, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:updateThreshold', '#', 'admin', '2023-09-14 23:23:51', 'admin', '2023-09-14 23:23:51', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4072, '新增运维', 4030, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:grantOperator', '#', 'admin', '2023-09-14 23:25:19', 'admin', '2023-09-14 23:25:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4073, '删除运维', 4030, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:revokeOperator', '#', 'admin', '2023-09-14 23:25:54', 'admin', '2023-09-14 23:25:54', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4074, '冻结账户', 4030, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:freezeAccount', '#', 'admin', '2023-09-14 23:26:57', 'admin', '2023-09-14 23:26:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4075, '解冻账户', 4030, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:unfreezeAccount', '#', 'admin', '2023-09-14 23:27:28', 'admin', '2023-09-14 23:27:28', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4076, '更新用户的权限状态', 4030, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:updatePermission', '#', 'admin', '2023-09-14 23:32:50', 'admin', '2023-09-14 23:32:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4077, '授权用户', 4030, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:grantPermission', '#', 'admin', '2023-09-14 23:33:33', 'admin', '2023-09-14 23:33:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4078, '撤销用户权限', 4030, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:sys:revokePermission', '#', 'admin', '2023-09-14 23:34:26', 'admin', '2023-09-14 23:34:26', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4079, '节点共识操作管理', 4012, 18, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chain:nodeManage', '#', 'admin', '2023-09-14 23:50:41', 'admin', '2023-09-14 23:50:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4080, '合约状态管理', 4005, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:contract:contractStatusManage', '#', 'admin', '2023-09-14 23:54:11', 'admin', '2023-09-14 23:54:11', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4081, '链上用户操作', 4009, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:privateKeyManagement:userOperate', '#', 'admin', '2023-09-15 00:12:31', 'admin', '2023-09-15 00:12:31', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4082, '订阅事件', 4000, 10, 'subscribe', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'message', 'admin', '2023-09-15 00:21:32', 'admin', '2023-09-15 00:21:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4083, '出块事件', 4082, 1, 'blockEvent', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:subscribeEvent:blockEvent', '#', 'admin', '2023-09-15 00:22:19', 'admin', '2023-09-15 00:25:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4084, '合约事件', 4082, 2, 'contractEvent', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos3:subscribeEvent:blockEvent', '#', 'admin', '2023-09-15 00:23:04', 'admin', '2023-09-15 00:23:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5000, 'Bcos 2.9.1', 0, 3, 'bcos1', NULL, NULL, 1, 0, 'M', '0', '1', NULL, 'star', 'admin', '2023-09-04 16:10:04', 'admin', '2024-05-17 09:50:07', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5001, '数据概览', 5000, 1, 'home', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:home', 'dashboard', 'admin', '2023-09-08 10:19:34', 'admin', '2023-09-15 00:58:48', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5002, '群组管理', 5000, 2, 'groupManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:groups', 'swagger', 'admin', '2023-09-11 13:42:07', 'admin', '2023-09-15 00:59:03', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5003, '合约管理', 5000, 5, 'contract', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-09-11 13:45:18', 'admin', '2023-09-12 18:11:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5004, '合约IDE', 5003, 1, 'ide', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:contract:ide', '#', 'admin', '2023-09-11 13:46:43', 'admin', '2023-09-11 16:37:21', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5005, '合约列表', 5003, 2, 'List', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:contract:List', '#', 'admin', '2023-09-11 13:47:32', 'admin', '2023-09-11 16:37:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5006, '合约仓库', 5003, 3, 'Warehouse', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:contract:Warehouse', '#', 'admin', '2023-09-11 16:38:29', 'admin', '2023-09-18 20:41:48', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5007, 'CNS查询', 5003, 4, 'cnsManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:contract:cnsManagement', '#', 'admin', '2023-09-11 16:39:32', 'admin', '2023-09-14 17:58:05', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5008, 'Event查看', 5003, 5, 'eventCheck', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:contract:eventCheck', '#', 'admin', '2023-09-11 16:41:12', 'admin', '2023-09-11 16:41:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5009, '私钥管理', 5000, 4, 'privateKeyManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:privateKeyManagement', 'lock', 'admin', '2023-09-11 16:44:13', 'admin', '2023-09-19 15:01:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5010, 'CRUD', 5003, 6, 'CRUDServiceManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:contract:CRUD', '#', 'admin', '2023-09-11 16:53:13', 'admin', '2023-09-18 19:17:22', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5011, '链管理', 5000, 4, 'chain', 'blank', NULL, 1, 0, 'C', '0', '1', 'bcos:chains', 'build', 'admin', '2023-09-12 18:10:48', 'admin', '2023-10-20 14:18:16', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5012, '节点管理', 5000, 3, 'front', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:chain:front', 'build', 'admin', '2023-09-12 18:13:13', 'admin', '2023-09-26 18:07:15', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5013, '系统监控', 5000, 8, 'monitor', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2023-09-14 09:37:40', 'admin', '2023-09-14 15:35:38', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5014, '节点监控', 5013, 1, 'nodesMetric', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:monitor:nodeMetric', '#', 'admin', '2023-09-14 09:50:44', 'admin', '2023-09-14 09:51:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5015, '主机监控', 5013, 2, 'hostMetric', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:monitor:hostMetric', '#', 'admin', '2023-09-14 09:56:18', 'admin', '2023-09-14 09:56:18', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5016, '邮件告警配置', 5013, 3, 'emailAlarm', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:monitor:emailAlarm', '#', 'admin', '2023-09-14 10:31:57', 'admin', '2023-09-14 10:31:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5017, '告警类型配置', 5013, 4, 'emailAlarmType', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:monitor:emailAlarmType', '#', 'admin', '2023-09-14 10:33:07', 'admin', '2023-09-14 10:33:07', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5018, '更新告警日志', 5017, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:updateAlertLog', '#', 'admin', '2023-09-14 13:52:37', 'admin', '2023-09-14 13:52:37', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5019, '获取某条告警日志', 5017, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:getAlertLog', '#', 'admin', '2023-09-14 13:54:12', 'admin', '2023-09-14 13:54:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5020, '修改邮件服务配置', 5016, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:updateMailConfig', '#', 'admin', '2023-09-14 14:01:30', 'admin', '2023-09-14 14:01:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5021, '获取某个邮件服务配置', 5016, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:getMailConfig', '#', 'admin', '2023-09-14 14:04:55', 'admin', '2023-09-14 14:04:55', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5022, '测试邮件发送', 5016, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:sendMailTest', '#', 'admin', '2023-09-14 14:10:12', 'admin', '2023-09-14 14:10:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5023, '获取某条规则', 5017, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:getAlertRule', '#', 'admin', '2023-09-14 14:16:08', 'admin', '2023-09-14 14:16:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5024, '更新某条告警规则', 5017, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:updateAlertRule', '#', 'admin', '2023-09-14 14:18:04', 'admin', '2023-09-14 14:18:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5025, '启用或关闭某条告警', 5017, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:monitor:toggleAlertRule', '#', 'admin', '2023-09-14 14:22:03', 'admin', '2023-09-14 14:22:03', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5026, '应用管理', 5000, 7, 'appManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:appManagement', 'dict', 'admin', '2023-09-14 15:15:28', 'admin', '2023-09-14 15:35:43', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5027, '新建应用', 5026, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:appManagement:newApp', '#', 'admin', '2023-09-14 15:18:06', 'admin', '2023-09-14 15:18:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5028, '删除某个应用', 5026, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:appManagement:deleteApp', '#', 'admin', '2023-09-14 15:18:54', 'admin', '2023-09-14 15:18:54', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5029, '系统管理', 5000, 6, 'sys', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'system', 'admin', '2023-09-14 15:36:10', 'admin', '2023-09-14 15:36:10', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5030, '权限管理', 5029, 1, 'newPermission', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:sys:newPermission', '#', 'admin', '2023-09-14 15:40:53', 'admin', '2023-09-14 15:43:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5031, '配置管理', 5029, 2, 'configManagement', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:sys:configManagement', '#', 'admin', '2023-09-14 15:41:55', 'admin', '2023-09-14 15:43:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5032, '证书管理', 5029, 3, 'certificate', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:sys:certificate', '#', 'admin', '2023-09-14 15:42:27', 'admin', '2023-09-14 15:43:23', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5033, '下载sdk证书', 5032, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:downloadSdkCert', '#', 'admin', '2023-09-14 16:32:33', 'admin', '2023-09-14 16:32:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5034, '添加证书', 5032, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:addCert', '#', 'admin', '2023-09-14 17:06:27', 'admin', '2023-09-14 17:06:27', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5035, '删除证书', 5032, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:deleteCert', '#', 'admin', '2023-09-14 17:08:33', 'admin', '2023-09-14 17:08:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5036, '添加abi', 5005, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:contract:addAbi', '#', 'admin', '2023-09-14 17:35:08', 'admin', '2023-09-14 17:35:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5037, '修改abi', 5005, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:contract:updateAbi', '#', 'admin', '2023-09-14 17:36:06', 'admin', '2023-09-14 17:36:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5038, '删除abi', 5005, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:contract:deleteAbi', '#', 'admin', '2023-09-14 17:36:32', 'admin', '2023-09-14 17:36:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5039, '初始化主机和docker', 5012, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:initHost', '#', 'admin', '2023-09-14 19:48:35', 'admin', '2023-09-14 19:48:35', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5040, '检查主机初始化状态', 5012, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:checkHostInit', '#', 'admin', '2023-09-14 19:53:16', 'admin', '2023-09-14 19:53:16', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5041, '配置链和主机', 5012, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:configChainAndHost', '#', 'admin', '2023-09-14 19:54:50', 'admin', '2023-09-14 19:54:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5042, '检查主机端口', 5012, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:checkPort', '#', 'admin', '2023-09-14 19:55:41', 'admin', '2023-09-14 19:55:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5043, '扩容节点', 5012, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:addNode', '#', 'admin', '2023-09-14 19:56:32', 'admin', '2023-09-14 19:56:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5044, '启动节点', 5012, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:startNode', '#', 'admin', '2023-09-14 19:57:09', 'admin', '2023-09-14 19:57:09', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5045, '停止节点', 5012, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:stopNode', '#', 'admin', '2023-09-14 19:57:43', 'admin', '2023-09-14 19:57:43', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5046, '强制停止节点', 5012, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:stopNodeForce', '#', 'admin', '2023-09-14 19:58:34', 'admin', '2023-09-14 19:58:34', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5047, '重启节点', 5012, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:restartNode', '#', 'admin', '2023-09-14 19:59:06', 'admin', '2023-09-14 19:59:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5048, '删除节点', 5012, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:deleteNode', '#', 'admin', '2023-09-14 19:59:50', 'admin', '2023-09-14 19:59:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5049, '升级链', 5012, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:upgradeChain', '#', 'admin', '2023-09-14 20:00:41', 'admin', '2023-09-14 20:00:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5050, '获取部署进度', 5012, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:progress', '#', 'admin', '2023-09-14 20:01:42', 'admin', '2023-09-14 20:01:42', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5051, '启动链', 5012, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:startChain', '#', 'admin', '2023-09-14 20:02:46', 'admin', '2023-09-14 20:02:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5052, '停止链', 5012, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:stopChain', '#', 'admin', '2023-09-14 20:03:14', 'admin', '2023-09-14 20:03:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5053, '重启链', 5012, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:restartChain', '#', 'admin', '2023-09-14 20:03:41', 'admin', '2023-09-14 20:03:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5054, '删除链', 5012, 16, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:deleteChain', '#', 'admin', '2023-09-14 20:04:19', 'admin', '2023-09-14 20:04:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5055, '异常用户信息', 5063, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:transAudit:externalAccount', '#', 'admin', '2023-09-14 20:15:56', 'admin', '2023-09-14 22:37:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5056, '外部合约信息', 5064, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:transAudit:externalContract', '#', 'admin', '2023-09-14 20:16:47', 'admin', '2023-09-14 22:38:07', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5057, '群组相关信息查询', 5002, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:groups:query', '#', 'admin', '2023-09-14 22:10:36', 'admin', '2023-09-14 22:10:36', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5058, '群组操作', 5002, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:groups:operate', '#', 'admin', '2023-09-14 22:12:18', 'admin', '2023-09-14 22:12:34', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5059, '获取某个合约方法', 5005, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:contract:getMethod', '#', 'admin', '2023-09-14 22:19:42', 'admin', '2023-09-14 22:19:42', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5060, '添加合约方法', 5005, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:contract:addMethod', '#', 'admin', '2023-09-14 22:20:18', 'admin', '2023-09-14 22:20:18', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5061, '交易审计', 5000, 9, 'audit', NULL, NULL, 1, 0, 'M', '0', '0', 'bcos:transAudit', 'validCode', 'admin', '2023-09-14 22:29:26', 'admin', '2023-09-14 22:34:27', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5062, '用户交易', 5061, 1, 'transactionCharts', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:transAudit:userTrans', '#', 'admin', '2023-09-14 22:31:35', 'admin', '2023-09-14 22:31:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5063, '异常用户', 5061, 2, 'unusualUser', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:transAudit:unusualUser', '#', 'admin', '2023-09-14 22:32:55', 'admin', '2023-09-14 22:32:55', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5064, '异常合约', 5061, 3, 'unusualContract', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:transAudit:unusualContract', '#', 'admin', '2023-09-14 22:33:30', 'admin', '2023-09-14 22:33:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5065, '更新节点描述', 5012, 17, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:updateNodeDesc', '#', 'admin', '2023-09-14 22:46:51', 'admin', '2023-09-14 22:47:00', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5066, '获取委员会投票列表', 5030, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:listGovernVote', '#', 'admin', '2023-09-14 23:09:02', 'admin', '2023-09-14 23:09:16', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5067, '删除合约状态记录', 5030, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:delContractStatusRec', '#', 'admin', '2023-09-14 23:10:18', 'admin', '2023-09-14 23:10:18', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5068, '新增委员投票', 5030, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:grantCommittee', '#', 'admin', '2023-09-14 23:19:50', 'admin', '2023-09-14 23:19:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5069, '撤销委员投票', 5030, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:revokeCommittee', '#', 'admin', '2023-09-14 23:21:14', 'admin', '2023-09-14 23:21:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5070, '修改投票权重', 5030, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:updateCommitteeWeight', '#', 'admin', '2023-09-14 23:22:56', 'admin', '2023-09-14 23:22:56', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5071, '修改投票阈值', 5030, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:updateThreshold', '#', 'admin', '2023-09-14 23:23:51', 'admin', '2023-09-14 23:23:51', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5072, '新增运维', 5030, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:grantOperator', '#', 'admin', '2023-09-14 23:25:19', 'admin', '2023-09-14 23:25:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5073, '删除运维', 5030, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:revokeOperator', '#', 'admin', '2023-09-14 23:25:54', 'admin', '2023-09-14 23:25:54', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5074, '冻结账户', 5030, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:freezeAccount', '#', 'admin', '2023-09-14 23:26:57', 'admin', '2023-09-14 23:26:57', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5075, '解冻账户', 5030, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:unfreezeAccount', '#', 'admin', '2023-09-14 23:27:28', 'admin', '2023-09-14 23:27:28', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5076, '更新用户的权限状态', 5030, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:updatePermission', '#', 'admin', '2023-09-14 23:32:50', 'admin', '2023-09-14 23:32:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5077, '授权用户', 5030, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:grantPermission', '#', 'admin', '2023-09-14 23:33:33', 'admin', '2023-09-14 23:33:33', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5078, '撤销用户权限', 5030, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:sys:revokePermission', '#', 'admin', '2023-09-14 23:34:26', 'admin', '2023-09-14 23:34:26', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5079, '节点共识操作管理', 5012, 18, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chain:nodeManage', '#', 'admin', '2023-09-14 23:50:41', 'admin', '2023-09-14 23:50:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5080, '合约状态管理', 5005, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:contract:contractStatusManage', '#', 'admin', '2023-09-14 23:54:11', 'admin', '2023-09-14 23:54:11', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5081, '链上用户操作', 5009, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:privateKeyManagement:userOperate', '#', 'admin', '2023-09-15 00:12:31', 'admin', '2023-09-15 00:12:31', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5082, '订阅事件', 5000, 10, 'subscribe', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'message', 'admin', '2023-09-15 00:21:32', 'admin', '2023-09-15 00:21:32', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5083, '出块事件', 5082, 1, 'blockEvent', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:subscribeEvent:blockEvent', '#', 'admin', '2023-09-15 00:22:19', 'admin', '2023-09-15 00:25:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5084, '合约事件', 5082, 2, 'contractEvent', 'blank', NULL, 1, 0, 'C', '0', '0', 'bcos:subscribeEvent:blockEvent', '#', 'admin', '2023-09-15 00:23:04', 'admin', '2023-09-15 00:23:04', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5085, '新建区块链', 3004, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:chains:new', '#', 'admin', '2023-09-25 15:03:34', 'admin', '2023-09-25 15:03:34', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5086, '链权限管理', 3005, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:chains:auth', '#', 'admin', '2023-09-26 18:08:14', 'admin', '2023-09-26 18:08:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5087, '新建证书/用户', 3001, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:account:new', '#', 'admin', '2023-10-16 14:34:42', 'admin', '2023-10-16 14:34:42', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5088, '快速生成证书', 3001, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:account:OneGenerate', '#', 'admin', '2023-10-16 14:39:46', 'admin', '2023-10-16 14:39:46', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5089, '查看证书', 3001, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:account:view', '#', 'admin', '2023-10-16 14:42:09', 'admin', '2023-10-16 14:42:09', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5090, '导入证书', 3001, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:account:import', '#', 'admin', '2023-10-16 14:43:12', 'admin', '2023-10-16 14:43:12', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5091, '删除证书/用户', 3001, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:account:delete', '#', 'admin', '2023-10-16 14:47:26', 'admin', '2023-10-16 14:47:26', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5092, '修改链配置', 3005, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:chains:config', '#', 'admin', '2023-10-16 15:20:50', 'admin', '2023-10-16 15:20:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5093, '下载SDK配置', 3005, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:DownloadSdkConfig', '#', 'admin', '2023-10-16 15:27:29', 'admin', '2023-10-16 15:27:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5094, '连接浏览器', 3005, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:ExplorerSubscribe', '#', 'admin', '2023-10-16 15:29:56', 'admin', '2023-10-16 15:29:56', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5095, '删除链', 3004, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:chains:delete', '#', 'admin', '2023-10-16 15:38:23', 'admin', '2023-10-16 15:38:23', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5096, '下载链配置', 3004, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:DownloadChainConfig', '#', 'admin', '2023-10-16 17:03:11', 'admin', '2023-10-16 17:03:11', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5097, '节点启/停/删', 3009, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:nodes:operate', '#', 'admin', '2023-10-16 17:19:17', 'admin', '2023-10-16 17:19:17', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5098, '新建节点', 3009, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:nodes:new', '#', 'admin', '2023-10-16 17:20:36', 'admin', '2023-10-16 17:20:36', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5099, '投票', 3008, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:votes:vote', '#', 'admin', '2023-10-16 17:41:07', 'admin', '2023-10-16 17:41:07', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5100, '部署合约', 3006, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:deploy', '#', 'admin', '2023-10-16 17:52:20', 'admin', '2023-10-16 17:52:20', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5101, '发起上链', 3007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:invoke', '#', 'admin', '2023-10-16 17:53:43', 'admin', '2023-10-16 17:53:43', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5102, '冻结合约', 3006, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:freeze', '#', 'admin', '2023-10-16 18:01:52', 'admin', '2023-10-16 18:01:52', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5103, '解冻合约', 3006, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:unfreeze', '#', 'admin', '2023-10-16 18:02:30', 'admin', '2023-10-16 18:02:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5104, '注销合约', 3006, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:revoke', '#', 'admin', '2023-10-16 18:04:52', 'admin', '2023-10-16 18:04:52', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5105, '升级合约', 3006, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:upgrade', '#', 'admin', '2023-10-16 18:06:03', 'admin', '2023-10-16 18:06:03', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5106, '编辑合约', 3006, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:modify', '#', 'admin', '2023-10-16 18:08:15', 'admin', '2023-10-16 18:09:03', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5107, '删除合约', 3006, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'cm:contracts:delete', '#', 'admin', '2023-10-16 18:10:56', 'admin', '2023-10-16 18:10:56', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5108, '添加主机', 2000, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'host:add', '#', 'admin', '2023-10-20 14:11:15', 'admin', '2023-10-20 14:11:15', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5109, '删除主机', 2000, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'host:delete', '#', 'admin', '2023-10-20 14:11:42', 'admin', '2023-10-20 14:11:42', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5110, '新增链', 5011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chains:add', '#', 'admin', '2023-10-20 14:19:15', 'admin', '2023-10-20 14:19:15', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5111, '删除链', 5011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:chains:delete', '#', 'admin', '2023-10-20 14:19:47', 'admin', '2023-10-20 14:19:47', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5112, '新增链', 4011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chains:add', '#', 'admin', '2023-10-20 14:20:30', 'admin', '2023-10-20 14:20:30', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5113, '删除链', 4011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:chains:delete', '#', 'admin', '2023-10-20 14:20:59', 'admin', '2023-10-20 14:20:59', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5114, '修改应用', 5026, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos:appManagement:updateApp', '#', 'admin', '2023-10-31 11:38:59', 'admin', '2023-10-31 11:38:59', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5115, '修改应用', 4026, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bcos3:appManagement:updateApp', '#', 'admin', '2023-10-31 16:48:11', 'admin', '2023-10-31 16:48:11', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(150) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `oss_id` bigint(20) NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) NOT NULL COMMENT 'URL地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新人',
  `service` varchar(20) NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='OSS对象存储表';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint(20) NOT NULL COMMENT '主建',
  `config_key` varchar(20) NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) DEFAULT '' COMMENT '域',
  `access_policy` char(1) NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对象存储配置表';

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'minio', 'webase', 'webase1234', 'webase', '', 'minio:9000', '', 'N', '', '1', '0', '', 'admin', '2023-09-05 01:28:45', 'admin', '2023-09-05 01:28:45', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'webase', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2023-09-05 01:28:45', 'admin', '2023-09-05 01:28:45', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'webase', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2023-09-05 01:28:45', 'admin', '2023-09-05 01:28:45', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'webase-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2023-09-05 01:28:45', 'admin', '2023-09-05 01:28:45', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 'image', 'webase', 'webase1234', 'webase', 'image', 'localhost:9000', '', 'N', '', '1', '1', '', 'admin', '2023-09-05 01:28:45', 'admin', '2023-09-05 01:28:45', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-21 15:46:54', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '访客角色', 'common', 4, '5', 0, 1, '0', '0', 'admin', '2023-08-21 15:46:54', 'admin', '2023-09-25 15:10:23', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '开发角色', 'dev', 3, '3', 1, 1, '0', '0', 'admin', '2023-08-31 13:54:15', 'admin', '2023-09-25 15:09:30', '开发角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '链管理员', 'chainAdmin', 2, '4', 1, 1, '0', '0', 'admin', '2023-09-19 16:04:35', 'admin', '2023-09-19 16:04:35', '链管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 5094);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 3012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4080);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4081);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 4084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5080);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5081);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5087);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5089);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5090);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5093);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5094);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5098);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 5115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 3012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4065);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4066);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4067);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4068);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4069);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4070);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4071);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4072);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4074);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4075);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4076);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4077);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4078);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4079);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4080);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4081);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 4084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5065);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5066);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5067);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5068);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5069);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5070);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5071);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5072);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5074);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5075);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5076);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5077);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5078);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5079);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5080);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5081);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5085);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5086);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5087);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5088);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5089);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5090);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5091);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5092);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5093);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5094);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5095);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5096);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5097);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5098);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5099);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 5115);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 100, 'admin', '超级管理员', 'sys_user', '', '18888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-09-05 01:28:44', 'admin', '2023-09-05 01:28:44', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AT transaction mode undo table';

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

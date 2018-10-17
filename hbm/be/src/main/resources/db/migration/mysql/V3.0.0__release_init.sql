/*
Navicat MySQL Data Transfer

Source Database       : db_hbm_dev

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-03-31 18:07:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account` (
  `ACCOUNT_ID_` bigint(20) NOT NULL COMMENT ' 登录账号编码',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户ID',
  `LOGIN_NAME_` varchar(128) NOT NULL COMMENT '登录名',
  `LOGIN_PWD_` varchar(256) NOT NULL COMMENT '密码',
  `DESCR_` text COMMENT '描述',
  `IS_VALID_` tinyint(4) DEFAULT '1' COMMENT '是否有效(1:有效;0:无效)',
  `IS_LOCK_` tinyint(4) DEFAULT '0' COMMENT '是否被锁定(1:锁定;0:正常)',
  `LAST_LOGIN_IP_` varchar(64) DEFAULT NULL COMMENT '最后登录IP',
  `LAST_LOGIN_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `LAST_PWD_CHANGE_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次密码修改时间',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`ACCOUNT_ID_`),
  UNIQUE KEY `AK_Key_2` (`LOGIN_NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES ('1', '1', '1', 'super', 'a72982d91c5b9cf054826734494b54024e59e851', '', '1', '0', '0:0:0:0:0:0:0:1', '2017-03-30 20:19:30', '2016-11-25 14:16:12', '0', '0', '0000-00-00 00:00:00', '2017-03-30 20:11:52', '1', '1');
INSERT INTO `sys_account` VALUES ('2', '1', '2', 'test', 'eb428ac4cb5e75bdf62a970929ec4fe4b4c3468e', '', '1', '0', '0:0:0:0:0:0:0:1', '2017-03-30 20:19:06', null, '0', '0', '0000-00-00 00:00:00', '2017-03-30 20:14:38', '1', '1');

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `ATT_ID_` bigint(20) NOT NULL COMMENT '附件编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ATT_CODE_` varchar(64) NOT NULL COMMENT '附件编码',
  `FILE_ID_` bigint(20) DEFAULT NULL COMMENT '文件编号',
  `BIZ_CODE_` varchar(64) DEFAULT NULL COMMENT '业务编码',
  `BIZ_ID_` bigint(20) DEFAULT NULL COMMENT '业务编号',
  `SUB_BIZ_ID_` bigint(20) DEFAULT NULL COMMENT '子业务编号',
  `ATT_NAME_` varchar(128) DEFAULT NULL COMMENT '附件名称',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`ATT_ID_`),
  UNIQUE KEY `AK_Key_2` (`ATT_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统附件表';

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
CREATE TABLE `sys_auth` (
  `AUTH_ID_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `AUTH_CODE_` varchar(100) DEFAULT NULL COMMENT '编码',
  `AUTH_NAME_` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '部门英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `MODEL_ID_` bigint(20) NOT NULL COMMENT '模型编号',
  `AUTH_CATEGORY_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '权限类型 1：主权限  2：附属权限',
  `OPERATION_ID_` bigint(20) DEFAULT NULL COMMENT '操作编号',
  `IS_INHERITABLE_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可继承，判断用户是否可控制下属的对应权限',
  `STYLE_` varchar(256) NOT NULL COMMENT 'CSS',
  `URI_` varchar(512) NOT NULL COMMENT '默认uri',
  `SORT_NO_` int(11) NOT NULL COMMENT '排序',
  `IS_VISIBLE_` tinyint(4) DEFAULT '1' COMMENT '是否可见',
  `TIP_` varchar(256) DEFAULT NULL COMMENT '提示信息',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  `ICON_ID_` bigint(20) DEFAULT NULL COMMENT 'ICON编号',
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否公共权限,如果是公共权限URL功能校验不拦截校验。（0：公共权限，1：非公共权限）',
  PRIMARY KEY (`AUTH_ID_`),
  UNIQUE KEY `AK_Key_2` (`AUTH_CODE_`) USING BTREE,
  KEY `FK_Reference_34` (`ICON_ID_`) USING BTREE,
  CONSTRAINT `sys_auth_ibfk_1` FOREIGN KEY (`ICON_ID_`) REFERENCES `sys_icon` (`ICON_ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=1063346679122140325 DEFAULT CHARSET=utf8 COMMENT='系统权限表';

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
INSERT INTO `sys_auth` VALUES ('1053269288255097393', '1', 'sysManagementMenu:view', '系统管理:访问', 'sysManagementMenu:view', 'sysManagementMenu.view', '1052481646384715198', '1', '1052481659203556933', '1', '', 'v-system', '1', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-03-24 16:58:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288340032050', '1', 'sysAuthManagementMenu:view', '权限管理:访问', 'sysAuthManagementMenu:view', 'sysAuthManagementMenu.view', '1052481646805194175', '1', '1052481659203556933', '1', '', 'v-auth', '1', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-03-24 16:58:15', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288340032051', '1', 'dauthManagementMenu:view', '数据权限:访问', 'sysDauthManagementMenu:view', 'sysDauthManagementMenu:view', '1052481646805194176', '1', '1052481659203556933', '1', '', '', '1', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2016-12-10 10:57:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288410286643', '1', 'sysUser:view', '用户管理:访问', 'sysUser:view', 'sysUser.view', '1052481647455311297', '1', '1052481659203556933', '1', '', '/sys/sysUser/view;/sys/sysUser/list;/sys/sysUser/aboutOne\r\n', '9', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-03-24 14:44:17', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288410286644', '1', 'dauthOperatorSupport:view', '运算符支持:访问', 'sysDauthOperatorSupport:view', 'sysDauthOperatorSupport:view', '1052481647455311298', '1', '1052481659203556933', '1', '', '/sys/dauthOperator/supportView', '103', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-02-28 12:01:51', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288410286645', '1', 'sysMetadata:view', '元数据管理:访问', 'sysMetadata:view', 'sysMetadata:view', '1052481647455311299', '1', '1052481659203556933', '1', '', '/sys/sysMetadata/metadataView', '101', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2016-12-10 10:57:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288410286646', '1', 'dauth:view', '数据权限:访问', 'sysDauth:view', 'sysDauth:view', '1052481647455311300', '1', '1052481659203556933', '1', '', '/sys/dauth/view', '101', '1', '', '', '0', null, '2016-12-10 10:57:29', '2016-12-10 10:57:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288410286667', '1', 'dauthUsage:view', '数据权限应用:访问', 'sysDauthUsage:view', 'sysDauthUsage:view', '1052481647455311301', '1', '1052481659203556933', '1', '', '/sys/dauthUsage/view', '101', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2016-12-10 10:57:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288579107380', '1', 'sysUser:create', '用户管理:创建', 'sysUser:create', 'sysUser.create', '1052481647455311297', '1', '1052481659203557933', '1', 'icon_auto_colorful__plus', '/sys/sysUser/addUser', '10', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-03-07 10:41:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288618953269', '1', 'sysUser:update', '用户管理:更新', 'sysUser:update', 'sysUser.update', '1052481647455311297', '1', '1052481659203557963', '1', '', '/sys/sysUser/updUser', '11', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-02-28 17:27:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288660896310', '1', 'sysUser:delete', '用户管理:删除', 'sysUser:delete', 'sysUser.delete', '1052481647455311297', '1', '1052481659203558275', '1', '', '/sys/sysUser/delUser', '12', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-02-28 17:27:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288709130807', '1', 'sysRole:view', '角色管理:访问', 'sysRole:view', 'sysRole.view', '1052481648127448515', '1', '1052481659203556933', '1', '', '/sys/sysRole/view;/sys/sysRole/list;/sys/sysRole/aboutOne', '13', '1', '', '', '0', '0', '2016-12-10 10:57:29', '2017-03-24 14:11:04', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288764705336', '1', 'sysRole:create', '角色管理:创建', 'sysRole:create', 'sysRole.create', '1052481648127448515', '1', '1052481659203557933', '1', '', '/sys/sysRole/create', '14', '1', null, null, '0', '0', '2016-12-10 10:57:29', '2016-12-10 10:57:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288804551225', '1', 'sysRole:update', '角色管理:更新', 'sysRole:update', 'sysRole.update', '1052481648127448515', '1', '1052481659203557963', '1', '', '/sys/sysRole/update', '15', '1', null, null, '0', '0', '2016-12-10 10:57:29', '2016-12-10 10:57:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288870611514', '1', 'sysRole:delete', '角色管理:删除', 'sysRole:delete', 'sysRole.delete', '1052481648127448515', '1', '1052481659203558275', '1', '', '/sys/sysRole/delete', '16', '1', null, null, '0', '0', '2016-12-10 10:57:30', '2016-12-10 10:57:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269288910457403', '1', 'sysAuthMenu:view', '功能权限:访问', 'sysAuthMenu:view', 'sysAuthMenu.view', '1052481648470332868', '1', '1052481659203556933', '1', '', '/sys/sysAuthMenu/view', '1', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-02-27 10:43:19', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289002732093', '1', 'sysModel:create', '模块配置:创建', 'sysModel:create', 'sysModel.create', '1052481648827897285', '1', '1052481659203557933', '1', '', '/sys/model/create', '22', '1', null, null, '0', '0', '2016-12-10 10:57:30', '2016-12-10 10:57:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289043626558', '1', 'sysModel:update', '模块配置:更新', 'sysModel:update', 'sysModel.update', '1052481648827897285', '1', '1052481659203557963', '1', '', '/sys/model/update', '23', '1', null, null, '0', '0', '2016-12-10 10:57:30', '2016-12-10 10:57:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289082423871', '1', 'sysModel:delete', '模块配置:删除', 'sysModel:delete', 'sysModel.delete', '1052481648827897285', '1', '1052481659203558275', '1', '', '/sys/model/delete', '24', '1', null, null, '0', '0', '2016-12-10 10:57:30', '2016-12-10 10:57:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289128561216', '1', 'sysOperation:view', '操作类型配置:访问', 'sysOperation:view', 'sysOperation.view', '1052481649176024518', '1', '1052481659203556933', '1', '', '/sys/sysOperation/view', '25', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-03-29 17:12:26', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289174698561', '1', 'sysOperation:create', '操作类型配置:创建', 'sysOperation:create', 'sysOperation.create', '1052481649176024518', '1', '1052481659203557933', '1', '', '/sys/sysOperation/create', '26', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-03-29 17:12:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289259633218', '1', 'sysOperation:update', '操作类型配置:更新', 'sysOperation:update', 'sysOperation.update', '1052481649176024518', '1', '1052481659203557963', '1', '', '/sys/sysOperation/update', '27', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-03-29 17:12:43', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289370782275', '1', 'sysOperation:delete', '操作类型配置:删除', 'sysOperation:delete', 'sysOperation.delete', '1052481649176024518', '1', '1052481659203558275', '1', '', '/sys/sysOperation/delete', '28', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-03-29 17:12:51', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289539603013', '1', 'sysAuth:create', '权限管理:创建', 'sysAuth:create', 'sysAuth.create', '1052481649506325959', '1', '1052481659203557933', '0', '', '/sys/sysAuthMenu/create', '30', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-02-27 10:55:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289616149062', '1', 'sysAuth:update', '权限管理:更新', 'sysAuth:update', 'sysAuth.update', '1052481649506325959', '1', '1052481659203557963', '1', '', '/sys/sysAuthMenu/update', '31', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-02-27 10:56:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289722055239', '1', 'sysAuth:delete', '权限管理:删除', 'sysAuth:delete', 'sysAuth.delete', '1052481649506325959', '1', '1052481659203558275', '1', '', '/sys/sysAuthMenu/delete', '32', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-03-29 11:12:48', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289776581192', '1', 'sysOrg:view', '组织架构:访问', 'sysOrganizationMenu:view', 'sysOrganizationMenu.view', '1052481649938339272', '1', '1052481659203556933', '1', '', '/sys/org/view', '33', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-02-28 20:21:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289816427081', '1', 'sysOrg:jobList', '职务配置:分页查询', '', '', '1052481650369304009', '2', '1052481659203556933', '1', '', '/sys/org/jobList', '37', '1', '', '', '0', '0', '2016-12-10 10:57:30', '2017-02-28 18:59:02', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289870953034', '1', 'sysOrg:allJobs', '职务配置:全部查询', '', '', '1052481650369304009', '2', '1060262570224060575', '1', '', '/sys/org/allJobs', '38', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:00:02', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289921284683', '1', 'sysOrg:updJob', '职务配置:更新', '', '', '1052481650369304009', '1', '1052481659203557963', '1', '', '/sys/org/updJob', '40', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:01:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269289975810636', '1', 'sysOrg:delJob', '职务配置:删除', '', '', '1052481650369304009', '1', '1052481659203558275', '1', '', '/sys/org/delJob', '42', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:02:23', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290030336589', '1', 'sysOrg:newPos', '岗位配置:新增', '', '', '1052481650765665738', '1', '1060512414373153244', '1', '', '/sys/org/newPos/%s', '1', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-03-30 18:55:46', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290079619662', '1', 'sysOrg:editPos', '岗位配置:修改', '', '', '1052481650765665738', '1', '1052481659203557933', '1', '', '/sys/org/editPos/%d', '2', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-03-30 18:55:53', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290156165711', '1', 'sysOrg:aboutPos', '岗位配置:关于', '', '', '1052481650765665738', '2', '1060512414373153244', '1', '', '/sys/org/aboutPos/%d', '3', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:11:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290220128848', '1', 'sysOrg:posView', '岗位配置:选择弹窗', '', '', '1052481650765665738', '2', '1060512414373153244', '1', '', '/sys/org/posView/%d', '4', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:13:28', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290258926161', '1', 'sysOrg:newGroup', '小组管理:新增', '', '', '1052481651160978891', '1', '1060512414373153244', '1', '', '/sys/org/newGroup/%d', '1', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-03-30 18:56:10', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290312403538', '1', 'sysOrg:editGroup', '小组管理:修改', '', '', '1052481651160978891', '1', '1060512414373153244', '1', '', '/sys/org/editGroup/%d', '2', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-03-30 18:56:18', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290354346579', '1', 'sysOrg:aboutGroup', '小组管理:关于', '', '', '1052481651160978891', '2', '1060512414373153244', '1', '', '/sys/org/aboutGroup/%d', '3', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:42:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290406775380', '1', 'sysOrg:delGroup', '小组管理:删除', '', '', '1052481651160978891', '1', '1052481659203558275', '1', '', '/sys/org/delGroup/%d', '6', '1', '', '', '0', '0', '2016-12-10 10:57:31', '2017-02-28 19:39:20', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290698279514', '1', 'sysConfigurationMenu:view', '配置运维:访问', 'sysConfigurationMenu:view', 'sysConfigurationMenu.view', '1052481652225283534', '1', '1052481659203556933', '1', '', '', '57', '1', null, null, '0', '0', '2016-12-10 10:57:31', '2016-12-10 10:57:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290745465435', '1', 'sysConfigMenu:view', '系统设置:访问', 'sysConfigMenu:view', 'sysConfigMenu.view', '1052481652225283555', '1', '1052481659203556933', '1', '', '', '61', '1', null, null, '0', '0', '2016-12-10 10:57:31', '2016-12-10 10:57:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290790554204', '1', 'sysConfig:view', '系统设置:访问', 'sysConfig:view', 'sysConfig.view', '1052481652945655248', '1', '1052481659203556933', '1', '', '/sys/sysConfig/view', '65', '1', null, null, '0', '0', '2016-12-10 10:57:31', '2016-12-10 10:57:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290838788701', '1', 'sysConfig:create', '系统设置:创建', 'sysConfig:create', 'sysConfig.create', '1052481652945655248', '1', '1052481659203557933', '1', '', '/sys/sysConfig/create', '66', '1', null, null, '0', '0', '2016-12-10 10:57:31', '2016-12-10 10:57:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290882828894', '1', 'sysConfig:update', '系统设置:更新', 'sysConfig:update', 'sysConfig.update', '1052481652945655248', '1', '1052481659203557963', '1', '', '/sys/sysConfig/update', '67', '1', null, null, '0', '0', '2016-12-10 10:57:31', '2016-12-10 10:57:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290933160543', '1', 'sysConfig:delete', '系统设置:删除', 'sysConfig:delete', 'sysConfig.delete', '1052481652945655248', '1', '1052481659203558275', '1', '', '/sys/sysConfig/delete', '68', '1', null, null, '0', '0', '2016-12-10 10:57:32', '2016-12-10 10:57:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269290986637920', '1', 'sysDictMenu:view', '字典配置:访问', 'sysDictMenu:view', 'sysDictMenu.view', '1052481653319996881', '1', '1052481659203556933', '1', '', '/sys/sysDict/view', '69', '1', null, null, '0', '0', '2016-12-10 10:57:32', '2016-12-10 10:57:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291229907554', '1', 'sysDictGroup:create', '字典组配置:创建', 'sysDictGroup:create', 'sysDictGroup.create', '1052481653695387090', '1', '1052481659203557933', '1', '', '/sys/sysDict/addGroup', '74', '1', '', '', '0', '0', '2016-12-10 10:57:32', '2017-02-27 19:14:19', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291350493795', '1', 'sysDictGroup:update', '字典组配置:更新', 'sysDictGroup:update', 'sysDictGroup.update', '1052481653695387090', '1', '1052481659203557963', '1', '', '/sys/sysDict/updGroup', '75', '1', '', '', '0', '0', '2016-12-10 10:57:32', '2017-02-27 19:15:24', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291475274340', '1', 'sysDictGroup:delete', '字典组配置:删除', 'sysDictGroup:delete', 'sysDictGroup.delete', '1052481653695387090', '1', '1052481659203558275', '1', '', '/sys/sysDict/delGroup', '76', '1', '', '', '0', '0', '2016-12-10 10:57:32', '2017-02-27 19:22:13', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291604249190', '1', 'sysDictItem:create', '字典项配置:创建', 'sysDictItem:create', 'sysDictItem.create', '1052481654041417171', '1', '1052481659203557933', '0', '', '/sys/sysDict/addItem', '78', '1', '', '', '0', '0', '2016-12-10 10:57:32', '2017-02-27 19:23:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291641997927', '1', 'sysDictItem:update', '字典项配置:更新', 'sysDictItem:update', 'sysDictItem.update', '1052481654041417171', '1', '1052481659203557963', '0', '', '/sys/sysDict/updItem', '79', '1', '', '', '0', '0', '2016-12-10 10:57:32', '2017-02-27 19:23:28', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291687086696', '1', 'sysDictItem:delete', '字典项配置:删除', 'sysDictItem:delete', 'sysDictItem.delete', '1052481654041417171', '1', '1052481659203558275', '0', '', '/sys/sysDict/delItem', '80', '1', '', '', '0', '0', '2016-12-10 10:57:32', '2017-02-27 19:24:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291791944297', '1', 'sysLogMenu:view', '日志管理:访问', 'sysLogMenu:view', 'sysLogMenu.view', '1052481654405273044', '1', '1052481659203556933', '1', '', '', '81', '1', null, null, '0', '0', '2016-12-10 10:57:32', '2016-12-10 10:57:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269291956570730', '1', 'sysLog:view', '系统日志:访问', 'sysLog:view', 'sysLog.view', '1052481654405273056', '1', '1052481659203556933', '1', '', '/sys/sysLog/view', '85', '1', null, null, '0', '0', '2016-12-10 10:57:32', '2016-12-10 10:57:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269292139022958', '1', 'sysUserLog:view', '个人日志:访问', 'sysUserLog:view', 'sysUserLog.view', '1052481654405273057', '1', '1052481659203556933', '1', '', '/sys/sysUserLog/view', '89', '1', '', '', '0', '0', '2016-12-10 10:57:33', '2017-01-16 14:45:18', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269292326718066', '1', 'sysResourceMenu:view', '资源管理:访问', 'sysResourceMenu:view', 'sysResourceMenu.view', '1052481654739768666', '1', '1052481659203556933', '1', '', '', '93', '1', null, null, '0', '0', '2016-12-10 10:57:33', '2016-12-10 10:57:33', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269292373903987', '1', 'sysAttachMenu:view', '附件管理:访问', 'sysAttachMenu:view', 'sysAttachMenu.view', '1052481654739768789', '1', '1052481659203556933', '1', '', '/sys/sysFile/view', '1', '1', '', '', '0', '0', '2016-12-10 10:57:33', '2017-03-29 11:16:52', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269292864637564', '1', 'sysIcon:view', '图标管理:访问', 'sysIcon:view', 'sysIcon.view', '1052481655604843993', '1', '1052481659203556933', '1', '', '/sys/sysIcon/view', '1', '1', '', '', '0', '0', '2016-12-10 10:57:33', '2017-02-28 10:01:20', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269292932795005', '1', 'sysIcon:create', '图标管理:创建', 'sysIcon:create', 'sysIcon.create', '1052481655604843993', '1', '1052481659203557933', '0', '', '/sys/sysIcon/addIcon', '110', '1', '', '', '0', '0', '2016-12-10 10:57:33', '2017-02-28 09:50:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269292977883774', '1', 'sysIcon:update', '图标管理:更新', 'sysIcon:update', 'sysIcon.update', '1052481655604843993', '1', '1052481659203557963', '0', '', '/sys/sysIcon/updIcon', '111', '1', '', '', '0', '0', '2016-12-10 10:57:33', '2017-02-28 09:51:15', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293014583935', '1', 'sysIcon:delete', '图标管理:删除', 'sysIcon:delete', 'sysIcon.delete', '1052481655604843993', '1', '1052481659203558275', '0', '', '/sys/sysIcon/delIcon', '112', '1', '', '', '0', '0', '2016-12-10 10:57:34', '2017-02-28 09:51:38', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293059672704', '1', 'sysMonitorMenu:view', '系统监控:访问', 'sysMonitorMenu:view', 'sysMonitorMenu.view', '1052481655704243258', '1', '1052481659203556933', '1', '', '', '113', '1', null, null, '0', '0', '2016-12-10 10:57:34', '2016-12-10 10:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293111052929', '1', 'sysJVMMonitor:view', 'JVM信息:访问', 'sysJVMMonitor:view', 'sysJVMMonitor.view', '1052481655704243260', '1', '1052481659203556933', '1', '', '/sys/info/jvmView', '117', '1', null, '/sys/sysJVMMonitor/view', '0', '0', '2016-12-10 10:57:34', '2016-12-10 10:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293281970821', '1', 'sysServerMonitor:view', '服务器信息:访问', 'sysServerMonitor:view', 'sysServerMonitor.view', '1052481655704243262', '1', '1052481659203556933', '1', '', '/sys/info/serverView', '121', '1', null, '/sys/sysServerMonitor/view', '0', '0', '2016-12-10 10:57:34', '2016-12-10 10:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293456034441', '1', 'sysSystemMonitor:view', '系统运行信息:访问', 'sysSystemMonitor:view', 'sysSystemMonitor.view', '1052481655704243263', '1', '1052481659203556933', '1', '', '/sys/info/systemView', '125', '1', '', '/sys/sysRunMonitor/view', '0', '0', '2016-12-10 10:57:34', '2017-02-07 11:16:20', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293698255501', '1', 'sysReportMenu:view', '系统报表:访问', 'sysReportMenu:view', 'sysReportMenu.view', '1052481655947728344', '1', '1052481659203556933', '1', '', '', '129', '1', null, null, '0', '0', '2016-12-10 10:57:34', '2016-12-10 10:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293742295694', '1', 'sysStatisticalReportMenu:view', '统计报表:访问', 'sysStatisticalReportMenu:view', 'sysStatisticalReportMenu.view', '1052481656350381529', '1', '1052481659203556933', '1', '', '', '133', '1', null, null, '0', '0', '2016-12-10 10:57:34', '2016-12-10 10:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293802064527', '1', 'sysAuditReportMenu:view', '审计报表:访问', 'sysAuditReportMenu:view', 'sysAuditReportMenu.view', '1052481656748840460', '1', '1052481659203556933', '1', '', '', '137', '1', null, null, '0', '0', '2016-12-10 10:57:34', '2016-12-10 10:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269293872319120', '1', 'sysEmployeeOrgReport:view', '员工分布:访问', 'sysEmployeeOrgReport:view', 'sysEmployeeOrgReport.view', '1052481656748840410', '1', '1052481659203556933', '0', '', '/sys/report/sysEmployeeOrgReport/view', '141', '1', '', '', '0', '0', '2016-12-10 10:57:34', '2017-03-06 11:55:41', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294071548564', '1', 'sysEmployeeJobReport:view', '入职离职:访问', 'sysEmployeeJobReport:view', 'sysEmployeeJobReport.view', '1052481656748840422', '1', '1052481659203556933', '1', '', '/sys/report/sysEmployeeJobReport/view', '145', '1', '', '', '0', '0', '2016-12-10 10:57:35', '2017-03-07 14:33:38', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294289652376', '1', 'sysPersonalCenterMenu:view', '个人中心:访问', 'sysPersonalCenterMenu:view', 'sysPersonalCenterMenu.view', '1052481657072850395', '1', '1052481659203556933', '1', '', '', '149', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294338935449', '1', 'sysPersonalMenu:view', '个人中心:访问', 'sysPersonalMenu:view', 'sysPersonalMenu.view', '1052481657408394716', '1', '1052481659203556933', '1', '', '', '153', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294376684186', '1', 'sysPersonal:view', '我的信息:访问', 'sysPersonal:view', 'sysPersonal.view', '1052481657744987613', '1', '1052481659203556933', '1', '', '/sys/sysPersonal/personal/view', '157', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294457424540', '1', 'sysPersonal:update', '我的信息:更新', 'sysPersonal:update', 'sysPersonal.update', '1052481657744987613', '2', '1052481659203557963', '0', '', '/sys/sysPersonal/updBasicInfo', '159', '1', '', '', '0', '0', '2016-12-10 10:57:35', '2017-02-28 19:03:46', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294561233566', '1', 'sysModifyPwd:view', '修改密码:访问', 'sysModifyPwd:view', 'sysModifyPwd.view', '1052481658097309150', '1', '1052481659203556933', '1', '', '/sys/sysPersonal/modifyPwd/view', '161', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294677625504', '1', 'sysModifyPwd:update', '修改密码:更新', 'sysModifyPwd:update', 'sysModifyPwd.update', '1052481658097309150', '2', '1052481659203557963', '0', '', '/sys/sysPersonal/modifyPwd/update', '163', '1', '', '', '0', '0', '2016-12-10 10:57:35', '2017-02-28 19:07:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294762560162', '1', 'sysPersonalSetting:view', '个性化设置:访问', 'sysPersonalSetting:view', 'sysPersonalSetting.view', '1052481658449630687', '1', '1052481659203556933', '1', '', '/sys/sysPersonal/personalSetting/view', '165', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269294956546724', '1', 'sysPersonalSetting:update', '个性化设置:更新', 'sysPersonalSetting:update', 'sysPersonalSetting.update', '1052481658449630687', '2', '1052481659203557963', '1', '', '/sys/sysPersonal/personalSetting/update', '167', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269295056161446', '1', 'sysTaskMenu:view', '任务中心:访问', 'sysTaskMenu:view', 'sysTaskMenu.view', '1052481658842846688', '1', '1052481659203556933', '1', '', '', '169', '1', null, null, '0', '0', '2016-12-10 10:57:35', '2016-12-10 10:57:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269295116978855', '1', 'sysMyTask:view', '待办任务:访问', 'sysMyTask:view', 'sysMyTask.view', '1052481659203556833', '1', '1052481659203556933', '1', '', '/sys/sysTask/myTask/view', '173', '1', null, null, '0', '0', '2016-12-10 10:57:36', '2016-12-10 10:57:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269295156824744', '1', 'sysMyTask:create', '待办任务:创建', 'sysMyTask:create', 'sysMyTask.create', '1052481659203556833', '1', '1052481659203557933', '1', '', '/sys/sysTask/myTask/create', '174', '1', null, null, '0', '0', '2016-12-10 10:57:36', '2016-12-10 10:57:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269295214496425', '1', 'sysMyTask:update', '待办任务:更新', 'sysMyTask:update', 'sysMyTask.update', '1052481659203556833', '1', '1052481659203557963', '1', '', '/sys/sysTask/myTask/update', '175', '1', null, null, '0', '0', '2016-12-10 10:57:36', '2016-12-10 10:57:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1053269295260633770', '1', 'sysMyTask:delete', '待办任务:删除', 'sysMyTask:delete', 'sysMyTask.delete', '1052481659203556833', '1', '1052481659203558275', '1', '', '/sys/sysTask/myTask/delete', '176', '1', null, null, '0', '0', '2016-12-10 10:57:36', '2016-12-10 10:57:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1056744893101518814', '1', 'sysDemo:view', 'DEMO演示:访问', '', 'sysDemo:view', '1056741606000308184', '1', '1052481659203556933', '1', '', 'sysDemo:view', '1', '1', '', '', '0', '0', '2017-01-17 19:40:44', '2017-03-29 12:08:25', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1056745852093476833', '1', 'sysDemo1:view', 'DEMO演示:访问', '', 'sysDemo1:view', '1056745429913710559', '1', '1052481659203556933', '0', '', ' a', '1', '1', '', '', '0', '0', '2017-01-17 19:55:59', '2017-03-29 12:10:12', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1058615553282663736', '1', 'sysDruidMonitor:view', 'druid监控:访问', 'sysDruidMonitor:view', 'sysDruidMonitor:view', '1058615343450023223', '1', '1052481659203556933', '1', '', '/sys/info/druidView', '1', '1', '', '此功能权限只有超级管理员角色才可以访问，其它角色配置也无效。', '0', '0', '2017-02-07 11:14:05', '2017-02-07 11:20:15', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1058635541087889252', '1', 'ueditor:view', '富文本编辑器:访问', 'ueditor:view', 'ueditor:view', '1058634996701833057', '1', '1052481659203556933', '0', '', '/common/demo/ueditor/toDemoPage', '1', '1', '', '', '0', '0', '2017-02-07 16:31:46', '2017-03-29 12:10:33', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1058635600936413029', '1', 'excelDemo:view', 'Excel相关:访问', 'excelDemo:view', 'excelDemo:view', '1058635183551784802', '1', '1052481659203556933', '0', '', '/common/demo/excel/toExcelDemoPage', '1', '1', '', '', '0', '0', '2017-02-07 16:32:44', '2017-03-29 12:17:11', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1058635657762940774', '1', 'pdfDemo:view', 'PDF相关:访问', 'pdfDemo:view', 'pdfDemo:view', '1058635416398571363', '1', '1052481659203556933', '0', '', '/common/demo/pdf/toPdfDemoPage', '1', '1', '', '', '0', '0', '2017-02-07 16:33:38', '2017-03-29 12:17:23', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1059183295447480819', '1', 'fileDemo:view', '文件上传下载:访问', 'fileDemo:view', 'fileDemo:view', '1059183053449771506', '1', '1052481659203556933', '0', '', '/common/demo/fileDemo/toFileDemoPage', '1', '1', '', '', '0', '0', '2017-02-13 17:38:06', '2017-03-29 12:12:21', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1059277407171456111', '1', 'echartsDemo:show', 'ECharts报表:访问', 'echartsDemo:show', 'echartsDemo:show', '1059277349464124526', '1', '1052481659203556933', '0', '', '/common/demo/echart/toEchartDemoPage', '1', '1', '', '', '0', '0', '2017-02-14 18:33:58', '2017-03-29 12:18:09', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1059442833175271064', '1', 'mailDemo:show', 'UEditor邮件:访问', 'mailDemo:show', 'mailDemo:show', '1059442767489324695', '1', '1052481659203556933', '0', '', '/common/demo/mail/toMailDemoPage', '1', '1', '', '', '0', '0', '2017-02-16 14:23:20', '2017-03-29 12:18:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1059970917085303378', '1', 'singleCommitDemo:view', '防重复提交:访问', '', '', '1059970869698056785', '1', '1052481659203556933', '0', '', '/common/demo/singleCommit/toSingleCommit', '1', '1', '', '', '0', '0', '2017-02-22 10:17:00', '2017-03-29 12:18:59', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060425623704276216', '1', 'sysAuthMenu:list', '获得功能权限列表', '', '', '1052481648470332868', '2', '1060262570224060575', '0', '', '/sys/sysAuthMenu/list', '2', '1', '', '', '0', '0', '2017-02-27 10:44:22', '2017-02-27 10:44:22', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060425958750522618', '1', 'sysAuthMenu:detailView', '详情:访问', '', '', '1060425852316912889', '2', '1052481659203556933', '0', '', '/sys/sysAuthMenu/detail/%d/%d/%d', '1', '1', '', '', '0', '0', '2017-02-27 10:49:42', '2017-03-29 16:56:04', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060426547659115772', '1', 'sysAuthMenu:checkForm', 'URL重复/包含:校验', '', '', '1052481648470332868', '2', '1060262570224060575', '0', '', '/sys/sysAuthMenu/checkForm', '4', '1', '', '', '0', '0', '2017-02-27 10:59:03', '2017-03-29 16:58:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060427833277254912', '1', 'authManageWinView', '[公共]权限选择框:访问', '', '', '1060427695770143999', '2', '1052481659203556933', '0', '', '/sys/sysAuthMenu/authManageDialogView', '1', '1', '', '', '0', '0', '2017-02-27 11:19:29', '2017-02-28 14:20:59', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060428045272059138', '1', 'sysAuthMenu:aboutDialogView', '关于弹出框:访问', '', '', '1052481648470332868', '2', '1060262570224060575', '0', '', '/sys/sysAuthMenu/aboutDialogView', '5', '1', '', '', '0', '0', '2017-02-27 11:22:52', '2017-03-29 16:58:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060428170911386883', '1', 'sysAuthMenu:authManageWinList', '[公共]权限选择框全部数据', '', '', '1060427695770143999', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/authManageDialogList', '2', '1', '', '', '0', '0', '2017-02-27 11:24:51', '2017-02-28 14:21:19', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060428226958822660', '1', 'menuset:view', '功能权限列表主页:访问', '', '', '1060425468402830583', '1', '1052481659203556933', '0', '', '/sys/sysAuthMenu/menuset_view', '1', '1', '', '', '0', '0', '2017-02-27 11:25:45', '2017-03-29 17:08:22', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060428307722243333', '1', 'menuset_view:treeList', '菜单树:query', '', '', '1060425468402830583', '2', '1060262570224060575', '0', '', '/sys/sysAuthMenu/treeList', '2', '1', '', '', '0', '0', '2017-02-27 11:27:02', '2017-02-27 11:27:02', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060428430601719046', '1', 'sysAuthMenu:getGrantedAuthList', '[公共]获取已授权的数据列表', '', '', '1060427695770143999', '2', '1060262570224060575', '0', '', '/sys/sysAuthMenu/getGrantedAuthList', '505', '1', '', '', '0', '0', '2017-02-27 11:28:59', '2017-02-28 14:17:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060428592153726216', '1', 'menuSet:update', '顶部菜单更新', '', '', '1060425468402830583', '1', '1060262570224060575', '0', '', '/sys/sysAuthMenu/updateMenuSet', '7', '1', '', '', '0', '0', '2017-02-27 11:31:33', '2017-02-27 16:37:21', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060429383554927902', '1', 'sysRole:pageListByAuthId', '根据权限ID查询角色列表', '', '', '1052481648127448515', '2', '1060262570224060575', '0', '', '/sys/sysRole/pageListByAuthId', '10', '1', '', '', '0', '0', '2017-02-27 11:44:08', '2017-02-28 11:25:21', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060429497480613151', '1', 'sysUser:pageListByAuthId', '根据权限ID查询角色列表', '', '', '1052481647455311297', '2', '1060262570224060575', '0', '', '/sys/sysUser/pageListByAuthId', '1', '1', '', '', '0', '0', '2017-02-27 11:45:57', '2017-02-27 11:45:57', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060443227480767902', '1', 'sysOperation:list', '操作权限列表查询', '', '', '1052481649176024518', '2', '1060262570224060575', '0', '', '/sys/sysOperation/list', '1', '1', '', '', '0', '0', '2017-02-27 15:24:11', '2017-02-27 15:24:11', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060454137317508479', '1', 'sysConfig:aboutOneView', '关于本条信息', '', '', '1052481652945655248', '2', '1060512414373153244', '0', '', '/sys/sysConfig/aboutOne', '1', '1', '', '', '0', '0', '2017-02-27 18:17:35', '2017-03-30 11:26:13', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060454237634774400', '1', 'sysConfig:list', '系统设置list', '', '', '1052481652945655248', '2', '1060262570224060575', '0', '', '/sys/sysConfig/list', '2', '1', '', '', '0', '0', '2017-02-27 18:19:11', '2017-02-27 18:19:11', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060455425160725889', '1', 'sysConfig:hisList', '系统设置hisList', '', '', '1052481652945655248', '2', '1060262570224060575', '0', '', '/sys/sysConfig/hisList', '3', '1', '', '', '0', '0', '2017-02-27 18:38:03', '2017-02-27 18:38:03', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060457336948118351', '1', 'sysDict:groupList', '字典组分页数据', '', '', '1052481653695387090', '2', '1060262570224060575', '0', '', '/sys/sysDict/groupList', '1', '1', '', '', '0', '0', '2017-02-27 19:08:26', '2017-03-29 11:04:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060457499070550864', '1', 'sysDict:groupIdItemList', '字典项列表', '', '', '1052481654041417171', '2', '1060262570224060575', '0', '', '/sys/sysDict/%d/itemList', '2', '1', '', '', '0', '0', '2017-02-27 19:11:01', '2017-02-27 19:11:01', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060457638798545745', '1', 'sysDict:itemList%s%s', '获取字典项列表', '', '', '1052481653319996881', '1', '1060262570224060575', '0', '', '/sys/sysDict/itemList/%s/%s', '3', '1', '', '', '0', '0', '2017-02-27 19:13:14', '2017-02-27 19:13:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060460357990747589', '1', 'sysDict:itemView', '字典项管理页面', '', '', '1052481654041417171', '2', '1060512414373153244', '0', '', '/sys/sysDict/item/view', '1', '1', '', '', '0', '0', '2017-02-27 19:56:27', '2017-03-29 11:04:46', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060512630049426250', '1', 'sysIcon:chooseIconView', '图标管理:选择图标', '', '', '1052481655604843993', '1', '1060512414373153244', '0', '', '/sys/sysIcon/chooseIconView', '1', '1', '', '', '0', '0', '2017-02-28 09:47:18', '2017-03-29 11:46:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060512716001200972', '1', 'sysIcon:iconList', '图标管理:分页数据', '', '', '1052481655604843993', '2', '1060262570224060575', '0', '', '/sys/sysIcon/iconList', '3', '1', '', '', '0', '0', '2017-02-28 09:48:40', '2017-03-29 11:47:47', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060512989158394705', '1', 'sysIcon:Reconfiguration', '图标管理:一键配置图标', '', '', '1052481655604843993', '1', '1060262570224060575', '0', '', '/sys/sysIcon/Reconfiguration', '4', '1', '', '', '0', '0', '2017-02-28 09:53:00', '2017-03-29 11:50:33', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060513898629335518', '1', 'sysRoleAuth:view', '角色权限:访问', 'sysRoleAuth:view', 'sysRoleAuth.view', '1060513673827224029', '2', '1052481659203556933', '1', '', '/sys/sysRole/sysRoleAuthView;\r\n/sys/sysAuthMenu/getRoleAuthList', '1', '1', '', '', '0', '0', '2017-02-28 10:07:28', '2017-03-24 11:48:01', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060514158411942368', '1', 'sysRoleAuth:manage', '角色权限:管理', 'sysRoleAuth:manage', 'sysRoleAuth.manage', '1060513673827224029', '1', '1060513996837915103', '1', '', '/sys/sysRoleAuth/refresh', '3', '1', '', '', '0', '0', '2017-02-28 10:11:36', '2017-02-28 10:52:51', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060517440993790435', '1', 'sysRoleUser:list', '角色用户:列表', 'sysRoleUser:list', 'sysRoleUser.list', '1060516871598148066', '2', '1060262570224060575', '1', '', '/sys/sysUserRole/list', '1', '1', '', '', '0', '0', '2017-02-28 11:03:46', '2017-02-28 11:04:20', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060517625944771045', '1', 'sysRoleUser:create', '角色用户:添加', 'sysRoleUser:create', 'sysRoleUser.create', '1060516871598148066', '1', '1052481659203557933', '1', '', '/sys/sysUserRole/add', '3', '1', '', '', '0', '0', '2017-02-28 11:06:42', '2017-02-28 11:06:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060518192551201254', '1', 'sysRoleUser:delete', '角色用户:删除', 'sysRoleUser:create', 'sysRoleUser.delete', '1060516871598148066', '1', '1052481659203558275', '1', '', '/sys/sysUserRole/delete', '5', '1', '', '', '0', '0', '2017-02-28 11:15:43', '2017-02-28 11:17:24', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060518473066075753', '1', 'dauthOperatorSupport:create', '运算符支持:创建', '', '', '1052481647455311298', '1', '1052481659203557933', '1', '', '/sys/dauthOperator/addSupport', '106', '1', '', '', '0', '0', '2017-02-28 11:20:10', '2017-02-28 11:20:10', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060520373898434155', '1', 'dauthOperatorSupport:about', '运算符支持:关于', '', '', '1052481647455311298', '2', '1060512414373153244', '1', '', '/sys/dauthOperator/aboutOperatorSupport', '105', '1', '', '', '0', '0', '2017-02-28 11:50:23', '2017-02-28 12:02:08', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060521285249956189', '1', 'dauthOperator:about', '运算符:关于', '', '', '1060521204894431579', '2', '1052481659203556933', '1', '', '/sys/dauthOperator/aboutOperator', '103', '1', '', '', '0', '0', '2017-02-28 12:04:52', '2017-02-28 12:04:52', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060521414168181087', '1', 'dauthOperatorSupport:list', '运算符支持:数据列表', '', '', '1052481647455311298', '2', '1060262570224060575', '1', '', '/sys/dauthOperator/supportList', '104', '1', '', '', '0', '0', '2017-02-28 12:06:55', '2017-02-28 12:06:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060521496474057057', '1', 'dauthOperatorSupport:update', '运算符支持:修改', '', '', '1052481647455311298', '1', '1052481659203557963', '1', '', '/sys/dauthOperator/updateSupport', '107', '1', '', '', '0', '0', '2017-02-28 12:08:14', '2017-02-28 12:08:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060521622693247331', '1', 'dauthOperatorSupport:delete', '运算符支持:删除', '', '', '1052481647455311298', '1', '1052481659203558275', '1', '', '/sys/dauthOperator/deleteSupport', '108', '1', '', '', '0', '0', '2017-02-28 12:10:14', '2017-02-28 12:10:45', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060521729551530342', '1', 'dauthOperator:view', '运算符:访问', '', '', '1060521204894431579', '1', '1052481659203556933', '1', '', '/sys/dauthOperator/operatorView', '101', '1', '', '', '0', '0', '2017-02-28 12:11:56', '2017-02-28 12:13:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060521817713703273', '1', 'dauthOperator:list', '运算符:数据列表', '', '', '1060521204894431579', '2', '1060262570224060575', '1', '', '/sys/dauthOperator/operatorList', '102', '1', '', '', '0', '0', '2017-02-28 12:13:20', '2017-02-28 12:13:59', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060522022291929453', '1', 'dauthOperator:create', '运算符:新增', '', '', '1060521204894431579', '1', '1052481659203557933', '1', '', '/sys/dauthOperator/addOperator', '104', '1', '', '', '0', '0', '2017-02-28 12:16:35', '2017-02-28 12:16:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060522062648473967', '1', 'dauthOperator:update', '运算符:修改', '', '', '1060521204894431579', '1', '1052481659203557963', '1', '', '/sys/dauthOperator/updateOperator', '105', '1', '', '', '0', '0', '2017-02-28 12:17:14', '2017-02-28 12:17:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060522106275527025', '1', 'dauthOperator:delete', '运算符:删除', '', '', '1060521204894431579', '1', '1052481659203558275', '1', '', '/sys/dauthOperator/deleteOperator', '106', '1', '', '', '0', '0', '2017-02-28 12:17:55', '2017-02-28 12:17:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529093387913715', '1', 'sysUserWin:winView', '[公用]用户管理:弹窗页面', 'sysUserWin:winView', 'sysUserWin.winView', '1060530341559306746', '2', '1060512414373153244', '1', '', '/sys/sysUser/winView', '1000', '1', '', '与sysOrg:orgTree同时使用', '0', '0', '2017-02-28 14:08:59', '2017-02-28 14:31:40', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529385641773556', '1', 'sysUserWin:winList', '[公共]用户管理:弹窗数据', 'sysUserWin:winList', 'sysUserWin.winList', '1060530341559306746', '2', '1060262570224060575', '1', '', '/sys/sysUser/winList', '102', '1', '', '与sysOrg:orgTree同时使用', '0', '0', '2017-02-28 14:13:37', '2017-02-28 14:31:26', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529513805055535', '1', 'sysLog:list', '分页数据list', '', '', '1052481654405273056', '2', '1060262570224060575', '0', '', '/sys/sysLog/list', '1', '1', '', '', '0', '0', '2017-02-28 14:15:40', '2017-02-28 14:15:40', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529720687982212', '1', 'dauthOperator:getList', '运算符:选择运算符列表', '', '', '1060521204894431579', '2', '1060262570224060575', '1', '', '/sys/dauthOperator/getOperatorList', '107', '1', '', '', '0', '0', '2017-02-28 14:18:57', '2017-02-28 14:18:57', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529782516287036', '1', 'sysUserLog:list', '个人日志:list', '', '', '1052481654405273057', '2', '1060262570224060575', '0', '', '/sys/sysUserLog/list', '1', '1', '', '', '0', '0', '2017-02-28 14:19:56', '2017-02-28 14:19:56', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529824024098438', '1', 'dauthOperatorSupport:opList', '运算符支持:获取支持的运算符', '', '', '1052481647455311298', '2', '1060262570224060575', '1', '', '/sys/dauthOperator/getSupportOperators/%d', '109', '1', '', '', '0', '0', '2017-02-28 14:20:35', '2017-02-28 14:20:47', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060529924825806473', '1', 'dauthOperatorSupport:vTypes', '运算符支持:获取支持的值类型', '', '', '1052481647455311298', '2', '1060262570224060575', '1', '', '/sys/dauthOperator/getSupportValueTypes/%d/%d', '110', '1', '', '', '0', '0', '2017-02-28 14:22:12', '2017-02-28 14:22:12', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060530105551095370', '1', 'info:jvmInfo', 'JVM信息:列表', '', '', '1052481655704243260', '2', '1060262570224060575', '0', '', '/sys/info/jvmInfo', '1', '1', '', '', '0', '0', '2017-02-28 14:25:04', '2017-03-29 11:54:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060530184971290188', '1', 'sysInfo:serverInfo', '服务器信息:列表', '', '', '1052481655704243262', '2', '1060262570224060575', '0', '', '/sys/info/serverInfo', '1', '1', '', '', '0', '0', '2017-02-28 14:26:20', '2017-03-29 11:54:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060530241626900046', '1', 'sysInfo:systemInfo', '系统运行信息:列表', '', '', '1052481655704243263', '2', '1060262570224060575', '0', '', '/sys/info/systemInfo', '1', '1', '', '', '0', '0', '2017-02-28 14:27:14', '2017-03-29 11:55:22', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060530512527558229', '1', 'sysFile:fileList', '附件管理fileList', '', '', '1052481654739768789', '2', '1060262570224060575', '1', '', '/sys/sysFile/fileList', '1', '1', '', '', '0', '0', '2017-02-28 14:31:32', '2017-02-28 14:31:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531101189704192', '1', 'sysRoleWin:winView', '[公共]角色选择框:页面', 'sysRoleWin:winView', 'sysRoleWin.winView', '1060531000917527039', '2', '1052481659203556933', '1', '', '/sys/sysRole/winView', '1', '1', '', '', '0', '0', '2017-02-28 14:40:53', '2017-02-28 14:40:53', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531180596267521', '1', 'sysRoleWin:winList', '[公共]角色选择框:数据', 'sysRoleWin:winList', 'sysRoleWin.winList', '1060531000917527039', '2', '1060262570224060575', '1', '', '/sys/sysRole/winList', '2', '1', '', '', '0', '0', '2017-02-28 14:42:09', '2017-02-28 14:42:09', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531371389945459', '1', 'sysFile:aboutDialogView', '附件管理:关于', '', '', '1052481654739768789', '2', '1060512414373153244', '0', '', '/sys/sysFile/aboutDialogView', '3', '1', '', '', '0', '0', '2017-02-28 14:45:11', '2017-02-28 14:45:11', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531786719295117', '1', 'dauthFilterType:aboutone', '过滤类型:关于', '', '', '1060531546931984011', '2', '1060512414373153244', '1', '', '/sys/dauthFilterType/aboutOne', '103', '1', '', '', '0', '0', '2017-02-28 14:51:47', '2017-02-28 14:52:31', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531869244323473', '1', 'dauthFilterType:view', '过滤类型:访问', '', '', '1060531546931984011', '1', '1052481659203556933', '1', '', '/sys/dauthFilterType/filterTypeView', '101', '1', '', '', '0', '0', '2017-02-28 14:53:06', '2017-02-28 14:53:06', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531910439728787', '1', 'dauthFilterType:list', '过滤类型:数据列表', '', '', '1060531546931984011', '2', '1060262570224060575', '1', '', '/sys/dauthFilterType/filterTypeList', '102', '1', '', '', '0', '0', '2017-02-28 14:53:45', '2017-02-28 14:53:45', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060531956747990677', '1', 'dauthFilterType:getList', '过滤类型:获取过滤类型列表', '', '', '1060531546931984011', '2', '1060262570224060575', '1', '', '/sys/dauthFilterType/getFilterTypeList', '107', '1', '', '', '0', '0', '2017-02-28 14:54:29', '2017-02-28 14:54:29', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532031278713347', '1', 'sysRoleWin:list', '[公共]角色选择框:数据列表', 'sysRoleWin:list', 'sysRoleWin.list', '1060531000917527039', '2', '1060262570224060575', '1', '', '/sys/sysRole/getList', '3', '1', '', '', '0', '0', '2017-02-28 14:55:40', '2017-02-28 14:55:40', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532034701227671', '1', 'dauthFilterType:create', '过滤类型:新增', '', '', '1060531546931984011', '1', '1052481659203557933', '1', '', '/sys/dauthFilterType/addFilterType', '104', '1', '', '', '0', '0', '2017-02-28 14:55:44', '2017-02-28 14:55:44', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532071473739417', '1', 'dauthFilterType:update', '过滤类型:修改', '', '', '1060531546931984011', '1', '1052481659203557963', '1', '', '/sys/dauthFilterType/updateFilterType', '105', '1', '', '', '0', '0', '2017-02-28 14:56:19', '2017-02-28 14:56:19', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532126926632603', '1', 'dauthFilterType:delete', '过滤类型:删除', '', '', '1060531546931984011', '1', '1052481659203558275', '1', '', '/sys/dauthFilterType/deleteFilterType', '106', '1', '', '', '0', '0', '2017-02-28 14:57:12', '2017-02-28 14:57:12', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532701455054527', '1', 'sysMetadata:aboutEntity', '元数据实体:关于', '', '', '1052481647455311299', '2', '1060512414373153244', '1', '', '/sys/sysMetadata/aboutEntity', '103', '1', '', '', '0', '0', '2017-02-28 15:06:20', '2017-02-28 15:07:22', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532757231957697', '1', 'sysMetadata:aboutField', '元数据字段:关于', '', '', '1060535699748026070', '2', '1060512414373153244', '1', '', '/sys/sysMetadata/aboutField', '103', '1', '', '', '0', '0', '2017-02-28 15:07:13', '2017-02-28 15:07:13', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532813148321476', '1', 'sysMetadata:entityList', '元数据实体:列表', '', '', '1052481647455311299', '2', '1060262570224060575', '1', '', '/sys/sysMetadata/entityList', '102', '1', '', '', '0', '0', '2017-02-28 15:08:06', '2017-02-28 15:08:06', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060532901006407366', '1', 'sysMetadata:getEntityList', '元数据实体:获取实体列表', '', '', '1052481647455311299', '2', '1060262570224060575', '1', '', '/sys/sysMetadata/getEntityList', '107', '1', '', '', '0', '0', '2017-02-28 15:09:30', '2017-02-28 15:09:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535336045246152', '1', 'sysMetadata:selectTableView', '元数据:选择表', '', '', '1052481647455311299', '2', '1060512414373153244', '1', '', '/sys/sysMetadata/sysMetaTableView', '108', '1', '', '', '0', '0', '2017-02-28 15:48:12', '2017-02-28 15:48:12', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535392954611402', '1', 'sysMetadata:tableList', '元数据:选择表数据', '', '', '1052481647455311299', '2', '1060262570224060575', '1', '', '/sys/sysMetadata/metaTableList', '109', '1', '', '', '0', '0', '2017-02-28 15:49:06', '2017-02-28 15:49:06', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535506143147724', '1', 'sysMetadata:tableFieldList', '元数据:表字段列表', '', '', '1060535699748026070', '2', '1060262570224060575', '1', '', '/sys/sysMetadata/metaFieldList/%s', '108', '1', '', '', '0', '0', '2017-02-28 15:50:54', '2017-02-28 15:50:54', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535560930195150', '1', 'sysMetadata:addEntity', '元数据实体:新增', '', '', '1052481647455311299', '1', '1052481659203557933', '1', '', '/sys/sysMetadata/addEntity', '104', '1', '', '', '0', '0', '2017-02-28 15:51:47', '2017-02-28 15:51:56', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535607169251025', '1', 'sysMetadata:updateEntity', '元数据实体:修改', '', '', '1052481647455311299', '1', '1052481659203557963', '1', '', '/sys/sysMetadata/updateEntity', '105', '1', '', '', '0', '0', '2017-02-28 15:52:31', '2017-02-28 15:52:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535663224026836', '1', 'sysMetadata:deleteEntity', '元数据实体:删除', '', '', '1052481647455311299', '1', '1052481659203558275', '1', '', '/sys/sysMetadata/deleteEntity', '106', '1', '', '', '0', '0', '2017-02-28 15:53:24', '2017-02-28 15:53:24', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535744735082200', '1', 'sysMetadataField:view', '元数据字段:访问', '', '', '1060535699748026070', '1', '1052481659203556933', '1', '', '/sys/sysMetadata/metadataFieldView', '101', '1', '', '', '0', '0', '2017-02-28 15:54:42', '2017-02-28 15:54:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060535863639406298', '1', 'sysMetadataField:list', '元数据字段:列表', '', '', '1060535699748026070', '2', '1060262570224060575', '1', '', '/sys/sysMetadata/fieldList/%d', '102', '1', '', '', '0', '0', '2017-02-28 15:56:35', '2017-02-28 15:57:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536006906345181', '1', 'sysMetadataField:getFieldList', '元数据字段:获取字段列表', '', '', '1060535699748026070', '2', '1060262570224060575', '1', '', '/sys/sysMetadata/getFieldList/%d/%d', '107', '1', '', '', '0', '0', '2017-02-28 15:58:52', '2017-02-28 15:59:51', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536045116454623', '1', 'sysMetadataField:addField', '元数据字段:新增', '', '', '1060535699748026070', '1', '1052481659203557933', '1', '', '/sys/sysMetadata/addField', '104', '1', '', '', '0', '0', '2017-02-28 15:59:28', '2017-02-28 15:59:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536117623387875', '1', 'sysMetadataField:updateField', '元数据字段:修改', '', '', '1060535699748026070', '1', '1052481659203557963', '1', '', '/sys/sysMetadata/updateField', '105', '1', '', '', '0', '0', '2017-02-28 16:00:37', '2017-02-28 16:00:37', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536158243124965', '1', 'sysMetadataField:deleteField', '元数据字段:删除', '', '', '1060535699748026070', '1', '1052481659203558275', '1', '', '/sys/sysMetadata/deleteField', '106', '1', '', '', '0', '0', '2017-02-28 16:01:16', '2017-02-28 16:01:16', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536526409692907', '1', 'dauthVariable:aboutOne', '数据权限变量:关于', '', '', '1060536473503790825', '2', '1060512414373153244', '1', '', '/sys/dauthVariable/aboutOne', '103', '1', '', '', '0', '0', '2017-02-28 16:07:07', '2017-02-28 16:08:28', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536599394776813', '1', 'dauthVariable:view', '数据权限变量:访问', '', '', '1060536473503790825', '1', '1052481659203556933', '1', '', '/sys/dauthVariable/view', '101', '1', '', '', '0', '0', '2017-02-28 16:08:17', '2017-02-28 16:08:17', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536654727083760', '1', 'dauthVariable:list', '数据权限变量:列表', '', '', '1060536473503790825', '2', '1060262570224060575', '1', '', '/sys/dauthVariable/list', '102', '1', '', '', '0', '0', '2017-02-28 16:09:10', '2017-02-28 16:09:10', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536725987260146', '1', 'dauthVariable:selVarView', '数据权限变量:选择变量', '', '', '1060536473503790825', '2', '1060512414373153244', '1', '', '/sys/dauthVariable/chooseVariableView', '107', '1', '', '', '0', '0', '2017-02-28 16:10:18', '2017-02-28 16:10:18', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536768554202868', '1', 'dauthVariable:selVarList', '数据权限变量:选择变量列表', '', '', '1060536473503790825', '2', '1060262570224060575', '1', '', '/sys/dauthVariable/chooseVariableList', '108', '1', '', '', '0', '0', '2017-02-28 16:10:58', '2017-02-28 16:10:58', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536814721955574', '1', 'dauthVariable:create', '数据权限变量:新增', '', '', '1060536473503790825', '1', '1052481659203557933', '1', '', '/sys/dauthVariable/add', '104', '1', '', '', '0', '0', '2017-02-28 16:11:42', '2017-02-28 16:11:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536853305358072', '1', 'dauthVariable:update', '数据权限变量:修改', '', '', '1060536473503790825', '1', '1052481659203557963', '1', '', '/sys/dauthVariable/update', '105', '1', '', '', '0', '0', '2017-02-28 16:12:19', '2017-02-28 16:12:19', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060536892744398586', '1', 'dauthVariable:delete', '数据权限变量:删除', '', '', '1060536473503790825', '1', '1052481659203558275', '1', '', '/sys/dauthVariable/delete', '106', '1', '', '', '0', '0', '2017-02-28 16:12:57', '2017-02-28 16:12:57', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537029762873084', '1', 'dauthUsage:aboutOne', '数据权限应用:关于', '', '', '1052481647455311301', '2', '1060512414373153244', '1', '', '/sys/dauthUsage/aboutOne', '103', '1', '', '', '0', '0', '2017-02-28 16:15:07', '2017-02-28 16:15:07', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537076158166782', '1', 'dauthUsage:list', '数据权限应用:列表', '', '', '1052481647455311301', '2', '1060262570224060575', '1', '', '/sys/dauthUsage/list', '102', '1', '', '', '0', '0', '2017-02-28 16:15:52', '2017-02-28 16:15:52', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537116852352768', '1', 'dauthUsage:create', '数据权限应用:新增', '', '', '1052481647455311301', '1', '1052481659203557933', '1', '', '/sys/dauthUsage/add', '104', '1', '', '', '0', '0', '2017-02-28 16:16:30', '2017-02-28 16:16:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537149546952450', '1', 'dauthUsage:update', '数据权限应用:修改', '', '', '1052481647455311301', '1', '1052481659203557963', '1', '', '/sys/dauthUsage/update', '105', '1', '', '', '0', '0', '2017-02-28 16:17:02', '2017-02-28 16:17:02', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537199051273988', '1', 'dauthUsage:clearConfig', '数据权限应用:清空配置', '', '', '1052481647455311301', '1', '1052481659203557963', '1', '', '/sys/dauthUsage/deleteUsageDauth', '106', '1', '', '', '0', '0', '2017-02-28 16:17:49', '2017-02-28 16:17:49', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537460372141834', '1', 'dauth:aboutDauth', '数据权限:关于', '', '', '1052481647455311300', '2', '1060512414373153244', '1', '', '/sys/dauth/aboutDauth', '103', '1', '', '', '0', '0', '2017-02-28 16:21:58', '2017-02-28 16:21:58', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537568121714444', '1', 'dauth:list', '数据权限:列表', '', '', '1052481647455311300', '2', '1060262570224060575', '1', '', '/sys/dauth/list', '102', '1', '', '', '0', '0', '2017-02-28 16:23:41', '2017-02-28 16:23:41', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537606721894158', '1', 'dauth:chooseDauthView', '数据权限:选择权限', '', '', '1052481647455311300', '2', '1060512414373153244', '1', '', '/sys/dauth/chooseDauthView', '108', '1', '', '', '0', '0', '2017-02-28 16:24:18', '2017-02-28 16:24:18', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537654704731920', '1', 'dauth:chooseDauthList', '数据权限:选择权限列表', '', '', '1052481647455311300', '2', '1060262570224060575', '1', '', '/sys/dauth/chooseDauthList', '109', '1', '', '', '0', '0', '2017-02-28 16:25:03', '2017-02-28 16:25:03', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537811049510674', '1', 'dauth:detailView', '数据权限:详情', '', '', '1052481647455311300', '2', '1060262570224060575', '1', '', '/sys/dauth/detailView', '107', '1', '', '', '0', '0', '2017-02-28 16:27:32', '2017-02-28 16:27:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537905622677270', '1', 'dauthCheck:view', '数据权限:校验', '', '', '1052481647455311300', '1', '1060512414373153244', '1', '', '/sys/dauth/checkView/%d', '101', '1', '', '', '0', '0', '2017-02-28 16:29:03', '2017-03-24 17:01:09', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537942106830616', '1', 'dauthCheck:check', '数据权限校验:校验', '', '', '1052481647455311300', '2', '1060262570224060575', '1', '', '/sys/dauth/checkDauth', '102', '1', '', '', '0', '0', '2017-02-28 16:29:37', '2017-02-28 16:29:37', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060537972850030362', '1', 'dauth:create', '数据权限:新增', '', '', '1052481647455311300', '1', '1052481659203557933', '1', '', '/sys/dauth/add', '104', '1', '', '', '0', '0', '2017-02-28 16:30:07', '2017-02-28 16:30:07', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060538012249224988', '1', 'dauth:update', '数据权限:修改', '', '', '1052481647455311300', '1', '1052481659203557963', '1', '', '/sys/dauth/update', '105', '1', '', '', '0', '0', '2017-02-28 16:30:44', '2017-02-28 16:30:44', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060538059636471582', '1', 'dauth:delete', '数据权限:删除', '', '', '1052481647455311300', '1', '1052481659203558275', '1', '', '/sys/dauth/delete', '106', '1', '', '', '0', '0', '2017-02-28 16:31:30', '2017-02-28 16:31:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539098439743266', '1', 'dauthFilter:aboutFilterItem', '过滤器项:关于', '', '', '1060536269074462439', '2', '1060512414373153244', '1', '', '/sys/dauthFilter/aboutFilterItem', '103', '1', '', '', '0', '0', '2017-02-28 16:48:00', '2017-02-28 16:48:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539139843815204', '1', 'dauthFilter:aboutFilterGroup', '过滤器组:关于', '', '', '1060537266043746054', '2', '1060512414373153244', '1', '', '/sys/dauthFilter/aboutFilterGroup', '103', '1', '', '', '0', '0', '2017-02-28 16:48:40', '2017-02-28 16:48:40', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539182585870118', '1', 'dauthFilter:aboutFilterJoin', '过滤器关联:关于', '', '', '1060537285849249544', '2', '1060512414373153244', '1', '', '/sys/dauthFilter/aboutFilterJoin', '103', '1', '', '', '0', '0', '2017-02-28 16:49:20', '2017-02-28 16:49:20', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539272757114664', '1', 'dauthFilter:filterItemView', '过滤器项:访问', '', '', '1060536269074462439', '1', '1052481659203556933', '1', '', '/sys/dauthFilter/filterItemView', '101', '1', '', '', '0', '0', '2017-02-28 16:50:46', '2017-02-28 16:50:46', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539337256073002', '1', 'dauthFilter:filterItemList', '过滤器项:列表', '', '', '1060536269074462439', '2', '1060262570224060575', '1', '', '/sys/dauthFilter/filterItemList', '102', '1', '', '', '0', '0', '2017-02-28 16:51:48', '2017-02-28 16:51:48', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539514465417008', '1', 'dauthFilterItemSelect:view', '过滤器项选择:访问', '', '', '1060539373376370476', '2', '1052481659203556933', '1', '', '/sys/dauthFilter/chooseFilterItemView/%d', '101', '1', '', '', '0', '0', '2017-02-28 16:54:37', '2017-02-28 16:55:54', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539570032604978', '1', 'dauthFilterItemSelect:list', '过滤器项选择:列表', '', '', '1060539373376370476', '2', '1060262570224060575', '1', '', '/sys/dauthFilter/chooseFilterItemList/%d', '102', '1', '', '', '0', '0', '2017-02-28 16:55:30', '2017-02-28 16:55:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539641341015862', '1', 'dauthFilter:addFilterItem', '过滤器项:新增', '', '', '1060536269074462439', '1', '1052481659203557933', '1', '', '/sys/dauthFilter/addFilterItem', '104', '1', '', '', '0', '0', '2017-02-28 16:56:38', '2017-02-28 16:56:38', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539726008284984', '1', 'dauthFilter:updateFilterItem', '过滤器项:修改', '', '', '1060536269074462439', '1', '1052481659203557963', '1', '', '/sys/dauthFilter/updateFilterItem', '105', '1', '', '', '0', '0', '2017-02-28 16:57:59', '2017-02-28 16:57:59', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539768441009978', '1', 'dauthFilter:deleteFilterItem', '过滤器项:删除', '', '', '1060536269074462439', '1', '1052481659203558275', '1', '', '/sys/dauthFilter/deleteFilterItem', '106', '1', '', '', '0', '0', '2017-02-28 16:58:39', '2017-02-28 16:58:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539828406974268', '1', 'dauthFilter:filterGroupView', '过滤器组:访问', '', '', '1060537266043746054', '1', '1052481659203556933', '1', '', '/sys/dauthFilter/filterGroupView', '101', '1', '', '', '0', '0', '2017-02-28 16:59:36', '2017-02-28 16:59:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060539904442435202', '1', 'sysRoleAuth:deleteBatch', '角色权限删除', '', '', '1060513673827224029', '2', '1052481659203558275', '1', '', '/sys/sysRoleAuth/deleteBatch', '1', '1', '', '', '0', '0', '2017-02-28 17:00:49', '2017-02-28 17:00:49', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540003079812926', '1', 'dauthFilter:filterGroupList', '过滤器组:列表', '', '', '1060537266043746054', '2', '1060262570224060575', '1', '', '/sys/dauthFilter/filterGroupList', '102', '1', '', '', '0', '0', '2017-02-28 17:02:23', '2017-02-28 17:02:23', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540184194053952', '1', 'dauthFilter:dauthDetailGpList', '过滤器组:权限详情列表', '', '', '1060537266043746054', '2', '1060262570224060575', '1', '', '/sys/dauthFilter/dauthDetailGroupList', '107', '1', '', '', '0', '0', '2017-02-28 17:05:16', '2017-02-28 17:05:16', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540230126925634', '1', 'dauthFilter:addFilterGroup', '过滤器组:新增', '', '', '1060537266043746054', '1', '1052481659203557933', '1', '', '/sys/dauthFilter/addFilterGroup', '104', '1', '', '', '0', '0', '2017-02-28 17:05:59', '2017-02-28 17:05:59', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540281988446020', '1', 'dauthFilter:updateFilterGroup', '过滤器组:修改', '', '', '1060537266043746054', '1', '1052481659203557963', '1', '', '/sys/dauthFilter/updateFilterGroup', '105', '1', '', '', '0', '0', '2017-02-28 17:06:49', '2017-02-28 17:06:49', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540292496295560', '1', 'sysUserAuth:addBatch', '用户权限/负授权添加', '', '', '1060542039792034969', '2', '1052481659203557933', '0', '', '/sys/sysUserAuth/addBatch', '1', '1', '', '', '0', '0', '2017-02-28 17:06:59', '2017-02-28 18:32:48', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540320044414790', '1', 'dauthFilter:deleteFilterGroup', '过滤器组:删除', '', '', '1060537266043746054', '1', '1052481659203558275', '1', '', '/sys/dauthFilter/deleteFilterGroup', '106', '1', '', '', '0', '0', '2017-02-28 17:07:25', '2017-02-28 17:07:25', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540362735158922', '1', 'sysUserAuth:deleteBatch', '用户权限/负授权删除', '', '', '1060542039792034969', '2', '1052481659203558275', '0', '', '/sys/sysUserAuth/deleteBatch', '2', '1', '', '', '0', '0', '2017-02-28 17:08:06', '2017-02-28 18:33:05', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540379121186632', '1', 'dauthFilterJoin:view', '过滤器项配置:访问', '', '', '1060537285849249544', '1', '1052481659203556933', '1', '', '/sys/dauthFilter/filterJoinView/%d/%d', '101', '1', '', '', '0', '0', '2017-02-28 17:08:22', '2017-03-30 19:05:28', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540484947670858', '1', 'dauthFilterJoin:itemViewJoin', '过滤器关联:过滤器项查看关联组', '', '', '1060537285849249544', '2', '1060512414373153244', '1', '', '/sys/dauthFilter/filterJoinItemGroupView', '108', '1', '', '', '0', '0', '2017-02-28 17:10:03', '2017-02-28 17:10:47', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540564383594317', '1', 'dauthFilterJoin:list', '过滤器关联:列表', '', '', '1060537285849249544', '2', '1060262570224060575', '1', '', '/sys/dauthFilter/filterJoinList', '102', '1', '', '', '0', '0', '2017-02-28 17:11:18', '2017-02-28 17:11:18', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540655986214547', '1', 'sysRoleAuth:addBatch', '角色权限添加', '', '', '1060513673827224029', '2', '1052481659203557933', '0', '', '/sys/sysRoleAuth/addBatch', '2', '1', '', '', '0', '0', '2017-02-28 17:12:46', '2017-02-28 17:12:46', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540692990392143', '1', 'dauthFilterJoin:dauthJoinList', '过滤器关联:权限详情获取关联列表', '', '', '1060537285849249544', '2', '1060262570224060575', '1', '', '/sys/dauthFilter/dauthDetailFilterJoinList', '107', '1', '', '', '0', '0', '2017-02-28 17:13:21', '2017-02-28 17:13:21', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540733235787601', '1', 'dauthFilterJoin:create', '过滤器项配置:新增', '', '', '1060537285849249544', '1', '1052481659203557933', '1', '', '/sys/dauthFilter/addFilterJoin', '104', '1', '', '', '0', '0', '2017-02-28 17:13:59', '2017-03-30 19:05:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540774933460819', '1', 'dauthFilterJoin:update', '过滤器项配置:修改', '', '', '1060537285849249544', '1', '1052481659203557963', '1', '', '/sys/dauthFilter/updateFilterJoin', '105', '1', '', '', '0', '0', '2017-02-28 17:14:39', '2017-03-30 19:05:43', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540810435241095', '1', 'sysUser:detailView', '用户管理:访问详情', 'sysUser:detailView', 'sysUser.detailView', '1052481647455311297', '2', '1060512414373153244', '1', '', '/sys/sysUser/detail/view/%s/%d', '9', '1', '', '', '0', '0', '2017-02-28 17:15:13', '2017-02-28 17:15:13', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060540836824610645', '1', 'dauthFilterJoin:delete', '过滤器项配置:删除', '', '', '1060537285849249544', '1', '1052481659203558275', '1', '', '/sys/dauthFilter/deleteFilterJoin', '106', '1', '', '', '0', '0', '2017-02-28 17:15:38', '2017-03-30 19:05:51', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060541545812075659', '1', 'sysUser:getUserById', '用户管理:获取单条数据', 'sysUser:getUserById', 'sysUser.getUserById', '1052481647455311297', '2', '1060262570224060575', '1', '', '/sys/sysUser/getUserById/', '9', '1', '', '', '0', '0', '2017-02-28 17:26:54', '2017-02-28 17:26:54', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060542273644405917', '1', 'sysUserTabLog:view', '用户日志:访问', 'sysUserTabLog:view', 'sysUserTabLog.view', '1060541736768251024', '2', '1052481659203556933', '1', '', '/sys/sysUser/sysUserTabLogView;/sys/sysUser/sysUserTabLogList', '1', '1', '', '', '0', '0', '2017-02-28 17:38:28', '2017-03-24 14:46:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543175201662116', '1', 'sysUserTabPos:view', '用户岗位:访问', 'sysUserTabPos:view', 'sysUserTabPos.view', '1060541793477338258', '2', '1052481659203556933', '1', '', '/sys/sysUser/sysUserTabPosView;/sys/sysUser/sysUserTabPosList', '1', '1', '', '', '0', '0', '2017-02-28 17:52:48', '2017-03-24 14:50:12', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543305368741032', '1', 'sysUserTabGroup:view', '用户小组:访问', 'sysUserTabGroup:view', 'sysUserTabGroup.view', '1060541832272553108', '2', '1052481659203556933', '1', '', '/sys/sysUser/sysUserTabGroupView;/sys/sysUser/sysUserTabGroupList', '1', '1', '', '', '0', '0', '2017-02-28 17:54:52', '2017-03-24 14:51:57', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543456489514156', '1', 'sysUserTabRole:view', '用户角色:访问', 'sysUserTabRole:view', 'sysUserTabRole:view', '1060541916079989910', '2', '1052481659203556933', '1', '', '/sys/sysUser/sysUserTabRoleView;/sys/sysUser/sysUserTabRoleList', '1', '1', '', '', '0', '0', '2017-02-28 17:57:16', '2017-03-24 14:53:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543603062613168', '1', 'sysUserTabAuth:view', '用户权限:访问', 'sysUserTabAuth:view', 'sysUserTabAuth.view', '1060542039792034969', '2', '1052481659203556933', '1', '', '/sys/sysUser/sysUserTabAuthView', '1', '1', '', '', '0', '0', '2017-02-28 17:59:36', '2017-02-28 17:59:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543741436896434', '1', 'sysUserTabNAuth:view', '用户负授权:访问', 'sysUserTabNAuth:view', 'sysUserTabNAuth.view', '1060542039792034969', '2', '1052481659203556933', '1', '', '/sys/sysUser/sysUserTabNAuthView', '10', '1', '', '', '0', '0', '2017-02-28 18:01:48', '2017-02-28 18:31:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543772628813471', '1', 'sysFile:webUpload', 'web上传:访问', '', '', '1060543577796052637', '1', '1052481659203556933', '0', '', '/sys/sysFile/webUpload', '1', '1', '', '', '0', '0', '2017-02-28 18:02:18', '2017-03-29 11:41:09', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543902148994228', '1', 'sysUserPwd:view', '更新密码:访问', 'sysUserPwd:view', 'sysUserPwd.view', '1060545925224342740', '1', '1052481659203556933', '1', '', '/sys/sysUser/sysUserChangePwdView/%d', '1', '1', '', '', '0', '0', '2017-02-28 18:04:21', '2017-02-28 18:40:06', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060543924875757217', '1', 'sysFile:upload', 'web上传:上传', '', '', '1060543577796052637', '1', '1060262570224060575', '0', '', '/sys/sysFile/upload', '2', '1', '', '', '0', '0', '2017-02-28 18:04:43', '2017-03-29 11:41:27', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060544004342089379', '1', 'sysFile:updateAttach', 'web上传:修改', '', '', '1060543577796052637', '1', '1052481659203557963', '0', '', '/sys/sysFile/updateAttach', '3', '1', '', '', '0', '0', '2017-02-28 18:05:59', '2017-03-29 11:41:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060544086428812965', '1', 'sysFile:deleteAttach', 'web上传:删除', '', '', '1060543577796052637', '1', '1052481659203558275', '0', '', '/sys/sysFile/deleteAttach', '4', '1', '', '', '0', '0', '2017-02-28 18:07:17', '2017-03-29 11:42:59', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060544158464935591', '1', 'sysFile:downFile', 'web上传:下载', '', '', '1060543577796052637', '1', '1060512414373153244', '0', '', '/sys/sysFile/downFile/%d/%d', '3', '1', '', '', '0', '0', '2017-02-28 18:08:26', '2017-03-29 11:41:53', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060545898669371360', '1', 'sysOrg:jobManage', '组织架构:职务配置', '', '', '1052481650369304009', '1', '1060512414373153244', '1', '', '/sys/org/jobManage', '34', '1', '', '', '0', '0', '2017-02-28 18:36:05', '2017-02-28 18:50:17', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060546235097425111', '1', 'sysUserPwd:update', '更新密码:保存', 'sysUserPwd:update', 'sysUserPwd.update', '1060545925224342740', '2', '1052481659203557963', '1', '', '/sys/sysUser/updUserPwd', '2', '1', '', '', '0', '0', '2017-02-28 18:41:26', '2017-02-28 18:41:26', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060546419125874659', '1', 'sysOrg:newOrg', '组织架构:新增部门', '', '', '1052481649938339272', '1', '1060512414373153244', '1', '', '/sys/org/newOrg/%d', '35', '1', '', '', '0', '0', '2017-02-28 18:44:22', '2017-03-30 18:55:25', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060546527206797285', '1', 'sysOrg:editOrg', '组织架构:修改部门', '', '', '1052481649938339272', '1', '1060512414373153244', '1', '', '/sys/org/editOrg/%d', '36', '1', '', '', '0', '0', '2017-02-28 18:46:05', '2017-03-30 18:55:33', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060546777792344040', '1', 'sysOrg:aboutOrg', '组织架构:关于', '', '', '1052481649938339272', '2', '1060512414373153244', '1', '', '/sys/org/aboutOrg/%d', '37', '1', '', '', '0', '0', '2017-02-28 18:50:04', '2017-02-28 18:50:45', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060546910797918189', '1', 'sysOrg:orgTree', '[公共]组织架构:组织树查询', '', '', '1052481649938339272', '2', '1060262570224060575', '1', '', '/sys/org/orgTree', '38', '1', '', '', '0', '0', '2017-02-28 18:52:11', '2017-02-28 20:05:54', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060546993337626607', '1', 'sysOrg:addOrg', '组织架构:新增部门', '', '', '1052481649938339272', '2', '1052481659203557933', '1', '', '/sys/org/addOrg', '39', '1', '', '', '0', '0', '2017-02-28 18:53:29', '2017-02-28 19:08:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060547128443498482', '1', 'sysOrg:updOrg', '组织架构:修改部门', '', '', '1052481649938339272', '2', '1052481659203557963', '1', '', '/sys/org/updOrg', '40', '1', '', '', '0', '0', '2017-02-28 18:55:38', '2017-02-28 19:08:43', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060547171395268596', '1', 'sysOrg:delOrg', '组织架构:删除部门', '', '', '1052481649938339272', '1', '1052481659203558275', '1', '', '/sys/org/delOrg/%d', '41', '1', '', '', '0', '0', '2017-02-28 18:56:19', '2017-02-28 19:08:56', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060547474314194937', '1', 'sysOrg:addJob', '职务配置:新增', '', '', '1052481650369304009', '1', '1052481659203557933', '1', '', '/sys/org/addJob', '39', '1', '', '', '0', '0', '2017-02-28 19:01:08', '2017-02-28 19:01:08', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060547630236397565', '1', 'sysOrg:chooseSysJobView', '职务配置:选择弹窗', '', '', '1052481650369304009', '2', '1060512414373153244', '1', '', '/sys/org/chooseSysJobView', '43', '1', '', '', '0', '0', '2017-02-28 19:03:37', '2017-02-28 19:03:37', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060547877732839423', '1', 'sysOrg:chooseSysJobList', '职务配置:弹窗列表', '', '', '1052481650369304009', '2', '1060262570224060575', '1', '', '/sys/org/chooseSysJobList', '44', '1', '', '', '0', '0', '2017-02-28 19:07:33', '2017-02-28 19:07:33', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548020285317108', '1', 'sysPersonalSetting:list', '个性化设置数据', '', '', '1052481658449630687', '2', '1060262570224060575', '0', '', '/sys/sysPersonal/personalSetting/list', '1', '1', '', '', '0', '0', '2017-02-28 19:09:49', '2017-02-28 19:09:49', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548320109227017', '1', 'sysOrg:addPos', '岗位配置:新增', '', '', '1052481650765665738', '2', '1052481659203557933', '1', '', '/sys/org/addPos', '5', '1', '', '', '0', '0', '2017-02-28 19:14:35', '2017-02-28 19:14:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548372414295051', '1', 'sysOrg:updPos', '岗位配置:修改', '', '', '1052481650765665738', '2', '1052481659203557963', '1', '', '/sys/org/updPos', '6', '1', '', '', '0', '0', '2017-02-28 19:15:25', '2017-02-28 19:15:25', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548409359440896', '1', 'sysPersonal:logView', '我的日志页面', '', '', '1052481657744987613', '2', '1060512414373153244', '0', '', '/sys/sysPersonal/logView', '1', '1', '', '', '0', '0', '2017-02-28 19:16:00', '2017-02-28 19:16:00', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548445786303501', '1', 'sysOrg:delPos', '岗位配置:删除', '', '', '1052481650765665738', '1', '1052481659203558275', '1', '', '/sys/org/delPos/%d', '7', '1', '', '', '0', '0', '2017-02-28 19:16:35', '2017-02-28 19:16:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548460813065218', '1', 'sysPersonal:logList', '我的日志数据查询', '', '', '1052481657744987613', '2', '1060262570224060575', '0', '', '/sys/sysPersonal/logList', '2', '1', '', '', '0', '0', '2017-02-28 19:16:49', '2017-02-28 19:16:49', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548509240499204', '1', 'sysPersonal:roleView', '我的角色页面', '', '', '1052481657744987613', '2', '1060512414373153244', '1', '', '/sys/sysPersonal/roleView', '3', '1', '', '', '0', '0', '2017-02-28 19:17:35', '2017-02-28 19:17:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548547256622086', '1', 'sysPersonal:roleList', '我的角色数据查询', '', '', '1052481657744987613', '2', '1060262570224060575', '1', '', '/sys/sysPersonal/roleList', '4', '1', '', '', '0', '0', '2017-02-28 19:18:11', '2017-02-28 19:18:11', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548604316982280', '1', 'sysPersonal:authView', '我的权限页面', '', '', '1052481657744987613', '2', '1060512414373153244', '1', '', '/sys/sysPersonal/authView', '5', '1', '', '', '0', '0', '2017-02-28 19:19:06', '2017-02-28 19:19:06', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548650538212362', '1', 'sysPersonal:authList', '我的权限数据查询', '', '', '1052481657744987613', '2', '1060262570224060575', '1', '', '/sys/sysPersonal/authList', '6', '1', '', '', '0', '0', '2017-02-28 19:19:50', '2017-02-28 19:19:50', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548696499395596', '1', 'sysPersonal:posView', '我的岗位页面', '', '', '1052481657744987613', '2', '1060512414373153244', '1', '', '/sys/sysPersonal/posView', '7', '1', '', '', '0', '0', '2017-02-28 19:20:34', '2017-02-28 19:20:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548738777979918', '1', 'sysPersonal:posList', '我的岗位数据查询', '', '', '1052481657744987613', '2', '1060262570224060575', '1', '', '/sys/sysPersonal/posList', '8', '1', '', '', '0', '0', '2017-02-28 19:21:14', '2017-02-28 19:21:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548783610895376', '1', 'sysPersonal:groupView', '我的用户组页面', '', '', '1052481657744987613', '2', '1060512414373153244', '1', '', '/sys/sysPersonal/groupView', '9', '1', '', '', '0', '0', '2017-02-28 19:21:57', '2017-02-28 19:21:57', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060548823386528786', '1', 'sysPersonal:groupList', '我的用户组数据查询', '', '', '1052481657744987613', '2', '1060262570224060575', '1', '', '/sys/sysPersonal/groupList', '10', '1', '', '', '0', '0', '2017-02-28 19:22:35', '2017-02-28 19:22:35', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060549276660100111', '1', 'sysOrg:posList', '岗位配置:岗位列表', '', '', '1052481650765665738', '2', '1060262570224060575', '1', '', '/sys/org/posList/%d', '8', '1', '', '', '0', '0', '2017-02-28 19:29:47', '2017-02-28 19:29:47', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060549604763724817', '1', 'sysOrg:chooseSysPositionView', '[公共]岗位配置:树形弹窗', '', '', '1052481650765665738', '2', '1060512414373153244', '1', '', '/sys/org/chooseSysPositionView', '9', '1', '', '', '0', '0', '2017-02-28 19:35:00', '2017-02-28 20:05:04', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060549946271507752', '1', 'sysOrg:addGroup', '小组管理:新增', '', '', '1052481651160978891', '2', '1052481659203557933', '1', '', '/sys/org/addGroup', '4', '1', '', '', '0', '0', '2017-02-28 19:40:26', '2017-02-28 19:42:07', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550019723207980', '1', 'sysOrg:updGroup', '小组管理:修改', '', '', '1052481651160978891', '2', '1052481659203557963', '1', '', '/sys/org/updGroup', '5', '1', '', '', '0', '0', '2017-02-28 19:41:36', '2017-02-28 19:41:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550128646137138', '1', 'sysOrg:updateUserGroup', '小组管理:人员更新', '', '', '1060541832272553108', '2', '1052481659203557963', '1', '', '/sys/org/updateUserGroup', '7', '1', '', '', '0', '0', '2017-02-28 19:43:19', '2017-02-28 19:43:19', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550232467744052', '1', 'sysOrg:updateUserPosition', '岗位管理:用户更新', '', '', '1052481650765665738', '1', '1052481659203557963', '1', '', '/sys/org/updateUserPosition', '10', '1', '', '', '0', '0', '2017-02-28 19:44:58', '2017-02-28 19:44:58', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550321210828086', '1', 'sysOrg:orgUser:view', '组织人员:访问', '', '', '1060545472174714840', '2', '1060512414373153244', '1', '', '/sys/org/orgUser/view/%d', '1', '1', '', '', '0', '0', '2017-02-28 19:46:23', '2017-02-28 19:46:23', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550397229442360', '1', 'sysOrg:orgUser:list', '组织人员:查询', '', '', '1060545472174714840', '2', '1060262570224060575', '1', '', '/sys/org/orgUser/list/%d', '2', '1', '', '', '0', '0', '2017-02-28 19:47:36', '2017-02-28 19:47:36', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550493994132794', '1', 'syOrg:posUser:view', '岗位人员:访问', '', '', '1060545543841738715', '2', '1060512414373153244', '1', '', '/sys/org/posUser/view/%d', '1', '1', '', '', '0', '0', '2017-02-28 19:49:08', '2017-02-28 19:49:08', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550543534105916', '1', 'sysOrg:posUser:list', '岗位人员:查询', '', '', '1060545543841738715', '2', '1060262570224060575', '1', '', '/sys/org/posUser/list/%d', '2', '1', '', '', '0', '0', '2017-02-28 19:49:55', '2017-02-28 19:49:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550604366193982', '1', 'sysOrg:posUser:add', '岗位人员:新增', '', '', '1060545543841738715', '1', '1052481659203557933', '1', '', '/sys/org/posUser/add', '3', '1', '', '', '0', '0', '2017-02-28 19:50:53', '2017-02-28 19:50:53', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550649891169780', '1', 'sysOrg:posUser:del', '岗位人员:删除', '', '', '1060545543841738715', '1', '1052481659203558275', '1', '', '/sys/org/posUser/del', '4', '1', '', '', '0', '0', '2017-02-28 19:51:37', '2017-02-28 19:51:37', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550715204871670', '1', 'sysOrg:posUser:setMajor', '岗位人员:设置主岗', '', '', '1060545543841738715', '1', '1052481659203557963', '1', '', '/sys/org/posUser/setMajor', '5', '1', '', '', '0', '0', '2017-02-28 19:52:39', '2017-02-28 19:52:39', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550896685065720', '1', 'sysOrg:groupUser:view', '小组人员:访问', '', '', '1060545574796750813', '2', '1060512414373153244', '1', '', '/sys/org/groupUser/view/%d', '1', '1', '', '', '0', '0', '2017-02-28 19:55:32', '2017-02-28 19:55:32', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060550974426490362', '1', 'sysOrg:groupUser:list', '小组人员:列表', '', '', '1060545574796750813', '2', '1060262570224060575', '1', '', '/sys/org/groupUser/list/%d', '2', '1', '', '', '0', '0', '2017-02-28 19:56:46', '2017-03-24 14:15:53', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060551024781207036', '1', 'sysOrg:groupUser:add', '小组人员:新增', '', '', '1060545574796750813', '1', '1052481659203557933', '1', '', '/sys/org/groupUser/add', '3', '1', '', '', '0', '0', '2017-02-28 19:57:34', '2017-02-28 19:57:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060551066653992446', '1', 'sysOrg:groupUser:del', '小组人员:删除', '', '', '1060545574796750813', '1', '1052481659203558275', '1', '', '/sys/org/groupUser/del', '4', '1', '', '', '0', '0', '2017-02-28 19:58:14', '2017-02-28 19:58:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1060551124526999040', '1', 'sysOrg:groupUser:setLeader', '小组人员:设置组长', '', '', '1060545574796750813', '1', '1052481659203557963', '1', '', '/sys/org/groupUser/setLeader', '5', '1', '', '', '0', '0', '2017-02-28 19:59:09', '2017-02-28 19:59:09', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1061265498981571428', '1', 'webSocketDemo:view', '消息推送:访问', '', '', '1061265384278891362', '1', '1052481659203556933', '0', '', '/common/demo/webSocket/toDemoView', '1', '1', '', '', '0', '0', '2017-03-08 17:13:50', '2017-03-29 12:19:20', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1061888394816547457', '1', '1111', 'xsdf', '', '', '1052481646384715198', '2', '1052481659203556933', '1', '', '112', '1', '1', '', '', '0', '0', '2017-03-15 14:14:30', '2017-03-15 14:14:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1061890423631800967', '1', 'vdbv', 'vfd', '', '', '1052481646384715198', '2', '1061329205799676383', '1', '', '212e', '12', '1', '', '', '0', '0', '2017-03-15 14:46:44', '2017-03-15 14:46:44', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1062715158343155066', '1', 'sysAuthMenu:getUserAuthList', '[公共]获取用户授权列表', 'sysAuthMenu:getUserAuthList', 'sysAuthMenu.getUserAuthList', '1060427695770143999', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/getUserAuthList', '10', '1', '', '', '0', '0', '2017-03-24 17:15:33', '2017-03-24 17:15:33', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1062715239701118332', '1', 'sysAuthMenu:getUserNAuthList', '[公共]获取用户负授权列表', 'sysAuthMenu.getUserNAuthList', 'sysAuthMenu.getUserNAuthList', '1060427695770143999', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/getUserNAuthList', '11', '1', '', '', '0', '0', '2017-03-24 17:16:50', '2017-03-24 17:16:50', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063085635986630521', '1', 'mainAttach:manage', '主附权限管理:访问', '', '', '1063084084742170457', '2', '1052481659203556933', '1', '', '/sys/sysAuthMenu/mainAttachAuthJoinView/%d', '1', '1', '', '', '0', '0', '2017-03-28 19:24:08', '2017-03-28 19:25:15', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063085695328692091', '1', 'mainAttach:list', '主附权限管理:列表', '', '', '1063084084742170457', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/authJoinList', '2', '1', '', '', '0', '0', '2017-03-28 19:25:04', '2017-03-28 19:25:04', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063085797168490366', '1', 'mainAttach:chooseAuth', '主附权限管理:选择权限', '', '', '1063084084742170457', '2', '1060512414373153244', '1', '', '/sys/sysAuthMenu/chooseMainAttachAuthView', '3', '1', '', '', '0', '0', '2017-03-28 19:26:41', '2017-03-28 19:26:41', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063085844650108800', '1', 'mainAttach:chooseAuthList', '主附权限管理:选择权限列表', '', '', '1063084084742170457', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/chooseMainAttachAuthList', '4', '1', '', '', '0', '0', '2017-03-28 19:27:27', '2017-03-28 19:27:27', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063085973985666946', '1', 'mainAttach:joinedList', '主附权限管理:已关联列表', '', '', '1063084084742170457', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/getMainAttachJoinedList', '5', '1', '', '', '0', '0', '2017-03-28 19:29:30', '2017-03-28 19:29:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063086049155983236', '1', 'mainAttach:saveMainAuthJoinList', '主附权限管理:保存主权限关联', '', '', '1063084084742170457', '2', '1052481659203557963', '1', '', '/sys/sysAuthMenu/saveMainAuthJoinList', '7', '1', '', '', '0', '0', '2017-03-28 19:30:42', '2017-03-28 19:30:42', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063086099806398342', '1', 'mainAttach:saveAttachAuthJoinList', '主附权限管理:保存附属权限关联', '', '', '1063084084742170457', '2', '1052481659203557963', '1', '', '/sys/sysAuthMenu/saveAttachAuthJoinList', '8', '1', '', '', '0', '0', '2017-03-28 19:31:30', '2017-03-28 19:31:30', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063086183253125000', '1', 'mainAttach:joinManage', '主附权限管理:管理', '', '', '1063084084742170457', '1', '1052481659203557963', '1', '', '/sys/sysAuthMenu/mainAttach:joinManage', '2', '1', '', '虚拟URL，主要配置 管理  按钮权限', '0', '0', '2017-03-28 19:32:50', '2017-03-29 17:11:44', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063086218756859786', '1', 'mainAttach:deleteJoin', '主附权限管理:删除', '', '', '1063084084742170457', '1', '1052481659203558275', '1', '', '/sys/sysAuthMenu/deleteBatchAuthJoin', '2', '1', '', '', '0', '0', '2017-03-28 19:33:23', '2017-03-28 19:33:23', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063088912725599228', '1', 'common:sysUserDetail', '查看用户详情', '', '', '1063088840446206970', '1', '1060512414373153244', '1', '', '/common/sysUser/detail/%d', '1', '1', '', '', '0', '0', '2017-03-28 20:16:13', '2017-03-30 17:36:12', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063147339691241342', '1', 'sysAuth_authJoinTab:view', '主附属权限:访问', '', '', '1063084084742170457', '1', '1052481659203556933', '0', '', '/sys/sysAuthMenu/mainAttachAuthJoinView/%d', '1', '0', '', '', '0', '0', '2017-03-29 11:44:53', '2017-03-29 17:11:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063147781809680259', '1', 'sysAuth:authJoinList', '主附权限关联分页数据', '', '', '1063084084742170457', '2', '1060262570224060575', '0', '', '/sys/sysAuthMenu/authJoinList', '1', '0', '', '', '0', '0', '2017-03-29 11:51:55', '2017-03-29 11:51:55', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063343110077830378', '1', 'sysEmployeeOrgReport:orgUserPie', '员工分布饼图数据查询', '', '', '1052481656748840410', '2', '1060262570224060575', '0', '', '/sys/report/sysEmployeeOrgReport/getOrgUserPieData', '1', '1', '', '', '0', '0', '2017-03-31 15:36:34', '2017-03-31 15:36:34', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063343187702751034', '1', 'sysPersonalSetting:themeColor', '个性化设置:主题修改', '', '', '1052481658449630687', '2', '1052481659203557963', '1', '', '/sys/sysPersonal/personalSetting/update/%s/%s', '3', '1', '', '', '0', '0', '2017-03-31 15:37:48', '2017-03-31 15:37:48', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063343214615614700', '1', 'sysEmployeeJobReport:UserInOutJobBar', '入职离职柱图数据查询', '', '', '1052481656748840422', '2', '1060262570224060575', '0', '', '/sys/report/sysEmployeeJobReport/getUserInOutJobBar', '1', '1', '', '', '0', '0', '2017-03-31 15:38:14', '2017-03-31 15:38:14', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063343762846687046', '1', 'sysConfig:pagesize', '系统设置:获取分页配置', '', '', '1052481652945655248', '2', '1060262570224060575', '1', '', '/sys/sysConfig/defaultPageSize/%s', '4', '1', '', '', '0', '0', '2017-03-31 15:46:57', '2017-03-31 15:46:57', '1', '1', null, '1');
INSERT INTO `sys_auth` VALUES ('1063346679122140324', '1', 'sysAuthMenu:checkAuthRelation', '删除:校验', '', '', '1052481648470332868', '2', '1060262570224060575', '1', '', '/sys/sysAuthMenu/checkAuthRelation', '5', '1', '', '', '0', '0', '2017-03-31 16:33:18', '2017-03-31 16:33:18', '2', '2', null, '1');

-- ----------------------------
-- Table structure for sys_auth_join
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_join`;
CREATE TABLE `sys_auth_join` (
  `AUTH_JOIN_ID_` bigint(20) NOT NULL COMMENT '主键ID',
  `MAIN_AUTH_ID_` bigint(20) NOT NULL COMMENT '主权限ID',
  `ATTACH_AUTH_ID_` bigint(20) NOT NULL COMMENT '附属权限ID',
  `IS_FINAL_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  PRIMARY KEY (`AUTH_JOIN_ID_`),
  UNIQUE KEY `AK_Key_2` (`MAIN_AUTH_ID_`,`ATTACH_AUTH_ID_`) USING BTREE,
  KEY `FK_Reference_35` (`ATTACH_AUTH_ID_`) USING BTREE,
  CONSTRAINT `sys_auth_join_ibfk_1` FOREIGN KEY (`ATTACH_AUTH_ID_`) REFERENCES `sys_auth` (`AUTH_ID_`),
  CONSTRAINT `sys_auth_join_ibfk_2` FOREIGN KEY (`MAIN_AUTH_ID_`) REFERENCES `sys_auth` (`AUTH_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限关联表';

-- ----------------------------
-- Records of sys_auth_join
-- ----------------------------
INSERT INTO `sys_auth_join` VALUES ('1062695084782875539', '1053269289002732093', '1060426547659115772', '0', '2017-03-24 11:56:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1062695145589797781', '1060428226958822660', '1060428307722243333', '0', '2017-03-24 11:57:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1062695250099270551', '1053269289128561216', '1060443227480767902', '0', '2017-03-24 11:59:07', '1');
INSERT INTO `sys_auth_join` VALUES ('1062703691014307104', '1053269288709130807', '1060513898629335518', '0', '2017-03-24 14:13:17', '1');
INSERT INTO `sys_auth_join` VALUES ('1062703691081415969', '1053269288709130807', '1060517440993790435', '0', '2017-03-24 14:13:17', '1');
INSERT INTO `sys_auth_join` VALUES ('1062703893003335303', '1053269288255097393', '1061888394816547457', '0', '2017-03-24 14:16:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1062703893006481032', '1053269288340032050', '1061888394816547457', '0', '2017-03-24 14:16:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1062704299991332524', '1053269290258926161', '1060549946271507752', '0', '2017-03-24 14:22:57', '1');
INSERT INTO `sys_auth_join` VALUES ('1062704355523917487', '1053269290312403538', '1060550019723207980', '0', '2017-03-24 14:23:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062704890652359974', '1060514158411942368', '1060427833277254912', '0', '2017-03-24 14:32:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1062704890716323111', '1060514158411942368', '1060428170911386883', '0', '2017-03-24 14:32:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1062704890781334824', '1060514158411942368', '1060428430601719046', '0', '2017-03-24 14:32:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1062705142840130859', '1060517625944771045', '1060529385641773556', '0', '2017-03-24 14:36:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1062705142926114092', '1060517625944771045', '1060529093387913715', '0', '2017-03-24 14:36:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1062705996409042663', '1060550604366193982', '1053269290220128848', '0', '2017-03-24 14:49:55', '1');
INSERT INTO `sys_auth_join` VALUES ('1062705996414285544', '1060550604366193982', '1060549276660100111', '0', '2017-03-24 14:49:55', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706052410341098', '1053269290079619662', '1053269289870953034', '0', '2017-03-24 14:50:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706052414535403', '1053269290079619662', '1060548372414295051', '0', '2017-03-24 14:50:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706088148956909', '1053269290030336589', '1053269289870953034', '0', '2017-03-24 14:51:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706088152102638', '1053269290030336589', '1060548320109227017', '0', '2017-03-24 14:51:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706404473927438', '1060545898669371360', '1053269289816427081', '0', '2017-03-24 14:56:24', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706470923237146', '1060546419125874659', '1060546993337626607', '0', '2017-03-24 14:57:28', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706507353913116', '1060546527206797285', '1060547128443498482', '0', '2017-03-24 14:58:02', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706844591683378', '1060531869244323473', '1060531910439728787', '0', '2017-03-24 15:03:24', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706844594829107', '1060531869244323473', '1060531786719295117', '0', '2017-03-24 15:03:24', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706859339904822', '1060521729551530342', '1060521817713703273', '0', '2017-03-24 15:03:38', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706859343050551', '1060521729551530342', '1060521285249956189', '0', '2017-03-24 15:03:38', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706877684741947', '1053269288410286644', '1060521414168181087', '0', '2017-03-24 15:03:56', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706877688936252', '1053269288410286644', '1060520373898434155', '0', '2017-03-24 15:03:56', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706906113734462', '1060535744735082200', '1060532757231957697', '0', '2017-03-24 15:04:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062706906117928767', '1060535744735082200', '1060535863639406298', '0', '2017-03-24 15:04:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712525128431537', '1053269288410286645', '1060532813148321476', '0', '2017-03-24 16:33:41', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712525132625842', '1053269288410286645', '1060532701455054527', '0', '2017-03-24 16:33:41', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712539361802164', '1060536599394776813', '1060536654727083760', '0', '2017-03-24 16:33:55', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712539365996469', '1060536599394776813', '1060536526409692907', '0', '2017-03-24 16:33:55', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712568411551674', '1060539272757114664', '1060539337256073002', '0', '2017-03-24 16:34:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712568415745979', '1060539272757114664', '1060539098439743266', '0', '2017-03-24 16:34:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712586262509501', '1060539828406974268', '1060540003079812926', '0', '2017-03-24 16:34:40', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712586265655230', '1060539828406974268', '1060539139843815204', '0', '2017-03-24 16:34:40', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712603054405568', '1060540379121186632', '1060540564383594317', '0', '2017-03-24 16:34:56', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712603058599873', '1060540379121186632', '1060539182585870118', '0', '2017-03-24 16:34:56', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712622083962819', '1053269288410286646', '1060537568121714444', '0', '2017-03-24 16:35:14', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712622087108548', '1053269288410286646', '1060537460372141834', '0', '2017-03-24 16:35:14', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712635115665350', '1060537905622677270', '1060537942106830616', '0', '2017-03-24 16:35:26', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712653343061960', '1053269288410286667', '1060537076158166782', '0', '2017-03-24 16:35:44', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712653356693449', '1053269288410286667', '1060537029762873084', '0', '2017-03-24 16:35:44', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712694649616333', '1053269288410286644', '1060531956747990677', '0', '2017-03-24 16:36:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712694652762062', '1060518473066075753', '1060531956747990677', '0', '2017-03-24 16:36:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712694655907791', '1060521496474057057', '1060531956747990677', '0', '2017-03-24 16:36:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712721584388049', '1053269288410286644', '1060529720687982212', '0', '2017-03-24 16:36:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712721588582354', '1060518473066075753', '1060529720687982212', '0', '2017-03-24 16:36:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712721591728083', '1060521496474057057', '1060529720687982212', '0', '2017-03-24 16:36:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712972209780702', '1060539641341015862', '1060529824024098438', '0', '2017-03-24 16:40:48', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712972213975007', '1060539726008284984', '1060529824024098438', '0', '2017-03-24 16:40:48', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712984447711201', '1060539641341015862', '1060529924825806473', '0', '2017-03-24 16:40:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062712984450856930', '1060539726008284984', '1060529924825806473', '0', '2017-03-24 16:40:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713227055691759', '1060536045116454623', '1060535506143147724', '0', '2017-03-24 16:44:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713227059886064', '1060536117623387875', '1060535506143147724', '0', '2017-03-24 16:44:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713252693374964', '1060539641341015862', '1060536006906345181', '0', '2017-03-24 16:45:15', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713252696520693', '1060539726008284984', '1060536006906345181', '0', '2017-03-24 16:45:15', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713287621441528', '1060537972850030362', '1060532901006407366', '0', '2017-03-24 16:45:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713287774533625', '1060538012249224988', '1060532901006407366', '0', '2017-03-24 16:45:49', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713307727886331', '1060535560930195150', '1060535336045246152', '0', '2017-03-24 16:46:08', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713307732080636', '1060535607169251025', '1060535336045246152', '0', '2017-03-24 16:46:08', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713323523635198', '1060535560930195150', '1060535392954611402', '0', '2017-03-24 16:46:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713323532023807', '1060535607169251025', '1060535392954611402', '0', '2017-03-24 16:46:23', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713369290830849', '1060539641341015862', '1060536725987260146', '0', '2017-03-24 16:47:06', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713369295025154', '1060539726008284984', '1060536725987260146', '0', '2017-03-24 16:47:06', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713381652493316', '1060539641341015862', '1060536768554202868', '0', '2017-03-24 16:47:18', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713381656687621', '1060539726008284984', '1060536768554202868', '0', '2017-03-24 16:47:18', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713484474807303', '1060540733235787601', '1060539514465417008', '0', '2017-03-24 16:48:56', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713484479001608', '1060540774933460819', '1060539514465417008', '0', '2017-03-24 16:48:56', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713501140874250', '1060540733235787601', '1060539570032604978', '0', '2017-03-24 16:49:12', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713501144019979', '1060540774933460819', '1060539570032604978', '0', '2017-03-24 16:49:12', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713552894391309', '1053269288410286667', '1060540184194053952', '0', '2017-03-24 16:50:02', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713613173879824', '1053269288410286667', '1060540692990392143', '0', '2017-03-24 16:50:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713644141474834', '1053269288410286645', '1060540484947670858', '0', '2017-03-24 16:51:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713676386235413', '1053269288410286667', '1060537811049510674', '0', '2017-03-24 16:51:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713695173571608', '1060537116852352768', '1060537606721894158', '0', '2017-03-24 16:52:17', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713695176717337', '1060537149546952450', '1060537606721894158', '0', '2017-03-24 16:52:17', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713708268188699', '1060537116852352768', '1060537654704731920', '0', '2017-03-24 16:52:30', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713708271334428', '1060537149546952450', '1060537654704731920', '0', '2017-03-24 16:52:30', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713757168530463', '1060539641341015862', '1060547630236397565', '0', '2017-03-24 16:53:16', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713757171676192', '1060539726008284984', '1060547630236397565', '0', '2017-03-24 16:53:16', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713770390025250', '1060539641341015862', '1060547877732839423', '0', '2017-03-24 16:53:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713770394219555', '1060539726008284984', '1060547877732839423', '0', '2017-03-24 16:53:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713808288707622', '1060539641341015862', '1060549604763724817', '0', '2017-03-24 16:54:05', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713808291853351', '1060539726008284984', '1060549604763724817', '0', '2017-03-24 16:54:05', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713929277865304', '1053269288579107380', '1060540810435241095', '0', '2017-03-24 16:56:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713929361751385', '1053269288579107380', '1060428430601719046', '0', '2017-03-24 16:56:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713929441443162', '1053269288579107380', '1060532031278713347', '0', '2017-03-24 16:56:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713929515892059', '1053269288579107380', '1060546910797918189', '0', '2017-03-24 16:56:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713929590340956', '1053269288579107380', '1060428170911386883', '0', '2017-03-24 16:56:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713990553501022', '1053269288618953269', '1060540810435241095', '0', '2017-03-24 16:56:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713990626901343', '1053269288618953269', '1060428430601719046', '0', '2017-03-24 16:56:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713990695058784', '1053269288618953269', '1060428170911386883', '0', '2017-03-24 16:56:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713990806207841', '1053269288618953269', '1060532031278713347', '0', '2017-03-24 16:56:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062713990882753890', '1053269288618953269', '1060546910797918189', '0', '2017-03-24 16:56:59', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715427782098313', '1053269288410286643', '1060428430601719046', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715427892198794', '1053269288410286643', '1062715239701118332', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715427972939147', '1053269288410286643', '1060543741436896434', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428048436620', '1053269288410286643', '1060543603062613168', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428120788365', '1053269288410286643', '1060543456489514156', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428188945806', '1053269288410286643', '1060543305368741032', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428266540431', '1053269288410286643', '1060543175201662116', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428347280784', '1053269288410286643', '1060542273644405917', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428418583953', '1053269288410286643', '1060541545812075659', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1062715428490935698', '1053269288410286643', '1062715158343155066', '0', '2017-03-24 17:19:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1063086247471064972', '1063086183253125000', '1063085797168490366', '0', '2017-03-28 19:33:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063086247541319565', '1063086183253125000', '1063085844650108800', '0', '2017-03-28 19:33:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063086247609477006', '1063086183253125000', '1063085973985666946', '0', '2017-03-28 19:33:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063086247676585871', '1063086183253125000', '1063086049155983236', '0', '2017-03-28 19:33:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063086247747889040', '1063086183253125000', '1063086099806398342', '0', '2017-03-28 19:33:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063144595149672125', '1053269290986637920', '1060457336948118351', '0', '2017-03-29 11:01:16', '1');
INSERT INTO `sys_auth_join` VALUES ('1063144595230412478', '1053269290986637920', '1060460357990747589', '0', '2017-03-29 11:01:16', '1');
INSERT INTO `sys_auth_join` VALUES ('1063144595314298559', '1053269290986637920', '1060457499070550864', '0', '2017-03-29 11:01:16', '1');
INSERT INTO `sys_auth_join` VALUES ('1063144965657710276', '1053269290790554204', '1060454137317508479', '0', '2017-03-29 11:07:09', '1');
INSERT INTO `sys_auth_join` VALUES ('1063144965736353477', '1053269290790554204', '1060454237634774400', '0', '2017-03-29 11:07:09', '1');
INSERT INTO `sys_auth_join` VALUES ('1063144965814996678', '1053269290790554204', '1060455425160725889', '0', '2017-03-29 11:07:09', '1');
INSERT INTO `sys_auth_join` VALUES ('1063145042703929032', '1053269291956570730', '1060529513805055535', '0', '2017-03-29 11:08:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063145079173402314', '1053269292139022958', '1060529782516287036', '0', '2017-03-29 11:08:57', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060153462644', '1053269288910457403', '1060429497480613151', '0', '2017-03-29 11:40:26', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060458598261', '1053269288910457403', '1060428045272059138', '0', '2017-03-29 11:40:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060584427382', '1053269288910457403', '1060425623704276216', '0', '2017-03-29 11:40:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060653633399', '1053269288910457403', '1060425958750522618', '0', '2017-03-29 11:40:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060756393848', '1053269288910457403', '1063085635986630521', '0', '2017-03-29 11:40:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060826648441', '1053269288910457403', '1063085695328692091', '0', '2017-03-29 11:40:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147060902145914', '1053269288910457403', '1060429383554927902', '0', '2017-03-29 11:40:27', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147781852876542', '1053269292864637564', '1060512716001200972', '0', '2017-03-29 11:51:55', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147832586973061', '1063147339691241342', '1063147781809680259', '0', '2017-03-29 11:52:43', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147869079719680', '1053269293111052929', '1060530105551095370', '0', '2017-03-29 11:53:18', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147889924361986', '1053269293281970821', '1060530184971290188', '0', '2017-03-29 11:53:38', '1');
INSERT INTO `sys_auth_join` VALUES ('1063147906891370244', '1053269293456034441', '1060530241626900046', '0', '2017-03-29 11:53:54', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148343610691351', '1053269294376684186', '1060548823386528786', '0', '2017-03-29 12:00:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148343688285976', '1053269294376684186', '1060548783610895376', '0', '2017-03-29 12:00:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148343766929177', '1053269294376684186', '1060548738777979918', '0', '2017-03-29 12:00:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148343844523802', '1053269294376684186', '1060548696499395596', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148343922118427', '1053269294376684186', '1060548650538212362', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148344296460060', '1053269294376684186', '1060548604316982280', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148344434872093', '1053269294376684186', '1060548547256622086', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148344516661022', '1053269294376684186', '1060548509240499204', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148344607887135', '1053269294376684186', '1060548460813065218', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148344688627488', '1053269294376684186', '1060548409359440896', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148344770416417', '1053269294376684186', '1053269294457424540', '0', '2017-03-29 12:00:51', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148406422490915', '1053269294561233566', '1053269294677625504', '0', '2017-03-29 12:01:50', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148734637264677', '1053269294762560162', '1060548020285317108', '0', '2017-03-29 12:07:03', '1');
INSERT INTO `sys_auth_join` VALUES ('1063148734824959782', '1053269294762560162', '1053269294956546724', '0', '2017-03-29 12:07:03', '1');
INSERT INTO `sys_auth_join` VALUES ('1063165893187075362', '1060543902148994228', '1060546235097425111', '0', '2017-03-29 16:39:47', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169389667941681', '1053269289776581192', '1060546910797918189', '0', '2017-03-29 17:35:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169389753924914', '1053269289776581192', '1060546777792344040', '0', '2017-03-29 17:35:21', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169389834665267', '1053269289776581192', '1053269290156165711', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169389914357044', '1053269289776581192', '1053269290354346579', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169389997194549', '1053269289776581192', '1060550397229442360', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169390082129206', '1053269289776581192', '1060550493994132794', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169390162869559', '1053269289776581192', '1060550543534105916', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169390243609912', '1053269289776581192', '1060550896685065720', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169390325398841', '1053269289776581192', '1060550974426490362', '0', '2017-03-29 17:35:22', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282154', '1053269288910457403', '1060531101189704192', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282155', '1053269288910457403', '1060531180596267521', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282156', '1053269288910457403', '1060529385641773556', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282157', '1053269288910457403', '1060529093387913715', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282158', '1053269288910457403', '1060540655986214547', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282159', '1053269288910457403', '1060539904442435202', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282160', '1053269288910457403', '1060546910797918189', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282161', '1053269288910457403', '1060540292496295560', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282162', '1053269288910457403', '1060540362735158922', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282163', '1053269289082423871', '1063346679122140324', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282164', '1053269289722055239', '1063346679122140324', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282940', '1053269289776581192', '1060550321210828086', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282941', '1053269292373903987', '1060530512527558229', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282942', '1053269292373903987', '1060531371389945459', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282943', '1060537905622677270', '1060529385641773556', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282944', '1060537905622677270', '1060529093387913715', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282945', '1060537905622677270', '1060546910797918189', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282946', '1060517625944771045', '1060546910797918189', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282947', '1053269294762560162', '1063343187702751034', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282948', '1053269294762560162', '1063343762846687046', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282950', '1060550604366193982', '1060529385641773556', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282951', '1060550604366193982', '1060529093387913715', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282952', '1060551024781207036', '1060529385641773556', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063169522992282953', '1060551024781207036', '1060529093387913715', '0', '2017-03-29 17:37:29', '1');
INSERT INTO `sys_auth_join` VALUES ('1063343246182995182', '1053269293872319120', '1063343110077830378', '0', '2017-03-31 15:38:44', '1');
INSERT INTO `sys_auth_join` VALUES ('1063343263826334960', '1053269294071548564', '1063343214615614700', '0', '2017-03-31 15:39:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1063343263826334961', '1063088912725599228', '1060543175201662116', '0', '2017-03-31 15:39:01', '1');
INSERT INTO `sys_auth_join` VALUES ('1063343263826334962', '1063088912725599228', '1060543305368741032', '0', '2017-03-31 15:39:01', '1');


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `CONFIG_ID_` bigint(20) NOT NULL COMMENT '设置编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `CONFIG_KEY_` varchar(32) DEFAULT NULL COMMENT '设置KEY',
  `CONFIG_VALUE_` varchar(256) DEFAULT NULL COMMENT '设置值',
  `CONFIG_DESC_` varchar(256) DEFAULT NULL COMMENT '设置描述',
  `CONFIG_TYPE_` varchar(32) DEFAULT NULL COMMENT '设置类型',
  `DEFAULT_VALUE_` varchar(256) DEFAULT NULL COMMENT '默认值',
  `SORT_NO_` int(11) DEFAULT NULL COMMENT '排序号',
  `VERSION_` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  `IS_CURRENT_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为当前版本',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`CONFIG_ID_`),
  UNIQUE KEY `AK_Key_2` (`CONFIG_KEY_`,`VERSION_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1054368604333830512', '1', 'sysLoginVerifCode', '1', '登录验证码开关', 'sys', '1', '9', '1', '0', null, '0', '0', '2016-12-22 14:10:38', '2016-12-22 14:11:17', '1', '1');
INSERT INTO `sys_config` VALUES ('1054368644869681521', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '2', '0', null, '0', '0', '2016-12-22 14:11:17', '2016-12-26 10:56:55', '1', '1');
INSERT INTO `sys_config` VALUES ('1054369247988576626', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '1', '0', null, '0', '0', '2016-12-22 14:20:52', '2016-12-22 17:04:12', '1', '1');
INSERT INTO `sys_config` VALUES ('1054369443150590323', '1', 'userOnlineTimeout', '1800', '用户非活跃自动退出的时间(秒)', 'user', '1800', '11', '1', '0', null, '0', '0', '2016-12-22 14:23:58', '2017-02-21 16:24:20', '1', '1');
INSERT INTO `sys_config` VALUES ('1054379524154664714', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '2', '0', null, '0', '0', '2016-12-22 17:04:12', '2016-12-22 17:15:00', '1', '1');
INSERT INTO `sys_config` VALUES ('1054380203558512396', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '3', '0', null, '0', '0', '2016-12-22 17:15:00', '2016-12-22 17:15:07', '1', '1');
INSERT INTO `sys_config` VALUES ('1054380211029616397', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '4', '0', null, '0', '0', '2016-12-22 17:15:07', '2016-12-22 17:15:21', '1', '1');
INSERT INTO `sys_config` VALUES ('1054380225200072462', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '5', '0', null, '0', '0', '2016-12-22 17:15:21', '2016-12-22 17:15:31', '1', '1');
INSERT INTO `sys_config` VALUES ('1054380235385939727', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '6', '0', null, '0', '0', '2016-12-22 17:15:31', '2017-01-19 10:59:03', '1', '1');
INSERT INTO `sys_config` VALUES ('1054718804590220616', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '3', '0', null, '0', '0', '2016-12-26 10:56:55', '2017-02-21 16:23:53', '1', '1');
INSERT INTO `sys_config` VALUES ('1055710190726003464', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '1', '0', null, '0', '0', '2017-01-06 09:34:35', '2017-01-19 14:29:35', '1', '1');
INSERT INTO `sys_config` VALUES ('1056893266407022349', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '7', '0', null, '0', '0', '2017-01-19 10:59:04', '2017-01-19 10:59:13', '1', '1');
INSERT INTO `sys_config` VALUES ('1056893276582403855', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '8', '0', null, '0', '0', '2017-01-19 10:59:14', '2017-03-16 11:10:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1056906511141211870', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '2', '0', null, '0', '0', '2017-01-19 14:29:35', '2017-02-23 10:45:36', '1', '1');
INSERT INTO `sys_config` VALUES ('1058791157042642781', '1', 'dauthFlag', '0', '数据权限是否启用开关(1:启用;0:禁用)', 'sys', '0', '12', '1', '1', null, '0', '1', '2017-02-09 09:45:13', '2017-02-09 09:45:13', '1', '1');
INSERT INTO `sys_config` VALUES ('1059514707179879550', '1', 'sysDefenseCsrf', '1', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '1', '0', null, '0', '0', '2017-02-17 09:25:45', '2017-02-17 09:38:48', '1', '1');
INSERT INTO `sys_config` VALUES ('1059515529840180351', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '2', '0', null, '0', '0', '2017-02-17 09:38:49', '2017-02-17 09:39:06', '1', '1');
INSERT INTO `sys_config` VALUES ('1059515548276243584', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '3', '0', null, '0', '0', '2017-02-17 09:39:07', '2017-02-23 10:23:17', '1', '1');
INSERT INTO `sys_config` VALUES ('1059903402372432249', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '4', '0', null, '0', '0', '2017-02-21 16:23:53', '2017-02-23 10:42:42', '1', '1');
INSERT INTO `sys_config` VALUES ('1059903430477414778', '1', 'userOnlineTimeout', '1800', '用户非活跃自动退出的时间(秒)', 'user', '1800', '11', '2', '1', null, '0', '0', '2017-02-21 16:24:20', '2017-02-21 16:24:20', '1', '1');
INSERT INTO `sys_config` VALUES ('1060058559543549904', '1', 'xs', '1', '23dsa', 'sys', '1', '2', '1', '0', null, '0', '0', '2017-02-23 09:30:03', '2017-02-23 09:30:13', '1', '1');
INSERT INTO `sys_config` VALUES ('1060061909569806306', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '4', '0', null, '0', '0', '2017-02-23 10:23:17', '2017-03-16 09:20:11', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063114412990446', '1', 'userLoginVerifcode', '3', '', 'd', '1', '12', '1', '0', null, '0', '0', '2017-02-23 10:42:26', '2017-02-23 11:08:50', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063130572595183', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '5', '0', null, '0', '0', '2017-02-23 10:42:42', '2017-02-23 10:42:42', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063130951131120', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '6', '0', null, '0', '0', '2017-02-23 10:42:42', '2017-02-23 10:43:12', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063161922920433', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '7', '0', null, '0', '0', '2017-02-23 10:43:12', '2017-03-16 11:10:17', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063237379497970', '1', ' sysName', 'as', 'as', 'c', 'as', '4', '1', '0', null, '0', '0', '2017-02-23 10:44:24', '2017-02-23 10:44:36', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063250179465203', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '2', '0', null, '0', '0', '2017-02-23 10:44:36', '2017-02-23 10:45:17', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063293027426292', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '3', '0', null, '0', '0', '2017-02-23 10:45:17', '2017-02-23 10:45:52', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063305107021813', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '1', '0', null, '0', '0', '2017-02-23 10:45:28', '2017-02-23 10:45:34', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063311110119414', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '2', '0', null, '0', '0', '2017-02-23 10:45:34', '2017-02-23 10:45:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063313021673463', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '3', '0', null, '0', '0', '2017-02-23 10:45:36', '2017-02-23 10:45:36', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063313248165880', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '4', '0', null, '0', '0', '2017-02-23 10:45:36', '2017-02-23 10:45:56', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063320846147577', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '3', '0', null, '0', '0', '2017-02-23 10:45:43', '2017-02-23 10:45:45', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063322103390202', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '4', '0', null, '0', '0', '2017-02-23 10:45:45', '2017-02-23 10:45:45', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063329790500860', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '4', '0', null, '0', '0', '2017-02-23 10:45:52', '2017-02-24 12:52:51', '1', '1');
INSERT INTO `sys_config` VALUES ('1060063334443032573', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '5', '0', null, '0', '0', '2017-02-23 10:45:56', '2017-02-23 11:01:31', '1', '1');
INSERT INTO `sys_config` VALUES ('1060064314519756798', '1', 'sysName', '鸿冠业务管理', '系统名称', 'sys', '鸿冠业务管理系统', '8', '6', '0', null, '0', '0', '2017-02-23 11:01:31', '2017-02-23 11:02:03', '1', '1');
INSERT INTO `sys_config` VALUES ('1060064347782684671', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '7', '0', null, '0', '0', '2017-02-23 11:02:03', '2017-03-10 09:47:21', '1', '1');
INSERT INTO `sys_config` VALUES ('1060064775348984832', '1', 'userLoginVerifcode', '3', '', 'd', '1', '12', '2', '0', null, '0', '0', '2017-02-23 11:08:50', '2017-02-23 11:10:49', '1', '1');
INSERT INTO `sys_config` VALUES ('1060064899235093505', '1', 'userLoginVerifcode', 'super', '', 'password', 'super', '12', '3', '0', null, '0', '0', '2017-02-23 11:10:49', '2017-02-23 11:15:33', '1', '1');
INSERT INTO `sys_config` VALUES ('1060161915517302606', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '5', '0', null, '0', '0', '2017-02-24 12:52:51', '2017-02-27 19:00:40', '1', '2');
INSERT INTO `sys_config` VALUES ('1060456848023343950', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '6', '0', null, '0', '0', '2017-02-27 19:00:40', '2017-03-02 15:02:06', '2', '1');
INSERT INTO `sys_config` VALUES ('1060628948726426734', '1', 'defaultPageList', '[10,20,30,50,100]', '数据表格展示数据供选择的数量，格式必须为[10,20,30,50,100]', 'sys', '[10,20,30,50,100]', '13', '1', '0', null, '0', '0', '2017-03-01 16:36:08', '2017-03-01 16:41:24', '1', '1');
INSERT INTO `sys_config` VALUES ('1060629280416181361', '1', 'defaultPageList', '[10,20,30,50,100]', '数据表格展示数据供选择的数量，格式必须为[10,20,30,50,100]', 'sys', '[10,20,30,50,100]', '13', '2', '0', null, '0', '1', '2017-03-01 16:41:24', '2017-03-08 15:54:45', '1', '1');
INSERT INTO `sys_config` VALUES ('1060713629858223340', '1', ' sysName', 'as', 'asq&lt;a&gt;1;*&amp;', 'sys', 'as', '4', '7', '0', null, '0', '0', '2017-03-02 15:02:06', '2017-03-02 15:02:33', '1', '1');
INSERT INTO `sys_config` VALUES ('1060713657655973102', '1', ' sysName', 'as', 'asq&amp;lt;a&amp;gt;1;*&amp;amp;', 'sys', 'as', '4', '8', '0', null, '0', '0', '2017-03-02 15:02:33', '2017-03-02 15:02:40', '1', '1');
INSERT INTO `sys_config` VALUES ('1060713664701355248', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '9', '0', null, '0', '0', '2017-03-02 15:02:40', '2017-03-10 09:20:12', '1', '1');
INSERT INTO `sys_config` VALUES ('1061169949813203103', '1', 'key', 'key', '', 'sys', 'a', '12', '1', '0', null, '0', '0', '2017-03-07 15:55:07', '2017-03-07 15:57:04', '1', '1');
INSERT INTO `sys_config` VALUES ('1061252342215968177', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认为10', 'profile', '10', '12', '1', '0', null, '0', '0', '2017-03-08 13:44:42', '2017-03-08 13:45:29', '1', '1');
INSERT INTO `sys_config` VALUES ('1061252391255770547', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认数据', 'profile', '10', '12', '2', '0', null, '0', '0', '2017-03-08 13:45:29', '2017-03-08 13:47:33', '1', '1');
INSERT INTO `sys_config` VALUES ('1061252496293725621', '1', 'themeColor', 'metro', '系统主题配色，默认为metro', 'profile', 'default', '12', '1', '0', null, '0', '0', '2017-03-08 13:47:09', '2017-03-08 14:13:46', '1', '1');
INSERT INTO `sys_config` VALUES ('1061252521005516215', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认数据为10', 'profile', '10', '12', '3', '0', null, '0', '0', '2017-03-08 13:47:33', '2017-03-08 14:13:38', '1', '1');
INSERT INTO `sys_config` VALUES ('1061254161811014369', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认数据为10', 'profile', '数据表格展示数据数量', '12', '4', '0', null, '0', '0', '2017-03-08 14:13:38', '2017-03-08 15:08:53', '1', '1');
INSERT INTO `sys_config` VALUES ('1061254170120979171', '1', 'themeColor', 'metro', '系统主题配色，默认为metro', 'profile', '系统主题配色', '12', '2', '1', null, '0', '1', '2017-03-08 14:13:46', '2017-03-08 14:13:46', '1', '1');
INSERT INTO `sys_config` VALUES ('1061257638702321050', '1', 'defaultPageSize', '20', '数据表格展示数据数量，默认数据为10', 'profile', '数据表格展示数据数量', '12', '5', '1', null, '0', '1', '2017-03-08 15:08:54', '2017-03-08 15:08:54', '1', '1');
INSERT INTO `sys_config` VALUES ('1061260524390092501', '1', 'defaultPageList', '[10,20,30,50,100]', '数据表格展示数据供选择的数量，格式必须为[10,20,30,50,100]', 'sys', '[10,20,30,50,100]', '13', '3', '1', null, '0', '0', '2017-03-08 15:54:46', '2017-03-08 15:54:46', '1', '1');
INSERT INTO `sys_config` VALUES ('1061264423937501773', '1', 'sysLogTimeout', '10', '系统日志过期时间（单位：天）过期将自动删除', 'sys', '10', '18', '1', '1', null, '0', '0', '2017-03-08 16:56:45', '2017-03-08 16:56:45', '1', '1');
INSERT INTO `sys_config` VALUES ('1061416895362299273', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '10', '0', null, '0', '0', '2017-03-10 09:20:13', '2017-03-10 09:21:25', '1', '1');
INSERT INTO `sys_config` VALUES ('1061416971501499788', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '11', '0', null, '0', '0', '2017-03-10 09:21:25', '2017-03-10 09:44:16', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418409448371599', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '12', '0', null, '0', '0', '2017-03-10 09:44:17', '2017-03-10 09:44:36', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418429970052498', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '13', '0', null, '0', '0', '2017-03-10 09:44:36', '2017-03-10 09:44:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418437165381013', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '14', '0', null, '0', '0', '2017-03-10 09:44:43', '2017-03-10 09:44:51', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418446097151384', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '15', '0', null, '0', '0', '2017-03-10 09:44:52', '2017-03-10 09:45:00', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418454891558299', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '16', '0', null, '0', '0', '2017-03-10 09:45:00', '2017-03-10 09:45:09', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418465343763870', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '17', '0', null, '0', '0', '2017-03-10 09:45:10', '2017-03-10 09:46:08', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418526681265569', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '18', '0', null, '0', '0', '2017-03-10 09:46:08', '2017-03-10 09:46:54', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418574741697956', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '19', '0', null, '0', '0', '2017-03-10 09:46:54', '2017-03-10 14:06:28', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418603326928295', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '8', '0', null, '0', '0', '2017-03-10 09:47:21', '2017-03-10 09:47:25', '1', '1');
INSERT INTO `sys_config` VALUES ('1061418607249651114', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '9', '0', null, '0', '0', '2017-03-10 09:47:25', '2017-03-10 15:56:40', '1', '1');
INSERT INTO `sys_config` VALUES ('1061434905612449199', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '20', '0', null, '0', '0', '2017-03-10 14:06:29', '2017-03-10 15:46:06', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441173620192691', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '21', '0', null, '0', '0', '2017-03-10 15:46:06', '2017-03-10 15:48:26', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441320225797558', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '22', '0', null, '0', '0', '2017-03-10 15:48:26', '2017-03-10 15:48:53', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441348330780089', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '23', '0', null, '0', '0', '2017-03-10 15:48:53', '2017-03-10 15:49:49', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441407566935484', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '24', '0', null, '0', '0', '2017-03-10 15:49:49', '2017-03-10 15:51:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441528303121855', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '25', '0', null, '0', '0', '2017-03-10 15:51:44', '2017-03-10 15:51:57', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441541259326914', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '26', '0', null, '0', '0', '2017-03-10 15:51:57', '2017-03-10 15:52:04', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441548596213189', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '27', '0', null, '0', '0', '2017-03-10 15:52:04', '2017-03-10 15:52:07', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441552372135368', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '28', '0', null, '0', '0', '2017-03-10 15:52:07', '2017-03-10 15:52:13', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441557951608267', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '29', '0', null, '0', '0', '2017-03-10 15:52:13', '2017-03-10 15:52:15', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441560489162190', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '30', '0', null, '0', '0', '2017-03-10 15:52:15', '2017-03-10 15:52:19', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441564321707473', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '31', '0', null, '0', '0', '2017-03-10 15:52:19', '2017-03-10 15:52:22', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441567469532628', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '32', '0', null, '0', '0', '2017-03-10 15:52:22', '2017-03-10 15:52:25', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441571323049431', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '33', '0', null, '0', '0', '2017-03-10 15:52:25', '2017-03-10 15:52:28', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441573992723930', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '34', '0', null, '0', '0', '2017-03-10 15:52:28', '2017-03-10 15:53:44', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441653569156573', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '35', '0', null, '0', '0', '2017-03-10 15:53:44', '2017-03-10 15:54:18', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441689504904672', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '36', '0', null, '0', '0', '2017-03-10 15:54:18', '2017-03-10 15:54:22', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441693878515171', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '37', '0', null, '0', '0', '2017-03-10 15:54:22', '2017-03-10 15:54:30', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441701813089766', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '38', '0', null, '0', '0', '2017-03-10 15:54:30', '2017-03-10 15:54:33', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441704971400681', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '39', '0', null, '0', '0', '2017-03-10 15:54:33', '2017-03-10 15:54:38', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441710649439724', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '40', '0', null, '0', '0', '2017-03-10 15:54:38', '2017-03-10 15:54:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441715909096943', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '41', '0', null, '0', '0', '2017-03-10 15:54:43', '2017-03-10 15:54:48', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441721107936754', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '42', '0', null, '0', '0', '2017-03-10 15:54:48', '2017-03-10 15:55:51', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441787513206261', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '43', '0', null, '0', '0', '2017-03-10 15:55:52', '2017-03-10 15:56:35', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441833474389496', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '44', '0', null, '0', '0', '2017-03-10 15:56:35', '2017-03-10 15:57:10', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441837953906170', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '10', '0', null, '0', '0', '2017-03-10 15:56:40', '2017-03-10 15:56:47', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441846041572860', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '11', '0', null, '0', '0', '2017-03-10 15:56:47', '2017-03-10 15:56:48', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441847255823870', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '12', '0', null, '0', '0', '2017-03-10 15:56:49', '2017-03-10 15:57:00', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441859548280320', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '13', '0', null, '0', '0', '2017-03-10 15:57:00', '2017-03-11 17:14:22', '1', '1');
INSERT INTO `sys_config` VALUES ('1061441869703738882', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '45', '0', null, '0', '0', '2017-03-10 15:57:10', '2017-03-13 11:33:12', '1', '1');
INSERT INTO `sys_config` VALUES ('1061537323593743695', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '14', '0', null, '0', '0', '2017-03-11 17:14:22', '2017-03-16 11:10:14', '1', '1');
INSERT INTO `sys_config` VALUES ('1061960476082391514', '1', 'sysDefenseCsrf', '1', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '5', '0', null, '0', '0', '2017-03-16 09:20:12', '2017-03-16 09:26:45', '1', '1');
INSERT INTO `sys_config` VALUES ('1061960888449555057', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '6', '0', null, '0', '0', '2017-03-16 09:26:45', '2017-03-16 09:27:29', '1', '1');
INSERT INTO `sys_config` VALUES ('1061960934371940979', '1', 'sysDefenseCsrf', '1', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '7', '0', null, '0', '0', '2017-03-16 09:27:29', '2017-03-22 16:40:27', '1', '1');
INSERT INTO `sys_config` VALUES ('1061961519968082566', '1', '22', '22', '', '22', '22', '12', '1', '0', null, '0', '0', '2017-03-16 09:36:47', '2017-03-16 09:39:45', '1', '1');
INSERT INTO `sys_config` VALUES ('1061967399646190285', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '15', '0', null, '0', '0', '2017-03-16 11:10:14', '2017-03-16 11:10:30', '1', '1');
INSERT INTO `sys_config` VALUES ('1061967402705935055', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '8', '0', null, '0', '0', '2017-03-16 11:10:17', '2017-03-16 11:10:22', '1', '1');
INSERT INTO `sys_config` VALUES ('1061967407394118353', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '9', '0', null, '0', '0', '2017-03-16 11:10:22', '2017-03-16 11:10:40', '1', '1');
INSERT INTO `sys_config` VALUES ('1061967416175942355', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '16', '0', null, '0', '0', '2017-03-16 11:10:30', '2017-03-16 15:27:21', '1', '1');
INSERT INTO `sys_config` VALUES ('1061967426388024021', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '10', '1', null, '0', '0', '2017-03-16 11:10:40', '2017-03-16 11:10:40', '1', '1');
INSERT INTO `sys_config` VALUES ('1061967430022388439', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '9', '1', null, '0', '0', '2017-03-16 11:10:43', '2017-03-16 11:10:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1061983575865080698', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '17', '0', null, '0', '0', '2017-03-16 15:27:21', '2017-03-30 17:34:18', '1', '1');
INSERT INTO `sys_config` VALUES ('1062077346889137721', '1', 'xsx', 'csac', '', 'xsa', 'sc', '12', '1', '0', null, '0', '0', '2017-03-17 16:17:48', '2017-03-17 16:18:01', '1', '1');
INSERT INTO `sys_config` VALUES ('1062440873932079965', '1', 'name', '0', '', 'sys', '0', '12', '1', '0', null, '0', '0', '2017-03-21 16:35:55', '2017-03-21 16:36:43', '1', '1');
INSERT INTO `sys_config` VALUES ('1062531756334870570', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '8', '1', null, '0', '0', '2017-03-22 16:40:27', '2017-03-22 16:40:27', '1', '1');
INSERT INTO `sys_config` VALUES ('1062691636119351214', '1', '1111111111', '1', '', '11111', '1', '1', '1', '0', null, '0', '0', '2017-03-24 11:01:40', '2017-03-24 11:01:49', '1', '1');
INSERT INTO `sys_config` VALUES ('1062706414284404499', '1', 'sdwedwf', 'frg', '', 'de', 'der', '1', '1', '0', null, '0', '0', '2017-03-24 14:56:34', '2017-03-24 14:56:41', '1', '1');
INSERT INTO `sys_config` VALUES ('1062710248319711107', '1', 'sa', 'dsf', '', 'sad', 'fdv', '1', '1', '0', null, '0', '0', '2017-03-24 15:57:30', '2017-03-24 15:57:34', '1', '1');
INSERT INTO `sys_config` VALUES ('1063259920665755762', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '18', '1', null, '0', '0', '2017-03-30 17:34:19', '2017-03-30 17:34:19', '1', '1');

-- ----------------------------
-- Table structure for sys_dauth
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth`;
CREATE TABLE `sys_dauth` (
  `DAUTH_ID_` bigint(20) NOT NULL COMMENT '数据权限编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ENTITY_ID_` bigint(20) DEFAULT NULL COMMENT '实体ID',
  `DAUTH_CODE_` varchar(64) NOT NULL COMMENT '数据权限编码',
  `DAUTH_NAME_` varchar(64) DEFAULT NULL COMMENT '数据权限名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `TABLE_ALIAS_` varchar(64) NOT NULL COMMENT '表别名',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`DAUTH_ID_`),
  UNIQUE KEY `AK_Key_2` (`DAUTH_CODE_`) USING BTREE,
  KEY `FK_Reference_dauth_32` (`ENTITY_ID_`) USING BTREE,
  CONSTRAINT `sys_dauth_ibfk_1` FOREIGN KEY (`ENTITY_ID_`) REFERENCES `sys_metadata_entity` (`ENTITY_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限表';

-- ----------------------------
-- Records of sys_dauth
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dauth_filter_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_filter_group`;
CREATE TABLE `sys_dauth_filter_group` (
  `FILTER_GROUP_ID_` bigint(20) NOT NULL COMMENT '过滤器组编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `DAUTH_ID_` bigint(20) DEFAULT NULL COMMENT '数据权限ID',
  `GROUP_CODE_` varchar(64) DEFAULT NULL COMMENT '过滤器组编码',
  `GROUP_NAME_` varchar(64) DEFAULT NULL COMMENT '过滤器组名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `CONFIG_TYPE_` tinyint(4) DEFAULT '0' COMMENT '配置类型（0:数据权限配置 1:岗位配置）',
  `BIZ_ID_` bigint(20) DEFAULT NULL COMMENT '业务ID，通过数据权限配置时为null',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`FILTER_GROUP_ID_`),
  KEY `FK_Reference_dauth_33` (`DAUTH_ID_`) USING BTREE,
  CONSTRAINT `sys_dauth_filter_group_ibfk_1` FOREIGN KEY (`DAUTH_ID_`) REFERENCES `sys_dauth` (`DAUTH_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限过滤器组';

-- ----------------------------
-- Records of sys_dauth_filter_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dauth_filter_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_filter_item`;
CREATE TABLE `sys_dauth_filter_item` (
  `FILTER_ITEM_ID_` bigint(20) NOT NULL COMMENT '过滤器编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ENTITY_ID_` bigint(20) DEFAULT NULL COMMENT '实体ID',
  `FILTER_TYPE_ID_` bigint(20) DEFAULT NULL COMMENT '过滤类型ID',
  `FIELD_ID_` bigint(20) DEFAULT NULL COMMENT '字段ID',
  `OPERATOR_ID_` bigint(20) DEFAULT NULL COMMENT '条件ID',
  `VALUE_TYPE_` tinyint(4) DEFAULT NULL COMMENT '值类型（当前用户、职务、岗位、数据权限变量、自定义值、自定义SQL）',
  `FILTER_VALUE_` varchar(3072) DEFAULT NULL COMMENT '值，如果类型是公共范围时，此字段与sys_dauth_variable关联',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`FILTER_ITEM_ID_`),
  KEY `FK_Reference_dauth_14` (`ENTITY_ID_`) USING BTREE,
  KEY `FK_Reference_dauth_35` (`OPERATOR_ID_`) USING BTREE,
  KEY `FK_Reference_dauth_8` (`FIELD_ID_`) USING BTREE,
  KEY `FK_Reference_dauth_9` (`FILTER_TYPE_ID_`) USING BTREE,
  CONSTRAINT `sys_dauth_filter_item_ibfk_1` FOREIGN KEY (`ENTITY_ID_`) REFERENCES `sys_metadata_entity` (`ENTITY_ID_`),
  CONSTRAINT `sys_dauth_filter_item_ibfk_2` FOREIGN KEY (`OPERATOR_ID_`) REFERENCES `sys_dauth_operator` (`OPERATOR_ID_`),
  CONSTRAINT `sys_dauth_filter_item_ibfk_3` FOREIGN KEY (`FIELD_ID_`) REFERENCES `sys_metadata_field` (`FIELD_ID_`),
  CONSTRAINT `sys_dauth_filter_item_ibfk_4` FOREIGN KEY (`FILTER_TYPE_ID_`) REFERENCES `sys_dauth_filter_type` (`FILTER_TYPE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限过滤器项';

-- ----------------------------
-- Records of sys_dauth_filter_item
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dauth_filter_join
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_filter_join`;
CREATE TABLE `sys_dauth_filter_join` (
  `JOIN_ID_` bigint(20) NOT NULL COMMENT '过滤器组编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `FILTER_GROUP_ID_` bigint(20) DEFAULT NULL COMMENT '过滤器组ID',
  `FILTER_ITEM_ID_` bigint(20) DEFAULT NULL COMMENT '过滤器项ID',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`JOIN_ID_`),
  UNIQUE KEY `AK_Key_2` (`FILTER_GROUP_ID_`,`FILTER_ITEM_ID_`) USING BTREE,
  KEY `FK_Reference_dauth_13` (`FILTER_ITEM_ID_`) USING BTREE,
  CONSTRAINT `sys_dauth_filter_join_ibfk_1` FOREIGN KEY (`FILTER_GROUP_ID_`) REFERENCES `sys_dauth_filter_group` (`FILTER_GROUP_ID_`),
  CONSTRAINT `sys_dauth_filter_join_ibfk_2` FOREIGN KEY (`FILTER_ITEM_ID_`) REFERENCES `sys_dauth_filter_item` (`FILTER_ITEM_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限过滤器关联';

-- ----------------------------
-- Records of sys_dauth_filter_join
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dauth_filter_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_filter_type`;
CREATE TABLE `sys_dauth_filter_type` (
  `FILTER_TYPE_ID_` bigint(20) NOT NULL COMMENT '过滤类型编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `FILTER_TYPE_CODE_` varchar(64) DEFAULT NULL COMMENT '过滤类型编码',
  `FILTER_TYPE_NAME_` varchar(64) DEFAULT NULL COMMENT '过滤类型名称（数值型表字段、字符型表字段、当前用户岗位、当前用户职务、无字段）',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `TYPE_` tinyint(4) DEFAULT NULL COMMENT '类型（普通类型--数据库字段、系统变量）',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`FILTER_TYPE_ID_`),
  UNIQUE KEY `AK_Key_2` (`FILTER_TYPE_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限过滤类型表';

-- ----------------------------
-- Records of sys_dauth_filter_type
-- ----------------------------
INSERT INTO `sys_dauth_filter_type` VALUES ('1054555673109101532', '1', 'NumberField', '数值型表字段', 'NumberField', 'NumberField', '2', '', '0', '1', '2016-12-24 15:44:01', '2016-12-24 15:44:01', '1', '1');
INSERT INTO `sys_dauth_filter_type` VALUES ('1054555696913873885', '1', 'StringField', '字符型表字段', 'StringField', 'StringField', '2', '', '0', '1', '2016-12-24 15:44:24', '2017-02-10 18:07:45', '1', '1');
INSERT INTO `sys_dauth_filter_type` VALUES ('1054555727166340062', '1', 'CurrentUserPosition', '当前用户岗位', 'CurrentUserPosition', 'CurrentUserPosition', '1', '', '0', '1', '2016-12-24 15:44:53', '2017-02-20 17:13:18', '1', '1');
INSERT INTO `sys_dauth_filter_type` VALUES ('1059815909991603084', '1', 'CurrentUserJob', '当前用户职务', 'CurrentUserJob', 'CurrentUserJob', '1', '', '0', '1', '2017-02-20 17:13:14', '2017-02-20 17:16:45', '1', '1');
INSERT INTO `sys_dauth_filter_type` VALUES ('1059816042813676429', '1', 'NoField', '无字段', 'NoField', 'NoField', '1', '', '0', '1', '2017-02-20 17:15:21', '2017-02-20 17:15:21', '1', '1');

-- ----------------------------
-- Table structure for sys_dauth_operator
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_operator`;
CREATE TABLE `sys_dauth_operator` (
  `OPERATOR_ID_` bigint(20) NOT NULL COMMENT '运算符编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `OPERATOR_CODE_` varchar(64) DEFAULT NULL COMMENT '运算符编码',
  `OPERATOR_NAME_` varchar(64) DEFAULT NULL COMMENT '运算符名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `OPERATOR_VALUE_` varchar(32) DEFAULT NULL COMMENT '运算符值',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`OPERATOR_ID_`),
  UNIQUE KEY `AK_Key_2` (`OPERATOR_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限运算符表';

-- ----------------------------
-- Records of sys_dauth_operator
-- ----------------------------
INSERT INTO `sys_dauth_operator` VALUES ('1054555069516250074', '1', 'equal', '等于', 'equal', '', '=', 'sql 运算符', '0', '1', '2016-12-24 15:34:26', '2017-02-20 17:20:39', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1054555182964833243', '1', 'notequal', '不等于', 'not equal', '', '!=', 'sql 运算符', '0', '1', '2016-12-24 15:36:14', '2017-02-20 17:20:37', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166209455078845', '1', 'greater', '大于', 'greater', '', '>', 'sql 运算符', '0', '1', '2017-01-11 10:22:48', '2017-02-20 17:20:18', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166251053137342', '1', 'greaterorequal', '大于等于', 'greater or equal', '', '>=', 'sql 运算符', '0', '1', '2017-01-11 10:23:28', '2017-02-20 17:20:16', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166272403193279', '1', 'less', '小于', 'less', '', '<', 'sql 运算符', '0', '1', '2017-01-11 10:23:48', '2017-02-20 17:19:41', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166292126907840', '1', 'lessorequal', '小于等于', 'less or equal', '', '<=', 'sql 运算符', '0', '1', '2017-01-11 10:24:07', '2017-02-20 17:19:38', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166348158614977', '1', 'in', '包含在', 'in', '', 'in', 'sql 运算符', '0', '1', '2017-01-11 10:25:01', '2017-02-20 17:19:36', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166366257036738', '1', 'notin', '不包含在', 'not in', '', 'not in', 'sql 运算符', '0', '1', '2017-01-11 10:25:18', '2017-02-20 17:19:34', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166430197104067', '1', 'contains', '存在', 'contains', '', 'contains', 'Java解析，比较的2个范围存相同项', '0', '1', '2017-01-11 10:26:19', '2017-02-20 17:19:23', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166493978836420', '1', 'notcontains', '不存在', 'not contains', '', 'notcontains', 'Java解析，比较的2个范围无相同项', '0', '1', '2017-01-11 10:27:20', '2017-02-20 17:19:16', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166787370401221', '1', 'match', '符合', 'match', '', 'match', '符合某个自定义SQL', '0', '1', '2017-01-11 10:31:59', '2017-01-11 10:31:59', '1', '1');
INSERT INTO `sys_dauth_operator` VALUES ('1056166813950754246', '1', 'notmatch', '不符合', 'not match', '', 'notmatch', '不符合某个自定义SQL', '0', '1', '2017-01-11 10:32:25', '2017-01-11 10:32:25', '1', '1');

-- ----------------------------
-- Table structure for sys_dauth_operator_support
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_operator_support`;
CREATE TABLE `sys_dauth_operator_support` (
  `SUPPORT_ID_` bigint(20) NOT NULL COMMENT '关系编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `FILTER_TYPE_ID_` bigint(20) DEFAULT NULL COMMENT '过滤类型ID',
  `OPERATOR_ID_` bigint(20) DEFAULT NULL COMMENT '条件ID',
  `VALUE_TYPE_` tinyint(4) DEFAULT NULL COMMENT '值类型（当前用户、职务、岗位、数据权限变量、自定义值、自定义SQL）',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`SUPPORT_ID_`),
  UNIQUE KEY `AK_Key_2` (`FILTER_TYPE_ID_`,`OPERATOR_ID_`,`VALUE_TYPE_`) USING BTREE,
  KEY `FK_Reference_dauth_36` (`OPERATOR_ID_`) USING BTREE,
  CONSTRAINT `sys_dauth_operator_support_ibfk_1` FOREIGN KEY (`FILTER_TYPE_ID_`) REFERENCES `sys_dauth_filter_type` (`FILTER_TYPE_ID_`),
  CONSTRAINT `sys_dauth_operator_support_ibfk_2` FOREIGN KEY (`OPERATOR_ID_`) REFERENCES `sys_dauth_operator` (`OPERATOR_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限运算符支持表';

-- ----------------------------
-- Records of sys_dauth_operator_support
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dauth_usage
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_usage`;
CREATE TABLE `sys_dauth_usage` (
  `USAGE_ID_` bigint(20) NOT NULL COMMENT '应用编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `DAUTH_ID_` bigint(20) DEFAULT NULL COMMENT '数据权限ID',
  `METHOD_NAME_` varchar(256) DEFAULT NULL COMMENT '方法名(格式为：com.hginfo.xx.method)',
  `METHOD_SHORT_NAME_` varchar(256) DEFAULT NULL COMMENT '方法名简写，无包名(格式为：xx.method)',
  `METHOD_ZH_NAME_` varchar(256) DEFAULT NULL COMMENT '中文名称',
  `METHOD_ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `METHOD_I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `IS_VALID_` tinyint(4) DEFAULT '0' COMMENT '方法是否在用（0:在用，1:不再用 与mapper/dao方法不再匹配时则不再用）',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`USAGE_ID_`),
  UNIQUE KEY `AK_Key_2` (`METHOD_NAME_`) USING BTREE,
  KEY `FK_Reference_dauth_37` (`DAUTH_ID_`) USING BTREE,
  CONSTRAINT `sys_dauth_usage_ibfk_1` FOREIGN KEY (`DAUTH_ID_`) REFERENCES `sys_dauth` (`DAUTH_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限应用表';

-- ----------------------------
-- Records of sys_dauth_usage
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dauth_variable
-- ----------------------------
DROP TABLE IF EXISTS `sys_dauth_variable`;
CREATE TABLE `sys_dauth_variable` (
  `VARIABLE_ID_` bigint(20) NOT NULL COMMENT '变量编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `VARIABLE_CODE_` varchar(64) DEFAULT NULL COMMENT '变量编码',
  `VARIABLE_NAME_` varchar(64) DEFAULT NULL COMMENT '变量名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `VARIABLE_VALUE_` varchar(3072) DEFAULT NULL COMMENT '变量值',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`VARIABLE_ID_`),
  UNIQUE KEY `AK_Key_2` (`VARIABLE_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限变量表';

-- ----------------------------
-- Records of sys_dauth_variable
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_group`;
CREATE TABLE `sys_dict_group` (
  `DICT_GROUP_ID_` bigint(20) NOT NULL COMMENT '字典组编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `DICT_GROUP_CODE_` varchar(64) DEFAULT NULL COMMENT '字典编码',
  `GROUP_TYPE_` varchar(128) DEFAULT NULL COMMENT '字典组类型',
  `GROUP_NAME_` varchar(256) DEFAULT NULL COMMENT '字典组中文名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`DICT_GROUP_ID_`),
  UNIQUE KEY `AK_Key_2` (`DICT_GROUP_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典组表';

-- ----------------------------
-- Records of sys_dict_group
-- ----------------------------
INSERT INTO `sys_dict_group` VALUES ('1053724760099904075', '1', 'trueOrFalse', null, '是否', null, null, '(不要删除)', '0', '1', '2016-12-15 11:37:01', '2016-12-19 18:20:31', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054288832070383792', '1', 'maleOrFemale', null, '男女', null, null, '(不要删除)', '0', '1', '2016-12-21 17:02:42', '2016-12-21 17:02:42', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054442420881083477', '1', 'orgNodeType', null, '组织树节点类型', null, null, '（不要删除）', '0', '1', '2016-12-23 09:43:55', '2016-12-23 09:43:55', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054469676774435390', '1', 'easyuiOrBootstrap', null, '图标配置类型', null, null, '图标配置类型(不要删除)', '0', '1', '2016-12-23 16:57:09', '2016-12-23 16:57:09', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054542916654603125', '1', 'DAUTH_FILTER_TYPE_TYPE', null, '过滤器类型的类型', null, null, '(不要删除)', '0', '1', '2016-12-24 12:21:16', '2016-12-24 12:21:16', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054542933943524214', '1', 'DAUTH_FILTER_VALUE_TYPE', null, '过滤器值类型', null, null, '数据权限过滤器项值类型(不要删除)', '0', '1', '2016-12-24 12:21:32', '2016-12-24 12:21:32', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054720559232210249', '1', 'STAFF_STATUS', null, '员工状态', null, null, '(不要删除)', '0', '1', '2016-12-26 11:24:49', '2016-12-26 11:24:49', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054897906824244748', '1', 'sysGroupDuty', null, '小组职责', null, null, '（不要删除）组长，组员', '0', '1', '2016-12-28 10:23:41', '2016-12-28 10:23:41', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054925484891733426', '1', 'LOG_TYPE', null, '日志类型', null, null, '系统日志类型', '0', '1', '2016-12-28 17:42:01', '2016-12-28 17:42:01', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054925752870010295', '1', 'LOG_LEVEL', null, '日志级别', null, null, '系统日志级别', '0', '1', '2016-12-28 17:46:17', '2016-12-28 17:46:17', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1054992436591932679', '1', 'isMajorPztn', null, '岗位类别', null, null, '（不要删除）', '0', '1', '2016-12-29 11:26:11', '2016-12-29 11:26:11', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1057161130082243193', '1', 'DAUTH_USAGE_METHOD_VALID', null, '方法是否在用', null, null, '', '0', '1', '2017-01-22 09:56:39', '2017-01-22 09:56:39', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1059270135917928043', '1', 'defaultPageSize', null, '表格展示数据数量', null, null, '表格展示数据数量', '0', '1', '2017-02-14 16:38:23', '2017-02-14 16:38:23', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1059355057992395012', '1', 'colorList', null, '系统主题配色', null, null, '系统主题配色', '0', '1', '2017-02-15 15:08:11', '2017-02-15 15:08:11', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1060456525103533971', '1', 'LOG_RESULT', '', '用户日志结果', '', '', '00000', '0', '1', '2017-02-27 18:55:32', '2017-03-23 17:03:32', '1', '1');
INSERT INTO `sys_dict_group` VALUES ('1061261238468542429', '1', 'AUTH_CATEGORY', '', '权限类别', '', '', '1：主权限  2：附属权限', '0', '1', '2017-03-08 16:06:07', '2017-03-08 16:06:07', '1', '1');

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `DICT_ITEM_ID_` bigint(20) NOT NULL COMMENT '字典编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `DICT_GROUP_ID_` bigint(20) DEFAULT NULL COMMENT '字典组编号',
  `ITEM_VALUE_` varchar(128) NOT NULL COMMENT '字典项值',
  `ITEM_NAME_` varchar(256) NOT NULL COMMENT '字典中文名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `IS_VISIBLE_` tinyint(4) DEFAULT '1' COMMENT '是否可见',
  `SORT_NO_` tinyint(4) DEFAULT NULL COMMENT '排序号',
  `PRIORITY_NO_` bigint(20) DEFAULT NULL COMMENT '权重号',
  `SUB_GROUP_CODE_` varchar(64) DEFAULT NULL COMMENT '字典项类型，字典组下项的再分组',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`DICT_ITEM_ID_`),
  KEY `FK_Reference_25` (`DICT_GROUP_ID_`) USING BTREE,
  CONSTRAINT `sys_dict_item_ibfk_1` FOREIGN KEY (`DICT_GROUP_ID_`) REFERENCES `sys_dict_group` (`DICT_GROUP_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典项表';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('1053725174320978509', '1', '1053724760099904075', '1', '是', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1053725193561299534', '1', '1053724760099904075', '0', '否', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054288856757008561', '1', '1054288832070383792', '1', '男', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054288870098041010', '1', '1054288832070383792', '0', '女', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054442641536076886', '1', '1054442420881083477', '1', '部门', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054442659663858775', '1', '1054442420881083477', '2', '岗位', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054442676363480152', '1', '1054442420881083477', '3', '小组', null, null, '1', '3', '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054469777534200383', '1', '1054469676774435390', '1', 'easyui', null, null, '1', '1', '1', '1', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054469798206876224', '1', '1054469676774435390', '0', 'bootstrap', null, null, '1', '2', '2', '1', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543009819532151', '1', '1054542933943524214', '1', '自定义SQL', null, null, '1', null, '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543016697142136', '1', '1054542933943524214', '2', '自定义值', null, null, '1', null, '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543023564266361', '1', '1054542933943524214', '3', '数据权限变量', null, null, '1', null, '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543029511789434', '1', '1054542933943524214', '4', '岗位', null, null, '1', null, '8', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543035888180091', '1', '1054542933943524214', '5', '职务', null, null, '1', null, '16', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543043010108284', '1', '1054542933943524214', '6', '当前用户', null, null, '1', null, '32', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543059687709565', '1', '1054542916654603125', '1', '系统变量', null, null, '1', null, '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054543065240968062', '1', '1054542916654603125', '2', '普通类型', null, null, '1', null, '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054720696817964362', '1', '1054720559232210249', '0', '离职', null, null, '1', '2', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054720704458937675', '1', '1054720559232210249', '1', '在职', null, null, '1', '1', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054897947849780749', '1', '1054897906824244748', '1', '组长', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054897964913257998', '1', '1054897906824244748', '0', '组员', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925603656596915', '1', '1054925484891733426', '0', '系统操作日志', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925621557886388', '1', '1054925484891733426', '1', '接口类调用日志', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925640846441909', '1', '1054925484891733426', '2', '定时任务调用日志', null, null, '1', '3', '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925663668698550', '1', '1054925484891733426', '3', '异常信息日志', null, null, '1', '4', '8', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925788504817080', '1', '1054925752870010295', '0', 'DEBUG', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925800926248377', '1', '1054925752870010295', '1', 'INFO', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925848727682490', '1', '1054925752870010295', '2', 'WARN', null, null, '1', '3', '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925866706566587', '1', '1054925752870010295', '3', 'ERROR', null, null, '1', '4', '8', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054925894837763516', '1', '1054925752870010295', '4', 'FATAL', null, null, '1', '5', '16', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054992459137365256', '1', '1054992436591932679', '1', '主岗', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1054992480914191625', '1', '1054992436591932679', '0', '副岗', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1057161150905913978', '1', '1057161130082243193', '0', '在用', null, null, '1', '1', '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1057161158363386491', '1', '1057161130082243193', '1', '不再用', null, null, '1', '2', '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059270159572754028', '1', '1059270135917928043', '10', '10', null, null, '1', null, '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059270173669809773', '1', '1059270135917928043', '20', '20', null, null, '1', null, '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059270184222678638', '1', '1059270135917928043', '30', '30', null, null, '1', null, '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355090484619525', '1', '1059355057992395012', 'default', '#95B8E7', null, null, '1', null, '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355103639005446', '1', '1059355057992395012', 'gray', '#D3D3D3', null, null, '1', null, '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355116460992775', '1', '1059355057992395012', 'metro', '#cce6ff', null, null, '1', null, '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355128791197960', '1', '1059355057992395012', 'bootstrap', '#0081c2', null, null, '1', null, '8', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355140782713097', '1', '1059355057992395012', 'black', '#000', null, null, '1', null, '16', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355151988844810', '1', '1059355057992395012', 'material', '#f5f5f5', null, null, '1', null, '32', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1060456537757749140', '1', '1060456525103533971', '0', '失败', '', '', '1', null, '1', '', '', '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1060456542360997781', '1', '1060456525103533971', '1', '成功', '', '', '1', null, '2', '', '', '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1061261250984345567', '1', '1061261238468542429', '1', '主权限', '', '', '1', null, '1', '', '', '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1061261258525704161', '1', '1061261238468542429', '2', '附属权限', '', '', '1', null, '2', '', '', '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');

-- ----------------------------
-- Table structure for sys_extend_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_extend_field`;
CREATE TABLE `sys_extend_field` (
  `EXTEND_ID_` bigint(20) NOT NULL COMMENT '扩展字段编号',
  `EXTEND_DEF_ID_` bigint(20) NOT NULL COMMENT '扩展字段定义编号',
  `BIZ_ID_` bigint(20) NOT NULL COMMENT '被扩展表编号',
  `VALUE_` varchar(512) NOT NULL,
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`EXTEND_ID_`),
  UNIQUE KEY `AK_Key_2` (`EXTEND_DEF_ID_`,`BIZ_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段表';

-- ----------------------------
-- Records of sys_extend_field
-- ----------------------------

-- ----------------------------
-- Table structure for sys_extend_field_def
-- ----------------------------
DROP TABLE IF EXISTS `sys_extend_field_def`;
CREATE TABLE `sys_extend_field_def` (
  `EXTEND_DEF_ID_` bigint(20) NOT NULL COMMENT '扩展字段编号',
  `TABLE_CODE_` varchar(256) NOT NULL COMMENT '扩展表编码',
  `FIELD_CODE_` varchar(256) NOT NULL COMMENT '扩展字段编码',
  `FIELD_NAME_` varchar(256) NOT NULL COMMENT '扩展字段名',
  `FILED_TYPE_` varchar(64) NOT NULL COMMENT '扩展字段类型',
  `DEFAULT_VALUE_` varchar(256) DEFAULT NULL COMMENT '默认值',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`EXTEND_DEF_ID_`),
  UNIQUE KEY `AK_Key_2` (`TABLE_CODE_`,`FIELD_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段定义表';

-- ----------------------------
-- Records of sys_extend_field_def
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `FILE_ID_` bigint(20) NOT NULL,
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `FILE_TYPE_` varchar(10) DEFAULT NULL COMMENT '文件类型（如：.png,.txt,.doc）',
  `REAL_NAME_` varchar(128) DEFAULT NULL COMMENT '文件真实名称',
  `FILE_NAME_` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `FILE_SIZE_` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `RELATIVE_PATH_` varchar(255) DEFAULT NULL COMMENT '相对路径',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`FILE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文件表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `GROUP_ID_` bigint(20) NOT NULL COMMENT '职务编号',
  `ORG_ID_` bigint(20) NOT NULL COMMENT '部门编号',
  `GROUP_CODE_` varchar(64) NOT NULL COMMENT '职务编码',
  `GROUP_NAME_` varchar(64) DEFAULT NULL COMMENT '职务名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '部门英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` tinyint(4) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` tinyint(4) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`GROUP_ID_`),
  UNIQUE KEY `AK_Key_2` (`GROUP_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小组表';

-- ----------------------------
-- Records of sys_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_user`;
CREATE TABLE `sys_group_user` (
  `GROUP_USER_ID_` bigint(20) NOT NULL COMMENT '主键ID',
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户ID',
  `GROUP_ID_` bigint(20) NOT NULL COMMENT '角色ID',
  `IS_LEADER_` tinyint(4) DEFAULT '0' COMMENT '是否为小组长',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  PRIMARY KEY (`GROUP_USER_ID_`),
  UNIQUE KEY `AK_Key_2` (`USER_ID_`,`GROUP_ID_`) USING BTREE,
  KEY `FK_Reference_20` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `sys_group_user_ibfk_1` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`),
  CONSTRAINT `sys_group_user_ibfk_2` FOREIGN KEY (`GROUP_ID_`) REFERENCES `sys_group` (`GROUP_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小组用户表';

-- ----------------------------
-- Records of sys_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_icon
-- ----------------------------
DROP TABLE IF EXISTS `sys_icon`;
CREATE TABLE `sys_icon` (
  `ICON_ID_` bigint(20) NOT NULL COMMENT 'ICON编号',
  `ICON_TYPE_` varchar(32) DEFAULT NULL COMMENT '类型，可用于区分不同的前端',
  `SKIN_CODE_` varchar(128) DEFAULT NULL COMMENT '皮肤编码',
  `ICON_CSS_` varchar(128) DEFAULT NULL COMMENT 'css名称',
  `IMAGE_PATH_` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `IMAGE_PATH_2_` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `IMAGE_PATH_3_` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `TIP_` varchar(256) DEFAULT NULL COMMENT '提示信息',
  `SORT_NO_` int(11) NOT NULL COMMENT '排序',
  `IS_VISIBLE` tinyint(4) DEFAULT '1' COMMENT '是否可见',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `DESCR_` text COMMENT '描述',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  PRIMARY KEY (`ICON_ID_`),
  UNIQUE KEY `AK_Key_2` (`IMAGE_PATH_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统图标表';

-- ----------------------------
-- Records of sys_icon
-- ----------------------------
INSERT INTO `sys_icon` VALUES ('1056821172734894917', '1', '1', 'icon_auto_add', '/static/images/icons/add.gif', null, null, null, '1', '1', '0', '1', null, '2017-01-18 15:53:10', '2017-01-18 15:53:10', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821173515035462', '1', '2', 'icon_auto_add_16px', '/static/images/icons/add_16px.png', null, null, null, '2', '1', '0', '1', null, '2017-01-18 15:53:11', '2017-01-18 15:53:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821173870502727', '1', '3', 'icon_auto_almirah_24px', '/static/images/icons/almirah_24px.png', null, null, null, '3', '1', '0', '1', null, '2017-01-18 15:53:11', '2017-01-18 15:53:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821174198707016', '1', '4', 'icon_auto_bank_24px', '/static/images/icons/bank_24px.png', null, null, null, '4', '1', '0', '1', null, '2017-01-18 15:53:11', '2017-01-18 15:53:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821174555222857', '1', '5', 'icon_auto_blue_refresh', '/static/images/icons/blue_refresh.png', null, null, null, '5', '1', '0', '1', null, '2017-01-18 15:53:12', '2017-01-18 15:53:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821174952633162', '1', '6', 'icon_auto_blue_remove', '/static/images/icons/blue_remove.png', null, null, null, '6', '1', '0', '1', null, '2017-01-18 15:53:12', '2017-01-18 15:53:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821175326974795', '1', '7', 'icon_auto_blue_trash', '/static/images/icons/blue_trash.png', null, null, null, '7', '1', '0', '1', null, '2017-01-18 15:53:12', '2017-01-18 15:53:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821175748502348', '1', '8', 'icon_auto_browser_16px', '/static/images/icons/browser_16px.png', null, null, null, '8', '1', '0', '1', null, '2017-01-18 15:53:13', '2017-01-18 15:53:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821176333607757', '1', '9', 'icon_auto_browser_24px', '/static/images/icons/browser_24px.png', null, null, null, '9', '1', '0', '1', null, '2017-01-18 15:53:13', '2017-01-18 15:53:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821176721580878', '1', '10', 'icon_auto_brush_16px', '/static/images/icons/brush_16px.png', null, null, null, '10', '1', '0', '1', null, '2017-01-18 15:53:14', '2017-01-18 15:53:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821177078096719', '1', '11', 'icon_auto_cart_16px', '/static/images/icons/cart_16px.png', null, null, null, '11', '1', '0', '1', null, '2017-01-18 15:53:14', '2017-01-18 15:53:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821177445098320', '1', '12', 'icon_auto_cart_24px', '/static/images/icons/cart_24px.png', null, null, null, '12', '1', '0', '1', null, '2017-01-18 15:53:14', '2017-01-18 15:53:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821177773302609', '1', '13', 'icon_auto_center_16px', '/static/images/icons/center_16px.png', null, null, null, '13', '1', '0', '1', null, '2017-01-18 15:53:15', '2017-01-18 15:53:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821178105701202', '1', '14', 'icon_auto_chart_organisation', '/static/images/icons/chart_organisation.png', null, null, null, '14', '1', '0', '1', null, '2017-01-18 15:53:15', '2017-01-18 15:53:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821178473751379', '1', '15', 'icon_auto_clear_16px', '/static/images/icons/clear_16px.png', null, null, null, '15', '1', '0', '1', null, '2017-01-18 15:53:15', '2017-01-18 15:53:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821178822927188', '1', '16', 'icon_auto_cog_edit', '/static/images/icons/cog_edit.png', null, null, null, '16', '1', '0', '1', null, '2017-01-18 15:53:16', '2017-01-18 15:53:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821179192025941', '1', '17', 'icon_auto_delete', '/static/images/icons/delete.gif', null, null, null, '17', '1', '0', '1', null, '2017-01-18 15:53:16', '2017-01-18 15:53:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821179572659030', '1', '18', 'icon_auto_delete_16px', '/static/images/icons/delete_16px.png', null, null, null, '18', '1', '0', '1', null, '2017-01-18 15:53:16', '2017-01-18 15:53:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821179999429463', '1', '19', 'icon_auto_doc_16px', '/static/images/icons/doc_16px.png', null, null, null, '19', '1', '0', '1', null, '2017-01-18 15:53:17', '2017-01-18 15:53:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821180310856536', '1', '20', 'icon_auto_doc_24px', '/static/images/icons/doc_24px.png', null, null, null, '20', '1', '0', '1', null, '2017-01-18 15:53:17', '2017-01-18 15:53:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821180638012249', '1', '21', 'icon_auto_dot', '/static/images/icons/dot.png', null, null, null, '21', '1', '0', '1', null, '2017-01-18 15:53:18', '2017-01-18 15:53:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821181002916698', '1', '22', 'icon_auto_edit', '/static/images/icons/edit.gif', null, null, null, '22', '1', '0', '1', null, '2017-01-18 15:53:18', '2017-01-18 15:53:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821181377258331', '1', '23', 'icon_auto_email', '/static/images/icons/email.png', null, null, null, '23', '1', '0', '1', null, '2017-01-18 15:53:18', '2017-01-18 15:53:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821181733774172', '1', '24', 'icon_auto_export', '/static/images/icons/export.png', null, null, null, '24', '1', '0', '1', null, '2017-01-18 15:53:19', '2017-01-18 15:53:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821182058832733', '1', '25', 'icon_auto_group', '/static/images/icons/group.png', null, null, null, '25', '1', '0', '1', null, '2017-01-18 15:53:19', '2017-01-18 15:53:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821182360822622', '1', '26', 'icon_auto_info_16px', '/static/images/icons/info_16px.png', null, null, null, '26', '1', '0', '1', null, '2017-01-18 15:53:19', '2017-01-18 15:53:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821182687978335', '1', '27', 'icon_auto_list', '/static/images/icons/list.png', null, null, null, '27', '1', '0', '1', null, '2017-01-18 15:53:19', '2017-01-18 15:53:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821183030862688', '1', '28', 'icon_auto_loading1', '/static/images/icons/loading1.gif', null, null, null, '28', '1', '0', '1', null, '2017-01-18 15:53:20', '2017-01-18 15:53:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821183367455585', '1', '29', 'icon_auto_logout', '/static/images/icons/logout.png', null, null, null, '29', '1', '0', '1', null, '2017-01-18 15:53:20', '2017-01-18 15:53:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821183708242786', '1', '30', 'icon_auto_other_16px', '/static/images/icons/other_16px.png', null, null, null, '30', '1', '0', '1', null, '2017-01-18 15:53:20', '2017-01-18 15:53:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821184174859107', '1', '31', 'icon_auto_position', '/static/images/icons/position.png', null, null, null, '31', '1', '0', '1', null, '2017-01-18 15:53:21', '2017-01-18 15:53:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821184512500580', '1', '32', 'icon_auto_receive', '/static/images/icons/receive.png', null, null, null, '32', '1', '0', '1', null, '2017-01-18 15:53:21', '2017-01-18 15:53:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821184858530661', '1', '33', 'icon_auto_refresh_16px', '/static/images/icons/refresh_16px.png', null, null, null, '33', '1', '0', '1', null, '2017-01-18 15:53:22', '2017-01-18 15:53:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821185171006310', '1', '34', 'icon_auto_refresh_2', '/static/images/icons/refresh_2.png', null, null, null, '34', '1', '0', '1', null, '2017-01-18 15:53:22', '2017-01-18 15:53:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821185486627687', '1', '35', 'icon_auto_remove_all_16px', '/static/images/icons/remove_all_16px.png', null, null, null, '35', '1', '0', '1', null, '2017-01-18 15:53:22', '2017-01-18 15:53:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821185820074856', '1', '36', 'icon_auto_report_16px', '/static/images/icons/report_16px.png', null, null, null, '36', '1', '0', '1', null, '2017-01-18 15:53:22', '2017-01-18 15:53:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821186170299241', '1', '37', 'icon_auto_save_16px', '/static/images/icons/save_16px.png', null, null, null, '37', '1', '0', '1', null, '2017-01-18 15:53:23', '2017-01-18 15:53:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821186497454954', '1', '38', 'icon_auto_search_16px', '/static/images/icons/search_16px.png', null, null, null, '38', '1', '0', '1', null, '2017-01-18 15:53:23', '2017-01-18 15:53:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821186819367787', '1', '39', 'icon_auto_search_2', '/static/images/icons/search_2.png', null, null, null, '39', '1', '0', '1', null, '2017-01-18 15:53:23', '2017-01-18 15:53:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821187227263852', '1', '40', 'icon_auto_settings_16px', '/static/images/icons/settings_16px.png', null, null, null, '40', '1', '0', '1', null, '2017-01-18 15:53:24', '2017-01-18 15:53:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821187574342509', '1', '41', 'icon_auto_set_16px', '/static/images/icons/set_16px.png', null, null, null, '41', '1', '0', '1', null, '2017-01-18 15:53:24', '2017-01-18 15:53:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821187920372590', '1', '42', 'icon_auto_signals_16px', '/static/images/icons/signals_16px.png', null, null, null, '42', '1', '0', '1', null, '2017-01-18 15:53:24', '2017-01-18 15:53:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821188280034159', '1', '43', 'icon_auto_system_16px', '/static/images/icons/system_16px.png', null, null, null, '43', '1', '0', '1', null, '2017-01-18 15:53:25', '2017-01-18 15:53:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821188642841456', '1', '44', 'icon_auto_system_24px', '/static/images/icons/system_24px.png', null, null, null, '44', '1', '0', '1', null, '2017-01-18 15:53:25', '2017-01-18 15:53:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821189001454449', '1', '45', 'icon_auto_tasktodo', '/static/images/icons/tasktodo.png', null, null, null, '45', '1', '0', '1', null, '2017-01-18 15:53:25', '2017-01-18 15:53:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821189727069042', '1', '46', 'icon_auto_undo_16px', '/static/images/icons/undo_16px.png', null, null, null, '46', '1', '0', '1', null, '2017-01-18 15:53:26', '2017-01-18 15:53:26', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821190080439155', '1', '47', 'icon_auto_user_center', '/static/images/icons/user_center.png', null, null, null, '47', '1', '0', '1', null, '2017-01-18 15:53:27', '2017-01-18 15:53:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821190457926516', '1', '48', 'icon_auto_user_man_24px', '/static/images/icons/user_man_24px.png', null, null, null, '48', '1', '0', '1', null, '2017-01-18 15:53:27', '2017-01-18 15:53:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821190834365301', '1', '49', 'icon_auto_warning', '/static/images/icons/warning.png', null, null, null, '49', '1', '0', '1', null, '2017-01-18 15:53:27', '2017-01-18 15:53:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821191156278134', '1', '50', 'icon_auto_zhuzhi_24px', '/static/images/icons/zhuzhi_24px.png', null, null, null, '50', '1', '0', '1', null, '2017-01-18 15:53:28', '2017-01-18 15:53:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821191518036855', '1', '51', 'icon_auto_zuzhi_16', '/static/images/icons/zuzhi_16.png', null, null, null, '51', '1', '0', '1', null, '2017-01-18 15:53:28', '2017-01-18 15:53:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821191873504120', '1', '52', 'icon_auto_blue__3column', '/static/images/icons/blue/3column.png', null, null, null, '52', '1', '0', '1', null, '2017-01-18 15:53:28', '2017-01-18 15:53:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821192241554297', '1', '53', 'icon_auto_blue__4column', '/static/images/icons/blue/4column.png', null, null, null, '53', '1', '0', '1', null, '2017-01-18 15:53:29', '2017-01-18 15:53:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821192617993082', '1', '54', 'icon_auto_blue__account-filling', '/static/images/icons/blue/account-filling.png', null, null, null, '54', '1', '0', '1', null, '2017-01-18 15:53:29', '2017-01-18 15:53:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821192996529019', '1', '55', 'icon_auto_blue__account', '/static/images/icons/blue/account.png', null, null, null, '55', '1', '0', '1', null, '2017-01-18 15:53:29', '2017-01-18 15:53:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821193320539004', '1', '56', 'icon_auto_blue__add', '/static/images/icons/blue/add.png', null, null, null, '56', '1', '0', '1', null, '2017-01-18 15:53:30', '2017-01-18 15:53:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821193666569085', '1', '57', 'icon_auto_blue__agriculture', '/static/images/icons/blue/agriculture.png', null, null, null, '57', '1', '0', '1', null, '2017-01-18 15:53:30', '2017-01-18 15:53:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821194022036350', '1', '58', 'icon_auto_blue__all', '/static/images/icons/blue/all.png', null, null, null, '58', '1', '0', '1', null, '2017-01-18 15:53:30', '2017-01-18 15:53:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821194385892223', '1', '59', 'icon_auto_blue__apparel', '/static/images/icons/blue/apparel.png', null, null, null, '59', '1', '0', '1', null, '2017-01-18 15:53:31', '2017-01-18 15:53:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821194752893824', '1', '60', 'icon_auto_blue__assessed-Badge', '/static/images/icons/blue/assessed-Badge.png', null, null, null, '60', '1', '0', '1', null, '2017-01-18 15:53:31', '2017-01-18 15:53:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821195113603969', '1', '61', 'icon_auto_blue__atm-away', '/static/images/icons/blue/atm-away.png', null, null, null, '61', '1', '0', '1', null, '2017-01-18 15:53:31', '2017-01-18 15:53:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821195470119810', '1', '62', 'icon_auto_blue__atm', '/static/images/icons/blue/atm.png', null, null, null, '62', '1', '0', '1', null, '2017-01-18 15:53:32', '2017-01-18 15:53:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821195821392771', '1', '63', 'icon_auto_blue__attachment', '/static/images/icons/blue/attachment.png', null, null, null, '63', '1', '0', '1', null, '2017-01-18 15:53:32', '2017-01-18 15:53:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821196141208452', '1', '64', 'icon_auto_blue__auth', '/static/images/icons/blue/auth.png', null, null, null, '64', '1', '0', '1', null, '2017-01-18 15:53:32', '2017-01-18 15:53:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821196550153093', '1', '65', 'icon_auto_blue__authMenu', '/static/images/icons/blue/authMenu.png', null, null, null, '65', '1', '0', '1', null, '2017-01-18 15:53:33', '2017-01-18 15:53:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821196900377478', '1', '66', 'icon_auto_blue__auto', '/static/images/icons/blue/auto.png', null, null, null, '66', '1', '0', '1', null, '2017-01-18 15:53:33', '2017-01-18 15:53:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821197233824647', '1', '67', 'icon_auto_blue__back', '/static/images/icons/blue/back.png', null, null, null, '67', '1', '0', '1', null, '2017-01-18 15:53:33', '2017-01-18 15:53:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821197592437640', '1', '68', 'icon_auto_blue__bad', '/static/images/icons/blue/bad.png', null, null, null, '68', '1', '0', '1', null, '2017-01-18 15:53:34', '2017-01-18 15:53:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821197927981961', '1', '69', 'icon_auto_blue__bags', '/static/images/icons/blue/bags.png', null, null, null, '69', '1', '0', '1', null, '2017-01-18 15:53:34', '2017-01-18 15:53:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821198266672010', '1', '70', 'icon_auto_blue__beauty', '/static/images/icons/blue/beauty.png', null, null, null, '70', '1', '0', '1', null, '2017-01-18 15:53:34', '2017-01-18 15:53:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821198607459211', '1', '71', 'icon_auto_blue__box', '/static/images/icons/blue/box.png', null, null, null, '71', '1', '0', '1', null, '2017-01-18 15:53:35', '2017-01-18 15:53:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821198949294988', '1', '72', 'icon_auto_blue__browse', '/static/images/icons/blue/browse.png', null, null, null, '72', '1', '0', '1', null, '2017-01-18 15:53:35', '2017-01-18 15:53:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821199324685197', '1', '73', 'icon_auto_blue__bussiness-card', '/static/images/icons/blue/bussiness-card.png', null, null, null, '73', '1', '0', '1', null, '2017-01-18 15:53:35', '2017-01-18 15:53:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821199701123982', '1', '74', 'icon_auto_blue__bussiness-man', '/static/images/icons/blue/bussiness-man.png', null, null, null, '74', '1', '0', '1', null, '2017-01-18 15:53:36', '2017-01-18 15:53:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821200212829071', '1', '75', 'icon_auto_blue__Calculator', '/static/images/icons/blue/Calculator.png', null, null, null, '75', '1', '0', '1', null, '2017-01-18 15:53:36', '2017-01-18 15:53:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821200524256144', '1', '76', 'icon_auto_blue__calendar', '/static/images/icons/blue/calendar.png', null, null, null, '76', '1', '0', '1', null, '2017-01-18 15:53:36', '2017-01-18 15:53:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821200859800465', '1', '77', 'icon_auto_blue__cart', '/static/images/icons/blue/cart.png', null, null, null, '77', '1', '0', '1', null, '2017-01-18 15:53:37', '2017-01-18 15:53:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821201186956178', '1', '78', 'icon_auto_blue__Category', '/static/images/icons/blue/Category.png', null, null, null, '78', '1', '0', '1', null, '2017-01-18 15:53:37', '2017-01-18 15:53:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821201529840531', '1', '79', 'icon_auto_blue__clock', '/static/images/icons/blue/clock.png', null, null, null, '79', '1', '0', '1', null, '2017-01-18 15:53:37', '2017-01-18 15:53:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821201890550676', '1', '80', 'icon_auto_blue__close', '/static/images/icons/blue/close.png', null, null, null, '80', '1', '0', '1', null, '2017-01-18 15:53:38', '2017-01-18 15:53:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821202209317781', '1', '81', 'icon_auto_blue__color-filling', '/static/images/icons/blue/color-filling.png', null, null, null, '81', '1', '0', '1', null, '2017-01-18 15:53:38', '2017-01-18 15:53:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821202536473494', '1', '82', 'icon_auto_blue__color', '/static/images/icons/blue/color.png', null, null, null, '82', '1', '0', '1', null, '2017-01-18 15:53:38', '2017-01-18 15:53:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821202879357847', '1', '83', 'icon_auto_blue__comments', '/static/images/icons/blue/comments.png', null, null, null, '83', '1', '0', '1', null, '2017-01-18 15:53:39', '2017-01-18 15:53:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821203199173528', '1', '84', 'icon_auto_blue__compare', '/static/images/icons/blue/compare.png', null, null, null, '84', '1', '0', '1', null, '2017-01-18 15:53:39', '2017-01-18 15:53:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821203538912153', '1', '85', 'icon_auto_blue__compass', '/static/images/icons/blue/compass.png', null, null, null, '85', '1', '0', '1', null, '2017-01-18 15:53:39', '2017-01-18 15:53:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821203895427994', '1', '86', 'icon_auto_blue__component-filling', '/static/images/icons/blue/component-filling.png', null, null, null, '86', '1', '0', '1', null, '2017-01-18 15:53:40', '2017-01-18 15:53:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821204226778011', '1', '87', 'icon_auto_blue__component', '/static/images/icons/blue/component.png', null, null, null, '87', '1', '0', '1', null, '2017-01-18 15:53:40', '2017-01-18 15:53:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821204603216796', '1', '88', 'icon_auto_blue__config', '/static/images/icons/blue/config.png', null, null, null, '88', '1', '0', '1', null, '2017-01-18 15:53:40', '2017-01-18 15:53:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821204956586909', '1', '89', 'icon_auto_blue__copy', '/static/images/icons/blue/copy.png', null, null, null, '89', '1', '0', '1', null, '2017-01-18 15:53:41', '2017-01-18 15:53:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821205601461150', '1', '90', 'icon_auto_blue__credit-level-filling', '/static/images/icons/blue/credit-level-filling.png', null, null, null, '90', '1', '0', '1', null, '2017-01-18 15:53:41', '2017-01-18 15:53:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821205934908319', '1', '91', 'icon_auto_blue__credit-level', '/static/images/icons/blue/credit-level.png', null, null, null, '91', '1', '0', '1', null, '2017-01-18 15:53:42', '2017-01-18 15:53:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821206259966880', '1', '92', 'icon_auto_blue__cry', '/static/images/icons/blue/cry.png', null, null, null, '92', '1', '0', '1', null, '2017-01-18 15:53:42', '2017-01-18 15:53:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821206579782561', '1', '93', 'icon_auto_blue__cut', '/static/images/icons/blue/cut.png', null, null, null, '93', '1', '0', '1', null, '2017-01-18 15:53:42', '2017-01-18 15:53:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821206911132578', '1', '94', 'icon_auto_blue__data', '/static/images/icons/blue/data.png', null, null, null, '94', '1', '0', '1', null, '2017-01-18 15:53:43', '2017-01-18 15:53:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821207414449059', '1', '95', 'icon_auto_blue__delete', '/static/images/icons/blue/delete.png', null, null, null, '95', '1', '0', '1', null, '2017-01-18 15:53:43', '2017-01-18 15:53:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821207733216164', '1', '96', 'icon_auto_blue__dict', '/static/images/icons/blue/dict.png', null, null, null, '96', '1', '0', '1', null, '2017-01-18 15:53:43', '2017-01-18 15:53:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821208097072037', '1', '97', 'icon_auto_blue__discount', '/static/images/icons/blue/discount.png', null, null, null, '97', '1', '0', '1', null, '2017-01-18 15:53:44', '2017-01-18 15:53:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821208451490726', '1', '98', 'icon_auto_blue__dollar', '/static/images/icons/blue/dollar.png', null, null, null, '98', '1', '0', '1', null, '2017-01-18 15:53:44', '2017-01-18 15:53:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821208799617959', '1', '99', 'icon_auto_blue__download', '/static/images/icons/blue/download.png', null, null, null, '99', '1', '0', '1', null, '2017-01-18 15:53:44', '2017-01-18 15:53:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821209207514024', '1', '100', 'icon_auto_blue__edit', '/static/images/icons/blue/edit.png', null, null, null, '100', '1', '0', '1', null, '2017-01-18 15:53:45', '2017-01-18 15:53:45', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821209993946025', '1', '101', 'icon_auto_blue__electrical', '/static/images/icons/blue/electrical.png', null, null, null, '101', '1', '0', '1', null, '2017-01-18 15:53:46', '2017-01-18 15:53:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821210361996202', '1', '102', 'icon_auto_blue__electronics', '/static/images/icons/blue/electronics.png', null, null, null, '102', '1', '0', '1', null, '2017-01-18 15:53:46', '2017-01-18 15:53:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821210824418219', '1', '103', 'icon_auto_blue__email-filling', '/static/images/icons/blue/email-filling.png', null, null, null, '103', '1', '0', '1', null, '2017-01-18 15:53:46', '2017-01-18 15:53:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821211188274092', '1', '104', 'icon_auto_blue__email', '/static/images/icons/blue/email.png', null, null, null, '104', '1', '0', '1', null, '2017-01-18 15:53:47', '2017-01-18 15:53:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821211502846893', '1', '105', 'icon_auto_blue__exl', '/static/images/icons/blue/exl.png', null, null, null, '105', '1', '0', '1', null, '2017-01-18 15:53:47', '2017-01-18 15:53:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821211828954030', '1', '106', 'icon_auto_blue__favorite', '/static/images/icons/blue/favorite.png', null, null, null, '106', '1', '0', '1', null, '2017-01-18 15:53:47', '2017-01-18 15:53:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821212193858479', '1', '107', 'icon_auto_blue__favorites-filling', '/static/images/icons/blue/favorites-filling.png', null, null, null, '107', '1', '0', '1', null, '2017-01-18 15:53:48', '2017-01-18 15:53:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821212531499952', '1', '108', 'icon_auto_blue__favorites', '/static/images/icons/blue/favorites.png', null, null, null, '108', '1', '0', '1', null, '2017-01-18 15:53:48', '2017-01-18 15:53:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821212888015793', '1', '109', 'icon_auto_blue__filter', '/static/images/icons/blue/filter.png', null, null, null, '109', '1', '0', '1', null, '2017-01-18 15:53:48', '2017-01-18 15:53:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821213264454578', '1', '110', 'icon_auto_blue__folder', '/static/images/icons/blue/folder.png', null, null, null, '110', '1', '0', '1', null, '2017-01-18 15:53:49', '2017-01-18 15:53:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821213620970419', '1', '111', 'icon_auto_blue__form', '/static/images/icons/blue/form.png', null, null, null, '111', '1', '0', '1', null, '2017-01-18 15:53:49', '2017-01-18 15:53:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821213937640372', '1', '112', 'icon_auto_blue__gifts', '/static/images/icons/blue/gifts.png', null, null, null, '112', '1', '0', '1', null, '2017-01-18 15:53:49', '2017-01-18 15:53:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821214323516341', '1', '113', 'icon_auto_blue__good', '/static/images/icons/blue/good.png', null, null, null, '113', '1', '0', '1', null, '2017-01-18 15:53:50', '2017-01-18 15:53:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821214663254966', '1', '114', 'icon_auto_blue__help', '/static/images/icons/blue/help.png', null, null, null, '114', '1', '0', '1', null, '2017-01-18 15:53:50', '2017-01-18 15:53:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821214986216375', '1', '115', 'icon_auto_blue__history', '/static/images/icons/blue/history.png', null, null, null, '115', '1', '0', '1', null, '2017-01-18 15:53:50', '2017-01-18 15:53:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821215361606584', '1', '116', 'icon_auto_blue__home', '/static/images/icons/blue/home.png', null, null, null, '116', '1', '0', '1', null, '2017-01-18 15:53:51', '2017-01-18 15:53:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821215728608185', '1', '117', 'icon_auto_blue__hot', '/static/images/icons/blue/hot.png', null, null, null, '117', '1', '0', '1', null, '2017-01-18 15:53:51', '2017-01-18 15:53:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821216138601402', '1', '118', 'icon_auto_blue__image-text', '/static/images/icons/blue/image-text.png', null, null, null, '118', '1', '0', '1', null, '2017-01-18 15:53:51', '2017-01-18 15:53:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821216504554427', '1', '119', 'icon_auto_blue__information', '/static/images/icons/blue/information.png', null, null, null, '119', '1', '0', '1', null, '2017-01-18 15:53:52', '2017-01-18 15:53:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821216862118844', '1', '120', 'icon_auto_blue__inquiry-template', '/static/images/icons/blue/inquiry-template.png', null, null, null, '120', '1', '0', '1', null, '2017-01-18 15:53:52', '2017-01-18 15:53:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821217239606205', '1', '121', 'icon_auto_blue__integral', '/static/images/icons/blue/integral.png', null, null, null, '121', '1', '0', '1', null, '2017-01-18 15:53:52', '2017-01-18 15:53:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821217668473790', '1', '122', 'icon_auto_blue__jewelry', '/static/images/icons/blue/jewelry.png', null, null, null, '122', '1', '0', '1', null, '2017-01-18 15:53:53', '2017-01-18 15:53:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821218050155455', '1', '123', 'icon_auto_blue__jvm', '/static/images/icons/blue/jvm.png', null, null, null, '123', '1', '0', '1', null, '2017-01-18 15:53:53', '2017-01-18 15:53:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821218675106752', '1', '124', 'icon_auto_blue__less', '/static/images/icons/blue/less.png', null, null, null, '124', '1', '0', '1', null, '2017-01-18 15:53:54', '2017-01-18 15:53:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821219004359617', '1', '125', 'icon_auto_blue__libra', '/static/images/icons/blue/libra.png', null, null, null, '125', '1', '0', '1', null, '2017-01-18 15:53:54', '2017-01-18 15:53:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821219460490178', '1', '126', 'icon_auto_blue__lights', '/static/images/icons/blue/lights.png', null, null, null, '126', '1', '0', '1', null, '2017-01-18 15:53:55', '2017-01-18 15:53:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821219836928963', '1', '127', 'icon_auto_blue__link', '/static/images/icons/blue/link.png', null, null, null, '127', '1', '0', '1', null, '2017-01-18 15:53:55', '2017-01-18 15:53:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821220173521860', '1', '128', 'icon_auto_blue__log', '/static/images/icons/blue/log.png', null, null, null, '128', '1', '0', '1', null, '2017-01-18 15:53:55', '2017-01-18 15:53:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821220551009221', '1', '129', 'icon_auto_blue__logistic', '/static/images/icons/blue/logistic.png', null, null, null, '129', '1', '0', '1', null, '2017-01-18 15:53:56', '2017-01-18 15:53:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821220900185030', '1', '130', 'icon_auto_blue__machinery', '/static/images/icons/blue/machinery.png', null, null, null, '130', '1', '0', '1', null, '2017-01-18 15:53:56', '2017-01-18 15:53:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821221245166535', '1', '131', 'icon_auto_blue__manage-order', '/static/images/icons/blue/manage-order.png', null, null, null, '131', '1', '0', '1', null, '2017-01-18 15:53:56', '2017-01-18 15:53:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821221580710856', '1', '132', 'icon_auto_blue__map', '/static/images/icons/blue/map.png', null, null, null, '132', '1', '0', '1', null, '2017-01-18 15:53:57', '2017-01-18 15:53:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821221926740937', '1', '133', 'icon_auto_blue__metadata', '/static/images/icons/blue/metadata.png', null, null, null, '133', '1', '0', '1', null, '2017-01-18 15:53:57', '2017-01-18 15:53:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821222336734154', '1', '134', 'icon_auto_blue__Mobile-phone', '/static/images/icons/blue/Mobile-phone.png', null, null, null, '134', '1', '0', '1', null, '2017-01-18 15:53:57', '2017-01-18 15:53:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821222754067403', '1', '135', 'icon_auto_blue__more', '/static/images/icons/blue/more.png', null, null, null, '135', '1', '0', '1', null, '2017-01-18 15:53:58', '2017-01-18 15:53:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821223111631820', '1', '136', 'icon_auto_blue__more_unfold', '/static/images/icons/blue/more_unfold.png', null, null, null, '136', '1', '0', '1', null, '2017-01-18 15:53:58', '2017-01-18 15:53:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821223531062221', '1', '137', 'icon_auto_blue__move', '/static/images/icons/blue/move.png', null, null, null, '137', '1', '0', '1', null, '2017-01-18 15:53:58', '2017-01-18 15:53:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821223908549582', '1', '138', 'icon_auto_blue__nav-list', '/static/images/icons/blue/nav-list.png', null, null, null, '138', '1', '0', '1', null, '2017-01-18 15:53:59', '2017-01-18 15:53:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821224254579663', '1', '139', 'icon_auto_blue__office', '/static/images/icons/blue/office.png', null, null, null, '139', '1', '0', '1', null, '2017-01-18 15:53:59', '2017-01-18 15:53:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821224614241232', '1', '140', 'icon_auto_blue__onepage', '/static/images/icons/blue/onepage.png', null, null, null, '140', '1', '0', '1', null, '2017-01-18 15:53:59', '2017-01-18 15:53:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821224991728593', '1', '141', 'icon_auto_blue__operation', '/static/images/icons/blue/operation.png', null, null, null, '141', '1', '0', '1', null, '2017-01-18 15:54:00', '2017-01-18 15:54:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821225406964690', '1', '142', 'icon_auto_blue__Operator', '/static/images/icons/blue/Operator.png', null, null, null, '142', '1', '0', '1', null, '2017-01-18 15:54:00', '2017-01-18 15:54:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821225745654739', '1', '143', 'icon_auto_blue__original-image', '/static/images/icons/blue/original-image.png', null, null, null, '143', '1', '0', '1', null, '2017-01-18 15:54:01', '2017-01-18 15:54:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821226130482132', '1', '144', 'icon_auto_blue__pdf', '/static/images/icons/blue/pdf.png', null, null, null, '144', '1', '0', '1', null, '2017-01-18 15:54:01', '2017-01-18 15:54:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821226514260949', '1', '145', 'icon_auto_blue__personal-center', '/static/images/icons/blue/personal-center.png', null, null, null, '145', '1', '0', '1', null, '2017-01-18 15:54:01', '2017-01-18 15:54:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821226895942614', '1', '146', 'icon_auto_blue__phone', '/static/images/icons/blue/phone.png', null, null, null, '146', '1', '0', '1', null, '2017-01-18 15:54:02', '2017-01-18 15:54:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821227316421591', '1', '147', 'icon_auto_blue__pic-filling', '/static/images/icons/blue/pic-filling.png', null, null, null, '147', '1', '0', '1', null, '2017-01-18 15:54:02', '2017-01-18 15:54:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821227698103256', '1', '148', 'icon_auto_blue__pic', '/static/images/icons/blue/pic.png', null, null, null, '148', '1', '0', '1', null, '2017-01-18 15:54:02', '2017-01-18 15:54:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821228070347737', '1', '149', 'icon_auto_blue__pin', '/static/images/icons/blue/pin.png', null, null, null, '149', '1', '0', '1', null, '2017-01-18 15:54:03', '2017-01-18 15:54:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821228441543642', '1', '150', 'icon_auto_blue__play', '/static/images/icons/blue/play.png', null, null, null, '150', '1', '0', '1', null, '2017-01-18 15:54:03', '2017-01-18 15:54:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821228835808219', '1', '151', 'icon_auto_blue__print', '/static/images/icons/blue/print.png', null, null, null, '151', '1', '0', '1', null, '2017-01-18 15:54:03', '2017-01-18 15:54:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821229196518364', '1', '152', 'icon_auto_blue__process', '/static/images/icons/blue/process.png', null, null, null, '152', '1', '0', '1', null, '2017-01-18 15:54:04', '2017-01-18 15:54:04', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821229548839901', '1', '153', 'icon_auto_blue__product-features', '/static/images/icons/blue/product-features.png', null, null, null, '153', '1', '0', '1', null, '2017-01-18 15:54:04', '2017-01-18 15:54:04', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821229948347358', '1', '154', 'icon_auto_blue__profile', '/static/images/icons/blue/profile.png', null, null, null, '154', '1', '0', '1', null, '2017-01-18 15:54:05', '2017-01-18 15:54:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821230347854815', '1', '155', 'icon_auto_blue__QRCode', '/static/images/icons/blue/QRCode.png', null, null, null, '155', '1', '0', '1', null, '2017-01-18 15:54:05', '2017-01-18 15:54:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821230697030624', '1', '156', 'icon_auto_blue__raw', '/static/images/icons/blue/raw.png', null, null, null, '156', '1', '0', '1', null, '2017-01-18 15:54:05', '2017-01-18 15:54:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821231156306913', '1', '157', 'icon_auto_blue__refresh', '/static/images/icons/blue/refresh.png', null, null, null, '157', '1', '0', '1', null, '2017-01-18 15:54:06', '2017-01-18 15:54:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821231523308514', '1', '158', 'icon_auto_blue__rejected-order', '/static/images/icons/blue/rejected-order.png', null, null, null, '158', '1', '0', '1', null, '2017-01-18 15:54:06', '2017-01-18 15:54:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821231864095715', '1', '159', 'icon_auto_blue__remind', '/static/images/icons/blue/remind.png', null, null, null, '159', '1', '0', '1', null, '2017-01-18 15:54:06', '2017-01-18 15:54:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821232222708708', '1', '160', 'icon_auto_blue__RFQ-filling', '/static/images/icons/blue/RFQ-filling.png', null, null, null, '160', '1', '0', '1', null, '2017-01-18 15:54:07', '2017-01-18 15:54:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821232569787365', '1', '161', 'icon_auto_blue__rfq-qm', '/static/images/icons/blue/rfq-qm.png', null, null, null, '161', '1', '0', '1', null, '2017-01-18 15:54:07', '2017-01-18 15:54:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821232913720294', '1', '162', 'icon_auto_blue__rfq-quantity', '/static/images/icons/blue/rfq-quantity.png', null, null, null, '162', '1', '0', '1', null, '2017-01-18 15:54:07', '2017-01-18 15:54:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821233293304807', '1', '163', 'icon_auto_blue__RFQ', '/static/images/icons/blue/RFQ.png', null, null, null, '163', '1', '0', '1', null, '2017-01-18 15:54:08', '2017-01-18 15:54:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821233678132200', '1', '164', 'icon_auto_blue__save', '/static/images/icons/blue/save.png', null, null, null, '164', '1', '0', '1', null, '2017-01-18 15:54:08', '2017-01-18 15:54:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821234038842345', '1', '165', 'icon_auto_blue__scanning', '/static/images/icons/blue/scanning.png', null, null, null, '165', '1', '0', '1', null, '2017-01-18 15:54:08', '2017-01-18 15:54:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821234414232554', '1', '166', 'icon_auto_blue__search', '/static/images/icons/blue/search.png', null, null, null, '166', '1', '0', '1', null, '2017-01-18 15:54:09', '2017-01-18 15:54:09', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821234764456939', '1', '167', 'icon_auto_blue__security', '/static/images/icons/blue/security.png', null, null, null, '167', '1', '0', '1', null, '2017-01-18 15:54:09', '2017-01-18 15:54:09', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821235108389868', '1', '168', 'icon_auto_blue__selected', '/static/images/icons/blue/selected.png', null, null, null, '168', '1', '0', '1', null, '2017-01-18 15:54:09', '2017-01-18 15:54:09', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821235721806829', '1', '169', 'icon_auto_blue__service', '/static/images/icons/blue/service.png', null, null, null, '169', '1', '0', '1', null, '2017-01-18 15:54:10', '2017-01-18 15:54:10', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821236079371246', '1', '170', 'icon_auto_blue__set', '/static/images/icons/blue/set.png', null, null, null, '170', '1', '0', '1', null, '2017-01-18 15:54:10', '2017-01-18 15:54:10', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821236433789935', '1', '171', 'icon_auto_blue__share', '/static/images/icons/blue/share.png', null, null, null, '171', '1', '0', '1', null, '2017-01-18 15:54:11', '2017-01-18 15:54:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821236752557040', '1', '172', 'icon_auto_blue__ship', '/static/images/icons/blue/ship.png', null, null, null, '172', '1', '0', '1', null, '2017-01-18 15:54:11', '2017-01-18 15:54:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821237162550257', '1', '173', 'icon_auto_blue__shoes', '/static/images/icons/blue/shoes.png', null, null, null, '173', '1', '0', '1', null, '2017-01-18 15:54:11', '2017-01-18 15:54:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821237528503282', '1', '174', 'icon_auto_blue__shuffling-banner', '/static/images/icons/blue/shuffling-banner.png', null, null, null, '174', '1', '0', '1', null, '2017-01-18 15:54:12', '2017-01-18 15:54:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821237869290483', '1', '175', 'icon_auto_blue__signboard', '/static/images/icons/blue/signboard.png', null, null, null, '175', '1', '0', '1', null, '2017-01-18 15:54:12', '2017-01-18 15:54:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821238224757748', '1', '176', 'icon_auto_blue__similar-product', '/static/images/icons/blue/similar-product.png', null, null, null, '176', '1', '0', '1', null, '2017-01-18 15:54:12', '2017-01-18 15:54:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821238560302069', '1', '177', 'icon_auto_blue__skip', '/static/images/icons/blue/skip.png', null, null, null, '177', '1', '0', '1', null, '2017-01-18 15:54:13', '2017-01-18 15:54:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821239549109238', '1', '178', 'icon_auto_blue__Smile', '/static/images/icons/blue/Smile.png', null, null, null, '178', '1', '0', '1', null, '2017-01-18 15:54:14', '2017-01-18 15:54:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821239887799287', '1', '179', 'icon_auto_blue__sorting', '/static/images/icons/blue/sorting.png', null, null, null, '179', '1', '0', '1', null, '2017-01-18 15:54:14', '2017-01-18 15:54:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821240208663544', '1', '180', 'icon_auto_blue__sports', '/static/images/icons/blue/sports.png', null, null, null, '180', '1', '0', '1', null, '2017-01-18 15:54:14', '2017-01-18 15:54:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821240577762297', '1', '181', 'icon_auto_blue__stop', '/static/images/icons/blue/stop.png', null, null, null, '181', '1', '0', '1', null, '2017-01-18 15:54:15', '2017-01-18 15:54:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821240958395386', '1', '182', 'icon_auto_blue__store', '/static/images/icons/blue/store.png', null, null, null, '182', '1', '0', '1', null, '2017-01-18 15:54:15', '2017-01-18 15:54:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821241321202683', '1', '183', 'icon_auto_blue__subtract', '/static/images/icons/blue/subtract.png', null, null, null, '183', '1', '0', '1', null, '2017-01-18 15:54:15', '2017-01-18 15:54:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821241680864252', '1', '184', 'icon_auto_blue__success', '/static/images/icons/blue/success.png', null, null, null, '184', '1', '0', '1', null, '2017-01-18 15:54:16', '2017-01-18 15:54:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821242021651453', '1', '185', 'icon_auto_blue__supplier-features', '/static/images/icons/blue/supplier-features.png', null, null, null, '185', '1', '0', '1', null, '2017-01-18 15:54:16', '2017-01-18 15:54:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821242366632958', '1', '186', 'icon_auto_blue__survey', '/static/images/icons/blue/survey.png', null, null, null, '186', '1', '0', '1', null, '2017-01-18 15:54:16', '2017-01-18 15:54:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821242709517311', '1', '187', 'icon_auto_blue__sysAuditReportMenu', '/static/images/icons/blue/sysAuditReportMenu.png', null, null, null, '187', '1', '0', '1', null, '2017-01-18 15:54:17', '2017-01-18 15:54:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821243024089088', '1', '188', 'icon_auto_blue__sysDauth', '/static/images/icons/blue/sysDauth.png', null, null, null, '188', '1', '0', '1', null, '2017-01-18 15:54:17', '2017-01-18 15:54:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821243334467585', '1', '189', 'icon_auto_blue__sysEmployee', '/static/images/icons/blue/sysEmployee.png', null, null, null, '189', '1', '0', '1', null, '2017-01-18 15:54:17', '2017-01-18 15:54:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821243730829314', '1', '190', 'icon_auto_blue__sysEmployeeJobReport', '/static/images/icons/blue/sysEmployeeJobReport.png', null, null, null, '190', '1', '0', '1', null, '2017-01-18 15:54:18', '2017-01-18 15:54:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821244055887875', '1', '191', 'icon_auto_blue__sysModifyPwd', '/static/images/icons/blue/sysModifyPwd.png', null, null, null, '191', '1', '0', '1', null, '2017-01-18 15:54:18', '2017-01-18 15:54:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821244418695172', '1', '192', 'icon_auto_blue__sysPersonal', '/static/images/icons/blue/sysPersonal.png', null, null, null, '192', '1', '0', '1', null, '2017-01-18 15:54:18', '2017-01-18 15:54:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821244735365125', '1', '193', 'icon_auto_blue__sysRunMonitor', '/static/images/icons/blue/sysRunMonitor.png', null, null, null, '193', '1', '0', '1', null, '2017-01-18 15:54:19', '2017-01-18 15:54:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821245068812294', '1', '194', 'icon_auto_blue__sysServerMonitor', '/static/images/icons/blue/sysServerMonitor.png', null, null, null, '194', '1', '0', '1', null, '2017-01-18 15:54:19', '2017-01-18 15:54:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821245404356615', '1', '195', 'icon_auto_blue__sysStatisticalReportMenu', '/static/images/icons/blue/sysStatisticalReportMenu.png', null, null, null, '195', '1', '0', '1', null, '2017-01-18 15:54:19', '2017-01-18 15:54:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821245770309640', '1', '196', 'icon_auto_blue__Task-Management', '/static/images/icons/blue/Task-Management.png', null, null, null, '196', '1', '0', '1', null, '2017-01-18 15:54:20', '2017-01-18 15:54:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821246113193993', '1', '197', 'icon_auto_blue__template-default', '/static/images/icons/blue/template-default.png', null, null, null, '197', '1', '0', '1', null, '2017-01-18 15:54:20', '2017-01-18 15:54:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821246442446858', '1', '198', 'icon_auto_blue__text', '/static/images/icons/blue/text.png', null, null, null, '198', '1', '0', '1', null, '2017-01-18 15:54:20', '2017-01-18 15:54:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821246837760011', '1', '199', 'icon_auto_blue__toys', '/static/images/icons/blue/toys.png', null, null, null, '199', '1', '0', '1', null, '2017-01-18 15:54:21', '2017-01-18 15:54:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821247173304332', '1', '200', 'icon_auto_blue__trade-assurance', '/static/images/icons/blue/trade-assurance.png', null, null, null, '200', '1', '0', '1', null, '2017-01-18 15:54:21', '2017-01-18 15:54:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821247545548813', '1', '201', 'icon_auto_blue__trade', '/static/images/icons/blue/trade.png', null, null, null, '201', '1', '0', '1', null, '2017-01-18 15:54:21', '2017-01-18 15:54:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821247873753102', '1', '202', 'icon_auto_blue__training', '/static/images/icons/blue/training.png', null, null, null, '202', '1', '0', '1', null, '2017-01-18 15:54:22', '2017-01-18 15:54:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821248203005967', '1', '203', 'icon_auto_blue__userLog', '/static/images/icons/blue/userLog.png', null, null, null, '203', '1', '0', '1', null, '2017-01-18 15:54:22', '2017-01-18 15:54:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821248514433040', '1', '204', 'icon_auto_blue__ViewGallery', '/static/images/icons/blue/ViewGallery.png', null, null, null, '204', '1', '0', '1', null, '2017-01-18 15:54:22', '2017-01-18 15:54:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821248857317393', '1', '205', 'icon_auto_blue__Viewlist', '/static/images/icons/blue/Viewlist.png', null, null, null, '205', '1', '0', '1', null, '2017-01-18 15:54:23', '2017-01-18 15:54:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821249242144786', '1', '206', 'icon_auto_blue__warning', '/static/images/icons/blue/warning.png', null, null, null, '206', '1', '0', '1', null, '2017-01-18 15:54:23', '2017-01-18 15:54:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821249567203347', '1', '207', 'icon_auto_blue__wrong', '/static/images/icons/blue/wrong.png', null, null, null, '207', '1', '0', '1', null, '2017-01-18 15:54:23', '2017-01-18 15:54:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821249944690708', '1', '208', 'icon_auto_blue__zip', '/static/images/icons/blue/zip.png', null, null, null, '208', '1', '0', '1', null, '2017-01-18 15:54:24', '2017-01-18 15:54:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821250270797845', '1', '209', 'icon_auto_colorful__about', '/static/images/icons/colorful/about.png', null, null, null, '209', '1', '0', '1', null, '2017-01-18 15:54:24', '2017-01-18 15:54:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821250602147862', '1', '210', 'icon_auto_colorful__accept_database', '/static/images/icons/colorful/accept_database.png', null, null, null, '210', '1', '0', '1', null, '2017-01-18 15:54:24', '2017-01-18 15:54:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821250954469399', '1', '211', 'icon_auto_colorful__address_book', '/static/images/icons/colorful/address_book.png', null, null, null, '211', '1', '0', '1', null, '2017-01-18 15:54:25', '2017-01-18 15:54:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821251285819416', '1', '212', 'icon_auto_colorful__add_column', '/static/images/icons/colorful/add_column.png', null, null, null, '212', '1', '0', '1', null, '2017-01-18 15:54:25', '2017-01-18 15:54:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821251652821017', '1', '213', 'icon_auto_colorful__add_database', '/static/images/icons/colorful/add_database.png', null, null, null, '213', '1', '0', '1', null, '2017-01-18 15:54:25', '2017-01-18 15:54:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821252053377050', '1', '214', 'icon_auto_colorful__add_image', '/static/images/icons/colorful/add_image.png', null, null, null, '214', '1', '0', '1', null, '2017-01-18 15:54:26', '2017-01-18 15:54:26', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821252428767259', '1', '215', 'icon_auto_colorful__add_row', '/static/images/icons/colorful/add_row.png', null, null, null, '215', '1', '0', '1', null, '2017-01-18 15:54:26', '2017-01-18 15:54:26', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821252780040220', '1', '216', 'icon_auto_colorful__advance', '/static/images/icons/colorful/advance.png', null, null, null, '216', '1', '0', '1', null, '2017-01-18 15:54:26', '2017-01-18 15:54:26', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821253119778845', '1', '217', 'icon_auto_colorful__advertising', '/static/images/icons/colorful/advertising.png', null, null, null, '217', '1', '0', '1', null, '2017-01-18 15:54:27', '2017-01-18 15:54:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821253458468894', '1', '218', 'icon_auto_colorful__alarm_clock', '/static/images/icons/colorful/alarm_clock.png', null, null, null, '218', '1', '0', '1', null, '2017-01-18 15:54:27', '2017-01-18 15:54:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821253813936159', '1', '219', 'icon_auto_colorful__alphabetical_sorting_az', '/static/images/icons/colorful/alphabetical_sorting_az.png', null, null, null, '219', '1', '0', '1', null, '2017-01-18 15:54:27', '2017-01-18 15:54:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821254137946144', '1', '220', 'icon_auto_colorful__alphabetical_sorting_za', '/static/images/icons/colorful/alphabetical_sorting_za.png', null, null, null, '220', '1', '0', '1', null, '2017-01-18 15:54:28', '2017-01-18 15:54:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821254475587617', '1', '221', 'icon_auto_colorful__answers', '/static/images/icons/colorful/answers.png', null, null, null, '221', '1', '0', '1', null, '2017-01-18 15:54:28', '2017-01-18 15:54:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821254821617698', '1', '222', 'icon_auto_colorful__approval', '/static/images/icons/colorful/approval.png', null, null, null, '222', '1', '0', '1', null, '2017-01-18 15:54:28', '2017-01-18 15:54:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821255148773411', '1', '223', 'icon_auto_colorful__approve', '/static/images/icons/colorful/approve.png', null, null, null, '223', '1', '0', '1', null, '2017-01-18 15:54:29', '2017-01-18 15:54:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821255505289252', '1', '224', 'icon_auto_colorful__area_chart', '/static/images/icons/colorful/area_chart.png', null, null, null, '224', '1', '0', '1', null, '2017-01-18 15:54:29', '2017-01-18 15:54:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821255841882149', '1', '225', 'icon_auto_colorful__assistant', '/static/images/icons/colorful/assistant.png', null, null, null, '225', '1', '0', '1', null, '2017-01-18 15:54:29', '2017-01-18 15:54:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821256186863654', '1', '226', 'icon_auto_colorful__automatic', '/static/images/icons/colorful/automatic.png', null, null, null, '226', '1', '0', '1', null, '2017-01-18 15:54:30', '2017-01-18 15:54:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821256552816679', '1', '227', 'icon_auto_colorful__bad_decision', '/static/images/icons/colorful/bad_decision.png', null, null, null, '227', '1', '0', '1', null, '2017-01-18 15:54:30', '2017-01-18 15:54:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821256899895336', '1', '228', 'icon_auto_colorful__bar_chart', '/static/images/icons/colorful/bar_chart.png', null, null, null, '228', '1', '0', '1', null, '2017-01-18 15:54:30', '2017-01-18 15:54:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821257255362601', '1', '229', 'icon_auto_colorful__bearish', '/static/images/icons/colorful/bearish.png', null, null, null, '229', '1', '0', '1', null, '2017-01-18 15:54:31', '2017-01-18 15:54:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821257605586986', '1', '230', 'icon_auto_colorful__binoculars', '/static/images/icons/colorful/binoculars.png', null, null, null, '230', '1', '0', '1', null, '2017-01-18 15:54:31', '2017-01-18 15:54:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821257980977195', '1', '231', 'icon_auto_colorful__biohazard', '/static/images/icons/colorful/biohazard.png', null, null, null, '231', '1', '0', '1', null, '2017-01-18 15:54:31', '2017-01-18 15:54:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821258333298732', '1', '232', 'icon_auto_colorful__biomass', '/static/images/icons/colorful/biomass.png', null, null, null, '232', '1', '0', '1', null, '2017-01-18 15:54:32', '2017-01-18 15:54:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821258651017261', '1', '233', 'icon_auto_colorful__biotech', '/static/images/icons/colorful/biotech.png', null, null, null, '233', '1', '0', '1', null, '2017-01-18 15:54:32', '2017-01-18 15:54:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821259041087534', '1', '234', 'icon_auto_colorful__bookmark', '/static/images/icons/colorful/bookmark.png', null, null, null, '234', '1', '0', '1', null, '2017-01-18 15:54:32', '2017-01-18 15:54:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821259405991983', '1', '235', 'icon_auto_colorful__briefcase', '/static/images/icons/colorful/briefcase.png', null, null, null, '235', '1', '0', '1', null, '2017-01-18 15:54:33', '2017-01-18 15:54:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821259780333616', '1', '236', 'icon_auto_colorful__broken_link', '/static/images/icons/colorful/broken_link.png', null, null, null, '236', '1', '0', '1', null, '2017-01-18 15:54:33', '2017-01-18 15:54:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821260126363697', '1', '237', 'icon_auto_colorful__bullish', '/static/images/icons/colorful/bullish.png', null, null, null, '237', '1', '0', '1', null, '2017-01-18 15:54:33', '2017-01-18 15:54:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821260483928114', '1', '238', 'icon_auto_colorful__business', '/static/images/icons/colorful/business.png', null, null, null, '238', '1', '0', '1', null, '2017-01-18 15:54:34', '2017-01-18 15:54:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821260837298227', '1', '239', 'icon_auto_colorful__businessman', '/static/images/icons/colorful/businessman.png', null, null, null, '239', '1', '0', '1', null, '2017-01-18 15:54:34', '2017-01-18 15:54:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821261199056948', '1', '240', 'icon_auto_colorful__businesswoman', '/static/images/icons/colorful/businesswoman.png', null, null, null, '240', '1', '0', '1', null, '2017-01-18 15:54:34', '2017-01-18 15:54:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821261551378485', '1', '241', 'icon_auto_colorful__business_contact', '/static/images/icons/colorful/business_contact.png', null, null, null, '241', '1', '0', '1', null, '2017-01-18 15:54:35', '2017-01-18 15:54:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821261958225974', '1', '242', 'icon_auto_colorful__butting_in', '/static/images/icons/colorful/butting_in.png', null, null, null, '242', '1', '0', '1', null, '2017-01-18 15:54:35', '2017-01-18 15:54:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821262381850679', '1', '243', 'icon_auto_colorful__cable_release', '/static/images/icons/colorful/cable_release.png', null, null, null, '243', '1', '0', '1', null, '2017-01-18 15:54:35', '2017-01-18 15:54:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821262728929336', '1', '244', 'icon_auto_colorful__calculator', '/static/images/icons/colorful/calculator.png', null, null, null, '244', '1', '0', '1', null, '2017-01-18 15:54:36', '2017-01-18 15:54:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821263149408313', '1', '245', 'icon_auto_colorful__calendar', '/static/images/icons/colorful/calendar.png', null, null, null, '245', '1', '0', '1', null, '2017-01-18 15:54:36', '2017-01-18 15:54:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821263657967674', '1', '246', 'icon_auto_colorful__callback', '/static/images/icons/colorful/callback.png', null, null, null, '246', '1', '0', '1', null, '2017-01-18 15:54:37', '2017-01-18 15:54:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821264037552187', '1', '247', 'icon_auto_colorful__call_transfer', '/static/images/icons/colorful/call_transfer.png', null, null, null, '247', '1', '0', '1', null, '2017-01-18 15:54:37', '2017-01-18 15:54:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821264424476732', '1', '248', 'icon_auto_colorful__camcorder', '/static/images/icons/colorful/camcorder.png', null, null, null, '248', '1', '0', '1', null, '2017-01-18 15:54:37', '2017-01-18 15:54:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821264754778173', '1', '249', 'icon_auto_colorful__camcorder_pro', '/static/images/icons/colorful/camcorder_pro.png', null, null, null, '249', '1', '0', '1', null, '2017-01-18 15:54:38', '2017-01-18 15:54:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821265081933886', '1', '250', 'icon_auto_colorful__camera', '/static/images/icons/colorful/camera.png', null, null, null, '250', '1', '0', '1', null, '2017-01-18 15:54:38', '2017-01-18 15:54:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821265451032639', '1', '251', 'icon_auto_colorful__camera_addon', '/static/images/icons/colorful/camera_addon.png', null, null, null, '251', '1', '0', '1', null, '2017-01-18 15:54:38', '2017-01-18 15:54:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821265782382656', '1', '252', 'icon_auto_colorful__camera_identification', '/static/images/icons/colorful/camera_identification.png', null, null, null, '252', '1', '0', '1', null, '2017-01-18 15:54:39', '2017-01-18 15:54:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821266096955457', '1', '253', 'icon_auto_colorful__cancel', '/static/images/icons/colorful/cancel.png', null, null, null, '253', '1', '0', '1', null, '2017-01-18 15:54:39', '2017-01-18 15:54:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821266416771138', '1', '254', 'icon_auto_colorful__candle_sticks', '/static/images/icons/colorful/candle_sticks.png', null, null, null, '254', '1', '0', '1', null, '2017-01-18 15:54:39', '2017-01-18 15:54:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821266753364035', '1', '255', 'icon_auto_colorful__capacitor', '/static/images/icons/colorful/capacitor.png', null, null, null, '255', '1', '0', '1', null, '2017-01-18 15:54:40', '2017-01-18 15:54:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821267059548228', '1', '256', 'icon_auto_colorful__cell_phone', '/static/images/icons/colorful/cell_phone.png', null, null, null, '256', '1', '0', '1', null, '2017-01-18 15:54:40', '2017-01-18 15:54:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821267518824517', '1', '257', 'icon_auto_colorful__charge_battery', '/static/images/icons/colorful/charge_battery.png', null, null, null, '257', '1', '0', '1', null, '2017-01-18 15:54:40', '2017-01-18 15:54:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821267880583238', '1', '258', 'icon_auto_colorful__checkmark', '/static/images/icons/colorful/checkmark.png', null, null, null, '258', '1', '0', '1', null, '2017-01-18 15:54:41', '2017-01-18 15:54:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821268264362055', '1', '259', 'icon_auto_colorful__cloth', '/static/images/icons/colorful/cloth.png', null, null, null, '259', '1', '0', '1', null, '2017-01-18 15:54:41', '2017-01-18 15:54:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821268619829320', '1', '260', 'icon_auto_colorful__comments', '/static/images/icons/colorful/comments.png', null, null, null, '260', '1', '0', '1', null, '2017-01-18 15:54:41', '2017-01-18 15:54:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821268985782345', '1', '261', 'icon_auto_colorful__compact_camera', '/static/images/icons/colorful/compact_camera.png', null, null, null, '261', '1', '0', '1', null, '2017-01-18 15:54:42', '2017-01-18 15:54:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821269372706890', '1', '262', 'icon_auto_colorful__conference_call', '/static/images/icons/colorful/conference_call.png', null, null, null, '262', '1', '0', '1', null, '2017-01-18 15:54:42', '2017-01-18 15:54:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821269766971467', '1', '263', 'icon_auto_colorful__contacts', '/static/images/icons/colorful/contacts.png', null, null, null, '263', '1', '0', '1', null, '2017-01-18 15:54:43', '2017-01-18 15:54:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821270180110412', '1', '264', 'icon_auto_colorful__copyleft', '/static/images/icons/colorful/copyleft.png', null, null, null, '264', '1', '0', '1', null, '2017-01-18 15:54:43', '2017-01-18 15:54:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821270635192397', '1', '265', 'icon_auto_colorful__copyright', '/static/images/icons/colorful/copyright.png', null, null, null, '265', '1', '0', '1', null, '2017-01-18 15:54:43', '2017-01-18 15:54:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821271095517262', '1', '266', 'icon_auto_colorful__crystal_oscillator', '/static/images/icons/colorful/crystal_oscillator.png', null, null, null, '266', '1', '0', '1', null, '2017-01-18 15:54:44', '2017-01-18 15:54:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821271443644495', '1', '267', 'icon_auto_colorful__currency_exchange', '/static/images/icons/colorful/currency_exchange.png', null, null, null, '267', '1', '0', '1', null, '2017-01-18 15:54:44', '2017-01-18 15:54:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821271797014608', '1', '268', 'icon_auto_colorful__cursor', '/static/images/icons/colorful/cursor.png', null, null, null, '268', '1', '0', '1', null, '2017-01-18 15:54:44', '2017-01-18 15:54:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821272235319377', '1', '269', 'icon_auto_colorful__customer_support', '/static/images/icons/colorful/customer_support.png', null, null, null, '269', '1', '0', '1', null, '2017-01-18 15:54:45', '2017-01-18 15:54:45', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821272598126674', '1', '270', 'icon_auto_colorful__dam', '/static/images/icons/colorful/dam.png', null, null, null, '270', '1', '0', '1', null, '2017-01-18 15:54:45', '2017-01-18 15:54:45', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821272995536979', '1', '271', 'icon_auto_colorful__database', '/static/images/icons/colorful/database.png', null, null, null, '271', '1', '0', '1', null, '2017-01-18 15:54:46', '2017-01-18 15:54:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821273436987476', '1', '272', 'icon_auto_colorful__data_backup', '/static/images/icons/colorful/data_backup.png', null, null, null, '272', '1', '0', '1', null, '2017-01-18 15:54:46', '2017-01-18 15:54:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821273785114709', '1', '273', 'icon_auto_colorful__data_configuration', '/static/images/icons/colorful/data_configuration.png', null, null, null, '273', '1', '0', '1', null, '2017-01-18 15:54:46', '2017-01-18 15:54:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821274233905238', '1', '274', 'icon_auto_colorful__data_encryption', '/static/images/icons/colorful/data_encryption.png', null, null, null, '274', '1', '0', '1', null, '2017-01-18 15:54:47', '2017-01-18 15:54:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821274622926935', '1', '275', 'icon_auto_colorful__data_protection', '/static/images/icons/colorful/data_protection.png', null, null, null, '275', '1', '0', '1', null, '2017-01-18 15:54:47', '2017-01-18 15:54:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821275006705752', '1', '276', 'icon_auto_colorful__data_recovery', '/static/images/icons/colorful/data_recovery.png', null, null, null, '276', '1', '0', '1', null, '2017-01-18 15:54:48', '2017-01-18 15:54:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821275352735833', '1', '277', 'icon_auto_colorful__data_sheet', '/static/images/icons/colorful/data_sheet.png', null, null, null, '277', '1', '0', '1', null, '2017-01-18 15:54:48', '2017-01-18 15:54:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821275714494554', '1', '278', 'icon_auto_colorful__debt', '/static/images/icons/colorful/debt.png', null, null, null, '278', '1', '0', '1', null, '2017-01-18 15:54:48', '2017-01-18 15:54:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821276094079067', '1', '279', 'icon_auto_colorful__decision', '/static/images/icons/colorful/decision.png', null, null, null, '279', '1', '0', '1', null, '2017-01-18 15:54:49', '2017-01-18 15:54:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821276462129244', '1', '280', 'icon_auto_colorful__delete_column', '/static/images/icons/colorful/delete_column.png', null, null, null, '280', '1', '0', '1', null, '2017-01-18 15:54:49', '2017-01-18 15:54:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821276855345245', '1', '281', 'icon_auto_colorful__delete_database', '/static/images/icons/colorful/delete_database.png', null, null, null, '281', '1', '0', '1', null, '2017-01-18 15:54:49', '2017-01-18 15:54:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821277259047006', '1', '282', 'icon_auto_colorful__delete_row', '/static/images/icons/colorful/delete_row.png', null, null, null, '282', '1', '0', '1', null, '2017-01-18 15:54:50', '2017-01-18 15:54:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821277595639903', '1', '283', 'icon_auto_colorful__department', '/static/images/icons/colorful/department.png', null, null, null, '283', '1', '0', '1', null, '2017-01-18 15:54:50', '2017-01-18 15:54:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821277923844192', '1', '284', 'icon_auto_colorful__deployment', '/static/images/icons/colorful/deployment.png', null, null, null, '284', '1', '0', '1', null, '2017-01-18 15:54:50', '2017-01-18 15:54:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821278292942945', '1', '285', 'icon_auto_colorful__diploma_1', '/static/images/icons/colorful/diploma_1.png', null, null, null, '285', '1', '0', '1', null, '2017-01-18 15:54:51', '2017-01-18 15:54:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821278675673186', '1', '286', 'icon_auto_colorful__diploma_2', '/static/images/icons/colorful/diploma_2.png', null, null, null, '286', '1', '0', '1', null, '2017-01-18 15:54:51', '2017-01-18 15:54:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821279053160547', '1', '287', 'icon_auto_colorful__disapprove', '/static/images/icons/colorful/disapprove.png', null, null, null, '287', '1', '0', '1', null, '2017-01-18 15:54:51', '2017-01-18 15:54:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821279433793636', '1', '288', 'icon_auto_colorful__disclaimer', '/static/images/icons/colorful/disclaimer.png', null, null, null, '288', '1', '0', '1', null, '2017-01-18 15:54:52', '2017-01-18 15:54:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821279761997925', '1', '289', 'icon_auto_colorful__dislike', '/static/images/icons/colorful/dislike.png', null, null, null, '289', '1', '0', '1', null, '2017-01-18 15:54:52', '2017-01-18 15:54:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821280091250790', '1', '290', 'icon_auto_colorful__display', '/static/images/icons/colorful/display.png', null, null, null, '290', '1', '0', '1', null, '2017-01-18 15:54:52', '2017-01-18 15:54:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821280478175335', '1', '291', 'icon_auto_colorful__document', '/static/images/icons/colorful/document.png', null, null, null, '291', '1', '0', '1', null, '2017-01-18 15:54:53', '2017-01-18 15:54:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821280813719656', '1', '292', 'icon_auto_colorful__donate', '/static/images/icons/colorful/donate.png', null, null, null, '292', '1', '0', '1', null, '2017-01-18 15:54:53', '2017-01-18 15:54:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821281171284073', '1', '293', 'icon_auto_colorful__doughnut_chart', '/static/images/icons/colorful/doughnut_chart.png', null, null, null, '293', '1', '0', '1', null, '2017-01-18 15:54:53', '2017-01-18 15:54:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821281623220330', '1', '294', 'icon_auto_colorful__down', '/static/images/icons/colorful/down.png', null, null, null, '294', '1', '0', '1', null, '2017-01-18 15:54:54', '2017-01-18 15:54:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821281989173355', '1', '295', 'icon_auto_colorful__download', '/static/images/icons/colorful/download.png', null, null, null, '295', '1', '0', '1', null, '2017-01-18 15:54:54', '2017-01-18 15:54:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821282356174956', '1', '296', 'icon_auto_colorful__down_left', '/static/images/icons/colorful/down_left.png', null, null, null, '296', '1', '0', '1', null, '2017-01-18 15:54:55', '2017-01-18 15:54:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821282726322285', '1', '297', 'icon_auto_colorful__down_right', '/static/images/icons/colorful/down_right.png', null, null, null, '297', '1', '0', '1', null, '2017-01-18 15:54:55', '2017-01-18 15:54:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821283792724078', '1', '298', 'icon_auto_colorful__do_not_inhale', '/static/images/icons/colorful/do_not_inhale.png', null, null, null, '298', '1', '0', '1', null, '2017-01-18 15:54:56', '2017-01-18 15:54:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821284141899887', '1', '299', 'icon_auto_colorful__do_not_insert', '/static/images/icons/colorful/do_not_insert.png', null, null, null, '299', '1', '0', '1', null, '2017-01-18 15:54:56', '2017-01-18 15:54:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821284559233136', '1', '300', 'icon_auto_colorful__do_not_mix', '/static/images/icons/colorful/do_not_mix.png', null, null, null, '300', '1', '0', '1', null, '2017-01-18 15:54:57', '2017-01-18 15:54:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821284982857841', '1', '301', 'icon_auto_colorful__edit_image', '/static/images/icons/colorful/edit_image.png', null, null, null, '301', '1', '0', '1', null, '2017-01-18 15:54:57', '2017-01-18 15:54:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821285325742194', '1', '302', 'icon_auto_colorful__electrical_sensor', '/static/images/icons/colorful/electrical_sensor.png', null, null, null, '302', '1', '0', '1', null, '2017-01-18 15:54:57', '2017-01-18 15:54:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821285696938099', '1', '303', 'icon_auto_colorful__electricity', '/static/images/icons/colorful/electricity.png', null, null, null, '303', '1', '0', '1', null, '2017-01-18 15:54:58', '2017-01-18 15:54:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821286009413748', '1', '304', 'icon_auto_colorful__electronics', '/static/images/icons/colorful/electronics.png', null, null, null, '304', '1', '0', '1', null, '2017-01-18 15:54:58', '2017-01-18 15:54:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821286380609653', '1', '305', 'icon_auto_colorful__electro_devices', '/static/images/icons/colorful/electro_devices.png', null, null, null, '305', '1', '0', '1', null, '2017-01-18 15:54:58', '2017-01-18 15:54:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821286798991478', '1', '306', 'icon_auto_colorful__empty_battery', '/static/images/icons/colorful/empty_battery.png', null, null, null, '306', '1', '0', '1', null, '2017-01-18 15:54:59', '2017-01-18 15:54:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821287127195767', '1', '307', 'icon_auto_colorful__empty_filter', '/static/images/icons/colorful/empty_filter.png', null, null, null, '307', '1', '0', '1', null, '2017-01-18 15:54:59', '2017-01-18 15:54:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821287504683128', '1', '308', 'icon_auto_colorful__empty_trash', '/static/images/icons/colorful/empty_trash.png', null, null, null, '308', '1', '0', '1', null, '2017-01-18 15:54:59', '2017-01-18 15:54:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821287966056569', '1', '309', 'icon_auto_colorful__end_call', '/static/images/icons/colorful/end_call.png', null, null, null, '309', '1', '0', '1', null, '2017-01-18 15:55:00', '2017-01-18 15:55:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821288352981114', '1', '310', 'icon_auto_colorful__engineering', '/static/images/icons/colorful/engineering.png', null, null, null, '310', '1', '0', '1', null, '2017-01-18 15:55:00', '2017-01-18 15:55:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821288703205499', '1', '311', 'icon_auto_colorful__entering_heaven_alive', '/static/images/icons/colorful/entering_heaven_alive.png', null, null, null, '311', '1', '0', '1', null, '2017-01-18 15:55:01', '2017-01-18 15:55:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821289059721340', '1', '312', 'icon_auto_colorful__expand', '/static/images/icons/colorful/expand.png', null, null, null, '312', '1', '0', '1', null, '2017-01-18 15:55:01', '2017-01-18 15:55:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821289423577213', '1', '313', 'icon_auto_colorful__expired', '/static/images/icons/colorful/expired.png', null, null, null, '313', '1', '0', '1', null, '2017-01-18 15:55:01', '2017-01-18 15:55:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821289828327550', '1', '314', 'icon_auto_colorful__export', '/static/images/icons/colorful/export.png', null, null, null, '314', '1', '0', '1', null, '2017-01-18 15:55:02', '2017-01-18 15:55:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821290157580415', '1', '315', 'icon_auto_colorful__external', '/static/images/icons/colorful/external.png', null, null, null, '315', '1', '0', '1', null, '2017-01-18 15:55:02', '2017-01-18 15:55:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821290521436288', '1', '316', 'icon_auto_colorful__factory', '/static/images/icons/colorful/factory.png', null, null, null, '316', '1', '0', '1', null, '2017-01-18 15:55:02', '2017-01-18 15:55:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821290954498177', '1', '317', 'icon_auto_colorful__factory_breakdown', '/static/images/icons/colorful/factory_breakdown.png', null, null, null, '317', '1', '0', '1', null, '2017-01-18 15:55:03', '2017-01-18 15:55:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821291341422722', '1', '318', 'icon_auto_colorful__faq', '/static/images/icons/colorful/faq.png', null, null, null, '318', '1', '0', '1', null, '2017-01-18 15:55:03', '2017-01-18 15:55:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821291671724163', '1', '319', 'icon_auto_colorful__feedback', '/static/images/icons/colorful/feedback.png', null, null, null, '319', '1', '0', '1', null, '2017-01-18 15:55:03', '2017-01-18 15:55:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821292139389060', '1', '320', 'icon_auto_colorful__feed_in', '/static/images/icons/colorful/feed_in.png', null, null, null, '320', '1', '0', '1', null, '2017-01-18 15:55:04', '2017-01-18 15:55:04', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821293112467589', '1', '321', 'icon_auto_colorful__file', '/static/images/icons/colorful/file.png', null, null, null, '321', '1', '0', '1', null, '2017-01-18 15:55:05', '2017-01-18 15:55:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821293838082182', '1', '322', 'icon_auto_colorful__filing_cabinet', '/static/images/icons/colorful/filing_cabinet.png', null, null, null, '322', '1', '0', '1', null, '2017-01-18 15:55:05', '2017-01-18 15:55:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821294519656583', '1', '323', 'icon_auto_colorful__filled_filter', '/static/images/icons/colorful/filled_filter.png', null, null, null, '323', '1', '0', '1', null, '2017-01-18 15:55:06', '2017-01-18 15:55:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821294878269576', '1', '324', 'icon_auto_colorful__film', '/static/images/icons/colorful/film.png', null, null, null, '324', '1', '0', '1', null, '2017-01-18 15:55:06', '2017-01-18 15:55:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821295218008201', '1', '325', 'icon_auto_colorful__film_reel', '/static/images/icons/colorful/film_reel.png', null, null, null, '325', '1', '0', '1', null, '2017-01-18 15:55:07', '2017-01-18 15:55:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821295572426890', '1', '326', 'icon_auto_colorful__fine_print', '/static/images/icons/colorful/fine_print.png', null, null, null, '326', '1', '0', '1', null, '2017-01-18 15:55:07', '2017-01-18 15:55:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821295934185611', '1', '327', 'icon_auto_colorful__flash_auto', '/static/images/icons/colorful/flash_auto.png', null, null, null, '327', '1', '0', '1', null, '2017-01-18 15:55:07', '2017-01-18 15:55:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821296320061580', '1', '328', 'icon_auto_colorful__flash_off', '/static/images/icons/colorful/flash_off.png', null, null, null, '328', '1', '0', '1', null, '2017-01-18 15:55:08', '2017-01-18 15:55:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821296669237389', '1', '329', 'icon_auto_colorful__flash_on', '/static/images/icons/colorful/flash_on.png', null, null, null, '329', '1', '0', '1', null, '2017-01-18 15:55:08', '2017-01-18 15:55:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821297010024590', '1', '330', 'icon_auto_colorful__flow_chart', '/static/images/icons/colorful/flow_chart.png', null, null, null, '330', '1', '0', '1', null, '2017-01-18 15:55:08', '2017-01-18 15:55:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821297399046287', '1', '331', 'icon_auto_colorful__folder', '/static/images/icons/colorful/folder.png', null, null, null, '331', '1', '0', '1', null, '2017-01-18 15:55:09', '2017-01-18 15:55:09', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821297747173520', '1', '332', 'icon_auto_colorful__frame', '/static/images/icons/colorful/frame.png', null, null, null, '332', '1', '0', '1', null, '2017-01-18 15:55:09', '2017-01-18 15:55:09', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821298158215313', '1', '333', 'icon_auto_colorful__full_battery', '/static/images/icons/colorful/full_battery.png', null, null, null, '333', '1', '0', '1', null, '2017-01-18 15:55:10', '2017-01-18 15:55:10', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821298534654098', '1', '334', 'icon_auto_colorful__full_trash', '/static/images/icons/colorful/full_trash.png', null, null, null, '334', '1', '0', '1', null, '2017-01-18 15:55:10', '2017-01-18 15:55:10', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821299248734355', '1', '335', 'icon_auto_colorful__gallery', '/static/images/icons/colorful/gallery.png', null, null, null, '335', '1', '0', '1', null, '2017-01-18 15:55:11', '2017-01-18 15:55:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821299890462868', '1', '336', 'icon_auto_colorful__genealogy', '/static/images/icons/colorful/genealogy.png', null, null, null, '336', '1', '0', '1', null, '2017-01-18 15:55:11', '2017-01-18 15:55:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821300258513045', '1', '337', 'icon_auto_colorful__generic_sorting_asc', '/static/images/icons/colorful/generic_sorting_asc.png', null, null, null, '337', '1', '0', '1', null, '2017-01-18 15:55:12', '2017-01-18 15:55:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821300677943446', '1', '338', 'icon_auto_colorful__generic_sorting_desc', '/static/images/icons/colorful/generic_sorting_desc.png', null, null, null, '338', '1', '0', '1', null, '2017-01-18 15:55:12', '2017-01-18 15:55:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821301028167831', '1', '339', 'icon_auto_colorful__globe', '/static/images/icons/colorful/globe.png', null, null, null, '339', '1', '0', '1', null, '2017-01-18 15:55:12', '2017-01-18 15:55:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821301483249816', '1', '340', 'icon_auto_colorful__good_decision', '/static/images/icons/colorful/good_decision.png', null, null, null, '340', '1', '0', '1', null, '2017-01-18 15:55:13', '2017-01-18 15:55:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821301817745561', '1', '341', 'icon_auto_colorful__graduation_cap', '/static/images/icons/colorful/graduation_cap.png', null, null, null, '341', '1', '0', '1', null, '2017-01-18 15:55:13', '2017-01-18 15:55:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821302212010138', '1', '342', 'icon_auto_colorful__grid', '/static/images/icons/colorful/grid.png', null, null, null, '342', '1', '0', '1', null, '2017-01-18 15:55:13', '2017-01-18 15:55:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821302649266331', '1', '343', 'icon_auto_colorful__headset', '/static/images/icons/colorful/headset.png', null, null, null, '343', '1', '0', '1', null, '2017-01-18 15:55:14', '2017-01-18 15:55:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821302990053532', '1', '344', 'icon_auto_colorful__heat_map', '/static/images/icons/colorful/heat_map.png', null, null, null, '344', '1', '0', '1', null, '2017-01-18 15:55:14', '2017-01-18 15:55:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821304020803741', '1', '345', 'icon_auto_colorful__high_battery', '/static/images/icons/colorful/high_battery.png', null, null, null, '345', '1', '0', '1', null, '2017-01-18 15:55:15', '2017-01-18 15:55:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821304397242526', '1', '346', 'icon_auto_colorful__high_priority', '/static/images/icons/colorful/high_priority.png', null, null, null, '346', '1', '0', '1', null, '2017-01-18 15:55:16', '2017-01-18 15:55:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821304782069919', '1', '347', 'icon_auto_colorful__home', '/static/images/icons/colorful/home.png', null, null, null, '347', '1', '0', '1', null, '2017-01-18 15:55:16', '2017-01-18 15:55:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821305102934176', '1', '348', 'icon_auto_colorful__icons8_cup', '/static/images/icons/colorful/icons8_cup.png', null, null, null, '348', '1', '0', '1', null, '2017-01-18 15:55:16', '2017-01-18 15:55:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821305784508577', '1', '349', 'icon_auto_colorful__idea', '/static/images/icons/colorful/idea.png', null, null, null, '349', '1', '0', '1', null, '2017-01-18 15:55:17', '2017-01-18 15:55:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821306179821730', '1', '350', 'icon_auto_colorful__image_file', '/static/images/icons/colorful/image_file.png', null, null, null, '350', '1', '0', '1', null, '2017-01-18 15:55:17', '2017-01-18 15:55:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821306551017635', '1', '351', 'icon_auto_colorful__import', '/static/images/icons/colorful/import.png', null, null, null, '351', '1', '0', '1', null, '2017-01-18 15:55:18', '2017-01-18 15:55:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821307205329060', '1', '352', 'icon_auto_colorful__info', '/static/images/icons/colorful/info.png', null, null, null, '352', '1', '0', '1', null, '2017-01-18 15:55:18', '2017-01-18 15:55:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821307922555045', '1', '353', 'icon_auto_colorful__inspection', '/static/images/icons/colorful/inspection.png', null, null, null, '353', '1', '0', '1', null, '2017-01-18 15:55:19', '2017-01-18 15:55:19', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821308643975334', '1', '354', 'icon_auto_colorful__integrated_webcam', '/static/images/icons/colorful/integrated_webcam.png', null, null, null, '354', '1', '0', '1', null, '2017-01-18 15:55:20', '2017-01-18 15:55:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821309000491175', '1', '355', 'icon_auto_colorful__internal', '/static/images/icons/colorful/internal.png', null, null, null, '355', '1', '0', '1', null, '2017-01-18 15:55:20', '2017-01-18 15:55:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821309344424104', '1', '356', 'icon_auto_colorful__invite', '/static/images/icons/colorful/invite.png', null, null, null, '356', '1', '0', '1', null, '2017-01-18 15:55:20', '2017-01-18 15:55:20', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821309734494377', '1', '357', 'icon_auto_colorful__in_transit', '/static/images/icons/colorful/in_transit.png', null, null, null, '357', '1', '0', '1', null, '2017-01-18 15:55:21', '2017-01-18 15:55:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821310149730474', '1', '358', 'icon_auto_colorful__ipad', '/static/images/icons/colorful/ipad.png', null, null, null, '358', '1', '0', '1', null, '2017-01-18 15:55:21', '2017-01-18 15:55:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821310516732075', '1', '359', 'icon_auto_colorful__iphone', '/static/images/icons/colorful/iphone.png', null, null, null, '359', '1', '0', '1', null, '2017-01-18 15:55:21', '2017-01-18 15:55:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821310856470700', '1', '360', 'icon_auto_colorful__key', '/static/images/icons/colorful/key.png', null, null, null, '360', '1', '0', '1', null, '2017-01-18 15:55:22', '2017-01-18 15:55:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821311202500781', '1', '361', 'icon_auto_colorful__kindle', '/static/images/icons/colorful/kindle.png', null, null, null, '361', '1', '0', '1', null, '2017-01-18 15:55:22', '2017-01-18 15:55:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821311562162350', '1', '362', 'icon_auto_colorful__landscape', '/static/images/icons/colorful/landscape.png', null, null, null, '362', '1', '0', '1', null, '2017-01-18 15:55:22', '2017-01-18 15:55:22', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821311938601135', '1', '363', 'icon_auto_colorful__leave', '/static/images/icons/colorful/leave.png', null, null, null, '363', '1', '0', '1', null, '2017-01-18 15:55:23', '2017-01-18 15:55:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821312363274416', '1', '364', 'icon_auto_colorful__left', '/static/images/icons/colorful/left.png', null, null, null, '364', '1', '0', '1', null, '2017-01-18 15:55:23', '2017-01-18 15:55:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821312736567473', '1', '365', 'icon_auto_colorful__left_down', '/static/images/icons/colorful/left_down.png', null, null, null, '365', '1', '0', '1', null, '2017-01-18 15:55:23', '2017-01-18 15:55:23', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821313130832050', '1', '366', 'icon_auto_colorful__left_down2', '/static/images/icons/colorful/left_down2.png', null, null, null, '366', '1', '0', '1', null, '2017-01-18 15:55:24', '2017-01-18 15:55:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821313499930803', '1', '367', 'icon_auto_colorful__left_up', '/static/images/icons/colorful/left_up.png', null, null, null, '367', '1', '0', '1', null, '2017-01-18 15:55:24', '2017-01-18 15:55:24', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821313875321012', '1', '368', 'icon_auto_colorful__left_up2', '/static/images/icons/colorful/left_up2.png', null, null, null, '368', '1', '0', '1', null, '2017-01-18 15:55:25', '2017-01-18 15:55:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821314243371189', '1', '369', 'icon_auto_colorful__library', '/static/images/icons/colorful/library.png', null, null, null, '369', '1', '0', '1', null, '2017-01-18 15:55:25', '2017-01-18 15:55:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821314586255542', '1', '370', 'icon_auto_colorful__light_at_the_end_of_tunnel', '/static/images/icons/colorful/light_at_the_end_of_tunnel.png', null, null, null, '370', '1', '0', '1', null, '2017-01-18 15:55:25', '2017-01-18 15:55:25', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821314917605559', '1', '371', 'icon_auto_colorful__like', '/static/images/icons/colorful/like.png', null, null, null, '371', '1', '0', '1', null, '2017-01-18 15:55:26', '2017-01-18 15:55:26', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821315270975672', '1', '372', 'icon_auto_colorful__like_placeholder', '/static/images/icons/colorful/like_placeholder.png', null, null, null, '372', '1', '0', '1', null, '2017-01-18 15:55:26', '2017-01-18 15:55:26', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821315984007353', '1', '373', 'icon_auto_colorful__line_chart', '/static/images/icons/colorful/line_chart.png', null, null, null, '373', '1', '0', '1', null, '2017-01-18 15:55:27', '2017-01-18 15:55:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821316371980474', '1', '374', 'icon_auto_colorful__link', '/static/images/icons/colorful/link.png', null, null, null, '374', '1', '0', '1', null, '2017-01-18 15:55:27', '2017-01-18 15:55:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821316728496315', '1', '375', 'icon_auto_colorful__list', '/static/images/icons/colorful/list.png', null, null, null, '375', '1', '0', '1', null, '2017-01-18 15:55:27', '2017-01-18 15:55:27', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821317116469436', '1', '376', 'icon_auto_colorful__lock', '/static/images/icons/colorful/lock.png', null, null, null, '376', '1', '0', '1', null, '2017-01-18 15:55:28', '2017-01-18 15:55:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821317527511229', '1', '377', 'icon_auto_colorful__lock_landscape', '/static/images/icons/colorful/lock_landscape.png', null, null, null, '377', '1', '0', '1', null, '2017-01-18 15:55:28', '2017-01-18 15:55:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821317916532926', '1', '378', 'icon_auto_colorful__lock_portrait', '/static/images/icons/colorful/lock_portrait.png', null, null, null, '378', '1', '0', '1', null, '2017-01-18 15:55:28', '2017-01-18 15:55:28', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821318289825983', '1', '379', 'icon_auto_colorful__low_battery', '/static/images/icons/colorful/low_battery.png', null, null, null, '379', '1', '0', '1', null, '2017-01-18 15:55:29', '2017-01-18 15:55:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821318642147520', '1', '380', 'icon_auto_colorful__low_priority', '/static/images/icons/colorful/low_priority.png', null, null, null, '380', '1', '0', '1', null, '2017-01-18 15:55:29', '2017-01-18 15:55:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821318990274753', '1', '381', 'icon_auto_colorful__make_decision', '/static/images/icons/colorful/make_decision.png', null, null, null, '381', '1', '0', '1', null, '2017-01-18 15:55:29', '2017-01-18 15:55:29', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821319327916226', '1', '382', 'icon_auto_colorful__manager', '/static/images/icons/colorful/manager.png', null, null, null, '382', '1', '0', '1', null, '2017-01-18 15:55:30', '2017-01-18 15:55:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821319996907715', '1', '383', 'icon_auto_colorful__medium_priority', '/static/images/icons/colorful/medium_priority.png', null, null, null, '383', '1', '0', '1', null, '2017-01-18 15:55:30', '2017-01-18 15:55:30', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821320337694916', '1', '384', 'icon_auto_colorful__menu', '/static/images/icons/colorful/menu.png', null, null, null, '384', '1', '0', '1', null, '2017-01-18 15:55:31', '2017-01-18 15:55:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821320671142085', '1', '385', 'icon_auto_colorful__middle_battery', '/static/images/icons/colorful/middle_battery.png', null, null, null, '385', '1', '0', '1', null, '2017-01-18 15:55:31', '2017-01-18 15:55:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821321027657926', '1', '386', 'icon_auto_colorful__mind_map', '/static/images/icons/colorful/mind_map.png', null, null, null, '386', '1', '0', '1', null, '2017-01-18 15:55:31', '2017-01-18 15:55:31', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821321421922503', '1', '387', 'icon_auto_colorful__minus', '/static/images/icons/colorful/minus.png', null, null, null, '387', '1', '0', '1', null, '2017-01-18 15:55:32', '2017-01-18 15:55:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821321803604168', '1', '388', 'icon_auto_colorful__missed_call', '/static/images/icons/colorful/missed_call.png', null, null, null, '388', '1', '0', '1', null, '2017-01-18 15:55:32', '2017-01-18 15:55:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821322162217161', '1', '389', 'icon_auto_colorful__mms', '/static/images/icons/colorful/mms.png', null, null, null, '389', '1', '0', '1', null, '2017-01-18 15:55:32', '2017-01-18 15:55:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821322527121610', '1', '390', 'icon_auto_colorful__money_transfer', '/static/images/icons/colorful/money_transfer.png', null, null, null, '390', '1', '0', '1', null, '2017-01-18 15:55:33', '2017-01-18 15:55:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821322895171787', '1', '391', 'icon_auto_colorful__multiple_cameras', '/static/images/icons/colorful/multiple_cameras.png', null, null, null, '391', '1', '0', '1', null, '2017-01-18 15:55:33', '2017-01-18 15:55:33', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821323250639052', '1', '392', 'icon_auto_colorful__multiple_devices', '/static/images/icons/colorful/multiple_devices.png', null, null, null, '392', '1', '0', '1', null, '2017-01-18 15:55:34', '2017-01-18 15:55:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821323595620557', '1', '393', 'icon_auto_colorful__multiple_inputs', '/static/images/icons/colorful/multiple_inputs.png', null, null, null, '393', '1', '0', '1', null, '2017-01-18 15:55:34', '2017-01-18 15:55:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821323941650638', '1', '394', 'icon_auto_colorful__multiple_smartphones', '/static/images/icons/colorful/multiple_smartphones.png', null, null, null, '394', '1', '0', '1', null, '2017-01-18 15:55:34', '2017-01-18 15:55:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821324299215055', '1', '395', 'icon_auto_colorful__music', '/static/images/icons/colorful/music.png', null, null, null, '395', '1', '0', '1', null, '2017-01-18 15:55:35', '2017-01-18 15:55:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821324760588496', '1', '396', 'icon_auto_colorful__negative_dynamic', '/static/images/icons/colorful/negative_dynamic.png', null, null, null, '396', '1', '0', '1', null, '2017-01-18 15:55:35', '2017-01-18 15:55:35', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821325396025553', '1', '397', 'icon_auto_colorful__neutral_decision', '/static/images/icons/colorful/neutral_decision.png', null, null, null, '397', '1', '0', '1', null, '2017-01-18 15:55:36', '2017-01-18 15:55:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821325756735698', '1', '398', 'icon_auto_colorful__neutral_trading', '/static/images/icons/colorful/neutral_trading.png', null, null, null, '398', '1', '0', '1', null, '2017-01-18 15:55:36', '2017-01-18 15:55:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821326113251539', '1', '399', 'icon_auto_colorful__news', '/static/images/icons/colorful/news.png', null, null, null, '399', '1', '0', '1', null, '2017-01-18 15:55:36', '2017-01-18 15:55:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821326438310100', '1', '400', 'icon_auto_colorful__next', '/static/images/icons/colorful/next.png', null, null, null, '400', '1', '0', '1', null, '2017-01-18 15:55:37', '2017-01-18 15:55:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821326795874517', '1', '401', 'icon_auto_colorful__night_landscape', '/static/images/icons/colorful/night_landscape.png', null, null, null, '401', '1', '0', '1', null, '2017-01-18 15:55:37', '2017-01-18 15:55:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821327142953174', '1', '402', 'icon_auto_colorful__night_portrait', '/static/images/icons/colorful/night_portrait.png', null, null, null, '402', '1', '0', '1', null, '2017-01-18 15:55:37', '2017-01-18 15:55:37', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821327499469015', '1', '403', 'icon_auto_colorful__no_idea', '/static/images/icons/colorful/no_idea.png', null, null, null, '403', '1', '0', '1', null, '2017-01-18 15:55:38', '2017-01-18 15:55:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821327846547672', '1', '404', 'icon_auto_colorful__numerical_sorting_12', '/static/images/icons/colorful/numerical_sorting_12.png', null, null, null, '404', '1', '0', '1', null, '2017-01-18 15:55:38', '2017-01-18 15:55:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821328182091993', '1', '405', 'icon_auto_colorful__numerical_sorting_21', '/static/images/icons/colorful/numerical_sorting_21.png', null, null, null, '405', '1', '0', '1', null, '2017-01-18 15:55:38', '2017-01-18 15:55:38', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821328560627930', '1', '406', 'icon_auto_colorful__ok', '/static/images/icons/colorful/ok.png', null, null, null, '406', '1', '0', '1', null, '2017-01-18 15:55:39', '2017-01-18 15:55:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821328918192347', '1', '407', 'icon_auto_colorful__old_time_camera', '/static/images/icons/colorful/old_time_camera.png', null, null, null, '407', '1', '0', '1', null, '2017-01-18 15:55:39', '2017-01-18 15:55:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821329257930972', '1', '408', 'icon_auto_colorful__online_support', '/static/images/icons/colorful/online_support.png', null, null, null, '408', '1', '0', '1', null, '2017-01-18 15:55:39', '2017-01-18 15:55:39', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821329625981149', '1', '409', 'icon_auto_colorful__opened_folder', '/static/images/icons/colorful/opened_folder.png', null, null, null, '409', '1', '0', '1', null, '2017-01-18 15:55:40', '2017-01-18 15:55:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821330306506974', '1', '410', 'icon_auto_colorful__organization', '/static/images/icons/colorful/organization.png', null, null, null, '410', '1', '0', '1', null, '2017-01-18 15:55:40', '2017-01-18 15:55:40', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821330664071391', '1', '411', 'icon_auto_colorful__org_unit', '/static/images/icons/colorful/org_unit.png', null, null, null, '411', '1', '0', '1', null, '2017-01-18 15:55:41', '2017-01-18 15:55:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821331023732960', '1', '412', 'icon_auto_colorful__overtime', '/static/images/icons/colorful/overtime.png', null, null, null, '412', '1', '0', '1', null, '2017-01-18 15:55:41', '2017-01-18 15:55:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821331371860193', '1', '413', 'icon_auto_colorful__package', '/static/images/icons/colorful/package.png', null, null, null, '413', '1', '0', '1', null, '2017-01-18 15:55:41', '2017-01-18 15:55:41', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821331726278882', '1', '414', 'icon_auto_colorful__paid', '/static/images/icons/colorful/paid.png', null, null, null, '414', '1', '0', '1', null, '2017-01-18 15:55:42', '2017-01-18 15:55:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821332196040931', '1', '415', 'icon_auto_colorful__panorama', '/static/images/icons/colorful/panorama.png', null, null, null, '415', '1', '0', '1', null, '2017-01-18 15:55:42', '2017-01-18 15:55:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821332541022436', '1', '416', 'icon_auto_colorful__parallel_tasks', '/static/images/icons/colorful/parallel_tasks.png', null, null, null, '416', '1', '0', '1', null, '2017-01-18 15:55:42', '2017-01-18 15:55:42', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821332935287013', '1', '417', 'icon_auto_colorful__phone', '/static/images/icons/colorful/phone.png', null, null, null, '417', '1', '0', '1', null, '2017-01-18 15:55:43', '2017-01-18 15:55:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821333316968678', '1', '418', 'icon_auto_colorful__phone_android', '/static/images/icons/colorful/phone_android.png', null, null, null, '418', '1', '0', '1', null, '2017-01-18 15:55:43', '2017-01-18 15:55:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821333668241639', '1', '419', 'icon_auto_colorful__photo_reel', '/static/images/icons/colorful/photo_reel.png', null, null, null, '419', '1', '0', '1', null, '2017-01-18 15:55:43', '2017-01-18 15:55:43', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821334050971880', '1', '420', 'icon_auto_colorful__picture', '/static/images/icons/colorful/picture.png', null, null, null, '420', '1', '0', '1', null, '2017-01-18 15:55:44', '2017-01-18 15:55:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821334417973481', '1', '421', 'icon_auto_colorful__pie_chart', '/static/images/icons/colorful/pie_chart.png', null, null, null, '421', '1', '0', '1', null, '2017-01-18 15:55:44', '2017-01-18 15:55:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821334766100714', '1', '422', 'icon_auto_colorful__planner', '/static/images/icons/colorful/planner.png', null, null, null, '422', '1', '0', '1', null, '2017-01-18 15:55:44', '2017-01-18 15:55:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821335138345195', '1', '423', 'icon_auto_colorful__plus', '/static/images/icons/colorful/plus.png', null, null, null, '423', '1', '0', '1', null, '2017-01-18 15:55:45', '2017-01-18 15:55:45', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821335499055340', '1', '424', 'icon_auto_colorful__podium_without_speaker', '/static/images/icons/colorful/podium_without_speaker.png', null, null, null, '424', '1', '0', '1', null, '2017-01-18 15:55:45', '2017-01-18 15:55:45', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821335825162477', '1', '425', 'icon_auto_colorful__podium_with_audience', '/static/images/icons/colorful/podium_with_audience.png', null, null, null, '425', '1', '0', '1', null, '2017-01-18 15:55:46', '2017-01-18 15:55:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821336184824046', '1', '426', 'icon_auto_colorful__podium_with_speaker', '/static/images/icons/colorful/podium_with_speaker.png', null, null, null, '426', '1', '0', '1', null, '2017-01-18 15:55:46', '2017-01-18 15:55:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821336541339887', '1', '427', 'icon_auto_colorful__portrait_mode', '/static/images/icons/colorful/portrait_mode.png', null, null, null, '427', '1', '0', '1', null, '2017-01-18 15:55:46', '2017-01-18 15:55:46', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821336903098608', '1', '428', 'icon_auto_colorful__positive_dynamic', '/static/images/icons/colorful/positive_dynamic.png', null, null, null, '428', '1', '0', '1', null, '2017-01-18 15:55:47', '2017-01-18 15:55:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821337251225841', '1', '429', 'icon_auto_colorful__previous', '/static/images/icons/colorful/previous.png', null, null, null, '429', '1', '0', '1', null, '2017-01-18 15:55:47', '2017-01-18 15:55:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821337705259250', '1', '430', 'icon_auto_colorful__print', '/static/images/icons/colorful/print.png', null, null, null, '430', '1', '0', '1', null, '2017-01-18 15:55:47', '2017-01-18 15:55:47', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821338077503731', '1', '431', 'icon_auto_colorful__privacy', '/static/images/icons/colorful/privacy.png', null, null, null, '431', '1', '0', '1', null, '2017-01-18 15:55:48', '2017-01-18 15:55:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821338465476852', '1', '432', 'icon_auto_colorful__process', '/static/images/icons/colorful/process.png', null, null, null, '432', '1', '0', '1', null, '2017-01-18 15:55:48', '2017-01-18 15:55:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821338821992693', '1', '433', 'icon_auto_colorful__puzzle', '/static/images/icons/colorful/puzzle.png', null, null, null, '433', '1', '0', '1', null, '2017-01-18 15:55:48', '2017-01-18 15:55:48', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821339209965814', '1', '434', 'icon_auto_colorful__questions', '/static/images/icons/colorful/questions.png', null, null, null, '434', '1', '0', '1', null, '2017-01-18 15:55:49', '2017-01-18 15:55:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821339615764727', '1', '435', 'icon_auto_colorful__radar_plot', '/static/images/icons/colorful/radar_plot.png', null, null, null, '435', '1', '0', '1', null, '2017-01-18 15:55:49', '2017-01-18 15:55:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821340004786424', '1', '436', 'icon_auto_colorful__rating', '/static/images/icons/colorful/rating.png', null, null, null, '436', '1', '0', '1', null, '2017-01-18 15:55:49', '2017-01-18 15:55:49', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821340344525049', '1', '437', 'icon_auto_colorful__ratings', '/static/images/icons/colorful/ratings.png', null, null, null, '437', '1', '0', '1', null, '2017-01-18 15:55:50', '2017-01-18 15:55:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821340720963834', '1', '438', 'icon_auto_colorful__reading', '/static/images/icons/colorful/reading.png', null, null, null, '438', '1', '0', '1', null, '2017-01-18 15:55:50', '2017-01-18 15:55:50', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821341129908475', '1', '439', 'icon_auto_colorful__reading_ebook', '/static/images/icons/colorful/reading_ebook.png', null, null, null, '439', '1', '0', '1', null, '2017-01-18 15:55:51', '2017-01-18 15:55:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821341467549948', '1', '440', 'icon_auto_colorful__redo', '/static/images/icons/colorful/redo.png', null, null, null, '440', '1', '0', '1', null, '2017-01-18 15:55:51', '2017-01-18 15:55:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821341819871485', '1', '441', 'icon_auto_colorful__refresh', '/static/images/icons/colorful/refresh.png', null, null, null, '441', '1', '0', '1', null, '2017-01-18 15:55:51', '2017-01-18 15:55:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821342238253310', '1', '442', 'icon_auto_colorful__registered_trademark', '/static/images/icons/colorful/registered_trademark.png', null, null, null, '442', '1', '0', '1', null, '2017-01-18 15:55:52', '2017-01-18 15:55:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821342587429119', '1', '443', 'icon_auto_colorful__remove_image', '/static/images/icons/colorful/remove_image.png', null, null, null, '443', '1', '0', '1', null, '2017-01-18 15:55:52', '2017-01-18 15:55:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821342921924864', '1', '444', 'icon_auto_colorful__reuse', '/static/images/icons/colorful/reuse.png', null, null, null, '444', '1', '0', '1', null, '2017-01-18 15:55:52', '2017-01-18 15:55:52', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821343277392129', '1', '445', 'icon_auto_colorful__right', '/static/images/icons/colorful/right.png', null, null, null, '445', '1', '0', '1', null, '2017-01-18 15:55:53', '2017-01-18 15:55:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821343641248002', '1', '446', 'icon_auto_colorful__right_down', '/static/images/icons/colorful/right_down.png', null, null, null, '446', '1', '0', '1', null, '2017-01-18 15:55:53', '2017-01-18 15:55:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821344000909571', '1', '447', 'icon_auto_colorful__right_down2', '/static/images/icons/colorful/right_down2.png', null, null, null, '447', '1', '0', '1', null, '2017-01-18 15:55:53', '2017-01-18 15:55:53', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821344358473988', '1', '448', 'icon_auto_colorful__right_up', '/static/images/icons/colorful/right_up.png', null, null, null, '448', '1', '0', '1', null, '2017-01-18 15:55:54', '2017-01-18 15:55:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821344747495685', '1', '449', 'icon_auto_colorful__right_up2', '/static/images/icons/colorful/right_up2.png', null, null, null, '449', '1', '0', '1', null, '2017-01-18 15:55:54', '2017-01-18 15:55:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821345132323078', '1', '450', 'icon_auto_colorful__rotate_camera', '/static/images/icons/colorful/rotate_camera.png', null, null, null, '450', '1', '0', '1', null, '2017-01-18 15:55:54', '2017-01-18 15:55:54', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821345511907591', '1', '451', 'icon_auto_colorful__rotate_to_landscape', '/static/images/icons/colorful/rotate_to_landscape.png', null, null, null, '451', '1', '0', '1', null, '2017-01-18 15:55:55', '2017-01-18 15:55:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821345857937672', '1', '452', 'icon_auto_colorful__rotate_to_portrait', '/static/images/icons/colorful/rotate_to_portrait.png', null, null, null, '452', '1', '0', '1', null, '2017-01-18 15:55:55', '2017-01-18 15:55:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821346245910793', '1', '453', 'icon_auto_colorful__ruler', '/static/images/icons/colorful/ruler.png', null, null, null, '453', '1', '0', '1', null, '2017-01-18 15:55:55', '2017-01-18 15:55:55', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821346624446730', '1', '454', 'icon_auto_colorful__rules', '/static/images/icons/colorful/rules.png', null, null, null, '454', '1', '0', '1', null, '2017-01-18 15:55:56', '2017-01-18 15:55:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821347000885515', '1', '455', 'icon_auto_colorful__safe', '/static/images/icons/colorful/safe.png', null, null, null, '455', '1', '0', '1', null, '2017-01-18 15:55:56', '2017-01-18 15:55:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821347326992652', '1', '456', 'icon_auto_colorful__sales_performance', '/static/images/icons/colorful/sales_performance.png', null, null, null, '456', '1', '0', '1', null, '2017-01-18 15:55:56', '2017-01-18 15:55:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821347671974157', '1', '457', 'icon_auto_colorful__scatter_plot', '/static/images/icons/colorful/scatter_plot.png', null, null, null, '457', '1', '0', '1', null, '2017-01-18 15:55:57', '2017-01-18 15:55:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821348063093006', '1', '458', 'icon_auto_colorful__search', '/static/images/icons/colorful/search.png', null, null, null, '458', '1', '0', '1', null, '2017-01-18 15:55:57', '2017-01-18 15:55:57', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821348618838287', '1', '459', 'icon_auto_colorful__selfie', '/static/images/icons/colorful/selfie.png', null, null, null, '459', '1', '0', '1', null, '2017-01-18 15:55:58', '2017-01-18 15:55:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821349290975504', '1', '460', 'icon_auto_colorful__self_service_kiosk', '/static/images/icons/colorful/self_service_kiosk.png', null, null, null, '460', '1', '0', '1', null, '2017-01-18 15:55:58', '2017-01-18 15:55:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821349712503057', '1', '461', 'icon_auto_colorful__serial_tasks', '/static/images/icons/colorful/serial_tasks.png', null, null, null, '461', '1', '0', '1', null, '2017-01-18 15:55:59', '2017-01-18 15:55:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821350125642002', '1', '462', 'icon_auto_colorful__services', '/static/images/icons/colorful/services.png', null, null, null, '462', '1', '0', '1', null, '2017-01-18 15:55:59', '2017-01-18 15:55:59', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821350514663699', '1', '463', 'icon_auto_colorful__service_mark', '/static/images/icons/colorful/service_mark.png', null, null, null, '463', '1', '0', '1', null, '2017-01-18 15:56:00', '2017-01-18 15:56:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821350849159444', '1', '464', 'icon_auto_colorful__settings', '/static/images/icons/colorful/settings.png', null, null, null, '464', '1', '0', '1', null, '2017-01-18 15:56:00', '2017-01-18 15:56:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821351205675285', '1', '465', 'icon_auto_colorful__share', '/static/images/icons/colorful/share.png', null, null, null, '465', '1', '0', '1', null, '2017-01-18 15:56:00', '2017-01-18 15:56:00', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821351586308374', '1', '466', 'icon_auto_colorful__shipped', '/static/images/icons/colorful/shipped.png', null, null, null, '466', '1', '0', '1', null, '2017-01-18 15:56:01', '2017-01-18 15:56:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821351939678487', '1', '467', 'icon_auto_colorful__shop', '/static/images/icons/colorful/shop.png', null, null, null, '467', '1', '0', '1', null, '2017-01-18 15:56:01', '2017-01-18 15:56:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821352338137368', '1', '468', 'icon_auto_colorful__signature', '/static/images/icons/colorful/signature.png', null, null, null, '468', '1', '0', '1', null, '2017-01-18 15:56:01', '2017-01-18 15:56:01', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821352694653209', '1', '469', 'icon_auto_colorful__sim_card', '/static/images/icons/colorful/sim_card.png', null, null, null, '469', '1', '0', '1', null, '2017-01-18 15:56:02', '2017-01-18 15:56:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821353051169050', '1', '470', 'icon_auto_colorful__sim_card_chip', '/static/images/icons/colorful/sim_card_chip.png', null, null, null, '470', '1', '0', '1', null, '2017-01-18 15:56:02', '2017-01-18 15:56:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821353398247707', '1', '471', 'icon_auto_colorful__slr_back_side', '/static/images/icons/colorful/slr_back_side.png', null, null, null, '471', '1', '0', '1', null, '2017-01-18 15:56:02', '2017-01-18 15:56:02', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821353732743452', '1', '472', 'icon_auto_colorful__smartphone_tablet', '/static/images/icons/colorful/smartphone_tablet.png', null, null, null, '472', '1', '0', '1', null, '2017-01-18 15:56:03', '2017-01-18 15:56:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821354424803613', '1', '473', 'icon_auto_colorful__sms', '/static/images/icons/colorful/sms.png', null, null, null, '473', '1', '0', '1', null, '2017-01-18 15:56:03', '2017-01-18 15:56:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821354856816926', '1', '474', 'icon_auto_colorful__sound_recording_copyright', '/static/images/icons/colorful/sound_recording_copyright.png', null, null, null, '474', '1', '0', '1', null, '2017-01-18 15:56:04', '2017-01-18 15:56:04', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821355219624223', '1', '475', 'icon_auto_colorful__speaker', '/static/images/icons/colorful/speaker.png', null, null, null, '475', '1', '0', '1', null, '2017-01-18 15:56:04', '2017-01-18 15:56:04', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821355609694496', '1', '476', 'icon_auto_colorful__sports_mode', '/static/images/icons/colorful/sports_mode.png', null, null, null, '476', '1', '0', '1', null, '2017-01-18 15:56:04', '2017-01-18 15:56:04', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821356016541985', '1', '477', 'icon_auto_colorful__stack_of_photos', '/static/images/icons/colorful/stack_of_photos.png', null, null, null, '477', '1', '0', '1', null, '2017-01-18 15:56:05', '2017-01-18 15:56:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821356731670818', '1', '478', 'icon_auto_colorful__start', '/static/images/icons/colorful/start.png', null, null, null, '478', '1', '0', '1', null, '2017-01-18 15:56:05', '2017-01-18 15:56:05', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821357444702499', '1', '479', 'icon_auto_colorful__statistics', '/static/images/icons/colorful/statistics.png', null, null, null, '479', '1', '0', '1', null, '2017-01-18 15:56:06', '2017-01-18 15:56:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821357815898404', '1', '480', 'icon_auto_colorful__support', '/static/images/icons/colorful/support.png', null, null, null, '480', '1', '0', '1', null, '2017-01-18 15:56:06', '2017-01-18 15:56:06', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821358199677221', '1', '481', 'icon_auto_colorful__survey', '/static/images/icons/colorful/survey.png', null, null, null, '481', '1', '0', '1', null, '2017-01-18 15:56:07', '2017-01-18 15:56:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821358556193062', '1', '482', 'icon_auto_colorful__switch_camera', '/static/images/icons/colorful/switch_camera.png', null, null, null, '482', '1', '0', '1', null, '2017-01-18 15:56:07', '2017-01-18 15:56:07', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821358901174567', '1', '483', 'icon_auto_colorful__synchronize', '/static/images/icons/colorful/synchronize.png', null, null, null, '483', '1', '0', '1', null, '2017-01-18 15:56:08', '2017-01-18 15:56:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821359289147688', '1', '484', 'icon_auto_colorful__tablet_android', '/static/images/icons/colorful/tablet_android.png', null, null, null, '484', '1', '0', '1', null, '2017-01-18 15:56:08', '2017-01-18 15:56:08', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821362311143721', '1', '485', 'icon_auto_colorful__template', '/static/images/icons/colorful/template.png', null, null, null, '485', '1', '0', '1', null, '2017-01-18 15:56:11', '2017-01-18 15:56:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821362658222378', '1', '486', 'icon_auto_colorful__timeline', '/static/images/icons/colorful/timeline.png', null, null, null, '486', '1', '0', '1', null, '2017-01-18 15:56:11', '2017-01-18 15:56:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821363026272555', '1', '487', 'icon_auto_colorful__todo_list', '/static/images/icons/colorful/todo_list.png', null, null, null, '487', '1', '0', '1', null, '2017-01-18 15:56:11', '2017-01-18 15:56:11', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821363401662764', '1', '488', 'icon_auto_colorful__trademark', '/static/images/icons/colorful/trademark.png', null, null, null, '488', '1', '0', '1', null, '2017-01-18 15:56:12', '2017-01-18 15:56:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821363782295853', '1', '489', 'icon_auto_colorful__tree_structure', '/static/images/icons/colorful/tree_structure.png', null, null, null, '489', '1', '0', '1', null, '2017-01-18 15:56:12', '2017-01-18 15:56:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821364126228782', '1', '490', 'icon_auto_colorful__two_smartphones', '/static/images/icons/colorful/two_smartphones.png', null, null, null, '490', '1', '0', '1', null, '2017-01-18 15:56:12', '2017-01-18 15:56:12', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821364956700975', '1', '491', 'icon_auto_colorful__undo', '/static/images/icons/colorful/undo.png', null, null, null, '491', '1', '0', '1', null, '2017-01-18 15:56:13', '2017-01-18 15:56:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821365317411120', '1', '492', 'icon_auto_colorful__unlock', '/static/images/icons/colorful/unlock.png', null, null, null, '492', '1', '0', '1', null, '2017-01-18 15:56:14', '2017-01-18 15:56:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821365696995633', '1', '493', 'icon_auto_colorful__up', '/static/images/icons/colorful/up.png', null, null, null, '493', '1', '0', '1', null, '2017-01-18 15:56:14', '2017-01-18 15:56:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821366032539954', '1', '494', 'icon_auto_colorful__upload', '/static/images/icons/colorful/upload.png', null, null, null, '494', '1', '0', '1', null, '2017-01-18 15:56:14', '2017-01-18 15:56:14', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821366403735859', '1', '495', 'icon_auto_colorful__up_left', '/static/images/icons/colorful/up_left.png', null, null, null, '495', '1', '0', '1', null, '2017-01-18 15:56:15', '2017-01-18 15:56:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821366729842996', '1', '496', 'icon_auto_colorful__up_right', '/static/images/icons/colorful/up_right.png', null, null, null, '496', '1', '0', '1', null, '2017-01-18 15:56:15', '2017-01-18 15:56:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821367077970229', '1', '497', 'icon_auto_colorful__video_call', '/static/images/icons/colorful/video_call.png', null, null, null, '497', '1', '0', '1', null, '2017-01-18 15:56:15', '2017-01-18 15:56:15', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821367456506166', '1', '498', 'icon_auto_colorful__video_file', '/static/images/icons/colorful/video_file.png', null, null, null, '498', '1', '0', '1', null, '2017-01-18 15:56:16', '2017-01-18 15:56:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821367802536247', '1', '499', 'icon_auto_colorful__video_projector', '/static/images/icons/colorful/video_projector.png', null, null, null, '499', '1', '0', '1', null, '2017-01-18 15:56:16', '2017-01-18 15:56:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821368166392120', '1', '500', 'icon_auto_colorful__view_details', '/static/images/icons/colorful/view_details.png', null, null, null, '500', '1', '0', '1', null, '2017-01-18 15:56:16', '2017-01-18 15:56:16', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821368537588025', '1', '501', 'icon_auto_colorful__vip', '/static/images/icons/colorful/vip.png', null, null, null, '501', '1', '0', '1', null, '2017-01-18 15:56:17', '2017-01-18 15:56:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821368940241210', '1', '502', 'icon_auto_colorful__voicemail', '/static/images/icons/colorful/voicemail.png', null, null, null, '502', '1', '0', '1', null, '2017-01-18 15:56:17', '2017-01-18 15:56:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821369301999931', '1', '503', 'icon_auto_colorful__voice_presentation', '/static/images/icons/colorful/voice_presentation.png', null, null, null, '503', '1', '0', '1', null, '2017-01-18 15:56:17', '2017-01-18 15:56:17', '1', '1');
INSERT INTO `sys_icon` VALUES ('1056821369699410236', '1', '504', 'icon_auto_colorful__webcam', '/static/images/icons/colorful/webcam.png', null, null, null, '504', '1', '0', '1', null, '2017-01-18 15:56:18', '2017-01-18 15:56:18', '1', '1');
INSERT INTO `sys_icon` VALUES ('1063139897532472765', '1', '505', 'icon_auto_colorful__bumen', '/static/images/icons/colorful/bumen.png', '', '', '', '505', '1', '0', '1', null, '2017-03-29 09:46:36', '2017-03-29 09:46:36', '1', '1');
INSERT INTO `sys_icon` VALUES ('1063139983793577407', '1', '506', 'icon_auto_colorful__fill', '/static/images/icons/colorful/fill.png', '', '', '', '506', '1', '0', '1', null, '2017-03-29 09:47:58', '2017-03-29 09:47:58', '1', '1');
INSERT INTO `sys_icon` VALUES ('1063140037415656897', '1', '507', 'icon_auto_colorful__gangwei', '/static/images/icons/colorful/gangwei.png', '', '', '', '507', '1', '0', '1', null, '2017-03-29 09:48:49', '2017-03-29 09:48:49', '1', '1');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `JOB_ID_` bigint(20) NOT NULL COMMENT '职务编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `JOB_CODE_` varchar(64) NOT NULL COMMENT '职务编码',
  `JOB_NAME_` varchar(64) DEFAULT NULL COMMENT '职务名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` tinyint(4) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` tinyint(4) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`JOB_ID_`),
  UNIQUE KEY `AK_Key_2` (`JOB_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职务表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `LOG_ID_` bigint(20) NOT NULL COMMENT '日志ID',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `LOG_TYPE_` tinyint(4) NOT NULL COMMENT '类型(0:系统操作日志,1:接口类调用日志,2;定时任务调用日志,3异常信息日志)',
  `LOG_LEVEL_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '日志级别（0:DEBUG,1:INFO,2:WARN,3:ERROR,4:FATAL）',
  `KEY1_` varchar(255) DEFAULT NULL COMMENT '关键词',
  `KEY2_` varchar(255) DEFAULT NULL COMMENT '关键词',
  `KEY3_` varchar(255) DEFAULT NULL COMMENT '关键词',
  `KEY4_` varchar(255) DEFAULT NULL COMMENT '关键词',
  `KEY5_` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT_` text COMMENT '日志内容',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `IS_FINAL_` tinyint(4) DEFAULT '1' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_USER_ID_` bigint(20) NOT NULL DEFAULT '1' COMMENT '数据创建用户编号',
  PRIMARY KEY (`LOG_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1063270422209163155', '1', '3', '0', '/hbm/sys/sysUser/updUser', '0:0:0:0:0:0:0:1', null, 'public com.hginfo.hbm.fe.eu.op.OperationResult com.hginfo.hbm.fe', '当前数据已锁定，无法修改', 'com.hginfo.hutils.exception.BaseRuntimeException: 当前数据已锁定，无法修改\r\n	at com.hginfo.hbm.be.service.base.BizService.checkChange(BizService.java:104)\r\n	at com.hginfo.hbm.be.service.base.BizService.checkChange(BizService.java:1)\r\n	at com.hginfo.hbm.be.service.base.BaseService.update(BaseService.java:207)\r\n	at com.hginfo.hbm.be.service.base.BizService.update(BizService.java:61)\r\n	at com.hginfo.hbm.be.service.impl.sys.SysUserServiceImpl.editUser(SysUserServiceImpl.java:555)\r\n	at com.hginfo.hbm.be.service.impl.sys.SysUserServiceImpl$$FastClassBySpringCGLIB$$8ba8fe77.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:720)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:52)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:99)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:280)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:96)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:655)\r\n	at com.hginfo.hbm.be.service.impl.sys.SysUserServiceImpl$$EnhancerBySpringCGLIB$$1ece97b9.editUser(<generated>)\r\n	at com.hginfo.hbm.fe.eu.web.sys.SysUserController.updateUser(SysUserController.java:250)\r\n	at com.hginfo.hbm.fe.eu.web.sys.SysUserController$$FastClassBySpringCGLIB$$250ea4fb.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:720)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:52)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:52)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:655)\r\n	at com.hginfo.hbm.fe.eu.web.sys.SysUserController$$EnhancerBySpringCGLIB$$faaa0089.updateUser(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:114)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:963)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:650)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:731)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)\r\n	at com.hginfo.hbm.fe.core.filter.DefaultFilter.doFilter(DefaultFilter.java:40)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:505)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:170)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)\r\n	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:956)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:423)\r\n	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1079)\r\n	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:625)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:318)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n', '2017-03-30 20:21:14', '1', '1');

-- ----------------------------
-- Table structure for sys_metadata_entity
-- ----------------------------
DROP TABLE IF EXISTS `sys_metadata_entity`;
CREATE TABLE `sys_metadata_entity` (
  `ENTITY_ID_` bigint(20) NOT NULL COMMENT '实体编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ENTITY_CODE_` varchar(64) DEFAULT NULL COMMENT '实体编码',
  `ENTITY_NAME_` varchar(64) DEFAULT NULL COMMENT '实体名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `TABLE_NAME_` varchar(64) NOT NULL COMMENT '表名',
  `TABLE_ALIAS_` varchar(64) NOT NULL COMMENT '表别名',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`ENTITY_ID_`),
  UNIQUE KEY `AK_Key_3` (`TABLE_NAME_`) USING BTREE,
  UNIQUE KEY `AK_Key_2` (`ENTITY_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='元数据实体表';

-- ----------------------------
-- Records of sys_metadata_entity
-- ----------------------------

-- ----------------------------
-- Table structure for sys_metadata_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_metadata_field`;
CREATE TABLE `sys_metadata_field` (
  `FIELD_ID_` bigint(20) NOT NULL COMMENT '字段编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ENTITY_ID_` bigint(20) DEFAULT NULL COMMENT '实体ID',
  `FILTER_TYPE_ID_` bigint(20) DEFAULT NULL COMMENT '过滤类型ID',
  `FIELD_CODE_` varchar(64) DEFAULT NULL COMMENT '字段编码',
  `FIELD_NAME_` varchar(64) DEFAULT NULL COMMENT '字段名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `COLUMN_NAME_` varchar(64) DEFAULT NULL COMMENT '列名',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`FIELD_ID_`),
  UNIQUE KEY `AK_Key_2` (`ENTITY_ID_`,`COLUMN_NAME_`) USING BTREE,
  KEY `FK_Reference_meta_10` (`FILTER_TYPE_ID_`) USING BTREE,
  CONSTRAINT `sys_metadata_field_ibfk_1` FOREIGN KEY (`FILTER_TYPE_ID_`) REFERENCES `sys_dauth_filter_type` (`FILTER_TYPE_ID_`),
  CONSTRAINT `sys_metadata_field_ibfk_2` FOREIGN KEY (`ENTITY_ID_`) REFERENCES `sys_metadata_entity` (`ENTITY_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='元数据字段表';

-- ----------------------------
-- Records of sys_metadata_field
-- ----------------------------

-- ----------------------------
-- Table structure for sys_model
-- ----------------------------
DROP TABLE IF EXISTS `sys_model`;
CREATE TABLE `sys_model` (
  `MODEL_ID_` bigint(20) NOT NULL COMMENT '模型编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `MODEL_CODE_` varchar(100) DEFAULT NULL COMMENT '编码',
  `MODEL_NAME_` varchar(64) DEFAULT NULL COMMENT '模型名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `FID_` bigint(20) DEFAULT NULL COMMENT '父职务编号',
  `STYLE_` varchar(256) NOT NULL COMMENT 'CSS',
  `IS_TOP_MENU_` tinyint(4) DEFAULT '0' COMMENT '是否是顶部导航菜单（不仅仅是顶级菜单）',
  `IS_SUB_MENU_` tinyint(4) DEFAULT '0' COMMENT '是否是左侧菜单',
  `IS_BS_TOP_MENU_` tinyint(4) DEFAULT '0' COMMENT '是否是bootstrap顶部导航菜单',
  `IS_BS_SUB_MENU_` tinyint(4) DEFAULT '0' COMMENT '是否是bootstrap左侧菜单',
  `URI_` varchar(64) DEFAULT NULL COMMENT '默认uri',
  `SORT_NO_` int(11) NOT NULL COMMENT '排序',
  `IS_VISIBLE_` tinyint(4) DEFAULT '1' COMMENT '是否可见',
  `TIP_` varchar(256) DEFAULT NULL COMMENT '提示信息',
  `MODEL_TYPE_` tinyint(4) DEFAULT NULL COMMENT '模块类型（区分导航模块，功能模块等）',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  `ICON_ID_` bigint(20) DEFAULT NULL COMMENT 'ICON编号',
  PRIMARY KEY (`MODEL_ID_`),
  UNIQUE KEY `AK_Key_2` (`MODEL_CODE_`) USING BTREE,
  KEY `FK_Reference_32` (`ICON_ID_`) USING BTREE,
  KEY `FK_Reference_23` (`FID_`) USING BTREE,
  CONSTRAINT `sys_model_ibfk_1` FOREIGN KEY (`FID_`) REFERENCES `sys_model` (`MODEL_ID_`),
  CONSTRAINT `sys_model_ibfk_2` FOREIGN KEY (`ICON_ID_`) REFERENCES `sys_icon` (`ICON_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统模块表';

-- ----------------------------
-- Records of sys_model
-- ----------------------------
INSERT INTO `sys_model` VALUES ('1052481646384715197', '1', 'sys', '系统', null, 'sys', null, 'icon_system_16', '0', '0', '0', '0', null, '1', '1', null, '0', null, '0', '1', '2016-12-01 18:18:15', '2016-12-01 18:18:15', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481646384715198', '1', 'sysManagementMenu', '系统管理', '', 'sysManagementMenu', '1052481646384715197', 'icon_system_16', '1', '0', '1', '0', '', '6', '1', 'test_test', '0', 'test_test', '0', '0', '2016-12-01 18:18:15', '2017-02-20 16:00:44', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481646805194175', '1', 'sysAuthManagementMenu', '权限管理', '', 'sysAuthManagementMenu', '1052481646384715198', 'icon_auto_blue__supplier-features', '1', '0', '0', '1', '', '11', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-01-18 11:18:44', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481646805194176', '1', 'dauthManagementMenu', '数据权限', '', 'dauthManagementMenu', '1052481646384715198', 'icon_auto_blue__link', '1', '0', '0', '1', '', '12', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-01-18 11:06:29', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481647455311297', '1', 'sysUser', '用户管理', '', 'sysUser', '1052481646805194175', 'icon_auto_blue__bussiness-card', '0', '1', '0', '1', '/sys/sysUser/', '2', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-02-27 10:15:49', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481647455311298', '1', 'dauthOperatorSupport', '运算符支持', '', 'dauthOperatorSupport', '1052481646805194176', 'icon_auto_blue__Operator', '0', '1', '0', '1', '/sys/dauthOperator/', '2', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-01-18 14:40:57', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481647455311299', '1', 'sysMetadata', '元数据管理', '', 'sysMetadata', '1052481646805194176', 'icon_auto_blue__metadata', '0', '1', '0', '1', '/sys/sysMetadata/', '3', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-01-18 14:39:14', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481647455311300', '1', 'dauth', '数据权限', '', 'dauth', '1052481646805194176', 'icon_auto_blue__sysDauth', '0', '1', '0', '1', '/sys/dauth/', '5', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-01-18 14:51:22', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481647455311301', '1', 'dauthUsage', '数据权限应用', '', 'dauthUsage', '1052481646805194176', 'icon_auto_blue__all', '0', '1', '0', '1', '/sys/dauthUsage/', '6', '1', '', '0', '', '0', '0', '2016-12-01 18:18:16', '2017-01-19 11:47:02', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481648127448515', '1', 'sysRole', '角色管理', '', 'sysRole', '1052481646805194175', 'icon_auto_blue__electrical', '0', '1', '0', '1', '/sys/sysRole/', '3', '1', '', '0', '', '0', '0', '2016-12-01 18:18:17', '2017-02-27 10:16:12', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481648470332868', '1', 'sysAuthMenu', '功能权限', '', 'sysAuthMenu', '1052481646805194175', 'icon_auto_blue__trade-assurance', '0', '1', '0', '1', '', '4', '1', '', '0', '', '0', '0', '2016-12-01 18:18:17', '2017-02-27 10:42:22', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481648827897285', '1', 'sysModel', '模块配置', null, 'sysModel', '1052481648470332868', '', '0', '1', '0', '1', '/sys/sysModel/', '41', '1', null, '0', null, '0', '0', '2016-12-01 18:18:17', '2016-12-01 18:18:17', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481649176024518', '1', 'sysOperation', '操作类型配置', '', 'sysOperation', '1052481648470332868', '', '0', '0', '0', '1', '', '46', '1', '', '0', '', '0', '0', '2016-12-01 18:18:18', '2017-03-29 17:12:17', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481649506325959', '1', 'sysAuth', '权限管理', '', 'sysAuth', '1052481648470332868', '', '0', '1', '0', '1', '', '51', '1', '', '0', '', '0', '0', '2016-12-01 18:18:18', '2017-02-27 10:54:42', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481649938339272', '1', 'sysOrganizationMenu', '组织架构', '', 'sysOrganizationMenu', '1052481646805194175', 'icon_auto_blue__nav-list', '0', '1', '0', '1', '/sys/org/view', '56', '1', '', '0', '', '0', '0', '2016-12-01 18:18:19', '2017-01-18 13:47:17', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481650369304009', '1', 'sysPosition', '职务配置', null, 'sysPosition', '1052481649938339272', '', '0', '1', '0', '1', '/sys/sysPosition/', '61', '1', null, '0', null, '0', '0', '2016-12-01 18:18:19', '2016-12-01 18:18:19', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481650765665738', '1', 'sysJob', '岗位配置', null, 'sysJob', '1052481649938339272', '', '0', '1', '0', '1', '/sys/sysJob/', '66', '1', null, '0', null, '0', '0', '2016-12-01 18:18:19', '2016-12-01 18:18:19', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481651160978891', '1', 'sysGroup', '小组管理', null, 'sysGroup', '1052481649938339272', '', '0', '1', '0', '1', '/sys/sysGroup/', '71', '1', null, '0', null, '0', '0', '2016-12-01 18:18:20', '2016-12-01 18:18:20', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481652225283534', '1', 'sysConfigurationMenu', '配置运维', '', 'sysConfigurationMenu', '1052481646384715198', 'icon_auto_blue__box', '1', '0', '0', '1', '', '86', '1', '', '0', '', '0', '0', '2016-12-01 18:18:21', '2017-01-19 09:54:04', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481652225283555', '1', 'sysConfigMenu', '系统设置', '', 'sysConfigMenu', '1052481652225283534', 'icon_auto_blue__set', '1', '0', '0', '1', '', '87', '1', '', '0', '', '0', '0', '2016-12-01 18:18:21', '2017-01-18 11:51:10', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481652945655248', '1', 'sysConfig', '系统设置', '', 'sysConfig', '1052481652225283555', 'icon_auto_blue__config', '0', '1', '0', '1', '', '96', '1', '', '0', '', '0', '0', '2016-12-01 18:18:21', '2017-02-27 18:15:17', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481653319996881', '1', 'sysDictMenu', '字典配置', '', 'sysDictMenu', '1052481652225283555', 'icon_auto_blue__dict', '0', '1', '0', '1', '', '101', '1', '', '0', '', '0', '0', '2016-12-01 18:18:22', '2017-02-27 19:07:19', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481653695387090', '1', 'sysDictGroup', '字典组配置', null, 'sysDictGroup', '1052481653319996881', '', '0', '0', '0', '0', '', '106', '1', null, '0', null, '0', '0', '2016-12-01 18:18:22', '2016-12-01 18:18:22', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481654041417171', '1', 'sysDictItem', '字典项配置', null, 'sysDictItem', '1052481653319996881', '', '0', '0', '0', '0', null, '111', '1', null, '0', null, '0', '0', '2016-12-01 18:18:22', '2016-12-01 18:18:22', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481654405273044', '1', 'sysLogMenu', '日志管理', '', 'sysLogMenu', '1052481652225283534', 'icon_auto_blue__comments', '1', '0', '0', '1', '', '116', '1', '', '0', '', '0', '0', '2016-12-01 18:18:23', '2017-01-18 11:47:46', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481654405273056', '1', 'sysLog', '系统日志', '', 'sysLog', '1052481654405273044', 'icon_auto_blue__log', '0', '1', '0', '1', '', '117', '1', '', '0', '', '0', '0', '2016-12-01 18:18:23', '2017-02-28 14:13:29', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481654405273057', '1', 'sysUserLog', '用户日志', '', 'sysUserLog', '1052481654405273044', 'icon_auto_blue__userLog', '0', '1', '0', '1', '', '118', '1', '', '0', '', '0', '0', '2016-12-01 18:18:23', '2017-03-04 16:19:58', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481654739768666', '1', 'sysResourceMenu', '资源管理', '', 'sysResourceMenu', '1052481652225283534', 'icon_auto_blue__folder', '1', '0', '0', '1', '', '120', '1', '', '0', '', '0', '0', '2016-12-01 18:18:23', '2017-01-18 11:48:50', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481654739768789', '1', 'sysAttachMenu', '附件管理', '', 'sysAttachMenu', '1052481654739768666', 'icon_auto_blue__attachment', '0', '1', '0', '1', '', '121', '1', '', '0', '', '0', '0', '2016-12-01 18:18:23', '2017-02-28 14:21:02', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481655604843993', '1', 'sysIcon', '图标管理', '', 'sysIcon', '1052481654739768666', 'icon_auto_blue__toys', '0', '1', '0', '1', '', '132', '1', '', '0', '', '0', '0', '2016-12-01 18:18:24', '2017-02-28 09:34:36', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481655704243258', '1', 'sysMonitorMenu', '系统监控', '', 'sysMonitorMenu', '1052481652225283534', 'icon_auto_blue__similar-product', '1', '0', '0', '1', '', '133', '1', '', '0', '', '0', '0', '2016-12-01 18:18:24', '2017-01-18 11:49:42', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481655704243260', '1', 'sysJVMMonitor', 'JVM信息', '', 'sysJVMMonitor', '1052481655704243258', 'icon_auto_blue__jvm', '0', '1', '0', '1', '', '134', '1', '', '0', '', '0', '0', '2016-12-01 18:18:24', '2017-02-07 11:17:05', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481655704243262', '1', 'sysServerMonitor', '服务器信息', '', 'sysServerMonitor', '1052481655704243258', 'icon_auto_blue__sysServerMonitor', '0', '1', '0', '1', '', '135', '1', '', '0', '', '0', '0', '2016-12-01 18:18:24', '2017-02-07 11:16:42', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481655704243263', '1', 'sysSystemMonitor', '系统运行信息', '', 'sysSystemMonitor', '1052481655704243258', 'icon_auto_blue__sysRunMonitor', '0', '1', '0', '1', '', '136', '1', '', '0', '', '0', '0', '2016-12-01 18:18:24', '2017-02-07 11:15:59', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481655947728344', '1', 'sysReportMenu', '系统报表', null, 'sysReportMenu', '1052481646384715197', 'icon_report_16', '1', '0', '1', '0', null, '136', '1', null, '0', null, '0', '0', '2016-12-01 18:18:24', '2016-12-01 18:18:24', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481656350381529', '1', 'sysStatisticalReportMenu', '统计报表', '', 'sysStatisticalReportMenu', '1052481655947728344', 'icon_auto_blue__sysStatisticalReportMenu', '1', '0', '0', '1', '', '141', '1', '', '0', '', '0', '0', '2016-12-01 18:18:25', '2017-01-18 16:02:53', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481656748840410', '1', 'sysEmployeeOrgReport', '员工分布', '', 'sysEmployeeOrgReport', '1052481656350381529', 'icon_auto_blue__sysEmployee', '0', '1', '0', '1', '', '145', '1', '', '0', '', '0', '0', '2016-12-01 18:18:25', '2017-03-06 11:55:15', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481656748840422', '1', 'sysEmployeeJobReport', '入职离职', '', 'sysEmployeeJobReport', '1052481656350381529', 'icon_auto_blue__sysEmployeeJobReport', '0', '1', '0', '1', '/sys/sysEmployeeJobReport/', '146', '1', '', '0', '', '0', '0', '2016-12-01 18:18:25', '2017-01-18 15:39:17', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481656748840460', '1', 'sysAuditReportMenu', '审计报表', '', 'sysAuditReportMenu', '1052481655947728344', 'icon_auto_blue__sysAuditReportMenu', '1', '0', '0', '1', '', '143', '1', '', '0', '', '0', '0', '2016-12-01 18:18:25', '2017-01-18 16:04:53', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481657072850395', '1', 'sysPersonalCenterMenu', '个人中心', null, 'sysPersonalCenterMenu', '1052481646384715197', 'icon_center_16', '1', '0', '1', '0', null, '151', '1', null, '0', null, '0', '0', '2016-12-01 18:18:25', '2016-12-01 18:18:25', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481657408394716', '1', 'sysPersonalMenu', '个人中心', '', 'sysPersonalMenu', '1052481657072850395', 'icon_auto_blue__account', '1', '0', '0', '1', '', '156', '1', '', '0', '', '0', '0', '2016-12-01 18:18:26', '2017-01-18 11:41:27', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481657744987613', '1', 'sysPersonal', '我的信息', '', 'sysPersonal', '1052481657408394716', 'icon_auto_blue__sysPersonal', '0', '1', '0', '1', '', '161', '1', '', '0', '', '0', '0', '2016-12-01 18:18:26', '2017-02-28 19:02:01', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481658097309150', '1', 'sysModifyPwd', '修改密码', '', 'sysModifyPwd', '1052481657408394716', 'icon_auto_blue__sysModifyPwd', '0', '1', '0', '1', '', '166', '1', '', '0', '', '0', '0', '2016-12-01 18:18:26', '2017-02-28 19:05:49', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481658449630687', '1', 'sysPersonalSetting', '个性化设置', '', 'sysPersonalSetting', '1052481657408394716', 'icon_auto_blue__color', '0', '1', '0', '1', '', '171', '1', '', '0', '', '0', '0', '2016-12-01 18:18:27', '2017-02-28 19:08:39', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481658842846688', '1', 'sysTaskMenu', '任务中心', '', 'sysTaskMenu', '1052481657072850395', 'icon_auto_blue__discount', '1', '0', '0', '1', '', '176', '1', '', '0', '', '0', '0', '2016-12-01 18:18:27', '2017-01-18 11:42:28', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1052481659203556833', '1', 'sysMyTask', '待办任务', null, 'sysMyTask', '1052481658842846688', '', '0', '1', '0', '1', '/sys/sysTask/myTask/', '181', '0', null, '0', null, '0', '0', '2016-12-01 18:18:27', '2016-12-01 18:18:27', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1056741606000308184', '1', 'sysDemo', 'DEMO演示', '', 'sysDemo', '1052481646384715197', 'icon_auto_colorful__org_unit', '1', '0', '0', '0', '', '152', '1', '', null, '', '0', '0', '2017-01-17 18:48:29', '2017-03-08 11:02:10', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1056745429913710559', '1', 'sysDemo1', 'DEMO演示', '', 'sysDemo1', '1056741606000308184', 'icon_auto_colorful__org_unit', '1', '0', '0', '0', '', '1', '1', '', null, '', '0', '0', '2017-01-17 19:49:16', '2017-01-17 19:49:16', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1058615343450023223', '1', 'sysDruidMonitor', 'druid监控', 'sysDruidMonitor', 'sysDruidMonitor', '1052481655704243258', 'icon_auto_blue__browse', '0', '1', '0', '0', '', '150', '1', '', null, '此功能模块只有超级管理员角色才可以访问。', '0', '0', '2017-02-07 11:10:44', '2017-02-07 11:11:13', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1058634996701833057', '1', 'ueditorDemo', '富文本编辑器', 'ueditorDemo', 'ueditorDemo', '1056745429913710559', 'icon_auto_colorful__statistics', '0', '1', '0', '0', '', '11', '1', '', null, '', '0', '0', '2017-02-07 16:23:07', '2017-02-28 11:15:18', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1058635183551784802', '1', 'excelDemo', 'Excel相关', 'excelDemo', 'excelDemo', '1056745429913710559', 'icon_auto_blue__text', '0', '1', '0', '0', '', '12', '1', '', null, '', '0', '0', '2017-02-07 16:26:05', '2017-03-29 12:16:32', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1058635416398571363', '1', 'pdfDemo', 'PDF相关', 'pdfDemo', 'pdfDemo', '1056745429913710559', 'icon_auto_colorful__survey', '0', '1', '0', '0', '', '13', '1', '', null, '', '0', '0', '2017-02-07 16:29:48', '2017-03-29 12:17:00', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1059183053449771506', '1', 'fileDemo', '文件上传下载', 'fileDemo', 'fileDemo', '1056745429913710559', 'icon_auto_colorful__opened_folder', '0', '1', '0', '0', '', '15', '1', '', null, '', '0', '0', '2017-02-13 17:34:15', '2017-03-29 12:17:36', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1059277349464124526', '1', 'echartsDemo', 'ECharts报表', 'echartsDemo', 'echartsDemo', '1056745429913710559', 'icon_auto_colorful__negative_dynamic', '0', '1', '0', '0', '', '16', '1', '', null, '', '0', '0', '2017-02-14 18:33:03', '2017-03-29 12:17:58', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1059442767489324695', '1', 'mailDemo', 'UEditor邮件', 'mailDemo', 'mailDemo', '1056745429913710559', 'icon_auto_email', '0', '1', '0', '0', '', '16', '1', '', null, '', '0', '0', '2017-02-16 14:22:18', '2017-03-29 12:18:21', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1059970869698056785', '1', 'singleCommitDemo', '防重复提交', 'singleCommitDemo', 'singleCommitDemo', '1056745429913710559', 'icon_auto_colorful__do_not_mix', '0', '1', '0', '0', '', '17', '1', '', null, '', '0', '0', '2017-02-22 10:16:15', '2017-03-29 12:18:48', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060425468402830583', '1', 'sysAuthMenu:menuset_view', '功能权限查询', '', '', '1052481648470332868', '', '0', '0', '0', '0', '', '5', '1', '', null, '', '0', '0', '2017-02-27 10:41:54', '2017-02-27 10:41:54', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060425852316912889', '1', 'sysAuthMenu:detail', '查看详情', '', '', '1052481648470332868', '', '0', '0', '0', '0', '', '3', '1', '', null, '', '0', '0', '2017-02-27 10:48:00', '2017-03-29 16:56:20', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060427695770143999', '1', 'sysAuthMenu:authManageWin', '功能权限选择框', '', '', '1052481646805194175', '', '0', '0', '0', '0', '', '6', '1', '', null, '', '0', '0', '2017-02-27 11:17:18', '2017-02-27 11:17:18', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060513673827224029', '1', 'sysRoleAuth', '角色权限', 'sysRoleAuth', 'sysRoleAuth', '1052481648127448515', '', '0', '0', '0', '0', '', '1', '1', '', null, '', '0', '0', '2017-02-28 10:03:53', '2017-02-28 10:03:53', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060516871598148066', '1', 'sysRoleUser', '角色用户', 'sysRoleUser', 'sysRoleUser', '1052481648127448515', '', '0', '0', '0', '0', '', '2', '1', '', null, '', '0', '0', '2017-02-28 10:54:43', '2017-02-28 10:54:43', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060521204894431579', '1', 'dauthOperator', '运算符', '', '', '1052481647455311298', '', '1', '1', '0', '0', '', '102', '1', '', null, '', '0', '0', '2017-02-28 12:03:36', '2017-02-28 12:03:36', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060530341559306746', '1', 'sysUserWin', '用户选择框', 'sysUserWin', 'sysUserWin', '1052481647455311297', '', '0', '0', '0', '0', '', '200', '1', '', null, '', '0', '0', '2017-02-28 14:28:49', '2017-02-28 14:44:30', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060531000917527039', '1', 'sysRoleWin', '角色选择框', 'sysRoleWin', 'sysRoleWin', '1052481648127448515', '', '0', '0', '0', '0', '', '3', '1', '', null, '', '0', '0', '2017-02-28 14:39:18', '2017-02-28 14:39:18', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060531546931984011', '1', 'dauthFilterType', '过滤类型', '', '', '1052481647455311298', '', '1', '1', '0', '0', '', '101', '1', '', null, '', '0', '0', '2017-02-28 14:47:59', '2017-02-28 14:47:59', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060535699748026070', '1', 'sysMetadataField', '元数据字段', '', '', '1052481647455311299', '', '1', '1', '0', '0', '', '1', '1', '', null, '', '0', '0', '2017-02-28 15:53:59', '2017-02-28 15:53:59', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060536269074462439', '1', 'dauthFilterItem', '过滤器项', '', '', '1052481647455311299', '', '1', '1', '0', '0', '', '1', '1', '', null, '', '0', '0', '2017-02-28 16:03:02', '2017-02-28 16:03:02', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060536473503790825', '1', 'dauthVariable', '数据权限变量', '', '', '1060536269074462439', '', '1', '1', '0', '0', '', '1', '1', '', null, '', '0', '0', '2017-02-28 16:06:17', '2017-02-28 16:06:17', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060537266043746054', '1', 'dauthFilterGroup', '过滤器组', '', '', '1052481647455311300', '', '1', '1', '0', '0', '', '2', '1', '', null, '', '0', '0', '2017-02-28 16:18:53', '2017-02-28 16:18:53', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060537285849249544', '1', 'dauthFilterJoin', '过滤器项配置', '', '', '1060537266043746054', '', '1', '1', '0', '0', '', '3', '1', '', null, '', '0', '0', '2017-02-28 16:19:12', '2017-03-30 19:05:18', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060539373376370476', '1', 'dauthFilterItemSelect', '过滤器项选择', '', '', '1060536269074462439', '', '1', '1', '0', '0', '', '2', '1', '', null, '', '0', '0', '2017-02-28 16:52:22', '2017-02-28 16:55:42', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060541736768251024', '1', 'sysUserTabLog', '用户日志', 'sysUserTabLog', 'sysUserTabLog', '1052481647455311297', '', '0', '0', '0', '0', '', '101', '1', '', null, '', '0', '0', '2017-02-28 17:29:56', '2017-02-28 17:29:56', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060541793477338258', '1', 'sysUserTabPos', '用户岗位', 'sysUserTabPos', 'sysUserTabPos', '1052481647455311297', '', '0', '0', '0', '0', '', '102', '1', '', null, '', '0', '0', '2017-02-28 17:30:50', '2017-02-28 17:30:50', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060541832272553108', '1', 'sysUserTabGroup', '用户小组', 'sysUserTabGroup', 'sysUserTabGroup', '1052481647455311297', '', '0', '0', '0', '0', '', '103', '1', '', null, '', '0', '0', '2017-02-28 17:31:27', '2017-02-28 17:31:27', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060541916079989910', '1', 'sysUserTabRole', '用户角色', 'sysUserTabRole', 'sysUserTabRole', '1052481647455311297', '', '0', '0', '0', '0', '', '105', '1', '', null, '', '0', '0', '2017-02-28 17:32:47', '2017-02-28 17:33:15', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060542039792034969', '1', 'sysUserTabAuth', '用户权限', 'sysUserTabAuth', 'sysUserTabAuth', '1052481647455311297', '', '0', '0', '0', '0', '', '106', '1', '', null, '', '0', '0', '2017-02-28 17:34:45', '2017-02-28 18:27:56', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060543577796052637', '1', 'sysFileWebupload', 'web上传', '', '', '1052481654739768789', '', '0', '0', '0', '0', '', '4', '1', '', null, '', '0', '0', '2017-02-28 17:59:12', '2017-03-29 11:40:47', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060545472174714840', '1', 'sysOrgUser', '组织人员', '', '', '1052481649938339272', '', '1', '1', '0', '0', '', '81', '1', '', null, '', '0', '0', '2017-02-28 18:29:19', '2017-02-28 18:29:48', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060545543841738715', '1', 'sysPosUser', '岗位人员', '', '', '1052481649938339272', '', '1', '1', '0', '0', '', '91', '1', '', null, '', '0', '0', '2017-02-28 18:30:27', '2017-02-28 18:30:27', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060545574796750813', '1', 'sysGroupUser', '小组人员', '', '', '1052481649938339272', '', '1', '1', '0', '0', '', '101', '1', '', null, '', '0', '0', '2017-02-28 18:30:57', '2017-02-28 18:30:57', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1060545925224342740', '1', 'sysUserPwd', '更新密码', 'sysUserPwd', 'sysUserPwd', '1052481647455311297', '', '0', '0', '0', '0', '', '100', '1', '', null, '', '0', '0', '2017-02-28 18:36:31', '2017-02-28 18:36:31', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1061265384278891362', '1', 'websocketDemo', '消息推送', '', '', '1056745429913710559', 'icon_auto_colorful__end_call', '0', '1', '0', '0', '', '18', '1', '', null, '', '0', '0', '2017-03-08 17:12:00', '2017-03-29 12:19:09', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1063084084742170457', '1', 'sysAuth:mainAttachAuth', '主附权限管理', '', '', '1052481648470332868', '', '1', '1', '0', '0', '', '6', '1', '', null, '', '0', '0', '2017-03-28 18:59:28', '2017-03-28 18:59:44', '1', '1', null);
INSERT INTO `sys_model` VALUES ('1063088840446206970', '1', 'common', '公共模块', '', '', '1052481646384715197', '', '0', '0', '0', '0', '', '1', '1', '', null, '公共模块，不显示菜单，只分配权限用', '0', '0', '2017-03-28 20:15:04', '2017-03-30 17:33:55', '1', '1', null);

-- ----------------------------
-- Table structure for sys_operation
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation`;
CREATE TABLE `sys_operation` (
  `OPERATION_ID_` bigint(20) NOT NULL COMMENT '操作编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `OPERATION_CODE_` varchar(64) DEFAULT NULL COMMENT '编码',
  `OPERATION_NAME_` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '部门英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `STYLE_` varchar(256) NOT NULL COMMENT 'CSS',
  `URI_` varchar(64) NOT NULL COMMENT '默认uri',
  `SORT_NO_` int(11) NOT NULL COMMENT '排序',
  `IS_VISIBLE_` tinyint(4) DEFAULT '1' COMMENT '是否可见',
  `TIP_` varchar(256) DEFAULT NULL COMMENT '提示信息',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  `ICON_ID_` bigint(20) DEFAULT NULL COMMENT 'ICON编号',
  PRIMARY KEY (`OPERATION_ID_`),
  UNIQUE KEY `AK_Key_2` (`OPERATION_CODE_`) USING BTREE,
  KEY `FK_Reference_33` (`ICON_ID_`) USING BTREE,
  CONSTRAINT `sys_operation_ibfk_1` FOREIGN KEY (`ICON_ID_`) REFERENCES `sys_icon` (`ICON_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作类型表';

-- ----------------------------
-- Records of sys_operation
-- ----------------------------
INSERT INTO `sys_operation` VALUES ('1052481659203556933', '1', 'view', '访问', 'view', 'view', '', 'view', '1', '1', null, null, '0', '1', '2016-12-01 19:47:02', '2016-12-01 19:47:11', '1', '1', null);
INSERT INTO `sys_operation` VALUES ('1052481659203557933', '1', 'create', '创建', 'create', 'create', '', 'create', '2', '1', null, null, '0', '1', '2016-12-01 19:48:41', '2016-12-01 19:48:42', '1', '1', null);
INSERT INTO `sys_operation` VALUES ('1052481659203557963', '1', 'update', '更新', 'update', 'update', '', 'update', '3', '1', null, null, '0', '1', '2016-12-01 19:50:06', '2016-12-01 19:50:10', '1', '1', null);
INSERT INTO `sys_operation` VALUES ('1052481659203558275', '1', 'delete', '删除', 'delete', 'delete', '', 'delete', '4', '1', null, null, '0', '1', '2016-12-01 19:50:08', '2016-12-01 19:50:12', '1', '1', null);
INSERT INTO `sys_operation` VALUES ('1060262570224060575', '1', 'query', '数据查询', 'query', 'query', '', 'query', '5', '1', '', '', '0', '0', '2017-02-25 15:32:42', '2017-02-25 15:50:40', '1', '2', null);
INSERT INTO `sys_operation` VALUES ('1060512414373153244', '1', 'subView', '子视图访问', 'subView', 'subView', '', 'subView', '2', '1', '', '子视图访问', '0', '0', '2017-02-28 09:43:52', '2017-02-28 16:31:08', '1', '1', null);
INSERT INTO `sys_operation` VALUES ('1060513996837915103', '1', 'manage', '管理', 'manage', 'manage', '', 'manage', '6', '1', '', '', '0', '0', '2017-02-28 10:09:01', '2017-02-28 10:09:01', '1', '1', null);

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `ORG_ID_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ORG_NAME_` varchar(256) DEFAULT NULL COMMENT '部门名称',
  `ORG_FULLNAME_` varchar(256) DEFAULT NULL COMMENT '部门全名',
  `ORG_CODE_` varchar(128) DEFAULT NULL COMMENT '部门编码(默认为编号)',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '部门英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `FID_` bigint(20) DEFAULT NULL COMMENT '父部门',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`ORG_ID_`),
  UNIQUE KEY `AK_Key_2` (`ORG_CODE_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1271254862 DEFAULT CHARSET=utf8 COMMENT='组织架构表';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '1', '鸿冠信息', '上海鸿冠信息科技股份有限公司', 'hg', 'Hongguan Info', 'sysOrg:hg', null, null, '0', '0', '2016-12-22 19:43:06', '0000-00-00 00:00:00', '1', '1');

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position` (
  `POSITION_ID_` bigint(20) NOT NULL COMMENT '权限编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ORG_ID_` bigint(20) DEFAULT NULL COMMENT '组织编号',
  `JOB_ID_` bigint(20) NOT NULL COMMENT '职务编号',
  `POSITION_CODE_` varchar(64) NOT NULL COMMENT '编码',
  `POSITION_NAME_` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名称',
  `I18N_CODE_` varchar(256) DEFAULT NULL COMMENT '国际化编码',
  `FID_` bigint(20) DEFAULT NULL COMMENT '父职务编号',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`POSITION_ID_`),
  UNIQUE KEY `AK_POSITION_CODE_` (`POSITION_CODE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of sys_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `ROLE_NAME_` varchar(256) NOT NULL COMMENT '角色名称',
  `ROLE_CODE_` varchar(128) NOT NULL COMMENT '角色编码(默认值为编号)',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`ROLE_ID_`),
  UNIQUE KEY `AK_Key_2` (`ROLE_CODE_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1062533500424820934 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1054552046249782277', '1', '超级管理员', 'superAdmin', '超级管理员', '0', '1', '2016-12-24 14:46:22', '2016-12-24 15:26:54', '1', '1');
INSERT INTO `sys_role` VALUES ('1059883554957176097', '1', '普通用户', 'staff', '普通用户', '0', '1', '2017-02-21 11:08:25', '2017-03-30 19:51:23', '1', '1');

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `ROLE_AUTH_ID_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ROLE_ID_` bigint(20) NOT NULL COMMENT '角色编号',
  `AUTH_ID_` bigint(20) NOT NULL COMMENT '权限编号',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  PRIMARY KEY (`ROLE_AUTH_ID_`),
  UNIQUE KEY `AK_Key_2` (`ROLE_ID_`,`AUTH_ID_`) USING BTREE,
  KEY `FK_Reference_2` (`AUTH_ID_`) USING BTREE,
  CONSTRAINT `sys_role_auth_ibfk_1` FOREIGN KEY (`AUTH_ID_`) REFERENCES `sys_auth` (`AUTH_ID_`),
  CONSTRAINT `sys_role_auth_ibfk_2` FOREIGN KEY (`ROLE_ID_`) REFERENCES `sys_role` (`ROLE_ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=1063268561633734471 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('1063268413976407694', '1054552046249782277', '1063088912725599228', '0', '2017-03-30 19:49:18', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414046662287', '1054552046249782277', '1053269288255097393', '0', '2017-03-30 19:49:18', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414114819728', '1054552046249782277', '1053269288340032050', '0', '2017-03-30 19:49:18', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414186122897', '1054552046249782277', '1053269288410286643', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414254280338', '1054552046249782277', '1053269288579107380', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414323486355', '1054552046249782277', '1053269288618953269', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414391643796', '1054552046249782277', '1053269288660896310', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414462946965', '1054552046249782277', '1060543902148994228', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414534250134', '1054552046249782277', '1060514158411942368', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414604504727', '1054552046249782277', '1060517625944771045', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414674759320', '1054552046249782277', '1060518192551201254', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414765985433', '1054552046249782277', '1053269288709130807', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414837288602', '1054552046249782277', '1053269288764705336', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414908591771', '1054552046249782277', '1053269288804551225', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268414977797788', '1054552046249782277', '1053269288870611514', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415047003805', '1054552046249782277', '1053269288910457403', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415116209822', '1054552046249782277', '1060428226958822660', '0', '2017-03-30 19:49:19', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415184367263', '1054552046249782277', '1060428592153726216', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415252524704', '1054552046249782277', '1063147339691241342', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415322779297', '1054552046249782277', '1063086183253125000', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415391985314', '1054552046249782277', '1063086218756859786', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415460142755', '1054552046249782277', '1053269289002732093', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415529348772', '1054552046249782277', '1053269289043626558', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415597506213', '1054552046249782277', '1053269289082423871', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415664615078', '1054552046249782277', '1053269289128561216', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415733821095', '1054552046249782277', '1053269289174698561', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415804075688', '1054552046249782277', '1053269289259633218', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415873281705', '1054552046249782277', '1053269289370782275', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268415942487722', '1054552046249782277', '1053269289539603013', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416011693739', '1054552046249782277', '1053269289616149062', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416079851180', '1054552046249782277', '1053269289722055239', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416150105773', '1054552046249782277', '1053269289776581192', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416219311790', '1054552046249782277', '1060546419125874659', '0', '2017-03-30 19:49:20', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416287469231', '1054552046249782277', '1060546527206797285', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416356675248', '1054552046249782277', '1060547171395268596', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416430075569', '1054552046249782277', '1060545898669371360', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416498233010', '1054552046249782277', '1060547474314194937', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416568487603', '1054552046249782277', '1053269289921284683', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416638742196', '1054552046249782277', '1053269289975810636', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416707948213', '1054552046249782277', '1053269290030336589', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416777154230', '1054552046249782277', '1053269290079619662', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416845311671', '1054552046249782277', '1060548445786303501', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416913469112', '1054552046249782277', '1060550232467744052', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268416982675129', '1054552046249782277', '1053269290258926161', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417061318330', '1054552046249782277', '1053269290312403538', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417130524347', '1054552046249782277', '1053269290406775380', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417199730364', '1054552046249782277', '1060550604366193982', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417267887805', '1054552046249782277', '1060550649891169780', '0', '2017-03-30 19:49:21', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417336045246', '1054552046249782277', '1060550715204871670', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417403154111', '1054552046249782277', '1060551024781207036', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417472360128', '1054552046249782277', '1060551066653992446', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417541566145', '1054552046249782277', '1060551124526999040', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417610772162', '1054552046249782277', '1053269288340032051', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417679978179', '1054552046249782277', '1060531869244323473', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417749184196', '1054552046249782277', '1060532034701227671', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417817341637', '1054552046249782277', '1060532071473739417', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417888644806', '1054552046249782277', '1060532126926632603', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268417957850823', '1054552046249782277', '1060521729551530342', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418027056840', '1054552046249782277', '1060522022291929453', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418095214281', '1054552046249782277', '1060522062648473967', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418194829002', '1054552046249782277', '1060522106275527025', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418264035019', '1054552046249782277', '1053269288410286644', '0', '2017-03-30 19:49:22', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418332192460', '1054552046249782277', '1060518473066075753', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418400349901', '1054552046249782277', '1060521496474057057', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418470604494', '1054552046249782277', '1060521622693247331', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418540859087', '1054552046249782277', '1060535744735082200', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418610065104', '1054552046249782277', '1060536045116454623', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418679271121', '1054552046249782277', '1060536117623387875', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418747428562', '1054552046249782277', '1060536158243124965', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418820828883', '1054552046249782277', '1060536599394776813', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418900520660', '1054552046249782277', '1060536814721955574', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268418981261013', '1054552046249782277', '1060536853305358072', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419065147094', '1054552046249782277', '1060536892744398586', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419138547415', '1054552046249782277', '1060539272757114664', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419220336344', '1054552046249782277', '1060539641341015862', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419303173849', '1054552046249782277', '1060539726008284984', '0', '2017-03-30 19:49:23', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419387059930', '1054552046249782277', '1060539768441009978', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419456265947', '1054552046249782277', '1053269288410286645', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419524423388', '1054552046249782277', '1060535560930195150', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419592580829', '1054552046249782277', '1060535607169251025', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419662835422', '1054552046249782277', '1060535663224026836', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419732041439', '1054552046249782277', '1060540379121186632', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419800198880', '1054552046249782277', '1060540733235787601', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419873599201', '1054552046249782277', '1060540774933460819', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268419942805218', '1054552046249782277', '1060540836824610645', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420012011235', '1054552046249782277', '1060539828406974268', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420082265828', '1054552046249782277', '1060540230126925634', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420150423269', '1054552046249782277', '1060540281988446020', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420221726438', '1054552046249782277', '1060540320044414790', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420290932455', '1054552046249782277', '1053269288410286646', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420360138472', '1054552046249782277', '1060537905622677270', '0', '2017-03-30 19:49:24', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420429344489', '1054552046249782277', '1060537972850030362', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420497501930', '1054552046249782277', '1060538012249224988', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420566707947', '1054552046249782277', '1060538059636471582', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420633816812', '1054552046249782277', '1053269288410286667', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420703022829', '1054552046249782277', '1060537116852352768', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420773277422', '1054552046249782277', '1060537149546952450', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268420842483439', '1054552046249782277', '1060537199051273988', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421178027760', '1054552046249782277', '1053269290698279514', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421259816689', '1054552046249782277', '1053269290745465435', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421338459890', '1054552046249782277', '1053269290790554204', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421416054515', '1054552046249782277', '1053269290838788701', '0', '2017-03-30 19:49:25', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421486309108', '1054552046249782277', '1053269290882828894', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421555515125', '1054552046249782277', '1053269290933160543', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421624721142', '1054552046249782277', '1060457638798545745', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421693927159', '1054552046249782277', '1053269290986637920', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421762084600', '1054552046249782277', '1053269291229907554', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421831290617', '1054552046249782277', '1053269291350493795', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421899448058', '1054552046249782277', '1053269291475274340', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268421968654075', '1054552046249782277', '1053269291604249190', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422036811516', '1054552046249782277', '1053269291641997927', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422104968957', '1054552046249782277', '1053269291687086696', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422173126398', '1054552046249782277', '1053269291791944297', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422242332415', '1054552046249782277', '1053269291956570730', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422310489856', '1054552046249782277', '1053269292139022958', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422380744449', '1054552046249782277', '1053269292326718066', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422448901890', '1054552046249782277', '1053269292373903987', '0', '2017-03-30 19:49:26', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422517059331', '1054552046249782277', '1060543772628813471', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422586265348', '1054552046249782277', '1060543924875757217', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422655471365', '1054552046249782277', '1060544004342089379', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422742503174', '1054552046249782277', '1060544158464935591', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422810660615', '1054552046249782277', '1060544086428812965', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422878818056', '1054552046249782277', '1053269292864637564', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268422949072649', '1054552046249782277', '1060512630049426250', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423017230090', '1054552046249782277', '1060512989158394705', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423086436107', '1054552046249782277', '1053269292932795005', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423154593548', '1054552046249782277', '1053269292977883774', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423224848141', '1054552046249782277', '1053269293014583935', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423294054158', '1054552046249782277', '1053269293059672704', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423362211599', '1054552046249782277', '1053269293111052929', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423430369040', '1054552046249782277', '1053269293281970821', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423499575057', '1054552046249782277', '1053269293456034441', '0', '2017-03-30 19:49:27', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423567732498', '1054552046249782277', '1058615553282663736', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423637987091', '1054552046249782277', '1053269293698255501', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423705095956', '1054552046249782277', '1053269293742295694', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423772204821', '1054552046249782277', '1053269293872319120', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423853993750', '1054552046249782277', '1053269294071548564', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423923199767', '1054552046249782277', '1053269293802064527', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268423991357208', '1054552046249782277', '1053269294289652376', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424060563225', '1054552046249782277', '1053269294338935449', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424132914970', '1054552046249782277', '1053269294376684186', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424202120987', '1054552046249782277', '1053269294561233566', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424271327004', '1054552046249782277', '1053269294762560162', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424340533021', '1054552046249782277', '1053269295056161446', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424407641886', '1054552046249782277', '1053269295116978855', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424475799327', '1054552046249782277', '1053269295156824744', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424546053920', '1054552046249782277', '1053269295214496425', '0', '2017-03-30 19:49:28', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424614211361', '1054552046249782277', '1053269295260633770', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424682368802', '1054552046249782277', '1056744893101518814', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424793517859', '1054552046249782277', '1056745852093476833', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424862723876', '1054552046249782277', '1058635541087889252', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268424931929893', '1054552046249782277', '1058635600936413029', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268425012670246', '1054552046249782277', '1058635657762940774', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268425079779111', '1054552046249782277', '1059183295447480819', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268425147936552', '1054552046249782277', '1059277407171456111', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268425216093993', '1054552046249782277', '1059442833175271064', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268425286348586', '1054552046249782277', '1059970917085303378', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268425356603179', '1054552046249782277', '1061265498981571428', '0', '2017-03-30 19:49:29', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560136367922', '1059883554957176097', '1053269294289652376', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560204525363', '1059883554957176097', '1053269294338935449', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560272682804', '1059883554957176097', '1053269294376684186', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560340840245', '1059883554957176097', '1053269294561233566', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560412143414', '1059883554957176097', '1053269294762560162', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560489738039', '1059883554957176097', '1053269295056161446', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560557895480', '1059883554957176097', '1053269295116978855', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560637587257', '1059883554957176097', '1053269295156824744', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560795922234', '1059883554957176097', '1053269295214496425', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560867225403', '1059883554957176097', '1053269295260633770', '0', '2017-03-30 19:51:38', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268560940625724', '1059883554957176097', '1056744893101518814', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561008783165', '1059883554957176097', '1056745852093476833', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561076940606', '1059883554957176097', '1058635541087889252', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561148243775', '1059883554957176097', '1058635600936413029', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561216401216', '1059883554957176097', '1058635657762940774', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561287704385', '1059883554957176097', '1059183295447480819', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561357958978', '1059883554957176097', '1059277407171456111', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561426116419', '1059883554957176097', '1059442833175271064', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561496371012', '1059883554957176097', '1059970917085303378', '0', '2017-03-30 19:51:39', '1');
INSERT INTO `sys_role_auth` VALUES ('1063268561565577029', '1059883554957176097', '1061265498981571428', '0', '2017-03-30 19:51:39', '1');

-- ----------------------------
-- Table structure for sys_staff_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_staff_info`;
CREATE TABLE `sys_staff_info` (
  `STAFF_ID_` bigint(20) NOT NULL COMMENT '员工编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `STAFF_CODE_` varchar(64) NOT NULL COMMENT '员工号',
  `STAFF_STATUS_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '员工状态(0离职，1在职)',
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户编号',
  `ENTRY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `QUIT_TIME_` timestamp NULL DEFAULT NULL COMMENT '离职时间',
  `ID_CARD_` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `BANK_CARD_` varchar(20) DEFAULT NULL COMMENT '银行账号',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`STAFF_ID_`),
  KEY `AK_Key_2` (`STAFF_CODE_`) USING BTREE,
  KEY `FK_Reference_27` (`USER_ID_`) USING BTREE,
  CONSTRAINT `sys_staff_info_ibfk_1` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息表';

-- ----------------------------
-- Records of sys_staff_info
-- ----------------------------
INSERT INTO `sys_staff_info` VALUES ('1', '1', '001', '1', '1', '2017-01-30 20:10:39', null, '', '', '', '0', '0', '0000-00-00 00:00:00', '2017-03-30 20:10:37', '1', '1');
INSERT INTO `sys_staff_info` VALUES ('2', '1', '002', '1', '2', '2017-01-30 20:14:40', null, '', '', '', '0', '0', '0000-00-00 00:00:00', '2017-03-30 20:14:38', '1', '1');

-- ----------------------------
-- Table structure for sys_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_token`;
CREATE TABLE `sys_token` (
  `TOKEN_ID_` bigint(20) NOT NULL COMMENT '令牌ID',
  `ACCOUNT_ID_` bigint(20) NOT NULL COMMENT '账户ID',
  `TENANT_ID_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `TOKEN_SIGN_` varchar(200) NOT NULL COMMENT '令牌签名',
  `TOKEN_TYPE_` int(11) NOT NULL DEFAULT '0' COMMENT '令牌类型',
  `EXTENSION_` text COMMENT '扩展数据 JSON对象',
  `DUE_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  `LOGIN_COUNT_` int(11) DEFAULT NULL COMMENT '登录次数',
  `IS_DELETE_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`TOKEN_ID_`),
  UNIQUE KEY `AK_Key_2` (`TOKEN_SIGN_`) USING BTREE,
  KEY `AK_Key_3` (`ACCOUNT_ID_`) USING BTREE,
  CONSTRAINT `sys_token_ibfk_1` FOREIGN KEY (`ACCOUNT_ID_`) REFERENCES `sys_account` (`ACCOUNT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统密钥表';

-- ----------------------------
-- Records of sys_token
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户ID',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `USER_NAME_` varchar(256) NOT NULL COMMENT '用户名',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文名',
  `GENDER_` tinyint(4) DEFAULT '0' COMMENT '性别(1:男;0:女)',
  `BIRTHDAY_` varchar(32) DEFAULT NULL COMMENT '生日',
  `MOBILE_` varchar(50) DEFAULT NULL COMMENT '手机',
  `EMAIL_` varchar(256) DEFAULT NULL COMMENT '邮箱',
  `ADDRESS_` varchar(256) DEFAULT NULL COMMENT '地址',
  `TELEPHONE_` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `IS_VISIBLE_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  `HEAD_PHOTO_` bigint(20) DEFAULT NULL COMMENT '头像：对应系统文件ID',
  PRIMARY KEY (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '超级管理员', 'super', '1', '', '', '', '', '', '', '0', '1', '1', '2016-11-29 19:20:41', '2017-03-30 20:10:37', '1', '1', null);
INSERT INTO `sys_user` VALUES ('2', '1', '测试账户', 'test', '0', '', '', '', '', '', '', '0', '0', '1', '2017-01-23 10:41:04', '2017-03-30 20:14:38', '1', '1', null);

-- ----------------------------
-- Table structure for sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `USER_AUTH_ID_` bigint(20) NOT NULL COMMENT '主键ID',
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户ID',
  `AUTH_ID_` bigint(20) NOT NULL COMMENT '权限编号',
  `AUTH_TYPE_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '授权类型（1:正授权;-1:负授权）',
  `IS_FINAL_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  PRIMARY KEY (`USER_AUTH_ID_`),
  UNIQUE KEY `AK_Key_2` (`USER_ID_`,`AUTH_ID_`,`AUTH_TYPE_`) USING BTREE,
  KEY `FK_Reference_3` (`AUTH_ID_`) USING BTREE,
  CONSTRAINT `sys_user_auth_ibfk_1` FOREIGN KEY (`AUTH_ID_`) REFERENCES `sys_auth` (`AUTH_ID_`),
  CONSTRAINT `sys_user_auth_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

-- ----------------------------
-- Records of sys_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_log`;
CREATE TABLE `sys_user_log` (
  `USER_LOG_ID_` bigint(20) NOT NULL COMMENT '日志ID',
  `USER_ID_` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `OPER_CODE_` varchar(128) DEFAULT NULL COMMENT '操作编码（如：USER_ADD）',
  `OPER_NAME_` varchar(256) DEFAULT NULL COMMENT '中文操作名称（如：新增用户）',
  `ENG_NAME_` varchar(256) DEFAULT NULL COMMENT '英文操作名称（如：addUser）',
  `REQ_URI_` varchar(256) DEFAULT NULL COMMENT '请求URI',
  `OPER_IP_` varchar(64) DEFAULT NULL COMMENT '调用方IP',
  `KEY1_` varchar(64) DEFAULT NULL COMMENT '关键词',
  `KEY2_` varchar(64) DEFAULT NULL COMMENT '关键词',
  `KEY3_` varchar(64) DEFAULT NULL COMMENT '关键词',
  `CONTENT_` text NOT NULL COMMENT '日志内容',
  `OPER_RES_` varchar(1) DEFAULT NULL COMMENT '操作结果(1：成功  0：失败)',
  `IS_FINAL_` tinyint(4) DEFAULT '1' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CRT_USER_ID_` bigint(20) NOT NULL DEFAULT '1' COMMENT '数据创建用户编号',
  PRIMARY KEY (`USER_LOG_ID_`),
  KEY `FK_Reference_26` (`USER_ID_`) USING BTREE,
  CONSTRAINT `sys_user_log_ibfk_1` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- ----------------------------
-- Records of sys_user_log
-- ----------------------------
INSERT INTO `sys_user_log` VALUES ('1063270288835538828', '2', 'onLoginSuccess', '用户登录成功', 'onLoginSuccess', '/hbm/login', '0:0:0:0:0:0:0:1', null, null, null, '', '1', '1', '2017-03-30 20:19:06', '-1');
INSERT INTO `sys_user_log` VALUES ('1063270313435131791', '1', 'onLoginSuccess', '用户登录成功', 'onLoginSuccess', '/hbm/login', '0:0:0:0:0:0:0:1', null, null, null, '', '1', '1', '2017-03-30 20:19:30', '-1');
INSERT INTO `sys_user_log` VALUES ('1063270421894590354', '1', 'updateUser', '更新用户', 'updateUser', '/hbm/sys/sysUser/updUser', '0:0:0:0:0:0:0:1', '', '', '', '{\"address\":\"\",\"authIds\":[],\"birthday\":\"\",\"descr\":\"\",\"email\":\"\",\"engName\":\"super\",\"gender\":1,\"groupIds\":[],\"id\":\"1\",\"isDelete\":0,\"mobile\":\"\",\"nAuthIds\":[],\"positionIds\":[],\"roleIds\":[\"1054552046249782277\"],\"staffInfo\":{\"bankCard\":\"\",\"descr\":\"\",\"entryTimeStr\":\"2017-03-30\",\"idCard\":\"\",\"quitTimeStr\":\"2017-02-17\",\"staffCode\":\"001\",\"staffStatus\":1,\"tableMeta\":{\"alias\":\"ssi\"}},\"tableMeta\":{\"alias\":\"su\"},\"telephone\":\"\",\"updTime\":1490876473608,\"updUserId\":\"1\",\"userAccount\":{\"descr\":\"\",\"loginName\":\"super\",\"loginPwd\":\"111111\",\"tableMeta\":{\"alias\":\"sa\"}},\"userId\":\"1\",\"userName\":\"超级管理员\"}', '0', '1', '2017-03-30 20:21:13', '1');

-- ----------------------------
-- Table structure for sys_user_password_found
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_password_found`;
CREATE TABLE `sys_user_password_found` (
  `FOUND_ID_` bigint(20) NOT NULL COMMENT '主键',
  `LOGIN_NAME_` varchar(128) DEFAULT NULL COMMENT '登录名',
  `PHONE_` varchar(15) DEFAULT NULL COMMENT '手机号',
  `EMAIL_` varchar(256) DEFAULT NULL COMMENT 'email',
  `VERIFICATION_CODE_` char(8) DEFAULT NULL COMMENT '验证码',
  `IP_` char(15) DEFAULT NULL COMMENT 'ip',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`FOUND_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='密码找回表';

-- ----------------------------
-- Records of sys_user_password_found
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_position`;
CREATE TABLE `sys_user_position` (
  `USER_POSITION_ID_` bigint(20) NOT NULL COMMENT '主键ID',
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户ID',
  `POSITION_ID_` bigint(20) NOT NULL COMMENT '角色ID',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `IS_MAJOR_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否主岗0否，1是，每个userId，应该只有一个主岗',
  PRIMARY KEY (`USER_POSITION_ID_`),
  UNIQUE KEY `AK_Key_2` (`USER_ID_`,`POSITION_ID_`) USING BTREE,
  KEY `FK_Reference_10` (`POSITION_ID_`) USING BTREE,
  CONSTRAINT `sys_user_position_ibfk_1` FOREIGN KEY (`POSITION_ID_`) REFERENCES `sys_position` (`POSITION_ID_`),
  CONSTRAINT `sys_user_position_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户岗位表';

-- ----------------------------
-- Records of sys_user_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_profile`;
CREATE TABLE `sys_user_profile` (
  `USER_PROFILE_ID_` bigint(20) NOT NULL COMMENT '配置编号',
  `TENANT_ID_` int(11) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `USER_ID_` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `PROFILE_KEY_` varchar(32) DEFAULT NULL COMMENT '设置KEY',
  `PROFILE_VALUE_` varchar(256) DEFAULT NULL COMMENT '设置值',
  `DEFAULT_VALUE_` varchar(256) DEFAULT NULL COMMENT '默认值--废弃',
  `SORT_NO_` int(11) DEFAULT NULL COMMENT '排序号',
  `PROFILE_TYPE_` varchar(32) DEFAULT NULL COMMENT '设置类型',
  `VERSION_` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  `IS_CURRENT_` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为当前版本（默认数据为 0）',
  `DESCR_` text COMMENT '设置描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) NOT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  PRIMARY KEY (`USER_PROFILE_ID_`),
  UNIQUE KEY `AK_Key_2` (`USER_ID_`,`PROFILE_KEY_`,`VERSION_`) USING BTREE,
  CONSTRAINT `sys_user_profile_ibfk_1` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户设置表';

-- ----------------------------
-- Records of sys_user_profile
-- ----------------------------
INSERT INTO `sys_user_profile` VALUES ('1063270295823249293', '1', '2', 'defaultPageSize', '20', null, '1', '数据表格展示数据数量', '1', '1', '数据表格展示数据数量，默认数据为10', '0', '2017-03-30 20:19:13', '2017-03-30 20:19:13', '2', '2', '0');
INSERT INTO `sys_user_profile` VALUES ('1063270295944884110', '1', '2', 'themeColor', 'metro', null, '1', '系统主题配色', '1', '1', '系统主题配色，默认为metro', '0', '2017-03-30 20:19:13', '2017-03-30 20:19:13', '2', '2', '0');
INSERT INTO `sys_user_profile` VALUES ('1063270395470475152', '1', '1', 'defaultPageSize', '20', null, '1', '数据表格展示数据数量', '1', '1', '数据表格展示数据数量，默认数据为10', '0', '2017-03-30 20:20:48', '2017-03-30 20:20:48', '1', '1', '0');
INSERT INTO `sys_user_profile` VALUES ('1063270395592109969', '1', '1', 'themeColor', 'metro', null, '1', '系统主题配色', '1', '1', '系统主题配色，默认为metro', '0', '2017-03-30 20:20:48', '2017-03-30 20:20:48', '1', '1', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ROLE_ID_` bigint(20) NOT NULL COMMENT '关联表主键',
  `USER_ID_` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID_` bigint(20) NOT NULL COMMENT '角色ID',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  PRIMARY KEY (`USER_ROLE_ID_`),
  UNIQUE KEY `AK_Key_2` (`USER_ID_`,`ROLE_ID_`) USING BTREE,
  KEY `FK_Reference_1` (`ROLE_ID_`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`ROLE_ID_`) REFERENCES `sys_role` (`ROLE_ID_`),
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `sys_user` (`USER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1063269755341041534', '1', '1054552046249782277', '0', '2017-03-30 20:10:38', '1');
INSERT INTO `sys_user_role` VALUES ('1063270008095043463', '2', '1059883554957176097', '0', '2017-03-30 20:14:39', '1');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEPT_NAME_` varchar(200) DEFAULT NULL,
  `DEPT_CODE_` varchar(200) DEFAULT NULL,
  `REMARK_` varchar(200) DEFAULT NULL,
  `IS_DELETE_` int(1) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` int(10) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` int(10) DEFAULT NULL COMMENT '数据修改用户编号',
  `IS_FINAL_` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `ID_` int(20) NOT NULL AUTO_INCREMENT,
  `CLIENTNAME_` varchar(200) DEFAULT NULL,
  `AMOUNT_` decimal(22,2) DEFAULT NULL,
  `CREATETIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IS_DELETE_` int(1) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` int(10) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` int(10) DEFAULT NULL COMMENT '数据修改用户编号',
  `IS_FINAL_` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID_` int(20) NOT NULL AUTO_INCREMENT,
  `USERNAME_` varchar(200) DEFAULT NULL,
  `SEX_` int(1) DEFAULT NULL,
  `CREATETIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IS_DELETE_` int(1) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` int(10) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` int(10) DEFAULT NULL COMMENT '数据修改用户编号',
  `IS_FINAL_` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Function structure for get_org_children
-- ----------------------------
DROP FUNCTION IF EXISTS `get_org_children`;
DELIMITER ;;
CREATE FUNCTION `get_org_children`(rootId bigint) RETURNS varchar(1000) CHARSET utf8
BEGIN
  declare sTemp varchar(1000);
  declare sTempChd varchar(1000);
  
  set sTemp = '$';
  set sTempChd = cast(rootId as char);
  
  WHILE sTempChd is not null DO
    set sTemp = concat(sTemp, ',', sTempChd);
	SELECT 
		GROUP_CONCAT(ORG_ID_)
	INTO sTempChd FROM
		sys_organization so
	WHERE
		FIND_IN_SET(so.FID_, sTempChd) > 0
			AND so.IS_DELETE_ = 0;
  END WHILE;
  RETURN sTemp;
END
;;
DELIMITER ;

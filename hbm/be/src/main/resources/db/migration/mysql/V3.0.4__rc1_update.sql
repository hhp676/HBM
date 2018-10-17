/*
 * update for V3.0.4-rc1
 */
/**修改版本号***/
update sys_config set CONFIG_VALUE_ = 'V3.0.4-RC1' where CONFIG_KEY_ = 'sysVersion';

-- 修改个性化设置中的默认值:10改为20
update sys_user_profile set DESCR_ = '数据表格展示数据数量，默认数据为20' where PROFILE_KEY_ = 'defaultPageSize';

-- 修改字典编号1057161158363386491的值：“不再用”改为“不在用”
update sys_dict_item set ITEM_NAME_ = '不在用' where DICT_ITEM_ID_ = '1057161158363386491';

-- 修改sys_meta_constraint_def表：“角色编码不能重复！”改为“角色代码不能重复！”
update sys_meta_constraint_def set  ERROR_MSG_ = '角色代码不能重复！' where DEF_CODE_ = 'uk_sysRoleCode' ;

-- 修改sys_meta_constraint_def表：“元数据字段不能重复！” 改为 “元数据‘表字段’不能重复！”
update sys_meta_constraint_def set ERROR_MSG_ = '元数据“表字段”不能重复！' where DEF_CODE_ = 'uk_sysMetadataField';
-- 元数据管理 约束菜单权限添加
INSERT INTO `SYS_AUTH` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1074489776065688516, 1, 'sysConstraintDetailView', '约束定义页面', '', '', 1066770861760943391, 2, 1060512414373153244, 1, NULL, NULL, '/sys/meta/constraintDetailView', 1, 1, '', '', 0, 0, '2017-8-1 16:28:03', '2017-8-1 16:28:03', 1, 1, NULL, 1);
INSERT INTO `SYS_AUTH` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1074489219556511388, 1, 'sysConstraintDefView', '约束管理页面', '', '', 1066770861760943391, 2, 1060512414373153244, 1, NULL, NULL, '/sys/meta/constraintDefView', 1, 1, '', '', 0, 0, '2017-8-1 16:19:12', '2017-8-1 16:19:12', 1, 1, NULL, 1);
-- 元数据管理 附属权限对应关系添加
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1074489829512655814, 1066770920083789089, 1074489219556511388, 0, '2017-8-1 16:28:53', 1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1074489833309549519, 1066770920083789089, 1074489776065688516, 0, '2017-8-1 16:28:58', 1);

ALTER TABLE `srv_interface`
  ADD COLUMN `TENANT_ID_` TINYINT NULL  COMMENT '租户ID' AFTER `IF_ID_`;

ALTER TABLE `srv_log`
  ADD COLUMN `TENANT_ID_` TINYINT NULL  COMMENT '租户ID' AFTER `LOG_ID_`;
-- 删除字典项名约束
delete from sys_metadata_field where FIELD_ID_ = 1071585192298589973;
delete from sys_meta_constraint_def where DEF_ID_ = 1071585313145925400;
delete from sys_meta_constraint_detail where DETAIL_ID_ = 1071585360832016154;

/** 系统变量表 **/
CREATE TABLE `sys_variable` (
  `VAR_ID_` bigint(20) NOT NULL COMMENT '主键ID',
  `VAR_KEY_` varchar(255) DEFAULT NULL COMMENT 'KEY',
  `VAR_VALUE_` text COMMENT 'VALUE',
  `IS_FINAL_` tinyint(4) DEFAULT NULL COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  PRIMARY KEY (`VAR_ID_`),
  KEY `VAR_KEY_` (`VAR_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统变量：K-V类型。';

insert into `sys_variable` (`VAR_ID_`, `VAR_KEY_`, `VAR_VALUE_`, `IS_FINAL_`, `CRT_USER_ID_`, `CRT_TIME_`) values('1075213443351914756','rsaKeyPair',NULL,'0','1','2017-08-17 11:19:37');

update sys_meta_constraint_def set ERROR_MSG_ = '系统字典组编码已存在！' where DEF_ID_ = '1067051767457441934';

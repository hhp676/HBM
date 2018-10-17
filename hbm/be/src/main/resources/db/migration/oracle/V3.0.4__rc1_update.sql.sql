/*
 * update for V3.0.4-rc1
 */
/**修改版本号***/
update sys_config set CONFIG_VALUE_ = 'V3.0.4-RC1' where CONFIG_KEY_ = 'sysVersion';

-- 修改个性化设置中的默认值：10改为20
update sys_user_profile set DESCR_ = '数据表格展示数据数量，默认数据为20' where PROFILE_KEY_ = 'defaultPageSize';

-- 修改字典编号1057161158363386491的值：“不再用”改为“不在用”
update sys_dict_item set ITEM_NAME_ = '不在用' where DICT_ITEM_ID_ = '1057161158363386491';

-- 修改sys_meta_constraint_def表：“角色编码不能重复！”改为“角色代码不能重复！”
update sys_meta_constraint_def set  ERROR_MSG_ = '角色代码不能重复！' where DEF_CODE_ = 'uk_sysRoleCode' ;

-- 修改sys_meta_constraint_def表：“元数据字段不能重复！” 改为 “元数据‘表字段’不能重复！”
update sys_meta_constraint_def set ERROR_MSG_ = '元数据“表字段”不能重复！' where DEF_CODE_ = 'uk_sysMetadataField';

-- 元数据管理 约束菜单权限添加
INSERT INTO SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1074489776065688516, 1, 'sysConstraintDetailView', '约束定义页面', '', '', 1066770861760943391, 2, 1060512414373153244, 1, NULL, NULL, '/sys/meta/constraintDetailView', 1, 1, '', '', 0, 0, null, null, 1, 1, NULL, 1);
INSERT INTO SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1074489219556511388, 1, 'sysConstraintDefView', '约束管理页面', '', '', 1066770861760943391, 2, 1060512414373153244, 1, NULL, NULL, '/sys/meta/constraintDefView', 1, 1, '', '', 0, 0, null, null, 1, 1, NULL, 1);
-- 元数据管理 附属权限对应关系添加
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_) VALUES (1074489829512655814, 1066770920083789089, 1074489219556511388, 0, NULL, 1);
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_) VALUES (1074489833309549519, 1066770920083789089, 1074489776065688516, 0, NULL, 1);

alter table SRV_INTERFACE add tenant_id_ NUMBER(3);
comment on column SRV_INTERFACE.tenant_id_
  is '租户ID';

alter table SRV_LOG add tenant_id_ NUMBER(3);
comment on column SRV_LOG.tenant_id_
  is '租户ID';

-- 删除字典项名约束
delete from sys_metadata_field where FIELD_ID_ = 1071585192298589973;
delete from sys_meta_constraint_def where DEF_ID_ = 1071585313145925400;
delete from sys_meta_constraint_detail where DETAIL_ID_ = 1071585360832016154;

/** 系统变量表 **/
create table SYS_VARIABLE
(
	VAR_ID_		NUMBER(24) not null,
	VAR_KEY_     VARCHAR2(255 CHAR),
	VAR_VALUE_ CLOB,
	IS_FINAL_  NUMBER(3) default '0',
	CRT_USER_ID_ NUMBER(24),
	CRT_TIME_ DATE default SYSDATE
);
comment on column SYS_VARIABLE.VAR_ID_
  is '主键ID';
comment on column SYS_VARIABLE.VAR_KEY_
  is 'KEY';
comment on column SYS_VARIABLE.VAR_VALUE_
  is 'VALUE';
comment on column SYS_VARIABLE.IS_FINAL_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_VARIABLE.CRT_USER_ID_
  is '数据创建用户编号';
comment on column SYS_VARIABLE.CRT_TIME_
  is '数据创建时间';
create index VAR_KEY_ on SYS_VARIABLE (VAR_KEY_);
alter table SYS_VARIABLE
  add constraint PK_SYS_VARIABLE primary key (VAR_ID_);

insert into sys_variable (VAR_ID_, VAR_KEY_, VAR_VALUE_, IS_FINAL_, CRT_USER_ID_, CRT_TIME_) values('1075213443351914756','rsaKeyPair',NULL,'0','1',to_date('17-08-2017 11:19:37', 'dd-mm-yyyy hh24:mi:ss'));

update sys_meta_constraint_def set ERROR_MSG_ = '系统字典组编码已存在！' where DEF_ID_ = '1067051767457441934';

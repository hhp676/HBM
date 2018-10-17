/*
 * update for 3.0.2-beta
 */

/**修改版本号***/
update sys_config set CONFIG_VALUE_ = 'V3.0.2-BETA' where CONFIG_KEY_ = 'sysVersion';

/***菜单模块***/
INSERT INTO `sys_model` (`MODEL_ID_`, `TENANT_ID_`, `MODEL_CODE_`, `MODEL_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `FID_`, `STYLE_`, `BS_STYLE_`, `IS_TOP_MENU_`, `IS_SUB_MENU_`, `IS_BS_TOP_MENU_`, `IS_BS_SUB_MENU_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `MODEL_TYPE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`) VALUES (1067147241363677900, 1, 'printdemo', '打印demo', '', '', 1056745429913710559, 'icon_auto_colorful__print', NULL, 0, 1, 0, 0, '', 19, 1, '', NULL, '', 0, 0, '2017-5-12 15:21:36', '2017-5-12 15:22:12', 1, 1, NULL);

/***菜单权限***/
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1067147372089647824, 1, 'printdemo:view', '访问', '', '', 1067147241363677900, 1, 1052481659203556933, 0, '', NULL, '/common/demo/print/toPrintDemoPage', 1, 1, '', '', 0, 0, '2017-5-12 15:23:41', '2017-5-12 15:23:41', 1, 1, NULL, 1);

/****允许easyui样式为空****/
ALTER TABLE `sys_model`   
  CHANGE `STYLE_` `STYLE_` VARCHAR(256) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT 'CSS';
ALTER TABLE `sys_auth`   
  CHANGE `STYLE_` `STYLE_` VARCHAR(256) CHARSET utf8 COLLATE utf8_general_ci NULL COMMENT 'CSS';
  
update `sys_dict_item` set ITEM_VALUE_='metro' where DICT_ITEM_ID_='1059355103639005447';
/***系统主题添加,字典项配置***/
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`, `TENANT_ID_`, `DICT_GROUP_ID_`, `ITEM_VALUE_`, `ITEM_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `IS_VISIBLE_`, `SORT_NO_`, `PRIORITY_NO_`, `SUB_GROUP_CODE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) VALUES (1067146638284628679, 1, 1059355057992395012, 'ui-sunny', '#FEEEBD', NULL, NULL, 1, NULL, 512, '', NULL, 0, 0, '2017-5-12 15:12:01', '2017-5-12 15:12:01', 1, 1);
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`, `TENANT_ID_`, `DICT_GROUP_ID_`, `ITEM_VALUE_`, `ITEM_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `IS_VISIBLE_`, `SORT_NO_`, `PRIORITY_NO_`, `SUB_GROUP_CODE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) VALUES (1067146620867781317, 1, 1059355057992395012, 'ui-dark-hive', '#000000', NULL, NULL, 1, NULL, 256, '', NULL, 0, 0, '2017-5-12 15:11:45', '2017-5-12 15:11:45', 1, 1);
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`, `TENANT_ID_`, `DICT_GROUP_ID_`, `ITEM_VALUE_`, `ITEM_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `IS_VISIBLE_`, `SORT_NO_`, `PRIORITY_NO_`, `SUB_GROUP_CODE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) VALUES (1067146598308717251, 1, 1059355057992395012, 'ui-pepper-grinder', '#ECEADF', NULL, NULL, 1, NULL, 128, '', NULL, 0, 0, '2017-5-12 15:11:23', '2017-5-12 15:11:23', 1, 1);
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`, `TENANT_ID_`, `DICT_GROUP_ID_`, `ITEM_VALUE_`, `ITEM_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `IS_VISIBLE_`, `SORT_NO_`, `PRIORITY_NO_`, `SUB_GROUP_CODE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) VALUES (1067146575226413761, 1, 1059355057992395012, 'ui-cupertino', '#D7EBF9', NULL, NULL, 1, NULL, 64, '', NULL, 0, 0, '2017-5-12 15:11:01', '2017-5-12 15:11:01', 1, 1);

INSERT INTO `sys_dict_group` VALUES ('1059355057992395063', '1', 'mcColorList', null, '移动端系统主题配色', null, null, '移动端系统主题配色', '0', '1', '2017-05-15 15:08:11', '2017-05-15 15:08:11', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355090484619561', '1', '1059355057992395063', 'metro', 'metro', null, null, '1', null, '1', '', null, '0', '1', '2017-05-15 20:01:45', '2017-05-15 20:01:45', '1', '1');


/***系统设置***/
insert into `sys_config` (`CONFIG_ID_`, `TENANT_ID_`, `CONFIG_KEY_`, `CONFIG_VALUE_`, `CONFIG_DESC_`, `CONFIG_TYPE_`, `DEFAULT_VALUE_`, `SORT_NO_`, `VERSION_`, `IS_CURRENT_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) values('1066978750681198755','1','sysContainerStyle','tabs','移动端系统主面板样式(tabs:tab多页面;single:单页面)','sys','tabs','20','1','1',NULL,'0','0','2017-05-10 18:43:31','2017-05-10 18:43:31','1','1');





/****hbm-job start*****/

CREATE TABLE JOB_JOB_DETAILS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE JOB_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES JOB_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE JOB_SIMPLE_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(10) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE JOB_CRON_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE JOB_SIMPROP_TRIGGERS
  (          
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE JOB_BLOB_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE JOB_CALENDARS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

CREATE TABLE JOB_PAUSED_TRIGGER_GRPS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL, 
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE JOB_FIRED_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    SCHED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE JOB_SCHEDULER_STATE
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE JOB_LOCKS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL, 
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);



CREATE TABLE `JOB_TRIGGER_INFO` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `job_group_` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron_` varchar(128) NOT NULL COMMENT '任务执行CRON',
  `job_desc_` varchar(255) NOT NULL,
  `add_time_` datetime DEFAULT NULL,
  `update_time_` datetime DEFAULT NULL,
  `author_` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email_` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy_` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler_` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param_` varchar(255) DEFAULT NULL COMMENT '执行器任务参数',
  `glue_type_` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source_` text COMMENT 'GLUE源代码',
  `glue_remark_` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime_` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobkey_` varchar(255) DEFAULT NULL COMMENT '子任务Key',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `JOB_TRIGGER_LOG` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `job_group_` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id_` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type_` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `executor_address_` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler_` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param_` varchar(255) DEFAULT NULL COMMENT 'executor_param',
  `trigger_time_` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code_` varchar(255) DEFAULT NULL COMMENT '调度-结果',
  `trigger_msg_` varchar(2048) DEFAULT NULL COMMENT '调度-日志',
  `handle_time_` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code_` varchar(255) DEFAULT NULL COMMENT '执行-状态',
  `handle_msg_` varchar(2048) DEFAULT NULL COMMENT '执行-日志',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `JOB_TRIGGER_LOGGLUE` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `job_id_` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type_` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source_` text COMMENT 'GLUE源代码',
  `glue_remark_` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time_` timestamp NULL DEFAULT NULL,
  `update_time_` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE JOB_TRIGGER_REGISTRY (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group_` varchar(255) NOT NULL,
  `registry_key_` varchar(255) NOT NULL,
  `registry_value_` varchar(255) NOT NULL,
  `update_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `JOB_TRIGGER_GROUP` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `app_name_` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title_` varchar(12) NOT NULL COMMENT '执行器名称',
  `order_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `address_type_` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list_` varchar(200) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `JOB_TRIGGER_GROUP` ( `app_name_`, `title_`, `order_`, `address_type_`, `address_list_`) values ( 'hbm-job-executor', 'HBM执行器', '1', '0', null);
/****hbm-job end*******/

/*** 唯一约束调整增加菜单 start ***/
INSERT INTO `sys_model` (`MODEL_ID_`, `TENANT_ID_`, `MODEL_CODE_`, `MODEL_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `FID_`, `STYLE_`, `BS_STYLE_`, `IS_TOP_MENU_`, `IS_SUB_MENU_`, `IS_BS_TOP_MENU_`, `IS_BS_SUB_MENU_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `MODEL_TYPE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`) VALUES (1066770481759098136, 1, 'sysMetaManage', '元数据管理', '', '', 1052481646384715198, 'icon_auto_blue__similar-product', 'fa fa-th-large', 1, 0, 0, 1, '', 99, 1, '', NULL, '', 0, 0, '2017-5-8 11:33:10', '2017-5-8 11:45:16', 1, 1, NULL);
INSERT INTO `sys_model` (`MODEL_ID_`, `TENANT_ID_`, `MODEL_CODE_`, `MODEL_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `FID_`, `STYLE_`, `BS_STYLE_`, `IS_TOP_MENU_`, `IS_SUB_MENU_`, `IS_BS_TOP_MENU_`, `IS_BS_SUB_MENU_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `MODEL_TYPE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`) VALUES (1066770861760943391, 1, 'sysConstraintManage', '约束管理', '', '', 1066770481759098136, 'icon_auto_blue__metadata', 'fa fa-random', 0, 1, 0, 1, '', 3, 1, '', NULL, '', 0, 0, '2017-5-8 11:39:13', '2017-5-8 11:45:50', 1, 1, NULL);

INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1066770920083789089,1,'sysConstraint:view','约束管理:访问','sysConstraint:view','',1066770861760943391,1,1052481659203556933,1,'',NULL,'/sys/meta/constraint/',1,1,'','',0,0,'2017-05-08 11:40:08','2017-05-08 11:56:58',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1066770651876922650,1,'sysMetaManage:view','元数据管理：访问','sysMetaManage:view','',1066770481759098136,1,1052481659203556933,1,'',NULL,'v-sysMeta',1,1,'','',0,0,'2017-05-08 11:35:53','2017-05-08 11:37:34',1,1,NULL,1);
/*** 唯一约束调整增加菜单 end ***/

/*** 唯一约束增加表 start ***/
/*==============================================================*/
/* Table: sys_meta_constraint_def                               */
/*==============================================================*/
create table sys_meta_constraint_def
(
  DEF_ID_              bigint not null comment '约束定义编号',
  TENANT_ID_           tinyint not null default 1 comment '租户ID',
  ENTITY_ID_           bigint not null comment '实体编号',
  DEF_CODE_            varchar(256) not null comment '约束编码',
  DEF_NAME_            varchar(256) not null comment '约束名称',
  DEF_TYPE_            tinyint not null default 3 comment '约束类型(1主键约束，2外键约束，3唯一约束)',
  REF_ID_              bigint comment '关联约束',
  ERROR_MSG_           varchar(1000) comment '错误提示信息',
  DESCR_               text comment '描述',
  IS_DELETE_           tinyint default 0 comment '删除标识(1:已删除;0:正常)',
  IS_FINAL_            tinyint default 0 comment '是否不可修改(1:不可修改;0:可修改)',
  CRT_TIME_            timestamp not null default CURRENT_TIMESTAMP comment '数据创建时间',
  UPD_TIME_            timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '数据最后修改时间',
  CRT_USER_ID_         bigint not null comment '数据创建用户编号',
  UPD_USER_ID_         bigint comment '数据修改用户编号',
  primary key (DEF_ID_)
);

alter table sys_meta_constraint_def comment '约束定义表';


/*==============================================================*/
/* Table: sys_meta_constraint_detail                            */
/*==============================================================*/
create table sys_meta_constraint_detail
(
  DETAIL_ID_           bigint not null comment '明细编号',
  TENANT_ID_           tinyint not null default 1 comment '租户ID',
  DEF_ID_              bigint not null comment '定义编号',
  FIELD_ID_            bigint not null comment '字段编号',
  REF_DETAIL_ID_       bigint comment '关联明细编号',
  DESCR_               text comment '描述',
  IS_DELETE_           tinyint default 0 comment '删除标识(1:已删除;0:正常)',
  IS_FINAL_            tinyint default 0 comment '是否不可修改(1:不可修改;0:可修改)',
  CRT_TIME_            timestamp not null default CURRENT_TIMESTAMP comment '数据创建时间',
  UPD_TIME_            timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '数据最后修改时间',
  CRT_USER_ID_         bigint not null comment '数据创建用户编号',
  UPD_USER_ID_         bigint comment '数据修改用户编号',
  primary key (DETAIL_ID_)
);

alter table sys_meta_constraint_detail comment '约束字段表';
/*** 唯一约束增加表 end ***/

/*** 唯一约束增加字典项 start ***/
INSERT INTO `sys_dict_group` (`DICT_GROUP_ID_`,`TENANT_ID_`,`DICT_GROUP_CODE_`,`GROUP_TYPE_`,`GROUP_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066982789165309216,1,'sysConstraintType',NULL,'数据约束类型',NULL,NULL,'（不要删除）',0,0,'2017-05-10 19:47:43','2017-05-10 19:56:56',1,1);

INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`,`TENANT_ID_`,`DICT_GROUP_ID_`,`ITEM_VALUE_`,`ITEM_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`IS_VISIBLE_`,`SORT_NO_`,`PRIORITY_NO_`,`SUB_GROUP_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066982825938869538,1,1066982789165309216,'3','唯一约束',NULL,NULL,1,3,1,'3',NULL,0,0,'2017-05-10 19:56:33','2017-05-10 19:56:28',1,1);
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`,`TENANT_ID_`,`DICT_GROUP_ID_`,`ITEM_VALUE_`,`ITEM_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`IS_VISIBLE_`,`SORT_NO_`,`PRIORITY_NO_`,`SUB_GROUP_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066982853787999524,1,1066982789165309216,'1','主键约束',NULL,NULL,1,1,2,'1',NULL,0,0,'2017-05-10 19:56:19','2017-05-10 19:56:15',1,1);
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`,`TENANT_ID_`,`DICT_GROUP_ID_`,`ITEM_VALUE_`,`ITEM_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`IS_VISIBLE_`,`SORT_NO_`,`PRIORITY_NO_`,`SUB_GROUP_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066983275836693800,1,1066982789165309216,'2','外键约束',NULL,NULL,1,2,4,'2',NULL,0,0,'2017-05-10 19:56:24','2017-05-10 19:56:19',1,1);
/*** 唯一约束增加字典项 end ***/

/*** 唯一约束调整对应数据库调整 start ***/
ALTER TABLE `sys_user_profile`
  DROP FOREIGN KEY `sys_user_profile_ibfk_1`;
ALTER TABLE `sys_user_profile`
  DROP INDEX `AK_Key_2` ;
alter table sys_user_profile add constraint FK_Reference_29 foreign key (USER_ID_)
references sys_user (USER_ID_) on delete restrict on update restrict;

ALTER TABLE `sys_metadata_entity`
  DROP INDEX `AK_Key_2` ,
  DROP INDEX `AK_Key_3` ;

ALTER TABLE `sys_role_auth`
  DROP FOREIGN KEY `sys_role_auth_ibfk_2`,
  DROP FOREIGN KEY `sys_role_auth_ibfk_1`;
ALTER TABLE `sys_role_auth`
  DROP INDEX `FK_Reference_2` ,
  DROP INDEX `AK_Key_2` ;
alter table sys_role_auth add constraint FK_Reference_2 foreign key (AUTH_ID_)
references sys_auth (AUTH_ID_);
alter table sys_role_auth add constraint FK_Reference_4 foreign key (ROLE_ID_)
references sys_role (ROLE_ID_);

ALTER TABLE `sys_metadata_field`
  DROP FOREIGN KEY `sys_metadata_field_ibfk_2`,
  DROP FOREIGN KEY `sys_metadata_field_ibfk_1`;
ALTER TABLE `sys_metadata_field`
  DROP INDEX `FK_Reference_meta_10` ,
  DROP INDEX `AK_Key_2` ;
alter table sys_metadata_field add constraint FK_Reference_meta_10 foreign key (FILTER_TYPE_ID_)
references sys_dauth_filter_type (FILTER_TYPE_ID_) on delete restrict on update restrict;
alter table sys_metadata_field add constraint FK_Reference_meta_7 foreign key (ENTITY_ID_)
references sys_metadata_entity (ENTITY_ID_) on delete restrict on update restrict;

ALTER TABLE `sys_account`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_attachment`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_auth`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_auth_join`
  DROP FOREIGN KEY `sys_auth_join_ibfk_2`;
ALTER TABLE `sys_auth_join`
  DROP INDEX `AK_Key_2` ;
alter table sys_auth_join add constraint foreign key (MAIN_AUTH_ID_)
references sys_auth (AUTH_ID_);

ALTER TABLE `sys_config`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_dauth`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_dauth_filter_join`
  DROP FOREIGN KEY `sys_dauth_filter_join_ibfk_1`;
ALTER TABLE `sys_dauth_filter_join`
  DROP INDEX `AK_Key_2` ;
alter table sys_dauth_filter_join add constraint foreign key (FILTER_GROUP_ID_)
references sys_dauth_filter_group (FILTER_GROUP_ID_) on delete restrict on update restrict;

ALTER TABLE `sys_dauth_filter_type`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_dauth_operator`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_dauth_operator_support`
  DROP FOREIGN KEY `sys_dauth_operator_support_ibfk_1`;
ALTER TABLE `sys_dauth_operator_support`
  DROP INDEX `AK_Key_2` ;
alter table sys_dauth_operator_support add constraint foreign key (FILTER_TYPE_ID_)
references sys_dauth_filter_type (FILTER_TYPE_ID_) on delete restrict on update restrict;

ALTER TABLE `sys_dauth_usage`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_dauth_variable`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_dict_group`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_extend_field`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_extend_field_def`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_group`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_group_user`
  DROP FOREIGN KEY `sys_group_user_ibfk_1`;
ALTER TABLE `sys_group_user`
  DROP INDEX `AK_Key_2` ;
alter table sys_group_user add constraint foreign key (USER_ID_)
references sys_user (USER_ID_) on delete restrict on update restrict;

ALTER TABLE `sys_icon`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_job`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_model`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_operation`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_organization`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_position`
  DROP INDEX `AK_POSITION_CODE_` ;

ALTER TABLE `sys_role`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_staff_info`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_token`
  DROP INDEX `AK_Key_2` ;

ALTER TABLE `sys_user_auth`
  DROP FOREIGN KEY `sys_user_auth_ibfk_2`;
ALTER TABLE `sys_user_auth`
  DROP INDEX `AK_Key_2` ;
alter table sys_user_auth add constraint foreign key (USER_ID_)
references sys_user (USER_ID_);

ALTER TABLE `sys_user_position`
  DROP FOREIGN KEY `sys_user_position_ibfk_2`;
ALTER TABLE `sys_user_position`
  DROP INDEX `AK_Key_2` ;
alter table sys_user_position add constraint foreign key (USER_ID_)
references sys_user (USER_ID_) on delete restrict on update restrict;

ALTER TABLE `sys_user_role`
  DROP FOREIGN KEY `sys_user_role_ibfk_2`;
ALTER TABLE `sys_user_role`
  DROP INDEX `AK_Key_2` ;
alter table sys_user_role add constraint foreign key (USER_ID_)
references sys_user (USER_ID_);


/*** 唯一约束调整对应数据库调整 end ***/

/*** 唯一约束元数据 start ***/
delete from sys_metadata_field where 1 = 1;
delete from sys_metadata_entity where 1 = 1;

INSERT INTO `sys_metadata_entity` VALUES (1066769867392128276,1,'sys_dict_group','系统字典组表','dict_group','','sys_dict_group','字典组','系统字典组表',0,0,'2017-05-08 03:23:25','2017-05-08 03:23:25',1,1),(1067403191985956964,1,'sys_meta_cnstraint_def','约束定义表','meta_constraint_def','','sys_meta_constraint_def','约束定义','约束定义表',0,0,'2017-05-15 03:09:50','2017-05-15 03:09:50',1,1),(1067688715183855724,1,'sys_user_profile','用户设置表','user_profile','','sys_user_profile','用户设置','用户设置表',0,0,'2017-05-18 06:48:06','2017-05-18 06:48:06',1,1),(1067690041355813017,1,'sys_meta_constraint_detail','约束字段表','constraint_field','','sys_meta_constraint_detail','约束字段','约束字段表',0,0,'2017-05-18 07:09:11','2017-05-18 07:09:11',1,1),(1067759988064219804,1,'sys_metadata_entity','元数据实体表','metadata_entity','','sys_metadata_entity','数据实体','元数据实体',0,0,'2017-05-19 01:40:57','2017-05-19 01:40:57',1,1),(1067767917818098528,1,'sys_role_auth','角色权限表','role_auth','','sys_role_auth','角色权限表','角色权限表',0,0,'2017-05-19 03:47:00','2017-05-19 03:47:00',1,1),(1067768429968831340,1,'sys_metadata_field','元数据字段表','metadata_field','','sys_metadata_field','元数据字段','元数据字段表',0,0,'2017-05-19 03:55:08','2017-05-19 03:55:08',1,1),(1067782107168217390,1,'sys_account','系统用户表','account','','sys_account','系统用户','系统用户表',0,0,'2017-05-19 07:32:32','2017-05-19 07:32:32',1,1),(1067782594549487926,1,'sys_attachment','系统附件表','attachment','','sys_attachment','系统附件','系统附件表',0,0,'2017-05-19 07:40:16','2017-05-19 07:40:16',1,1),(1067783427275069758,1,'sys_auth','系统权限表','auth','','sys_auth','系统权限','系统权限表',0,0,'2017-05-19 07:53:31','2017-05-19 07:53:31',1,1),(1067783715108133190,1,'sys_auth_join','系统权限关联表','auth_join','','sys_auth_join','系统权限关联','系统权限关联表',0,0,'2017-05-19 07:58:05','2017-05-19 07:58:05',1,1),(1067784637587626322,1,'sys_config','系统设置表','config','','sys_config','系统设置','系统设置表',0,0,'2017-05-19 08:12:45','2017-05-19 08:12:45',1,1),(1067785233634924894,1,'sys_dauth','数据权限表','dauth','','sys_dauth','数据权限','数据权限表',0,0,'2017-05-19 08:22:13','2017-05-19 08:22:13',1,1),(1067785850500651366,1,'sys_dauth_filter_join','数据权限过滤器关联表','dauth_filter_join','','sys_dauth_filter_join','数据权限过滤器关联','数据权限过滤器关联表',0,0,'2017-05-19 08:32:02','2017-05-19 08:32:02',1,1),(1067786390398802290,1,'sys_dauth_filter_type','数据权限过滤类型表','dauth_filter_type','','sys_dauth_filter_type','数据权限过滤类型','数据权限过滤类型表',0,0,'2017-05-19 08:40:36','2017-05-19 08:40:36',1,1),(1067786796778625402,1,'sys_dauth_operator','数据权限运算符表','dauth_operator','','sys_dauth_operator','数据权限运算符','数据权限运算符表',0,0,'2017-05-19 08:47:04','2017-05-19 08:47:04',1,1),(1067787278903384450,1,'sys_dauth_operator_support','数据权限运算符支持表','dauth_operator_support','','sys_dauth_operator_support','数据权限运算符支持','数据权限运算符支持表',0,0,'2017-05-19 08:54:44','2017-05-19 08:54:44',1,1),(1067787811732035986,1,'sys_dauth_usage','数据权限应用表','dauth_usage','','sys_dauth_usage','数据权限应用','数据权限应用表',0,0,'2017-05-19 09:03:12','2017-05-19 09:03:12',1,1),(1067788465944893850,1,'sys_dauth_variable','数据权限变量表','auth_variable','','sys_dauth_variable','数据权限变量','数据权限变量表',0,0,'2017-05-19 09:13:36','2017-05-19 09:13:36',1,1),(1067789032995920290,1,'sys_extend_field','扩展字段表','extend_field','','sys_extend_field','扩展字段','扩展字段表',0,0,'2017-05-19 09:22:37','2017-05-19 09:22:37',1,1),(1067789500016990638,1,'sys_extend_field_def','扩展字段定义表','extend_field_def','','sys_extend_field_def','扩展字段定义','扩展字段定义表',0,0,'2017-05-19 09:30:02','2017-05-19 09:30:02',1,1),(1067789866165049786,1,'sys_group','小组表','group','','sys_group','小组','小组表',0,0,'2017-05-19 09:35:51','2017-05-19 09:35:51',1,1),(1067792117253249475,1,'sys_group_user','小组用户表','group_user','','sys_group_user','小组用户','小组用户表',0,0,'2017-05-19 10:11:38','2017-05-19 10:11:38',1,1),(1067792369514420687,1,'sys_icon','系统图标表','icon','','sys_icon','系统图标','系统图标表',0,0,'2017-05-19 10:15:39','2017-05-19 10:15:39',1,1),(1067792612071021015,1,'sys_job','职务表','job','','sys_job','职务','职务表',0,0,'2017-05-19 10:19:30','2017-05-19 10:19:30',1,1),(1067793083969018335,1,'sys_operation','系统操作类型表','operation','','sys_operation','系统操作类型','系统操作类型表',0,0,'2017-05-19 10:27:00','2017-05-19 10:27:00',1,1),(1067793323016034791,1,'sys_organization','组织架构表','organization','','sys_organization','组织架构','组织架构表',0,0,'2017-05-19 10:30:48','2017-05-19 10:30:48',1,1),(1067793546809416175,1,'sys_position','岗位表','position','','sys_position','岗位','岗位表',0,0,'2017-05-19 10:34:21','2017-05-19 10:34:21',1,1),(1067793797082487287,1,'sys_role','系统角色表','role','','sys_role','系统角色','系统角色表',0,0,'2017-05-19 10:38:20','2017-05-19 10:38:20',1,1),(1067795029384731135,1,'sys_staff_info','员工信息表','stafffInfo','','sys_staff_info','员工信息','员工信息表',0,0,'2017-05-19 10:57:55','2017-05-19 10:57:55',1,1),(1067795300434287111,1,'sys_token','系统密钥表','token','','sys_token','系统密钥','系统密钥表',0,0,'2017-05-19 11:02:14','2017-05-19 11:02:14',1,1),(1067796056679881231,1,'sys_user_position','用户岗位表','user_position','','sys_user_position','用户岗位','用户岗位表',0,0,'2017-05-19 11:14:15','2017-05-19 11:14:15',1,1),(1067796327340415515,1,'sys_user_role','用户角色表','user_role','','sys_user_role','用户角色','用户角色表',0,0,'2017-05-19 11:18:33','2017-05-19 11:18:33',1,1);
INSERT INTO `sys_metadata_field` VALUES (1066770029490443542,1,1066769867392128276,1059816042813676429,'dictGroupCode','字典编码','dictGroupCode','','DICT_GROUP_CODE_','字典编码',0,0,'2017-05-08 03:25:59','2017-05-08 03:25:59',1,1),(1067403246977476710,1,1067403191985956964,1059816042813676429,'def_code','约束编码','defCode','','DEF_CODE_','约束编码',0,0,'2017-05-15 03:10:42','2017-05-15 03:10:42',1,1),(1067688854670678128,1,1067688715183855724,1059816042813676429,'user_id','用户编号','userId','','USER_ID_','',0,0,'2017-05-18 06:50:19','2017-05-18 06:51:12',1,1),(1067688895726622834,1,1067688715183855724,1059816042813676429,'profile_key','设置key','profileKey','','PROFILE_KEY_','',0,0,'2017-05-18 06:50:58','2017-05-18 06:51:19',1,1),(1067688942988040310,1,1067688715183855724,1059816042813676429,'version','版本号','version','','VERSION_','',0,0,'2017-05-18 06:51:43','2017-05-18 06:51:43',1,1),(1067690284835160219,1,1067690041355813017,1059816042813676429,'field_id','字段编号','fieldId','','FIELD_ID_','',0,0,'2017-05-18 07:13:03','2017-05-18 07:13:03',1,1),(1067690320226697373,1,1067690041355813017,1059816042813676429,'def_id','定义编号','defId','','DEF_ID_','',0,0,'2017-05-18 07:13:37','2017-05-18 07:13:37',1,1),(1067760050317128350,1,1067759988064219804,1059816042813676429,'entity_code','实体编码','entityCode','','ENTITY_CODE_','实体编码',0,0,'2017-05-19 01:41:57','2017-05-19 01:41:57',1,1),(1067760085580739232,1,1067759988064219804,1059816042813676429,'table_name','表名','tableName','','TABLE_NAME_','表名',0,0,'2017-05-19 01:42:30','2017-05-19 01:42:30',1,1),(1067767966694323042,1,1067767917818098528,1059816042813676429,'role_id','角色编号','roleId','','ROLE_ID_','角色编号',0,0,'2017-05-19 03:47:46','2017-05-19 03:47:46',1,1),(1067767999136215908,1,1067767917818098528,1059816042813676429,'auth_id','权限编号','authId','','AUTH_ID_','权限编号',0,0,'2017-05-19 03:48:17','2017-05-19 03:48:17',1,1),(1067768477768168302,1,1067768429968831340,1059816042813676429,'entity_id','实体编号','entityId','','ENTITY_ID_','实体编号',0,0,'2017-05-19 03:55:54','2017-05-19 03:55:54',1,1),(1067768530556629872,1,1067768429968831340,1059816042813676429,'column_name','列名','columnName','','COLUMN_NAME_','列名',0,0,'2017-05-19 03:56:44','2017-05-19 03:56:44',1,1),(1067782147843529008,1,1067782107168217390,1059816042813676429,'login_name','登录名','loginName','','LOGIN_NAME_','登录名',0,0,'2017-05-19 07:33:10','2017-05-19 07:33:10',1,1),(1067782639571147064,1,1067782594549487926,1059816042813676429,'att_code','附件编码','attCode','','ATT_CODE_','附件编码',0,0,'2017-05-19 07:40:59','2017-05-19 07:40:59',1,1),(1067783456243030336,1,1067783427275069758,1059816042813676429,'auth_code','权限编码','authCode','','AUTH_CODE_','权限编码',0,0,'2017-05-19 07:53:58','2017-05-19 07:53:58',1,1),(1067783807616653640,1,1067783715108133190,1059816042813676429,'main_auth_id','主权限编号','mainAuthId','','MAIN_AUTH_ID_','主权限编号',0,0,'2017-05-19 07:59:33','2017-05-19 07:59:33',1,1),(1067783856847296842,1,1067783715108133190,1059816042813676429,'attach_auth_id','附属权限编号','attachAuthId','','ATTACH_AUTH_ID_','附属权限编号',0,0,'2017-05-19 08:00:20','2017-05-19 08:00:20',1,1),(1067784677515303252,1,1067784637587626322,1059816042813676429,'config_key','设置Key','configKey','','CONFIG_KEY_','设置Key',0,0,'2017-05-19 08:13:23','2017-05-19 08:13:23',1,1),(1067784707739457878,1,1067784637587626322,1059816042813676429,'version','版本号','version','','VERSION_','版本号',0,0,'2017-05-19 08:13:52','2017-05-19 08:13:52',1,1),(1067785268867078496,1,1067785233634924894,1059816042813676429,'dauth_code','数据权限编码','dauthCode','','DAUTH_CODE_','数据权限编码',0,0,'2017-05-19 08:22:47','2017-05-19 08:22:47',1,1),(1067785915305793896,1,1067785850500651366,1059816042813676429,'filter_group_id','过滤器组编号','filterGroupId','','FILTER_GROUP_ID_','过滤器组编号',0,0,'2017-05-19 08:33:03','2017-05-19 08:33:03',1,1),(1067785954462767466,1,1067785850500651366,1059816042813676429,'filter_item_id','过滤器项ID','filterItemId','','FILTER_ITEM_ID_','过滤器项ID',0,0,'2017-05-19 08:33:41','2017-05-19 08:33:41',1,1),(1067786426486593908,1,1067786390398802290,1059816042813676429,'filter_type','过滤类型编码','filterType','','FILTER_TYPE_CODE_','过滤类型编码',0,0,'2017-05-19 08:41:11','2017-05-19 08:41:11',1,1),(1067786829416601980,1,1067786796778625402,1059816042813676429,'operator_code','运算符编码','operatorCode','','OPERATOR_CODE_','运算符编码',0,0,'2017-05-19 08:47:35','2017-05-19 08:47:35',1,1),(1067787323379784068,1,1067787278903384450,1059816042813676429,'filter_type_id','过滤类型ID','filterTypeId','','FILTER_TYPE_ID_','过滤类型ID',0,0,'2017-05-19 08:55:26','2017-05-19 08:55:26',1,1),(1067787378329360774,1,1067787278903384450,1059816042813676429,'operator_id','条件ID','operatorId','','OPERATOR_ID_','条件ID',0,0,'2017-05-19 08:56:19','2017-05-19 08:56:19',1,1),(1067787416108505480,1,1067787278903384450,1059816042813676429,'value_type','值类型','valueType','','VALUE_TYPE_','值类型',0,0,'2017-05-19 08:56:55','2017-05-19 08:56:55',1,1),(1067787850899495316,1,1067787811732035986,1059816042813676429,'method_name','方法名','methodName','','METHOD_NAME_','方法名',0,0,'2017-05-19 09:03:49','2017-05-19 09:03:49',1,1),(1067788502286440860,1,1067788465944893850,1059816042813676429,'variable_code','变量编码','variableCode','','VARIABLE_CODE_','变量编码',0,0,'2017-05-19 09:14:10','2017-05-19 09:14:10',1,1),(1067789071282575780,1,1067789032995920290,1059816042813676429,'extend_def_id','扩展字段定义编号','extendDefId','','EXTEND_DEF_ID_','扩展字段定义编号',0,0,'2017-05-19 09:23:13','2017-05-19 09:23:13',1,1),(1067789130161166758,1,1067789032995920290,1059816042813676429,'biz_id','被扩展表编号','bizId','','BIZ_ID_','被扩展表编号',0,0,'2017-05-19 09:24:09','2017-05-19 09:24:09',1,1),(1067789545883802032,1,1067789500016990638,1059816042813676429,'table_code','扩展表编码','tableCode','','TABLE_CODE_','扩展表编码',0,0,'2017-05-19 09:30:46','2017-05-19 09:30:46',1,1),(1067789575791286706,1,1067789500016990638,1059816042813676429,'field_code','扩展字段编码','fieldCode','','FIELD_CODE_','扩展字段编码',0,0,'2017-05-19 09:31:14','2017-05-19 09:31:14',1,1),(1067789897646447036,1,1067789866165049786,1059816042813676429,'group_code','小组编码','groupCode','','GROUP_CODE_','小组编码',0,0,'2017-05-19 09:36:21','2017-05-19 09:36:21',1,1),(1067792155081677253,1,1067792117253249475,1059816042813676429,'group_id','小组ID','groupId','','GROUP_ID_','小组ID',0,0,'2017-05-19 10:12:14','2017-05-19 10:12:14',1,1),(1067792183642790343,1,1067792117253249475,1059816042813676429,'user_id','用户ID','userId','','USER_ID_','用户ID',0,0,'2017-05-19 10:12:41','2017-05-19 10:12:41',1,1),(1067792401360722385,1,1067792369514420687,1059816042813676429,'image_path','图片路径','imagePath','','IMAGE_PATH_','图片路径',0,0,'2017-05-19 10:16:09','2017-05-19 10:16:09',1,1),(1067792633315170777,1,1067792612071021015,1059816042813676429,'job_code','职务编码','jobCode','','JOB_CODE_','职务编码',0,0,'2017-05-19 10:19:50','2017-05-19 10:19:50',1,1),(1067793124635941345,1,1067793083969018335,1059816042813676429,'operation_code','操作类型编码','operationCode','','OPERATION_CODE_','操作类型编码',0,0,'2017-05-19 10:27:39','2017-05-19 10:27:39',1,1),(1067793360660961769,1,1067793323016034791,1059816042813676429,'org_code','部门编码','orgCode','','ORG_CODE_','部门编码',0,0,'2017-05-19 10:31:24','2017-05-19 10:31:24',1,1),(1067793597609777649,1,1067793546809416175,1059816042813676429,'position_code','岗位编码','positionCode','','POSITION_CODE_','岗位编码',0,0,'2017-05-19 10:35:10','2017-05-19 10:35:10',1,1),(1067793823338830329,1,1067793797082487287,1059816042813676429,'role_code','角色编码','roleCode','','ROLE_CODE_','角色编码',0,0,'2017-05-19 10:38:45','2017-05-19 10:38:45',1,1),(1067795095032928769,1,1067795029384731135,1059816042813676429,'staff_code','员工号','staffCode','','STAFF_CODE_','员工号',0,0,'2017-05-19 10:58:58','2017-05-19 10:58:58',1,1),(1067795328310680073,1,1067795300434287111,1059815909991603084,'token_sign','令牌签名','tokenSign','','TOKEN_SIGN_','令牌签名',0,0,'2017-05-19 11:02:40','2017-05-19 11:02:40',1,1),(1067796086259161617,1,1067796056679881231,1059816042813676429,'user_id','用户ID','userId','','USER_ID_','用户ID',0,0,'2017-05-19 11:14:43','2017-05-19 11:14:43',1,1),(1067796119413037587,1,1067796056679881231,1059816042813676429,'position_id','岗位ID','positionId','','POSITION_ID_','岗位ID',0,0,'2017-05-19 11:15:15','2017-05-19 11:15:15',1,1),(1067796383118367261,1,1067796327340415515,1059816042813676429,'role_id','角色ID','roleId','','ROLE_ID_','角色ID',0,0,'2017-05-19 11:19:26','2017-05-19 11:19:26',1,1),(1067796412965034527,1,1067796327340415515,1059816042813676429,'user_id','用户ID','userId','','USER_ID_','用户ID',0,0,'2017-05-19 11:19:55','2017-05-19 11:19:55',1,1);
INSERT INTO `sys_meta_constraint_def` VALUES (1067051767457441934,1,1066769867392128276,'uk_sysDictGroupCode','系统字典编码',3,NULL,'系统字典编码已存在！',NULL,0,0,'2017-05-11 06:04:05','2017-05-15 02:07:31',1,1),(1067602907763295913,1,1066769867392128276,'uk_sysDictGroupCode','系统字典编码',3,NULL,'系统字典编码已存在！',NULL,1,0,'2017-05-17 08:04:14','2017-05-17 08:04:14',1,1),(1067602985768961708,1,1067403191985956964,'uk_sysMetaConstraintDefCode','约束定义编码',3,NULL,'约束定义编码已存在！',NULL,0,0,'2017-05-17 08:05:28','2017-05-17 08:05:28',1,1),(1067608054799542495,1,1066769867392128276,'uk_sysDictGroupCode','系统字典编码',3,NULL,'约束定义编码已存在！',NULL,1,0,'2017-05-17 09:26:02','2017-05-17 09:26:02',1,1),(1067688792153528430,1,1067688715183855724,'uk_sysUserProfile','用户设置',3,NULL,'用户设置不允许重复！',NULL,0,0,'2017-05-18 06:49:19','2017-05-18 06:49:19',1,1),(1067690393967804575,1,1067690041355813017,'uk_sysConstraintDetailField','约束字段',3,NULL,'约束字段不能重复！',NULL,0,0,'2017-05-18 07:14:47','2017-05-18 07:14:47',1,1),(1067760194832921250,1,1067759988064219804,'uk_sysMetadataEntityCode','元数据实体编码',3,NULL,'元数据实体编码不能重复！',NULL,0,0,'2017-05-19 01:44:14','2017-05-19 01:44:14',1,1),(1067760274859192998,1,1067759988064219804,'uk_sysMetadataEntityTableName','元数据实体表名',3,NULL,'元数据实体表名不能重复！',NULL,0,0,'2017-05-19 01:45:31','2017-05-19 01:45:31',1,1),(1067768083467940710,1,1067767917818098528,'uk_sysRoleAuth','角色权限',3,NULL,'角色权限组合不能重复！',NULL,0,0,'2017-05-19 03:49:38','2017-05-19 03:49:38',1,1),(1067768591641424754,1,1067768429968831340,'uk_sysMetadataField','元数据字段',3,NULL,'元数据字段不能重复！',NULL,0,0,'2017-05-19 03:57:42','2017-05-19 03:57:42',1,1),(1067782219608070450,1,1067782107168217390,'uk_sysAccountLoginName','账号登录名',3,NULL,'账号登录名不能重复！',NULL,0,0,'2017-05-19 07:34:19','2017-05-19 07:34:19',1,1),(1067782679369849146,1,1067782594549487926,'uk_sysAttachment','系统附件编码',3,NULL,'系统附件编码不能重复！',NULL,0,0,'2017-05-19 07:41:37','2017-05-19 07:41:37',1,1),(1067783492708309314,1,1067783427275069758,'uk_sysAuthCode','系统权限编码',3,NULL,'系统权限编码不能重复！',NULL,0,0,'2017-05-19 07:54:33','2017-05-19 07:54:33',1,1),(1067783919830014284,1,1067783715108133190,'uk_sysAuthJoin','系统权限关联组合',3,NULL,'系统权限关联组合不能重复！',NULL,0,0,'2017-05-19 08:01:20','2017-05-19 08:01:20',1,1),(1067784749990779224,1,1067784637587626322,'uk_sysConfig','系统设置Key',3,NULL,'系统设置Key不能重复！',NULL,0,0,'2017-05-19 08:14:32','2017-05-19 08:14:32',1,1),(1067785310586771810,1,1067785233634924894,'uk_sysDauth','数据权限编码',3,NULL,'数据权限编码不能重复！',NULL,0,0,'2017-05-19 08:23:27','2017-05-19 08:23:27',1,1),(1067786014590212460,1,1067785850500651366,'uk_sysDauthFilterJoin','数据权限过滤器关联',3,NULL,'数据权限过滤器关联不能重复！',NULL,0,0,'2017-05-19 08:34:38','2017-05-19 08:34:38',1,1),(1067786481557805430,1,1067786390398802290,'uk_sysDauthFilterType','数据权限过滤类型',3,NULL,'数据权限过滤类型编码不能重复！',NULL,0,0,'2017-05-19 08:42:03','2017-05-19 08:42:03',1,1),(1067786900685166974,1,1067786796778625402,'uk_sysDauthOperator','数据权限运算符编码',3,NULL,'数据权限运算符编码不能重复！',NULL,0,0,'2017-05-19 08:48:43','2017-05-19 08:48:43',1,1),(1067787485679425930,1,1067787278903384450,'uk_sysDauthOperatorSupport','权限权限运算符支持',3,NULL,'数据权限运算符组合不能重复！',NULL,0,0,'2017-05-19 08:58:01','2017-05-19 08:58:01',1,1),(1067787913181763990,1,1067787811732035986,'uk_sysDauthMethod','数据权限应用方法名',3,NULL,'数据权限应用方法名不能重复！',NULL,0,0,'2017-05-19 09:04:49','2017-05-19 09:04:49',1,1),(1067788542363015582,1,1067788465944893850,'uk_sysDauthVariable','数据权限变量编码',3,NULL,'数据权限变量编码不能重复！',NULL,0,0,'2017-05-19 09:14:49','2017-05-19 09:14:49',1,1),(1067789203999791528,1,1067789032995920290,'uk_sysExtendField','系统扩展字段',3,NULL,'系统扩展字段值不能重复！',NULL,0,0,'2017-05-19 09:25:20','2017-05-19 09:25:20',1,1),(1067789630634957236,1,1067789500016990638,'uk_sysExtendFieldDef','系统扩展字段定义',3,NULL,'系统扩展字段定义不能重复！',NULL,0,0,'2017-05-19 09:32:07','2017-05-19 09:32:07',1,1),(1067789939451075006,1,1067789866165049786,'uk_sysGroupCode','小组编码',3,NULL,'小组编码不能重复！',NULL,0,0,'2017-05-19 09:37:01','2017-05-19 09:37:01',1,1),(1067792217071393225,1,1067792117253249475,'uk_sysGroupUser','小组用户',3,NULL,'小组用户不能重复！',NULL,0,0,'2017-05-19 10:13:13','2017-05-19 10:13:13',1,1),(1067792457281280467,1,1067792369514420687,'uk_SysIcon','系统图标路径',3,NULL,'系统图标图片路径不能重复！',NULL,0,0,'2017-05-19 10:17:02','2017-05-19 10:17:02',1,1),(1067792670170520027,1,1067792612071021015,'uk_sysJobCode','职务编码',3,NULL,'职务编码不能重复！',NULL,0,0,'2017-05-19 10:20:25','2017-05-19 10:20:25',1,1),(1067793160265505251,1,1067793083969018335,'uk_sysOperationCode','操作类型编码',3,NULL,'操作类型编码不能重复！',NULL,0,0,'2017-05-19 10:28:13','2017-05-19 10:28:13',1,1),(1067793395101440491,1,1067793323016034791,'uk_sysOrgCode','部门编码',3,NULL,'部门编码不能重复！',NULL,0,0,'2017-05-19 10:31:57','2017-05-19 10:31:57',1,1),(1067793649774336499,1,1067793546809416175,'uk_sysPositionCode','岗位编码',3,NULL,'岗位编码不能重复！',NULL,0,0,'2017-05-19 10:36:00','2017-05-19 10:36:00',1,1),(1067793854851684859,1,1067793797082487287,'uk_sysRoleCode','角色编码',3,NULL,'角色编码不能重复！',NULL,0,0,'2017-05-19 10:39:15','2017-05-19 10:39:15',1,1),(1067795139563854339,1,1067795029384731135,'uk_sysStaffCode','员工号',3,NULL,'员工号不能重复！',NULL,0,0,'2017-05-19 10:59:40','2017-05-19 10:59:40',1,1),(1067795361596676619,1,1067795300434287111,'uk_sysTokenSign','令牌签名',3,NULL,'令牌签名不能重复！',NULL,0,0,'2017-05-19 11:03:12','2017-05-19 11:03:12',1,1),(1067796151580203541,1,1067796056679881231,'uk_sysUserPosition','用户岗位',3,NULL,'用户岗位不能重复！',NULL,0,0,'2017-05-19 11:15:45','2017-05-19 11:15:45',1,1),(1067796461723818529,1,1067796327340415515,'uk_sysUserRole','用户角色',3,NULL,'用户角色不能重复！',NULL,0,0,'2017-05-19 11:20:41','2017-05-19 11:20:41',1,1);
INSERT INTO `sys_meta_constraint_detail` VALUES (1067163513371335990,1,1067051767457441934,1066770029490443542,NULL,NULL,1,0,'2017-05-12 11:40:15','2017-05-12 11:40:15',1,1),(1067594942169327466,1,1067051767457441934,1066770029490443542,NULL,NULL,0,0,'2017-05-17 05:57:37','2017-05-17 05:57:37',1,1),(1067603786637756078,1,1067602985768961708,1067403246977476710,NULL,NULL,0,0,'2017-05-17 08:18:12','2017-05-17 08:18:12',1,1),(1067688953047029880,1,1067688792153528430,1067688854670678128,NULL,NULL,0,0,'2017-05-18 06:51:53','2017-05-18 06:51:53',1,1),(1067688963621918842,1,1067688792153528430,1067688895726622834,NULL,NULL,0,0,'2017-05-18 06:52:03','2017-05-18 06:52:03',1,1),(1067688971061565564,1,1067688792153528430,1067688942988040310,NULL,NULL,0,0,'2017-05-18 06:52:10','2017-05-18 06:52:10',1,1),(1067691223736379974,1,1067690393967804575,1067690284835160219,NULL,NULL,0,0,'2017-05-18 07:27:58','2017-05-18 07:27:58',1,1),(1067691626523064452,1,1067690393967804575,1067690320226697373,NULL,NULL,0,0,'2017-05-18 07:34:22','2017-05-18 07:34:22',1,1),(1067760202659492516,1,1067760194832921250,1067760050317128350,NULL,NULL,0,0,'2017-05-19 01:44:22','2017-05-19 01:44:22',1,1),(1067760282589295272,1,1067760274859192998,1067760085580739232,NULL,NULL,0,0,'2017-05-19 01:45:38','2017-05-19 01:45:38',1,1),(1067768098800218984,1,1067768083467940710,1067767999136215908,NULL,NULL,0,0,'2017-05-19 03:49:52','2017-05-19 03:49:52',1,1),(1067768106282857322,1,1067768083467940710,1067767966694323042,NULL,NULL,0,0,'2017-05-19 03:49:59','2017-05-19 03:49:59',1,1),(1067768608760476532,1,1067768591641424754,1067768530556629872,NULL,NULL,0,0,'2017-05-19 03:57:59','2017-05-19 03:57:59',1,1),(1067768616032351094,1,1067768591641424754,1067768477768168302,NULL,NULL,0,0,'2017-05-19 03:58:05','2017-05-19 03:58:05',1,1),(1067782230409451828,1,1067782219608070450,1067782147843529008,NULL,NULL,0,0,'2017-05-19 07:34:29','2017-05-19 07:34:29',1,1),(1067782685728414012,1,1067782679369849146,1067782639571147064,NULL,NULL,0,0,'2017-05-19 07:41:43','2017-05-19 07:41:43',1,1),(1067783498621229380,1,1067783492708309314,1067783456243030336,NULL,NULL,0,0,'2017-05-19 07:54:39','2017-05-19 07:54:39',1,1),(1067783928023587150,1,1067783919830014284,1067783856847296842,NULL,NULL,0,0,'2017-05-19 08:01:28','2017-05-19 08:01:28',1,1),(1067783932604815696,1,1067783919830014284,1067783807616653640,NULL,NULL,0,0,'2017-05-19 08:01:32','2017-05-19 08:01:32',1,1),(1067784757342345562,1,1067784749990779224,1067784707739457878,NULL,NULL,0,0,'2017-05-19 08:14:39','2017-05-19 08:14:39',1,1),(1067784761528260956,1,1067784749990779224,1067784677515303252,NULL,NULL,0,0,'2017-05-19 08:14:43','2017-05-19 08:14:43',1,1),(1067785317269346660,1,1067785310586771810,1067785268867078496,NULL,NULL,0,0,'2017-05-19 08:23:33','2017-05-19 08:23:33',1,1),(1067786027831630190,1,1067786014590212460,1067785915305793896,NULL,NULL,0,0,'2017-05-19 08:34:51','2017-05-19 08:34:51',1,1),(1067786031590775152,1,1067786014590212460,1067785954462767466,NULL,NULL,0,0,'2017-05-19 08:34:54','2017-05-19 08:34:54',1,1),(1067786488121891192,1,1067786481557805430,1067786426486593908,NULL,NULL,0,0,'2017-05-19 08:42:10','2017-05-19 08:42:10',1,1),(1067786907575359872,1,1067786900685166974,1067786829416601980,NULL,NULL,0,0,'2017-05-19 08:48:50','2017-05-19 08:48:50',1,1),(1067787493584640396,1,1067787485679425930,1067787416108505480,NULL,NULL,0,0,'2017-05-19 08:58:08','2017-05-19 08:58:08',1,1),(1067787497588103566,1,1067787485679425930,1067787378329360774,NULL,NULL,0,0,'2017-05-19 08:58:12','2017-05-19 08:58:12',1,1),(1067787502440913296,1,1067787485679425930,1067787323379784068,NULL,NULL,0,0,'2017-05-19 08:58:17','2017-05-19 08:58:17',1,1),(1067787919247776152,1,1067787913181763990,1067787850899495316,NULL,NULL,0,0,'2017-05-19 09:04:54','2017-05-19 09:04:54',1,1),(1067788551266474400,1,1067788542363015582,1067788502286440860,NULL,NULL,0,0,'2017-05-19 09:14:57','2017-05-19 09:14:57',1,1),(1067789211259083178,1,1067789203999791528,1067789071282575780,NULL,NULL,0,0,'2017-05-19 09:25:27','2017-05-19 09:25:27',1,1),(1067789214877718956,1,1067789203999791528,1067789130161166758,NULL,NULL,0,0,'2017-05-19 09:25:30','2017-05-19 09:25:30',1,1),(1067789638062021046,1,1067789630634957236,1067789545883802032,NULL,NULL,0,0,'2017-05-19 09:32:14','2017-05-19 09:32:14',1,1),(1067789643235695032,1,1067789630634957236,1067789575791286706,NULL,NULL,0,0,'2017-05-19 09:32:19','2017-05-19 09:32:19',1,1),(1067789946602363328,1,1067789939451075006,1067789897646447036,NULL,NULL,0,0,'2017-05-19 09:37:08','2017-05-19 09:37:08',1,1),(1067792224065395147,1,1067792217071393225,1067792155081677253,NULL,NULL,0,0,'2017-05-19 10:13:20','2017-05-19 10:13:20',1,1),(1067792228773501389,1,1067792217071393225,1067792183642790343,NULL,NULL,0,0,'2017-05-19 10:13:24','2017-05-19 10:13:24',1,1),(1067792463610485205,1,1067792457281280467,1067792401360722385,NULL,NULL,0,0,'2017-05-19 10:17:08','2017-05-19 10:17:08',1,1),(1067792676767111645,1,1067792670170520027,1067792633315170777,NULL,NULL,0,0,'2017-05-19 10:20:32','2017-05-19 10:20:32',1,1),(1067793166712150501,1,1067793160265505251,1067793124635941345,NULL,NULL,0,0,'2017-05-19 10:28:19','2017-05-19 10:28:19',1,1),(1067793400998631917,1,1067793395101440491,1067793360660961769,NULL,NULL,0,0,'2017-05-19 10:32:02','2017-05-19 10:32:02',1,1),(1067793655802599925,1,1067793649774336499,1067793597609777649,NULL,NULL,0,0,'2017-05-19 10:36:05','2017-05-19 10:36:05',1,1),(1067793861186132477,1,1067793854851684859,1067793823338830329,NULL,NULL,0,0,'2017-05-19 10:39:21','2017-05-19 10:39:21',1,1),(1067795145758841349,1,1067795139563854339,1067795095032928769,NULL,NULL,0,0,'2017-05-19 10:59:46','2017-05-19 10:59:46',1,1),(1067795369505036813,1,1067795361596676619,1067795328310680073,NULL,NULL,0,0,'2017-05-19 11:03:20','2017-05-19 11:03:20',1,1),(1067796158715763223,1,1067796151580203541,1067796119413037587,NULL,NULL,0,0,'2017-05-19 11:15:52','2017-05-19 11:15:52',1,1),(1067796165980297753,1,1067796151580203541,1067796086259161617,NULL,NULL,0,0,'2017-05-19 11:15:59','2017-05-19 11:15:59',1,1),(1067796470206798371,1,1067796461723818529,1067796383118367261,NULL,NULL,0,0,'2017-05-19 11:20:49','2017-05-19 11:20:49',1,1),(1067796474889738789,1,1067796461723818529,1067796412965034527,NULL,NULL,0,0,'2017-05-19 11:20:54','2017-05-19 11:20:54',1,1);

/*** 唯一约束元数据 end ***/

/*** druid附属权限 start ***/
INSERT INTO `sys_auth` VALUES (1068058186915200682, 1, 'sysDruidMonitor:attachAuth', 'druid监控:附属权限', '', '', 1058615343450023223, 2, 1060512414373153244, 1, '', NULL, '/druid;\r\n/druid/%s;\r\n/druid/%s/%s;\r\n/druid/%s/%s/%s;\r\n/druid/%s/%s/%s/%s;\r\n/druid/%s/%s/%s/%s/%s;', 1, 1, '', '', 0, 0, '2017-5-22 16:40:42', '2017-5-22 16:40:42', 1, 1, NULL, 1);
INSERT INTO `sys_auth_join` VALUES (1068058229240970924, 1058615553282663736, 1068058186915200682, 0, '2017-5-22 16:41:22', 1);

/*** druid附属权限 end ***/

/*** 元数据管理 start ***/

update sys_model set SORT_NO_ = 3 where MODEL_ID_ = 01066770861760943391;
UPDATE sys_model set MODEL_NAME_ = '实体字段管理', FID_ = 1066770481759098136, SORT_NO_ = 2 where MODEL_ID_ = 01052481647455311299;
UPDATE sys_model set STYLE_='icon_auto_blue__integral', BS_STYLE_ = 'fa fa-database' where MODEL_ID_ = 01052481647455311299;

update sys_auth set auth_name_ = '实体字段管理:访问' where AUTH_ID_ = 01053269288410286645;
update sys_model set FID_ = 1052481646805194176, IS_TOP_MENU_ = 0,IS_SUB_MENU_ = 1, IS_BS_TOP_MENU_ = 0, IS_BS_SUB_MENU_ = 1 where MODEL_ID_ = 01060536269074462439;
update sys_model set SORT_NO_ = 3, STYLE_ = 'icon_auto_blue__filter', BS_STYLE_ = 'fa fa-filter' where MODEL_ID_ = 01060536269074462439;
update sys_model set MODEL_NAME_='过滤器项配置' where MODEL_ID_ = 01060536269074462439;
update sys_auth set AUTH_NAME_ = '过滤器项管理:访问' where AUTH_ID_ = 1060539272757114664;

INSERT INTO `sys_dict_group` (`DICT_GROUP_ID_`,`TENANT_ID_`,`DICT_GROUP_CODE_`,`GROUP_TYPE_`,`GROUP_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066982789165309217,1,'sysFieldType',NULL,'字段类型',NULL,NULL,'（不要删除）',0,1,'2017-05-10 19:47:43','2017-05-10 19:56:56',1,1);

INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`,`TENANT_ID_`,`DICT_GROUP_ID_`,`ITEM_VALUE_`,`ITEM_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`IS_VISIBLE_`,`SORT_NO_`,`PRIORITY_NO_`,`SUB_GROUP_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066982825938869531,1,1066982789165309217,'NumberField','数值型字段',NULL,NULL,1,1,1,'1',NULL,0,1,'2017-05-10 19:56:33','2017-05-10 19:56:28',1,1);
INSERT INTO `sys_dict_item` (`DICT_ITEM_ID_`,`TENANT_ID_`,`DICT_GROUP_ID_`,`ITEM_VALUE_`,`ITEM_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`IS_VISIBLE_`,`SORT_NO_`,`PRIORITY_NO_`,`SUB_GROUP_CODE_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`) VALUES (1066982853787999522,1,1066982789165309217,'StringField','字符型字段',NULL,NULL,1,2,2,'2',NULL,0,1,'2017-05-10 19:56:19','2017-05-10 19:56:15',1,1);

INSERT INTO `sys_auth` VALUES (1068213102472182993, 1, 'filterItem_sysMetadata:entityFieldView', '过滤器项_实体字段:访问', '', '', 1052481647455311299, 2, 1060512414373153244, 1, '', NULL, '/sys/sysMetadata/metadataEntityFilterItemView;\r\n/sys/sysMetadata/metadataFieldFilterItemView;', 901, 1, '', '', 0, 0, '2017-5-24 09:43:01', '2017-5-24 09:48:57', 1, 1, NULL, 1);
INSERT INTO `sys_auth` VALUES (1068213411453975770, 1, 'constraint_sysMetadata:entityFieldView', '约束_实体字段:访问', '', '', 1052481647455311299, 2, 1060512414373153244, 1, '', NULL, '/sys/sysMetadata/metadataEntityConstraintView;\r\n/sys/sysMetadata/metadataFieldConstraintView', 902, 1, '', '', 0, 0, '2017-5-24 09:47:55', '2017-5-24 09:49:25', 1, 1, NULL, 1);

INSERT INTO `sys_auth_join` VALUES (1068213559799168224, 1060539272757114664, 1068213102472182993, 0, '2017-5-24 09:50:17', 1);
INSERT INTO `sys_auth_join` VALUES (1068213583763324130, 1066770920083789089, 1068213411453975770, 0, '2017-5-24 09:50:40', 1);
INSERT INTO `sys_auth_join` VALUES (1068216822677547191, 1066770920083789089, 1060532813148321476, 0, '2017-5-24 10:42:09', 1);
INSERT INTO `sys_auth_join` VALUES (1068216822673352886, 1066770920083789089, 1060535863639406298, 0, '2017-5-24 10:42:09', 1);

INSERT INTO `sys_auth_join` VALUES (1068214107495901287, 1060539272757114664, 1060532813148321476, 0, '2017-5-24 09:58:59', 1);
INSERT INTO `sys_auth_join` VALUES (1068214107491706982, 1060539272757114664, 1060535863639406298, 0, '2017-5-24 09:58:59', 1);

delete from sys_auth_join where ATTACH_AUTH_ID_  = 01060540484947670858;
INSERT INTO `sys_auth_join` VALUES (1068215709021677708, 1060539272757114664, 1060540484947670858, 0, '2017-5-24 10:24:27', 1);
INSERT INTO `sys_auth_join` VALUES (1068216299643644054, 1060539272757114664, 1060540564383594317, 0, '2017-5-24 10:33:50', 1);

INSERT INTO `sys_auth_join` VALUES (1068219194696753288, 1053269288410286645, 1060531956747990677, 0, '2017-5-24 11:19:51', 1);

update sys_metadata_field set FILTER_TYPE_ID_ = 1054555696913873885 where COLUMN_NAME_ not like '%ID_%';
update sys_metadata_field set FILTER_TYPE_ID_ = 1054555673109101532 where COLUMN_NAME_ like '%ID_%';
update sys_metadata_field set FILTER_TYPE_ID_ = 1054555673109101532 where COLUMN_NAME_ in ('VERSION_', 'VALUE_TYPE_');

update sys_metadata_entity
set TABLE_ALIAS_ = CONCAT(left(table_name_,1),left(substring_index(table_name_,'_',-1),1))
where LENGTH(table_name_)-length(REPLACE(table_name_,'_','')) = 1;


update sys_metadata_entity
set TABLE_ALIAS_ = CONCAT(left(table_name_,1),left(substring_index(table_name_,'_',-2),1), left(substring_index(table_name_,'_',-1),1))
where LENGTH(table_name_)-length(REPLACE(table_name_,'_','')) = 2;


update sys_metadata_entity
set TABLE_ALIAS_ = CONCAT(left(table_name_,1),left(substring_index(table_name_,'_',-3),1), left(substring_index(table_name_,'_',-2),1), left(substring_index(table_name_,'_',-1),1))
where LENGTH(table_name_)-length(REPLACE(table_name_,'_','')) = 3;

INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068491236841899401,1,'sysConstraintDefList','约束定义:列表','','',1066770861760943391,2,1060262570224060575,1,'',NULL,'/sys/meta/constraintList',1,1,'','',0,0,'2017-05-27 11:23:50','2017-05-27 11:32:54',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068491379960989069,1,'sysConstraintDefAbout','约束定义:关于','','',1066770861760943391,2,1060512414373153244,1,'',NULL,'/sys/meta/aboutDef',2,1,'','',0,0,'2017-05-27 11:26:07','2017-05-27 11:26:07',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068491641576506767,1,'sysConstrainDefAllList','约束定义:全部列表','','',1066770861760943391,2,1060262570224060575,1,'',NULL,'/sys/meta/getDefList',3,1,'','',0,0,'2017-05-27 11:30:16','2017-05-27 11:30:16',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068491783701546385,1,'sysConstraintDetailList','约束字段:列表','','',1066770861760943391,2,1060262570224060575,1,'',NULL,'/sys/meta/constraintDetailList',4,1,'','',0,0,'2017-05-27 11:32:32','2017-05-27 11:32:32',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068491877466260884,1,'sysConstraintDetailAbout','约束字段:关于','','',1066770861760943391,2,1060512414373153244,1,'',NULL,'/sys/meta/aboutDetail',5,1,'','',0,0,'2017-05-27 11:34:01','2017-05-27 11:34:01',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068492077929874847,1,'sysConstraintDef:add','约束定义:新增','','',1066770861760943391,1,1052481659203557933,1,'',NULL,'/sys/meta/addDef',2,1,'','',0,0,'2017-05-27 11:37:12','2017-05-27 11:37:12',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068492132623599009,1,'sysConstraintDef:update','约束定义:修改','','',1066770861760943391,1,1052481659203557963,1,'',NULL,'/sys/meta/updateDef',3,1,'','',0,0,'2017-05-27 11:38:05','2017-05-27 11:38:05',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068492181048935843,1,'sysConstraintDef:del','约束定义:删除','','',1066770861760943391,1,1052481659203558275,1,'',NULL,'/sys/meta/delDef',4,1,'','',0,0,'2017-05-27 11:38:51','2017-05-27 11:38:51',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068492242982028709,1,'sysConstraintDetail:add','约束字段:新增','','',1066770861760943391,1,1052481659203557933,1,'',NULL,'/sys/meta/addDetail',5,1,'','',0,0,'2017-05-27 11:39:50','2017-05-27 11:39:50',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068492318879008167,1,'sysConstraintDetail:update','约束字段:修改','','',1066770861760943391,1,1052481659203557963,1,'',NULL,'/sys/meta/updateDetail',6,1,'','',0,0,'2017-05-27 11:41:02','2017-05-27 11:41:02',1,1,NULL,1);
INSERT INTO `sys_auth` (`AUTH_ID_`,`TENANT_ID_`,`AUTH_CODE_`,`AUTH_NAME_`,`ENG_NAME_`,`I18N_CODE_`,`MODEL_ID_`,`AUTH_CATEGORY_`,`OPERATION_ID_`,`IS_INHERITABLE_`,`STYLE_`,`BS_STYLE_`,`URI_`,`SORT_NO_`,`IS_VISIBLE_`,`TIP_`,`DESCR_`,`IS_DELETE_`,`IS_FINAL_`,`CRT_TIME_`,`UPD_TIME_`,`CRT_USER_ID_`,`UPD_USER_ID_`,`ICON_ID_`,`IS_PUBLIC`) VALUES (1068492373356725673,1,'sysConstraintDetail:del','约束字段:删除','','',1066770861760943391,1,1052481659203558275,1,'',NULL,'/sys/meta/delDetail',8,1,'','',0,0,'2017-05-27 11:41:54','2017-05-27 11:41:54',1,1,NULL,1);


INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`,`MAIN_AUTH_ID_`,`ATTACH_AUTH_ID_`,`IS_FINAL_`,`CRT_TIME_`,`CRT_USER_ID_`) VALUES (1068491957937128857,1066770920083789089,1068491236841899401,0,'2017-05-27 11:35:18',1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`,`MAIN_AUTH_ID_`,`ATTACH_AUTH_ID_`,`IS_FINAL_`,`CRT_TIME_`,`CRT_USER_ID_`) VALUES (1068491957943420314,1066770920083789089,1068491379960989069,0,'2017-05-27 11:35:18',1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`,`MAIN_AUTH_ID_`,`ATTACH_AUTH_ID_`,`IS_FINAL_`,`CRT_TIME_`,`CRT_USER_ID_`) VALUES (1068491957950760347,1066770920083789089,1068491641576506767,0,'2017-05-27 11:35:18',1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`,`MAIN_AUTH_ID_`,`ATTACH_AUTH_ID_`,`IS_FINAL_`,`CRT_TIME_`,`CRT_USER_ID_`) VALUES (1068491957957051804,1066770920083789089,1068491783701546385,0,'2017-05-27 11:35:18',1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`,`MAIN_AUTH_ID_`,`ATTACH_AUTH_ID_`,`IS_FINAL_`,`CRT_TIME_`,`CRT_USER_ID_`) VALUES (1068491957962294685,1066770920083789089,1068491877466260884,0,'2017-05-27 11:35:18',1);


/*** 元数据管理 end ***/
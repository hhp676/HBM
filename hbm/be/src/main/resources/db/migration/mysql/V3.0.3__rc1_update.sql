/*
 * update for V3.0.3-rc1
 */
/**修改版本号***/
update sys_config set CONFIG_VALUE_ = 'V3.0.3-RC1' where CONFIG_KEY_ = 'sysVersion';

-- 任务中心sql
INSERT INTO sys_config (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_,  CRT_USER_ID_, UPD_USER_ID_) VALUES (1070299965235607514, 1, 'sysTaskWebSocketTimer', '10', '任务中心推送间隔秒值(需填正整数,0为不推送)', 'sys', '0', 23, 1, 1, NULL, 0, 0,  1, 1);
-- 任务中心建表语句
CREATE TABLE `sys_task` (
  `TASK_ID_` bigint(20) NOT NULL COMMENT '主键',
  `BUSINESS_ID_` bigint(20) NOT NULL COMMENT '业务数据主键',
  `TASK_TYPE_ID_` bigint(20) DEFAULT NULL COMMENT '任务类型ID',
  `TASK_NAME_` varchar(64) DEFAULT NULL COMMENT '任务名称',
  `CROSSDOMAIN_APPURL_` varchar(128) DEFAULT NULL COMMENT '跨域应用地址,本机时不需填写',
  `TASK_HANDLE_URL_` varchar(2048) DEFAULT NULL COMMENT '任务办理url',
  `TASK_VIEW_URL_` varchar(2048) DEFAULT NULL COMMENT '任务查看url',
  `TASK_CRT_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务添加时间',
  `TASK_END_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务办理时限',
  `TASK_LATER_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务延时后时限',
  `TASK_STATUS_` varchar(64) DEFAULT NULL COMMENT '任务状态',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

CREATE TABLE `sys_task_handler` (
  `TASK_HANDLER_ID_` bigint(20) NOT NULL COMMENT '主键',
  `TASK_ID_` bigint(20) NOT NULL COMMENT '任务表主键',
  `USER_ID_` bigint(20) NOT NULL COMMENT '人员表主键',
  PRIMARY KEY (`TASK_HANDLER_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务办理人表';

CREATE TABLE `sys_task_handle_log` (
  `TASK_HANDLE_LOG_ID_` bigint(20) NOT NULL COMMENT '主键',
  `TASK_ID_` bigint(20) NOT NULL COMMENT '任务表主键',
  `USER_ID_` bigint(20) DEFAULT NULL COMMENT '人员表主键',
  `TASK_HANDLE_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务处理时间',
  `TASK_HANDLE_TYPE_` varchar(64) DEFAULT NULL COMMENT '任务处理类型',
  `DESCR_` text COMMENT '描述',
  PRIMARY KEY (`TASK_HANDLE_LOG_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务办理日志';

CREATE TABLE `sys_task_type` (
  `TASK_TYPE_ID_` bigint(20) NOT NULL COMMENT '主键',
  `TASK_TYPE_CODE_` varchar(64) DEFAULT NULL COMMENT '任务类型编码',
  `TASK_TYPE_NAME_` varchar(64) DEFAULT NULL COMMENT '任务类型名称',
  `HANDLE_WIN_HEIGHT_` int(8) DEFAULT NULL COMMENT '任务办理弹窗高度',
  `HANDLE_WIN_WIDTH_` int(8) DEFAULT NULL COMMENT '任务办理弹窗宽度',
  `TASK_HANDLE_MODE_` tinyint(4) DEFAULT NULL COMMENT '任务办理方式(0:winform,1:newwindow)',
  `DESCR_` text COMMENT '描述',
  `IS_DELETE_` tinyint(4) DEFAULT '0' COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`TASK_TYPE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务类型表';

-- 任务中心模块权限
-- 删除错误的菜单配置
DELETE FROM Sys_Role_Auth WHERE auth_id_ IN(SELECT auth_id_ FROM Sys_Auth WHERE model_id_ = 1052481659203556833);
DELETE FROM Sys_Auth WHERE model_id_ = 1052481659203556833;
DELETE FROM sys_model WHERE MODEL_ID_ = 1052481659203556833;
-- 模块
INSERT INTO `sys_model` (`MODEL_ID_`, `TENANT_ID_`, `MODEL_CODE_`, `MODEL_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `FID_`, `STYLE_`, `BS_STYLE_`, `IS_TOP_MENU_`, `IS_SUB_MENU_`, `IS_BS_TOP_MENU_`, `IS_BS_SUB_MENU_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `MODEL_TYPE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`) VALUES (1052481659203556833, 1, 'sysMyTask', '待办任务', '', 'sysMyTask', 1052481658842846688, 'icon_auto_blue__remind', NULL, 0, 1, 0, 1, '/sys/sysTask/myTask/', 181, 1, '', 0, '', 0, 0, '2016-12-1 18:18:27', '2017-6-19 15:55:48', 1, 1, NULL);
INSERT INTO `sys_model` (`MODEL_ID_`, `TENANT_ID_`, `MODEL_CODE_`, `MODEL_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `FID_`, `STYLE_`, `BS_STYLE_`, `IS_TOP_MENU_`, `IS_SUB_MENU_`, `IS_BS_TOP_MENU_`, `IS_BS_SUB_MENU_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `MODEL_TYPE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`) VALUES (1070234276045852458, 1, 'taskHistory', '已办任务', '', '', 1052481658842846688, 'icon_auto_blue__rejected-order', NULL, 0, 1, 0, 0, '', 182, 1, '', NULL, '', 0, 0, '2017-6-15 17:08:42', '2017-6-19 15:56:35', 1, 1, NULL);
-- 权限
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1053269295116978855, 1, 'sysTask:view', '待办任务:访问', 'sysTask:view', 'sysTask.view', 1052481659203556833, 1, 1052481659203556933, 0, '', NULL, '/sys/sysTask/view', 173, 1, '', '', 0, 0, '2016-12-10 10:57:36', '2017-6-12 09:48:57', 1, 1, NULL, 1);
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1070234741027442478, 1, 'taskHistory:view', 'taskHistory:view', '', '', 1070234276045852458, 1, 1052481659203556933, 0, '', NULL, '/sys/sysTask/taskHistoryView', 0, 1, '', '', 0, 0, '2017-6-15 17:16:06', '2017-6-15 17:16:06', 1, 1, NULL, 1);
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1070587318650416325, 1, 'sysTask:getDoTasklist', '查询待办任务列表', '', '', 1052481659203556833, 2, 1060262570224060575, 0, '', NULL, '/sys/sysTask/getDoTasklist', 0, 1, '', '', 0, 0, '2017-6-19 14:40:10', '2017-6-19 15:12:07', 1, 1, NULL, 1);
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1070587427993824455, 1, 'sysTask:getSysTaskTypeList', '待办任务类型查询', '', '', 1052481659203556833, 2, 1060262570224060575, 0, '', NULL, '/sys/sysTaskType/getSysTaskTypeList', 1, 1, '', '', 0, 0, '2017-6-19 14:41:54', '2017-6-19 14:41:54', 1, 1, NULL, 1);
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1070588422649949385, 1, 'sysTask:crossDomainWin', '任务中心:跨域弹窗', '', '', 1052481659203556833, 2, 1060512414373153244, 0, '', NULL, '/sys/sysTask/taskCrossDomainWin%s', 2, 1, '', '', 0, 0, '2017-6-19 14:57:43', '2017-6-19 14:57:43', 1, 1, NULL, 1);
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1070591118113749537, 1, 'sysTaskHistory:getHistoryTasklist', '任务历史:列表查询', '', '', 1070234276045852458, 2, 1060262570224060575, 0, '', NULL, '/sys/sysTask/getHistoryTasklist', 0, 1, '', '', 0, 0, '2017-6-19 15:40:33', '2017-6-19 15:40:33', 1, 1, NULL, 1);
-- 主从权限
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1070588460363033803, 1053269295116978855, 1070587318650416325, 0, '2017-6-19 14:58:19', 1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1070588460403928268, 1053269295116978855, 1070587427993824455, 0, '2017-6-19 14:58:19', 1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1070588460411268301, 1053269295116978855, 1070588422649949385, 0, '2017-6-19 14:58:19', 1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1070591159632116259, 1070234741027442478, 1070591118113749537, 0, '2017-6-19 15:41:13', 1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1070591159640504868, 1070234741027442478, 1070587427993824455, 0, '2017-6-19 15:41:13', 1);
INSERT INTO `sys_auth_join` (`AUTH_JOIN_ID_`, `MAIN_AUTH_ID_`, `ATTACH_AUTH_ID_`, `IS_FINAL_`, `CRT_TIME_`, `CRT_USER_ID_`) VALUES (1070591159649942053, 1070234741027442478, 1070588422649949385, 0, '2017-6-19 15:41:13', 1);

/*** 默认启用验证码登录 ***/
update sys_config set CONFIG_VALUE_=0 where CONFIG_KEY_='sysLoginVerifCode' and IS_CURRENT_=1;

/*** SRV ***/

CREATE TABLE `srv_interface` (
  `IF_ID_` bigint(20) NOT NULL COMMENT '主键',
  `REQ_URI_` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `REQ_METHOD` varchar(6) DEFAULT NULL COMMENT '请求方法类型',
  `ENABLED_` tinyint(4) DEFAULT '1' COMMENT '是否可用(1:是;0:否)',
  `IF_SWITCH_` tinyint(4) DEFAULT '1' COMMENT '开关(1:开;0:关)',
  `CLASS_NAME_` varchar(200) DEFAULT NULL COMMENT '类名',
  `METHOD_NAME_` varchar(100) DEFAULT NULL COMMENT '方法名',
  `PARAMETERS_` varchar(255) DEFAULT NULL COMMENT '参数类型',
  `DESCR_` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `IS_DELETE_` tinyint(4) DEFAULT NULL COMMENT '删除标识(1:已删除;0:正常)',
  `IS_FINAL_` tinyint(4) DEFAULT '0' COMMENT '是否不可修改(1:不可修改;0:可修改)',
  `CRT_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPD_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `CRT_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据创建用户编号',
  `UPD_USER_ID_` bigint(20) DEFAULT NULL COMMENT '数据修改用户编号',
  PRIMARY KEY (`IF_ID_`),
  KEY `CRT_TIME_` (`CRT_TIME_`),
  KEY `CLASS_NAME_` (`CLASS_NAME_`,`METHOD_NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口表';


CREATE TABLE `srv_log` (
  `LOG_ID_` bigint(20) NOT NULL COMMENT '主键',
  `IF_ID_` bigint(20) DEFAULT NULL COMMENT '接口主键',
  `REQ_TYPE_` varchar(6) DEFAULT NULL COMMENT '请求方法类型',
  `REQ_URI_` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `REQ_USERID_` bigint(20) DEFAULT NULL COMMENT '请求用户',
  `BEGIN_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '请求开始时间',
  `END_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '请求结束时间',
  `PROCESS_TIME_` int(11) DEFAULT NULL COMMENT '处理时间（毫秒）',
  `CONSUMER_IP_` varchar(50) DEFAULT NULL COMMENT '消费者机器IP',
  `PROVIDER_IP_` varchar(50) DEFAULT NULL COMMENT '提供者机器IP',
  `IP_` varchar(50) DEFAULT NULL COMMENT '客户端请求IP',
  `RESULT_` tinyint(4) DEFAULT NULL COMMENT '结果(1:成功;0:失败)',
  PRIMARY KEY (`LOG_ID_`),
  KEY `IF_ID_` (`IF_ID_`),
  KEY `BEGIN_TIME_` (`BEGIN_TIME_`),
  KEY `PROCESS_TIME_` (`PROCESS_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口日志表';

CREATE TABLE `srv_log_ext` (
  `LOG_EXT_ID_` bigint(20) NOT NULL COMMENT '日志ID',
  `PARAMETER_` text COMMENT '请求参数',
  `RESPONSE_` mediumtext COMMENT '页面返回结果',
  PRIMARY KEY (`LOG_EXT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口日志扩展表';


/*工作流demo*/
INSERT INTO `sys_model` (`MODEL_ID_`, `TENANT_ID_`, `MODEL_CODE_`, `MODEL_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `FID_`, `STYLE_`, `BS_STYLE_`, `IS_TOP_MENU_`, `IS_SUB_MENU_`, `IS_BS_TOP_MENU_`, `IS_BS_SUB_MENU_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `MODEL_TYPE_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`) VALUES (1071503232585737597, 1, 'workflowdemo', '工作流demo', 'workflowdemo', '', 1056745429913710559, 'icon_auto_blue__process', 'fa fa-users', 0, 1, 0, 1, '', 21, 1, '', NULL, '', 0, 0, '2017-6-29 17:18:13', '2017-6-29 20:18:12', 1, 1, NULL);
INSERT INTO `sys_auth` (`AUTH_ID_`, `TENANT_ID_`, `AUTH_CODE_`, `AUTH_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `MODEL_ID_`, `AUTH_CATEGORY_`, `OPERATION_ID_`, `IS_INHERITABLE_`, `STYLE_`, `BS_STYLE_`, `URI_`, `SORT_NO_`, `IS_VISIBLE_`, `TIP_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`, `ICON_ID_`, `IS_PUBLIC`) VALUES (1071503474793162112, 1, 'workflowDemo:view', '工作流demo:访问', '', '', 1071503232585737597, 1, 1052481659203556933, 1, '', NULL, '/common/demo/workflowDemo/workflowDemoView', 1, 1, '', '', 0, 0, '2017-6-29 17:22:04', '2017-6-29 17:22:04', 1, 1, NULL, 1);


/*** 增加字典项名约束 ***/
insert into `sys_metadata_entity` (`ENTITY_ID_`, `TENANT_ID_`, `ENTITY_CODE_`, `ENTITY_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `TABLE_NAME_`, `TABLE_ALIAS_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) values('1071584701398298387','1','sys_dic_item','系统字典项','sys_dic_item','','sys_dict_item','sdi','系统字典项','0','0','2017-06-30 14:53:08','2017-06-30 14:53:08','1','1');
insert into `sys_metadata_field` (`FIELD_ID_`, `TENANT_ID_`, `ENTITY_ID_`, `FILTER_TYPE_ID_`, `FIELD_CODE_`, `FIELD_NAME_`, `ENG_NAME_`, `I18N_CODE_`, `COLUMN_NAME_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) values('1071585192298589973','1','1071584701398298387','1054555696913873885','item_name','字典项名称','','','ITEM_NAME_','项名称','0','0','2017-06-30 15:00:56','2017-06-30 15:01:17','1','1');
insert into `sys_meta_constraint_def` (`DEF_ID_`, `TENANT_ID_`, `ENTITY_ID_`, `DEF_CODE_`, `DEF_NAME_`, `DEF_TYPE_`, `REF_ID_`, `ERROR_MSG_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) values('1071585313145925400','1','1071584701398298387','uk_sysDictItemName','字典项名称','3',NULL,'字典项名称不能重复',NULL,'0','0','2017-06-30 15:02:51','2017-06-30 15:06:15','1','1');
insert into `sys_meta_constraint_detail` (`DETAIL_ID_`, `TENANT_ID_`, `DEF_ID_`, `FIELD_ID_`, `REF_DETAIL_ID_`, `DESCR_`, `IS_DELETE_`, `IS_FINAL_`, `CRT_TIME_`, `UPD_TIME_`, `CRT_USER_ID_`, `UPD_USER_ID_`) values('1071585360832016154','1','1071585313145925400','1071585192298589973',NULL,NULL,'0','0','2017-06-30 15:03:37','2017-06-30 15:03:37','1','1');


/***图标配置***/
INSERT INTO `sys_icon` VALUES ('1071944428812411566','1','478','icon_auto_colorful_fullscreen','/static/images/icons/colorful/fullscreen.png',NULL,NULL,'','478','1','0','0','','2017-07-04 14:10:51','2017-07-04 14:10:51','1','1');

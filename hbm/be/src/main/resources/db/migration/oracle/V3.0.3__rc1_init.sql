----------------------------------------------------
-- Export file for user DB_HBM_DEV@LOCALHOST      --
-- Created by Administrator on 2017/6/1, 11:07:50 --
----------------------------------------------------

set define off
spool hbmtableinit0601.log

prompt
prompt Creating table JOB_JOB_DETAILS
prompt ==============================
prompt
create table JOB_JOB_DETAILS
(
  sched_name        VARCHAR2(120 CHAR) not null,
  job_name          VARCHAR2(200 CHAR) not null,
  job_group         VARCHAR2(200 CHAR) not null,
  description       VARCHAR2(250 CHAR),
  job_class_name    VARCHAR2(250 CHAR),
  is_durable        VARCHAR2(1 CHAR),
  is_nonconcurrent  VARCHAR2(1 CHAR),
  is_update_data    VARCHAR2(1 CHAR),
  requests_recovery VARCHAR2(1 CHAR),
  job_data          BLOB
)
;
alter table JOB_JOB_DETAILS
  add constraint PRIMARY_4 primary key (SCHED_NAME, JOB_NAME, JOB_GROUP);

prompt
prompt Creating table JOB_TRIGGERS
prompt ===========================
prompt
create table JOB_TRIGGERS
(
  sched_name     VARCHAR2(120 CHAR) not null,
  trigger_name   VARCHAR2(200 CHAR) not null,
  trigger_group  VARCHAR2(200 CHAR) not null,
  job_name       VARCHAR2(200 CHAR),
  job_group      VARCHAR2(200 CHAR),
  description    VARCHAR2(250 CHAR),
  next_fire_time NUMBER(24),
  prev_fire_time NUMBER(24),
  priority       NUMBER(10),
  trigger_state  VARCHAR2(16 CHAR),
  trigger_type   VARCHAR2(8 CHAR),
  start_time     NUMBER(24),
  end_time       NUMBER(24),
  calendar_name  VARCHAR2(200 CHAR),
  misfire_instr  NUMBER(5),
  job_data       BLOB
)
;
create index SCHED_NAME on JOB_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP);
alter table JOB_TRIGGERS
  add constraint PRIMARY_15 primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
alter table JOB_TRIGGERS
  add constraint JOB_TRIGGERS_IBFK_1 foreign key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  references JOB_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP);

prompt
prompt Creating table JOB_BLOB_TRIGGERS
prompt ================================
prompt
create table JOB_BLOB_TRIGGERS
(
  sched_name    VARCHAR2(120 CHAR) not null,
  trigger_name  VARCHAR2(200 CHAR) not null,
  trigger_group VARCHAR2(200 CHAR) not null,
  blob_data     BLOB
)
;
alter table JOB_BLOB_TRIGGERS
  add constraint PRIMARY primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
alter table JOB_BLOB_TRIGGERS
  add constraint JOB_BLOB_TRIGGERS_IBFK_1 foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table JOB_CALENDARS
prompt ============================
prompt
create table JOB_CALENDARS
(
  sched_name    VARCHAR2(120 CHAR) not null,
  calendar_name VARCHAR2(200 CHAR) not null,
  calendar      BLOB
)
;
alter table JOB_CALENDARS
  add constraint PRIMARY_61 primary key (SCHED_NAME, CALENDAR_NAME);

prompt
prompt Creating table JOB_CRON_TRIGGERS
prompt ================================
prompt
create table JOB_CRON_TRIGGERS
(
  sched_name      VARCHAR2(120 CHAR) not null,
  trigger_name    VARCHAR2(200 CHAR) not null,
  trigger_group   VARCHAR2(200 CHAR) not null,
  cron_expression VARCHAR2(200 CHAR),
  time_zone_id    VARCHAR2(80 CHAR)
)
;
alter table JOB_CRON_TRIGGERS
  add constraint PRIMARY_2 primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
alter table JOB_CRON_TRIGGERS
  add constraint JOB_CRON_TRIGGERS_IBFK_1 foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table JOB_FIRED_TRIGGERS
prompt =================================
prompt
create table JOB_FIRED_TRIGGERS
(
  sched_name        VARCHAR2(120 CHAR) not null,
  entry_id          VARCHAR2(95 CHAR) not null,
  trigger_name      VARCHAR2(200 CHAR),
  trigger_group     VARCHAR2(200 CHAR),
  instance_name     VARCHAR2(200 CHAR),
  fired_time        NUMBER(24),
  sched_time        NUMBER(24),
  priority          NUMBER(10),
  state             VARCHAR2(16 CHAR),
  job_name          VARCHAR2(200 CHAR),
  job_group         VARCHAR2(200 CHAR),
  is_nonconcurrent  VARCHAR2(1 CHAR),
  requests_recovery VARCHAR2(1 CHAR)
)
;
alter table JOB_FIRED_TRIGGERS
  add constraint PRIMARY_3 primary key (SCHED_NAME, ENTRY_ID);

prompt
prompt Creating table JOB_LOCKS
prompt ========================
prompt
create table JOB_LOCKS
(
  sched_name VARCHAR2(120 CHAR) not null,
  lock_name  VARCHAR2(40 CHAR) not null
)
;
alter table JOB_LOCKS
  add constraint PRIMARY_5 primary key (SCHED_NAME, LOCK_NAME);

prompt
prompt Creating table JOB_PAUSED_TRIGGER_GRPS
prompt ======================================
prompt
create table JOB_PAUSED_TRIGGER_GRPS
(
  sched_name    VARCHAR2(120 CHAR) not null,
  trigger_group VARCHAR2(200 CHAR) not null
)
;
alter table JOB_PAUSED_TRIGGER_GRPS
  add constraint PRIMARY_6 primary key (SCHED_NAME, TRIGGER_GROUP);

prompt
prompt Creating table JOB_SCHEDULER_STATE
prompt ==================================
prompt
create table JOB_SCHEDULER_STATE
(
  sched_name        VARCHAR2(120 CHAR) not null,
  instance_name     VARCHAR2(200 CHAR) not null,
  last_checkin_time NUMBER(24),
  checkin_interval  NUMBER(24)
)
;
alter table JOB_SCHEDULER_STATE
  add constraint PRIMARY_7 primary key (SCHED_NAME, INSTANCE_NAME);

prompt
prompt Creating table JOB_SIMPLE_TRIGGERS
prompt ==================================
prompt
create table JOB_SIMPLE_TRIGGERS
(
  sched_name      VARCHAR2(120 CHAR) not null,
  trigger_name    VARCHAR2(200 CHAR) not null,
  trigger_group   VARCHAR2(200 CHAR) not null,
  repeat_count    NUMBER(24),
  repeat_interval NUMBER(24),
  times_triggered NUMBER(24)
)
;
alter table JOB_SIMPLE_TRIGGERS
  add constraint PRIMARY_8 primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
alter table JOB_SIMPLE_TRIGGERS
  add constraint JOB_SIMPLE_TRIGGERS_IBFK_1 foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table JOB_SIMPROP_TRIGGERS
prompt ===================================
prompt
create table JOB_SIMPROP_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  str_prop_1    VARCHAR2(512),
  str_prop_2    VARCHAR2(512),
  str_prop_3    VARCHAR2(512),
  int_prop_1    NUMBER(10),
  int_prop_2    NUMBER(10),
  long_prop_1   NUMBER(13),
  long_prop_2   NUMBER(13),
  dec_prop_1    NUMBER(13,4),
  dec_prop_2    NUMBER(13,4),
  bool_prop_1   VARCHAR2(1),
  bool_prop_2   VARCHAR2(1)
)
;
alter table JOB_SIMPROP_TRIGGERS
  add constraint JOB_SIMPROP_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
alter table JOB_SIMPROP_TRIGGERS
  add constraint JOB_SIMPROP_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table JOB_TRIGGER_GROUP
prompt ================================
prompt
create table JOB_TRIGGER_GROUP
(
  id_           NUMBER(10) not null,
  app_name_     VARCHAR2(64 CHAR),
  title_        VARCHAR2(12 CHAR),
  order_        NUMBER(3) default '0',
  address_type_ NUMBER(3) default '0',
  address_list_ VARCHAR2(200 CHAR)
)
;
comment on column JOB_TRIGGER_GROUP.app_name_
  is '执行器AppName';
comment on column JOB_TRIGGER_GROUP.title_
  is '执行器名称';
comment on column JOB_TRIGGER_GROUP.order_
  is '排序';
comment on column JOB_TRIGGER_GROUP.address_type_
  is '执行器地址类型：0=自动注册、1=手动录入';
comment on column JOB_TRIGGER_GROUP.address_list_
  is '执行器地址列表，多地址逗号分隔';
alter table JOB_TRIGGER_GROUP
  add constraint PRIMARY_10 primary key (ID_);

prompt
prompt Creating table JOB_TRIGGER_INFO
prompt ===============================
prompt
create table JOB_TRIGGER_INFO
(
  id_                      NUMBER(10) not null,
  job_group_               NUMBER(10),
  job_cron_                VARCHAR2(128 CHAR),
  job_desc_                VARCHAR2(255 CHAR),
  add_time_                DATE,
  update_time_             DATE,
  author_                  VARCHAR2(64 CHAR),
  alarm_email_             VARCHAR2(255 CHAR),
  executor_route_strategy_ VARCHAR2(50 CHAR),
  executor_handler_        VARCHAR2(255 CHAR),
  executor_param_          VARCHAR2(255 CHAR),
  glue_type_               VARCHAR2(50 CHAR),
  glue_source_             CLOB,
  glue_remark_             VARCHAR2(128 CHAR),
  glue_updatetime_         DATE,
  child_jobkey_            VARCHAR2(255 CHAR)
)
;
comment on column JOB_TRIGGER_INFO.job_group_
  is '执行器主键ID';
comment on column JOB_TRIGGER_INFO.job_cron_
  is '任务执行CRON';
comment on column JOB_TRIGGER_INFO.author_
  is '作者';
comment on column JOB_TRIGGER_INFO.alarm_email_
  is '报警邮件';
comment on column JOB_TRIGGER_INFO.executor_route_strategy_
  is '执行器路由策略';
comment on column JOB_TRIGGER_INFO.executor_handler_
  is '执行器任务handler';
comment on column JOB_TRIGGER_INFO.executor_param_
  is '执行器任务参数';
comment on column JOB_TRIGGER_INFO.glue_type_
  is 'GLUE类型';
comment on column JOB_TRIGGER_INFO.glue_source_
  is 'GLUE源代码';
comment on column JOB_TRIGGER_INFO.glue_remark_
  is 'GLUE备注';
comment on column JOB_TRIGGER_INFO.glue_updatetime_
  is 'GLUE更新时间';
comment on column JOB_TRIGGER_INFO.child_jobkey_
  is '子任务Key';
alter table JOB_TRIGGER_INFO
  add constraint PRIMARY_11 primary key (ID_);

prompt
prompt Creating table JOB_TRIGGER_LOG
prompt ==============================
prompt
create table JOB_TRIGGER_LOG
(
  id_               NUMBER(10) not null,
  job_group_        NUMBER(10),
  job_id_           NUMBER(10),
  glue_type_        VARCHAR2(50 CHAR),
  executor_address_ VARCHAR2(255 CHAR),
  executor_handler_ VARCHAR2(255 CHAR),
  executor_param_   VARCHAR2(255 CHAR),
  trigger_time_     DATE,
  trigger_code_     VARCHAR2(255 CHAR),
  trigger_msg_      VARCHAR2(2048 CHAR),
  handle_time_      DATE,
  handle_code_      VARCHAR2(255 CHAR),
  handle_msg_       VARCHAR2(2048 CHAR)
)
;
comment on column JOB_TRIGGER_LOG.job_group_
  is '执行器主键ID';
comment on column JOB_TRIGGER_LOG.job_id_
  is '任务，主键ID';
comment on column JOB_TRIGGER_LOG.glue_type_
  is 'GLUE类型';
comment on column JOB_TRIGGER_LOG.executor_address_
  is '执行器地址，本次执行的地址';
comment on column JOB_TRIGGER_LOG.executor_handler_
  is '执行器任务handler';
comment on column JOB_TRIGGER_LOG.executor_param_
  is 'executor_param';
comment on column JOB_TRIGGER_LOG.trigger_time_
  is '调度-时间';
comment on column JOB_TRIGGER_LOG.trigger_code_
  is '调度-结果';
comment on column JOB_TRIGGER_LOG.trigger_msg_
  is '调度-日志';
comment on column JOB_TRIGGER_LOG.handle_time_
  is '执行-时间';
comment on column JOB_TRIGGER_LOG.handle_code_
  is '执行-状态';
comment on column JOB_TRIGGER_LOG.handle_msg_
  is '执行-日志';
alter table JOB_TRIGGER_LOG
  add constraint PRIMARY_12 primary key (ID_);

prompt
prompt Creating table JOB_TRIGGER_LOGGLUE
prompt ==================================
prompt
create table JOB_TRIGGER_LOGGLUE
(
  id_          NUMBER(10) not null,
  job_id_      NUMBER(10),
  glue_type_   VARCHAR2(50 CHAR),
  glue_source_ CLOB,
  glue_remark_ VARCHAR2(128 CHAR),
  add_time_    DATE,
  update_time_ DATE
)
;
comment on column JOB_TRIGGER_LOGGLUE.job_id_
  is '任务，主键ID';
comment on column JOB_TRIGGER_LOGGLUE.glue_type_
  is 'GLUE类型';
comment on column JOB_TRIGGER_LOGGLUE.glue_source_
  is 'GLUE源代码';
comment on column JOB_TRIGGER_LOGGLUE.glue_remark_
  is 'GLUE备注';
alter table JOB_TRIGGER_LOGGLUE
  add constraint PRIMARY_13 primary key (ID_);

prompt
prompt Creating table JOB_TRIGGER_REGISTRY
prompt ===================================
prompt
create table JOB_TRIGGER_REGISTRY
(
  id_             NUMBER(10) not null,
  registry_group_ VARCHAR2(255 CHAR),
  registry_key_   VARCHAR2(255 CHAR),
  registry_value_ VARCHAR2(255 CHAR),
  update_time_    DATE default SYSDATE
)
;
alter table JOB_TRIGGER_REGISTRY
  add constraint PRIMARY_14 primary key (ID_);

prompt
prompt Creating table SYS_ACCOUNT
prompt ==========================
prompt
create table SYS_ACCOUNT
(
  account_id_      NUMBER(24) not null,
  tenant_id_       NUMBER(3) default '1',
  user_id_         NUMBER(24),
  login_name_      VARCHAR2(128 CHAR),
  login_pwd_       VARCHAR2(256 CHAR),
  descr_           CLOB,
  is_valid_        NUMBER(3) default '1',
  is_lock_         NUMBER(3) default '0',
  last_login_ip_   VARCHAR2(64 CHAR),
  last_login_time_ DATE,
  last_pwd_change_ DATE,
  is_delete_       NUMBER(3) default '0',
  is_final_        NUMBER(3) default '0',
  crt_time_        DATE,
  upd_time_        DATE default SYSDATE,
  crt_user_id_     NUMBER(24),
  upd_user_id_     NUMBER(24)
)
;
comment on column SYS_ACCOUNT.account_id_
  is ' 登录账号编码';
comment on column SYS_ACCOUNT.tenant_id_
  is '租户ID';
comment on column SYS_ACCOUNT.user_id_
  is '用户ID';
comment on column SYS_ACCOUNT.login_name_
  is '登录名';
comment on column SYS_ACCOUNT.login_pwd_
  is '密码';
comment on column SYS_ACCOUNT.descr_
  is '描述';
comment on column SYS_ACCOUNT.is_valid_
  is '是否有效(1:有效;0:无效)';
comment on column SYS_ACCOUNT.is_lock_
  is '是否被锁定(1:锁定;0:正常)';
comment on column SYS_ACCOUNT.last_login_ip_
  is '最后登录IP';
comment on column SYS_ACCOUNT.last_login_time_
  is '最后登录时间';
comment on column SYS_ACCOUNT.last_pwd_change_
  is '上次密码修改时间';
comment on column SYS_ACCOUNT.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_ACCOUNT.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_ACCOUNT.crt_time_
  is '数据创建时间';
comment on column SYS_ACCOUNT.upd_time_
  is '数据最后修改时间';
comment on column SYS_ACCOUNT.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_ACCOUNT.upd_user_id_
  is '数据修改用户编号';
alter table SYS_ACCOUNT
  add constraint PRIMARY_16 primary key (ACCOUNT_ID_);

prompt
prompt Creating table SYS_ATTACHMENT
prompt =============================
prompt
create table SYS_ATTACHMENT
(
  att_id_      NUMBER(24) not null,
  tenant_id_   NUMBER(10) default '1',
  att_code_    VARCHAR2(64 CHAR),
  file_id_     NUMBER(24),
  biz_code_    VARCHAR2(64 CHAR),
  biz_id_      NUMBER(24),
  sub_biz_id_  NUMBER(24),
  att_name_    VARCHAR2(128 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE default SYSDATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24)
)
;
comment on column SYS_ATTACHMENT.att_id_
  is '附件编号';
comment on column SYS_ATTACHMENT.tenant_id_
  is '租户ID';
comment on column SYS_ATTACHMENT.att_code_
  is '附件编码';
comment on column SYS_ATTACHMENT.file_id_
  is '文件编号';
comment on column SYS_ATTACHMENT.biz_code_
  is '业务编码';
comment on column SYS_ATTACHMENT.biz_id_
  is '业务编号';
comment on column SYS_ATTACHMENT.sub_biz_id_
  is '子业务编号';
comment on column SYS_ATTACHMENT.att_name_
  is '附件名称';
comment on column SYS_ATTACHMENT.descr_
  is '描述';
comment on column SYS_ATTACHMENT.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_ATTACHMENT.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_ATTACHMENT.crt_time_
  is '数据创建时间';
comment on column SYS_ATTACHMENT.upd_time_
  is '数据最后修改时间';
comment on column SYS_ATTACHMENT.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_ATTACHMENT.upd_user_id_
  is '数据修改用户编号';
alter table SYS_ATTACHMENT
  add constraint PRIMARY_17 primary key (ATT_ID_);

prompt
prompt Creating table SYS_ICON
prompt =======================
prompt
create table SYS_ICON
(
  icon_id_      NUMBER(24) not null,
  icon_type_    VARCHAR2(32 CHAR),
  skin_code_    VARCHAR2(128 CHAR),
  icon_css_     VARCHAR2(128 CHAR),
  image_path_   VARCHAR2(256 CHAR),
  image_path_2_ VARCHAR2(256 CHAR),
  image_path_3_ VARCHAR2(256 CHAR),
  tip_          VARCHAR2(256 CHAR),
  sort_no_      NUMBER(10),
  is_visible    NUMBER(3) default '1',
  is_delete_    NUMBER(3) default '0',
  is_final_     NUMBER(3) default '0',
  descr_        CLOB,
  upd_time_     DATE,
  crt_time_     DATE,
  upd_user_id_  NUMBER(24),
  crt_user_id_  NUMBER(24)
)
;
comment on column SYS_ICON.icon_id_
  is 'ICON编号';
comment on column SYS_ICON.icon_type_
  is '类型，可用于区分不同的前端';
comment on column SYS_ICON.skin_code_
  is '皮肤编码';
comment on column SYS_ICON.icon_css_
  is 'css名称';
comment on column SYS_ICON.image_path_
  is '图片路径';
comment on column SYS_ICON.image_path_2_
  is '图片路径';
comment on column SYS_ICON.image_path_3_
  is '图片路径';
comment on column SYS_ICON.tip_
  is '提示信息';
comment on column SYS_ICON.sort_no_
  is '排序';
comment on column SYS_ICON.is_visible
  is '是否可见';
comment on column SYS_ICON.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_ICON.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_ICON.descr_
  is '描述';
comment on column SYS_ICON.upd_time_
  is '数据最后修改时间';
comment on column SYS_ICON.crt_time_
  is '数据创建时间';
comment on column SYS_ICON.upd_user_id_
  is '数据修改用户编号';
comment on column SYS_ICON.crt_user_id_
  is '数据创建用户编号';
alter table SYS_ICON
  add constraint PRIMARY_37 primary key (ICON_ID_);

prompt
prompt Creating table SYS_AUTH
prompt =======================
prompt
create table SYS_AUTH
(
  auth_id_        NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  auth_code_      VARCHAR2(100 CHAR),
  auth_name_      VARCHAR2(64 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  model_id_       NUMBER(24),
  auth_category_  NUMBER(3) default '1',
  operation_id_   NUMBER(24),
  is_inheritable_ NUMBER(3) default '0',
  style_          VARCHAR2(256 CHAR),
  bs_style_       VARCHAR2(256 CHAR),
  uri_            VARCHAR2(512 CHAR),
  sort_no_        NUMBER(10),
  is_visible_     NUMBER(3) default '1',
  tip_            VARCHAR2(256 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24),
  icon_id_        NUMBER(24),
  is_public       NUMBER(3) default '1'
)
;
comment on column SYS_AUTH.auth_id_
  is '权限编号';
comment on column SYS_AUTH.tenant_id_
  is '租户ID';
comment on column SYS_AUTH.auth_code_
  is '编码';
comment on column SYS_AUTH.auth_name_
  is '权限名称';
comment on column SYS_AUTH.eng_name_
  is '部门英文名称';
comment on column SYS_AUTH.i18n_code_
  is '国际化编码';
comment on column SYS_AUTH.model_id_
  is '模型编号';
comment on column SYS_AUTH.auth_category_
  is '权限类型 1：主权限  2：附属权限';
comment on column SYS_AUTH.operation_id_
  is '操作编号';
comment on column SYS_AUTH.is_inheritable_
  is '是否可继承，判断用户是否可控制下属的对应权限';
comment on column SYS_AUTH.style_
  is 'CSS';
comment on column SYS_AUTH.bs_style_
  is 'bootstrap css';
comment on column SYS_AUTH.uri_
  is '默认uri';
comment on column SYS_AUTH.sort_no_
  is '排序';
comment on column SYS_AUTH.is_visible_
  is '是否可见';
comment on column SYS_AUTH.tip_
  is '提示信息';
comment on column SYS_AUTH.descr_
  is '描述';
comment on column SYS_AUTH.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_AUTH.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_AUTH.crt_time_
  is '数据创建时间';
comment on column SYS_AUTH.upd_time_
  is '数据最后修改时间';
comment on column SYS_AUTH.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_AUTH.upd_user_id_
  is '数据修改用户编号';
comment on column SYS_AUTH.icon_id_
  is 'ICON编号';
comment on column SYS_AUTH.is_public
  is '是否公共权限,如果是公共权限URL功能校验不拦截校验。（0：公共权限，1：非公共权限）';
create index FK_REFERENCE_34 on SYS_AUTH (ICON_ID_);
alter table SYS_AUTH
  add constraint PRIMARY_18 primary key (AUTH_ID_);
alter table SYS_AUTH
  add constraint SYS_AUTH_IBFK_1 foreign key (ICON_ID_)
  references SYS_ICON (ICON_ID_);

prompt
prompt Creating table SYS_AUTH_JOIN
prompt ============================
prompt
create table SYS_AUTH_JOIN
(
  auth_join_id_   NUMBER(24) not null,
  main_auth_id_   NUMBER(24),
  attach_auth_id_ NUMBER(24),
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24)
)
;
comment on column SYS_AUTH_JOIN.auth_join_id_
  is '主键ID';
comment on column SYS_AUTH_JOIN.main_auth_id_
  is '主权限ID';
comment on column SYS_AUTH_JOIN.attach_auth_id_
  is '附属权限ID';
comment on column SYS_AUTH_JOIN.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_AUTH_JOIN.crt_time_
  is '数据创建时间';
comment on column SYS_AUTH_JOIN.crt_user_id_
  is '数据创建用户编号';
create index FK_REFERENCE_35 on SYS_AUTH_JOIN (ATTACH_AUTH_ID_);
create index MAIN_AUTH_ID_ on SYS_AUTH_JOIN (MAIN_AUTH_ID_);
alter table SYS_AUTH_JOIN
  add constraint PRIMARY_19 primary key (AUTH_JOIN_ID_);
alter table SYS_AUTH_JOIN
  add constraint SYS_AUTH_JOIN_IBFK_1 foreign key (ATTACH_AUTH_ID_)
  references SYS_AUTH (AUTH_ID_);

prompt
prompt Creating table SYS_CONFIG
prompt =========================
prompt
create table SYS_CONFIG
(
  config_id_     NUMBER(24) not null,
  tenant_id_     NUMBER(10) default '1',
  config_key_    VARCHAR2(32 CHAR),
  config_value_  VARCHAR2(256 CHAR),
  config_desc_   VARCHAR2(256 CHAR),
  config_type_   VARCHAR2(32 CHAR),
  default_value_ VARCHAR2(256 CHAR),
  sort_no_       NUMBER(10),
  version_       NUMBER(10) default '1',
  is_current_    NUMBER(3) default '1',
  descr_         CLOB,
  is_delete_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  upd_time_      DATE,
  crt_user_id_   NUMBER(24),
  upd_user_id_   NUMBER(24)
)
;
comment on column SYS_CONFIG.config_id_
  is '设置编号';
comment on column SYS_CONFIG.tenant_id_
  is '租户ID';
comment on column SYS_CONFIG.config_key_
  is '设置KEY';
comment on column SYS_CONFIG.config_value_
  is '设置值';
comment on column SYS_CONFIG.config_desc_
  is '设置描述';
comment on column SYS_CONFIG.config_type_
  is '设置类型';
comment on column SYS_CONFIG.default_value_
  is '默认值';
comment on column SYS_CONFIG.sort_no_
  is '排序号';
comment on column SYS_CONFIG.version_
  is '版本号';
comment on column SYS_CONFIG.is_current_
  is '是否为当前版本';
comment on column SYS_CONFIG.descr_
  is '描述';
comment on column SYS_CONFIG.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_CONFIG.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_CONFIG.crt_time_
  is '数据创建时间';
comment on column SYS_CONFIG.upd_time_
  is '数据最后修改时间';
comment on column SYS_CONFIG.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_CONFIG.upd_user_id_
  is '数据修改用户编号';
alter table SYS_CONFIG
  add constraint PRIMARY_20 primary key (CONFIG_ID_);

prompt
prompt Creating table SYS_METADATA_ENTITY
prompt ==================================
prompt
create table SYS_METADATA_ENTITY
(
  entity_id_   NUMBER(24) not null,
  tenant_id_   NUMBER(3) default '1',
  entity_code_ VARCHAR2(64 CHAR),
  entity_name_ VARCHAR2(64 CHAR),
  eng_name_    VARCHAR2(256 CHAR),
  i18n_code_   VARCHAR2(256 CHAR),
  table_name_  VARCHAR2(64 CHAR),
  table_alias_ VARCHAR2(64 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE,
  upd_time_    DATE default SYSDATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24)
)
;
comment on column SYS_METADATA_ENTITY.entity_id_
  is '实体编号';
comment on column SYS_METADATA_ENTITY.tenant_id_
  is '租户ID';
comment on column SYS_METADATA_ENTITY.entity_code_
  is '实体编码';
comment on column SYS_METADATA_ENTITY.entity_name_
  is '实体名称';
comment on column SYS_METADATA_ENTITY.eng_name_
  is '英文名称';
comment on column SYS_METADATA_ENTITY.i18n_code_
  is '国际化编码';
comment on column SYS_METADATA_ENTITY.table_name_
  is '表名';
comment on column SYS_METADATA_ENTITY.table_alias_
  is '表别名';
comment on column SYS_METADATA_ENTITY.descr_
  is '描述';
comment on column SYS_METADATA_ENTITY.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_METADATA_ENTITY.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_METADATA_ENTITY.crt_time_
  is '数据创建时间';
comment on column SYS_METADATA_ENTITY.upd_time_
  is '数据最后修改时间';
comment on column SYS_METADATA_ENTITY.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_METADATA_ENTITY.upd_user_id_
  is '数据修改用户编号';
alter table SYS_METADATA_ENTITY
  add constraint PRIMARY_42 primary key (ENTITY_ID_);

prompt
prompt Creating table SYS_DAUTH
prompt ========================
prompt
create table SYS_DAUTH
(
  dauth_id_    NUMBER(24) not null,
  tenant_id_   NUMBER(3) default '1',
  entity_id_   NUMBER(24),
  dauth_code_  VARCHAR2(64 CHAR),
  dauth_name_  VARCHAR2(64 CHAR),
  eng_name_    VARCHAR2(256 CHAR),
  i18n_code_   VARCHAR2(256 CHAR),
  table_alias_ VARCHAR2(64 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE,
  upd_time_    DATE default SYSDATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24)
)
;
comment on column SYS_DAUTH.dauth_id_
  is '数据权限编号';
comment on column SYS_DAUTH.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH.entity_id_
  is '实体ID';
comment on column SYS_DAUTH.dauth_code_
  is '数据权限编码';
comment on column SYS_DAUTH.dauth_name_
  is '数据权限名称';
comment on column SYS_DAUTH.eng_name_
  is '英文名称';
comment on column SYS_DAUTH.i18n_code_
  is '国际化编码';
comment on column SYS_DAUTH.table_alias_
  is '表别名';
comment on column SYS_DAUTH.descr_
  is '描述';
comment on column SYS_DAUTH.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_DAUTH_32 on SYS_DAUTH (ENTITY_ID_);
alter table SYS_DAUTH
  add constraint PRIMARY_21 primary key (DAUTH_ID_);
alter table SYS_DAUTH
  add constraint SYS_DAUTH_IBFK_1 foreign key (ENTITY_ID_)
  references SYS_METADATA_ENTITY (ENTITY_ID_);

prompt
prompt Creating table SYS_DAUTH_FILTER_GROUP
prompt =====================================
prompt
create table SYS_DAUTH_FILTER_GROUP
(
  filter_group_id_ NUMBER(24) not null,
  tenant_id_       NUMBER(3) default '1',
  dauth_id_        NUMBER(24),
  group_code_      VARCHAR2(64 CHAR),
  group_name_      VARCHAR2(64 CHAR),
  eng_name_        VARCHAR2(256 CHAR),
  i18n_code_       VARCHAR2(256 CHAR),
  config_type_     NUMBER(3) default '0',
  biz_id_          NUMBER(24),
  descr_           CLOB,
  is_delete_       NUMBER(3) default '0',
  is_final_        NUMBER(3) default '0',
  crt_time_        DATE,
  upd_time_        DATE default SYSDATE,
  crt_user_id_     NUMBER(24),
  upd_user_id_     NUMBER(24)
)
;
comment on column SYS_DAUTH_FILTER_GROUP.filter_group_id_
  is '过滤器组编号';
comment on column SYS_DAUTH_FILTER_GROUP.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_FILTER_GROUP.dauth_id_
  is '数据权限ID';
comment on column SYS_DAUTH_FILTER_GROUP.group_code_
  is '过滤器组编码';
comment on column SYS_DAUTH_FILTER_GROUP.group_name_
  is '过滤器组名称';
comment on column SYS_DAUTH_FILTER_GROUP.eng_name_
  is '英文名称';
comment on column SYS_DAUTH_FILTER_GROUP.i18n_code_
  is '国际化编码';
comment on column SYS_DAUTH_FILTER_GROUP.config_type_
  is '配置类型（0:数据权限配置 1:岗位配置）';
comment on column SYS_DAUTH_FILTER_GROUP.biz_id_
  is '业务ID，通过数据权限配置时为null';
comment on column SYS_DAUTH_FILTER_GROUP.descr_
  is '描述';
comment on column SYS_DAUTH_FILTER_GROUP.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_FILTER_GROUP.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_FILTER_GROUP.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_FILTER_GROUP.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_FILTER_GROUP.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_FILTER_GROUP.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_DAUTH_33 on SYS_DAUTH_FILTER_GROUP (DAUTH_ID_);
alter table SYS_DAUTH_FILTER_GROUP
  add constraint PRIMARY_22 primary key (FILTER_GROUP_ID_);
alter table SYS_DAUTH_FILTER_GROUP
  add constraint SYS_DAUTH_FILTER_GROUP_IBFK_1 foreign key (DAUTH_ID_)
  references SYS_DAUTH (DAUTH_ID_);

prompt
prompt Creating table SYS_DAUTH_FILTER_TYPE
prompt ====================================
prompt
create table SYS_DAUTH_FILTER_TYPE
(
  filter_type_id_   NUMBER(24) not null,
  tenant_id_        NUMBER(3) default '1',
  filter_type_code_ VARCHAR2(64 CHAR),
  filter_type_name_ VARCHAR2(64 CHAR),
  eng_name_         VARCHAR2(256 CHAR),
  i18n_code_        VARCHAR2(256 CHAR),
  type_             NUMBER(3),
  descr_            CLOB,
  is_delete_        NUMBER(3) default '0',
  is_final_         NUMBER(3) default '0',
  crt_time_         DATE,
  upd_time_         DATE default SYSDATE,
  crt_user_id_      NUMBER(24),
  upd_user_id_      NUMBER(24)
)
;
comment on column SYS_DAUTH_FILTER_TYPE.filter_type_id_
  is '过滤类型编号';
comment on column SYS_DAUTH_FILTER_TYPE.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_FILTER_TYPE.filter_type_code_
  is '过滤类型编码';
comment on column SYS_DAUTH_FILTER_TYPE.filter_type_name_
  is '过滤类型名称（数值型表字段、字符型表字段、当前用户岗位、当前用户职务、无字段）';
comment on column SYS_DAUTH_FILTER_TYPE.eng_name_
  is '英文名称';
comment on column SYS_DAUTH_FILTER_TYPE.i18n_code_
  is '国际化编码';
comment on column SYS_DAUTH_FILTER_TYPE.type_
  is '类型（普通类型--数据库字段、系统变量）';
comment on column SYS_DAUTH_FILTER_TYPE.descr_
  is '描述';
comment on column SYS_DAUTH_FILTER_TYPE.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_FILTER_TYPE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_FILTER_TYPE.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_FILTER_TYPE.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_FILTER_TYPE.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_FILTER_TYPE.upd_user_id_
  is '数据修改用户编号';
alter table SYS_DAUTH_FILTER_TYPE
  add constraint PRIMARY_25 primary key (FILTER_TYPE_ID_);

prompt
prompt Creating table SYS_DAUTH_OPERATOR
prompt =================================
prompt
create table SYS_DAUTH_OPERATOR
(
  operator_id_    NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  operator_code_  VARCHAR2(64 CHAR),
  operator_name_  VARCHAR2(64 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  operator_value_ VARCHAR2(32 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24)
)
;
comment on column SYS_DAUTH_OPERATOR.operator_id_
  is '运算符编号';
comment on column SYS_DAUTH_OPERATOR.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_OPERATOR.operator_code_
  is '运算符编码';
comment on column SYS_DAUTH_OPERATOR.operator_name_
  is '运算符名称';
comment on column SYS_DAUTH_OPERATOR.eng_name_
  is '英文名称';
comment on column SYS_DAUTH_OPERATOR.i18n_code_
  is '国际化编码';
comment on column SYS_DAUTH_OPERATOR.operator_value_
  is '运算符值';
comment on column SYS_DAUTH_OPERATOR.descr_
  is '描述';
comment on column SYS_DAUTH_OPERATOR.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_OPERATOR.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_OPERATOR.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_OPERATOR.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_OPERATOR.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_OPERATOR.upd_user_id_
  is '数据修改用户编号';
alter table SYS_DAUTH_OPERATOR
  add constraint PRIMARY_26 primary key (OPERATOR_ID_);

prompt
prompt Creating table SYS_METADATA_FIELD
prompt =================================
prompt
create table SYS_METADATA_FIELD
(
  field_id_       NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  entity_id_      NUMBER(24),
  filter_type_id_ NUMBER(24),
  field_code_     VARCHAR2(64 CHAR),
  field_name_     VARCHAR2(64 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  column_name_    VARCHAR2(64 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24)
)
;
comment on column SYS_METADATA_FIELD.field_id_
  is '字段编号';
comment on column SYS_METADATA_FIELD.tenant_id_
  is '租户ID';
comment on column SYS_METADATA_FIELD.entity_id_
  is '实体ID';
comment on column SYS_METADATA_FIELD.filter_type_id_
  is '过滤类型ID';
comment on column SYS_METADATA_FIELD.field_code_
  is '字段编码';
comment on column SYS_METADATA_FIELD.field_name_
  is '字段名称';
comment on column SYS_METADATA_FIELD.eng_name_
  is '英文名称';
comment on column SYS_METADATA_FIELD.i18n_code_
  is '国际化编码';
comment on column SYS_METADATA_FIELD.column_name_
  is '列名';
comment on column SYS_METADATA_FIELD.descr_
  is '描述';
comment on column SYS_METADATA_FIELD.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_METADATA_FIELD.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_METADATA_FIELD.crt_time_
  is '数据创建时间';
comment on column SYS_METADATA_FIELD.upd_time_
  is '数据最后修改时间';
comment on column SYS_METADATA_FIELD.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_METADATA_FIELD.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_META_10 on SYS_METADATA_FIELD (FILTER_TYPE_ID_);
create index FK_REFERENCE_META_7 on SYS_METADATA_FIELD (ENTITY_ID_);
alter table SYS_METADATA_FIELD
  add constraint PRIMARY_43 primary key (FIELD_ID_);
alter table SYS_METADATA_FIELD
  add constraint FK_REFERENCE_META_10 foreign key (FILTER_TYPE_ID_)
  references SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_);
alter table SYS_METADATA_FIELD
  add constraint FK_REFERENCE_META_7 foreign key (ENTITY_ID_)
  references SYS_METADATA_ENTITY (ENTITY_ID_);

prompt
prompt Creating table SYS_DAUTH_FILTER_ITEM
prompt ====================================
prompt
create table SYS_DAUTH_FILTER_ITEM
(
  filter_item_id_ NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  entity_id_      NUMBER(24),
  filter_type_id_ NUMBER(24),
  field_id_       NUMBER(24),
  operator_id_    NUMBER(24),
  value_type_     NUMBER(3),
  filter_value_   VARCHAR2(3072 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24)
)
;
comment on column SYS_DAUTH_FILTER_ITEM.filter_item_id_
  is '过滤器编号';
comment on column SYS_DAUTH_FILTER_ITEM.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_FILTER_ITEM.entity_id_
  is '实体ID';
comment on column SYS_DAUTH_FILTER_ITEM.filter_type_id_
  is '过滤类型ID';
comment on column SYS_DAUTH_FILTER_ITEM.field_id_
  is '字段ID';
comment on column SYS_DAUTH_FILTER_ITEM.operator_id_
  is '条件ID';
comment on column SYS_DAUTH_FILTER_ITEM.value_type_
  is '值类型（当前用户、职务、岗位、数据权限变量、自定义值、自定义SQL）';
comment on column SYS_DAUTH_FILTER_ITEM.filter_value_
  is '值，如果类型是公共范围时，此字段与sys_dauth_variable关联';
comment on column SYS_DAUTH_FILTER_ITEM.descr_
  is '描述';
comment on column SYS_DAUTH_FILTER_ITEM.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_FILTER_ITEM.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_FILTER_ITEM.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_FILTER_ITEM.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_FILTER_ITEM.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_FILTER_ITEM.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_DAUTH_14 on SYS_DAUTH_FILTER_ITEM (ENTITY_ID_);
create index FK_REFERENCE_DAUTH_35 on SYS_DAUTH_FILTER_ITEM (OPERATOR_ID_);
create index FK_REFERENCE_DAUTH_8 on SYS_DAUTH_FILTER_ITEM (FIELD_ID_);
create index FK_REFERENCE_DAUTH_9 on SYS_DAUTH_FILTER_ITEM (FILTER_TYPE_ID_);
alter table SYS_DAUTH_FILTER_ITEM
  add constraint PRIMARY_23 primary key (FILTER_ITEM_ID_);
alter table SYS_DAUTH_FILTER_ITEM
  add constraint SYS_DAUTH_FILTER_ITEM_IBFK_1 foreign key (ENTITY_ID_)
  references SYS_METADATA_ENTITY (ENTITY_ID_);
alter table SYS_DAUTH_FILTER_ITEM
  add constraint SYS_DAUTH_FILTER_ITEM_IBFK_2 foreign key (OPERATOR_ID_)
  references SYS_DAUTH_OPERATOR (OPERATOR_ID_);
alter table SYS_DAUTH_FILTER_ITEM
  add constraint SYS_DAUTH_FILTER_ITEM_IBFK_3 foreign key (FIELD_ID_)
  references SYS_METADATA_FIELD (FIELD_ID_);
alter table SYS_DAUTH_FILTER_ITEM
  add constraint SYS_DAUTH_FILTER_ITEM_IBFK_4 foreign key (FILTER_TYPE_ID_)
  references SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_);

prompt
prompt Creating table SYS_DAUTH_FILTER_JOIN
prompt ====================================
prompt
create table SYS_DAUTH_FILTER_JOIN
(
  join_id_         NUMBER(24) not null,
  tenant_id_       NUMBER(3) default '1',
  filter_group_id_ NUMBER(24),
  filter_item_id_  NUMBER(24),
  descr_           CLOB,
  is_delete_       NUMBER(3) default '0',
  is_final_        NUMBER(3) default '0',
  crt_time_        DATE,
  upd_time_        DATE default SYSDATE,
  crt_user_id_     NUMBER(24),
  upd_user_id_     NUMBER(24)
)
;
comment on column SYS_DAUTH_FILTER_JOIN.join_id_
  is '过滤器组编号';
comment on column SYS_DAUTH_FILTER_JOIN.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_FILTER_JOIN.filter_group_id_
  is '过滤器组ID';
comment on column SYS_DAUTH_FILTER_JOIN.filter_item_id_
  is '过滤器项ID';
comment on column SYS_DAUTH_FILTER_JOIN.descr_
  is '描述';
comment on column SYS_DAUTH_FILTER_JOIN.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_FILTER_JOIN.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_FILTER_JOIN.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_FILTER_JOIN.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_FILTER_JOIN.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_FILTER_JOIN.upd_user_id_
  is '数据修改用户编号';
create index FILTER_GROUP_ID_ on SYS_DAUTH_FILTER_JOIN (FILTER_GROUP_ID_);
create index FK_REFERENCE_DAUTH_13 on SYS_DAUTH_FILTER_JOIN (FILTER_ITEM_ID_);
alter table SYS_DAUTH_FILTER_JOIN
  add constraint PRIMARY_24 primary key (JOIN_ID_);
alter table SYS_DAUTH_FILTER_JOIN
  add constraint SYS_DAUTH_FILTER_JOIN_IBFK_2 foreign key (FILTER_ITEM_ID_)
  references SYS_DAUTH_FILTER_ITEM (FILTER_ITEM_ID_);
alter table SYS_DAUTH_FILTER_JOIN
  add constraint SYS_DAUTH_FILTER_JOIN_IBFK_3 foreign key (FILTER_GROUP_ID_)
  references SYS_DAUTH_FILTER_GROUP (FILTER_GROUP_ID_);

prompt
prompt Creating table SYS_DAUTH_OPERATOR_SUPPORT
prompt =========================================
prompt
create table SYS_DAUTH_OPERATOR_SUPPORT
(
  support_id_     NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  filter_type_id_ NUMBER(24),
  operator_id_    NUMBER(24),
  value_type_     NUMBER(3),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24)
)
;
comment on column SYS_DAUTH_OPERATOR_SUPPORT.support_id_
  is '关系编号';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.filter_type_id_
  is '过滤类型ID';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.operator_id_
  is '条件ID';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.value_type_
  is '值类型（当前用户、职务、岗位、数据权限变量、自定义值、自定义SQL）';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.descr_
  is '描述';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_OPERATOR_SUPPORT.upd_user_id_
  is '数据修改用户编号';
create index FILTER_TYPE_ID_ on SYS_DAUTH_OPERATOR_SUPPORT (FILTER_TYPE_ID_);
create index FK_REFERENCE_DAUTH_36 on SYS_DAUTH_OPERATOR_SUPPORT (OPERATOR_ID_);
alter table SYS_DAUTH_OPERATOR_SUPPORT
  add constraint PRIMARY_27 primary key (SUPPORT_ID_);
alter table SYS_DAUTH_OPERATOR_SUPPORT
  add constraint SYS_DAUTH_OPERATOR_SUPPORT_IBF foreign key (OPERATOR_ID_)
  references SYS_DAUTH_OPERATOR (OPERATOR_ID_);
alter table SYS_DAUTH_OPERATOR_SUPPORT
  add constraint SYS_DAUTH_OPERATOR_SUPPORT__61 foreign key (FILTER_TYPE_ID_)
  references SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_);

prompt
prompt Creating table SYS_DAUTH_USAGE
prompt ==============================
prompt
create table SYS_DAUTH_USAGE
(
  usage_id_          NUMBER(24) not null,
  tenant_id_         NUMBER(3) default '1',
  dauth_id_          NUMBER(24),
  method_name_       VARCHAR2(256 CHAR),
  method_short_name_ VARCHAR2(256 CHAR),
  method_zh_name_    VARCHAR2(256 CHAR),
  method_eng_name_   VARCHAR2(256 CHAR),
  method_i18n_code_  VARCHAR2(256 CHAR),
  is_valid_          NUMBER(3) default '0',
  descr_             CLOB,
  is_delete_         NUMBER(3) default '0',
  is_final_          NUMBER(3) default '0',
  crt_time_          DATE,
  upd_time_          DATE default SYSDATE,
  crt_user_id_       NUMBER(24),
  upd_user_id_       NUMBER(24)
)
;
comment on column SYS_DAUTH_USAGE.usage_id_
  is '应用编号';
comment on column SYS_DAUTH_USAGE.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_USAGE.dauth_id_
  is '数据权限ID';
comment on column SYS_DAUTH_USAGE.method_name_
  is '方法名(格式为：com.hginfo.xx.method)';
comment on column SYS_DAUTH_USAGE.method_short_name_
  is '方法名简写，无包名(格式为：xx.method)';
comment on column SYS_DAUTH_USAGE.method_zh_name_
  is '中文名称';
comment on column SYS_DAUTH_USAGE.method_eng_name_
  is '英文名称';
comment on column SYS_DAUTH_USAGE.method_i18n_code_
  is '国际化编码';
comment on column SYS_DAUTH_USAGE.is_valid_
  is '方法是否在用（0:在用，1:不再用 与mapper/dao方法不再匹配时则不再用）';
comment on column SYS_DAUTH_USAGE.descr_
  is '描述';
comment on column SYS_DAUTH_USAGE.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_USAGE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_USAGE.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_USAGE.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_USAGE.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_USAGE.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_DAUTH_37 on SYS_DAUTH_USAGE (DAUTH_ID_);
alter table SYS_DAUTH_USAGE
  add constraint PRIMARY_28 primary key (USAGE_ID_);
alter table SYS_DAUTH_USAGE
  add constraint SYS_DAUTH_USAGE_IBFK_1 foreign key (DAUTH_ID_)
  references SYS_DAUTH (DAUTH_ID_);

prompt
prompt Creating table SYS_DAUTH_VARIABLE
prompt =================================
prompt
create table SYS_DAUTH_VARIABLE
(
  variable_id_    NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  variable_code_  VARCHAR2(64 CHAR),
  variable_name_  VARCHAR2(64 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  variable_value_ VARCHAR2(3072 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24)
)
;
comment on column SYS_DAUTH_VARIABLE.variable_id_
  is '变量编号';
comment on column SYS_DAUTH_VARIABLE.tenant_id_
  is '租户ID';
comment on column SYS_DAUTH_VARIABLE.variable_code_
  is '变量编码';
comment on column SYS_DAUTH_VARIABLE.variable_name_
  is '变量名称';
comment on column SYS_DAUTH_VARIABLE.eng_name_
  is '英文名称';
comment on column SYS_DAUTH_VARIABLE.i18n_code_
  is '国际化编码';
comment on column SYS_DAUTH_VARIABLE.variable_value_
  is '变量值';
comment on column SYS_DAUTH_VARIABLE.descr_
  is '描述';
comment on column SYS_DAUTH_VARIABLE.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DAUTH_VARIABLE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DAUTH_VARIABLE.crt_time_
  is '数据创建时间';
comment on column SYS_DAUTH_VARIABLE.upd_time_
  is '数据最后修改时间';
comment on column SYS_DAUTH_VARIABLE.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DAUTH_VARIABLE.upd_user_id_
  is '数据修改用户编号';
alter table SYS_DAUTH_VARIABLE
  add constraint PRIMARY_29 primary key (VARIABLE_ID_);

prompt
prompt Creating table SYS_DICT_GROUP
prompt =============================
prompt
create table SYS_DICT_GROUP
(
  dict_group_id_   NUMBER(24) not null,
  tenant_id_       NUMBER(10) default '1',
  dict_group_code_ VARCHAR2(64 CHAR),
  group_type_      VARCHAR2(128 CHAR),
  group_name_      VARCHAR2(256 CHAR),
  eng_name_        VARCHAR2(256 CHAR),
  i18n_code_       VARCHAR2(256 CHAR),
  descr_           CLOB,
  is_delete_       NUMBER(3) default '0',
  is_final_        NUMBER(3) default '0',
  crt_time_        DATE default SYSDATE,
  upd_time_        DATE,
  crt_user_id_     NUMBER(24),
  upd_user_id_     NUMBER(24)
)
;
comment on column SYS_DICT_GROUP.dict_group_id_
  is '字典组编号';
comment on column SYS_DICT_GROUP.tenant_id_
  is '租户ID';
comment on column SYS_DICT_GROUP.dict_group_code_
  is '字典编码';
comment on column SYS_DICT_GROUP.group_type_
  is '字典组类型';
comment on column SYS_DICT_GROUP.group_name_
  is '字典组中文名称';
comment on column SYS_DICT_GROUP.eng_name_
  is '英文名称';
comment on column SYS_DICT_GROUP.i18n_code_
  is '国际化编码';
comment on column SYS_DICT_GROUP.descr_
  is '描述';
comment on column SYS_DICT_GROUP.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DICT_GROUP.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DICT_GROUP.crt_time_
  is '数据创建时间';
comment on column SYS_DICT_GROUP.upd_time_
  is '数据最后修改时间';
comment on column SYS_DICT_GROUP.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DICT_GROUP.upd_user_id_
  is '数据修改用户编号';
alter table SYS_DICT_GROUP
  add constraint PRIMARY_30 primary key (DICT_GROUP_ID_);

prompt
prompt Creating table SYS_DICT_ITEM
prompt ============================
prompt
create table SYS_DICT_ITEM
(
  dict_item_id_   NUMBER(24) not null,
  tenant_id_      NUMBER(10) default '1',
  dict_group_id_  NUMBER(24),
  item_value_     VARCHAR2(128 CHAR),
  item_name_      VARCHAR2(256 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  is_visible_     NUMBER(3) default '1',
  sort_no_        NUMBER(3),
  priority_no_    NUMBER(24),
  sub_group_code_ VARCHAR2(64 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE default SYSDATE,
  upd_time_       DATE default SYSDATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24)
)
;
comment on column SYS_DICT_ITEM.dict_item_id_
  is '字典编号';
comment on column SYS_DICT_ITEM.tenant_id_
  is '租户ID';
comment on column SYS_DICT_ITEM.dict_group_id_
  is '字典组编号';
comment on column SYS_DICT_ITEM.item_value_
  is '字典项值';
comment on column SYS_DICT_ITEM.item_name_
  is '字典中文名称';
comment on column SYS_DICT_ITEM.eng_name_
  is '英文名称';
comment on column SYS_DICT_ITEM.i18n_code_
  is '国际化编码';
comment on column SYS_DICT_ITEM.is_visible_
  is '是否可见';
comment on column SYS_DICT_ITEM.sort_no_
  is '排序号';
comment on column SYS_DICT_ITEM.priority_no_
  is '权重号';
comment on column SYS_DICT_ITEM.sub_group_code_
  is '字典项类型，字典组下项的再分组';
comment on column SYS_DICT_ITEM.descr_
  is '描述';
comment on column SYS_DICT_ITEM.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_DICT_ITEM.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_DICT_ITEM.crt_time_
  is '数据创建时间';
comment on column SYS_DICT_ITEM.upd_time_
  is '数据最后修改时间';
comment on column SYS_DICT_ITEM.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_DICT_ITEM.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_25 on SYS_DICT_ITEM (DICT_GROUP_ID_);
alter table SYS_DICT_ITEM
  add constraint PRIMARY_31 primary key (DICT_ITEM_ID_);
alter table SYS_DICT_ITEM
  add constraint SYS_DICT_ITEM_IBFK_1 foreign key (DICT_GROUP_ID_)
  references SYS_DICT_GROUP (DICT_GROUP_ID_);

prompt
prompt Creating table SYS_EXTEND_FIELD
prompt ===============================
prompt
create table SYS_EXTEND_FIELD
(
  extend_id_     NUMBER(24) not null,
  extend_def_id_ NUMBER(24),
  biz_id_        NUMBER(24),
  value_         VARCHAR2(512 CHAR),
  descr_         CLOB,
  is_delete_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  upd_time_      DATE default SYSDATE,
  crt_user_id_   NUMBER(24),
  upd_user_id_   NUMBER(24)
)
;
comment on column SYS_EXTEND_FIELD.extend_id_
  is '扩展字段编号';
comment on column SYS_EXTEND_FIELD.extend_def_id_
  is '扩展字段定义编号';
comment on column SYS_EXTEND_FIELD.biz_id_
  is '被扩展表编号';
comment on column SYS_EXTEND_FIELD.descr_
  is '描述';
comment on column SYS_EXTEND_FIELD.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_EXTEND_FIELD.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_EXTEND_FIELD.crt_time_
  is '数据创建时间';
comment on column SYS_EXTEND_FIELD.upd_time_
  is '数据最后修改时间';
comment on column SYS_EXTEND_FIELD.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_EXTEND_FIELD.upd_user_id_
  is '数据修改用户编号';
alter table SYS_EXTEND_FIELD
  add constraint PRIMARY_32 primary key (EXTEND_ID_);

prompt
prompt Creating table SYS_EXTEND_FIELD_DEF
prompt ===================================
prompt
create table SYS_EXTEND_FIELD_DEF
(
  extend_def_id_ NUMBER(24) not null,
  table_code_    VARCHAR2(256 CHAR),
  field_code_    VARCHAR2(256 CHAR),
  field_name_    VARCHAR2(256 CHAR),
  filed_type_    VARCHAR2(64 CHAR),
  default_value_ VARCHAR2(256 CHAR),
  descr_         CLOB,
  is_delete_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  upd_time_      DATE default SYSDATE,
  crt_user_id_   NUMBER(24),
  upd_user_id_   NUMBER(24)
)
;
comment on column SYS_EXTEND_FIELD_DEF.extend_def_id_
  is '扩展字段编号';
comment on column SYS_EXTEND_FIELD_DEF.table_code_
  is '扩展表编码';
comment on column SYS_EXTEND_FIELD_DEF.field_code_
  is '扩展字段编码';
comment on column SYS_EXTEND_FIELD_DEF.field_name_
  is '扩展字段名';
comment on column SYS_EXTEND_FIELD_DEF.filed_type_
  is '扩展字段类型';
comment on column SYS_EXTEND_FIELD_DEF.default_value_
  is '默认值';
comment on column SYS_EXTEND_FIELD_DEF.descr_
  is '描述';
comment on column SYS_EXTEND_FIELD_DEF.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_EXTEND_FIELD_DEF.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_EXTEND_FIELD_DEF.crt_time_
  is '数据创建时间';
comment on column SYS_EXTEND_FIELD_DEF.upd_time_
  is '数据最后修改时间';
comment on column SYS_EXTEND_FIELD_DEF.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_EXTEND_FIELD_DEF.upd_user_id_
  is '数据修改用户编号';
alter table SYS_EXTEND_FIELD_DEF
  add constraint PRIMARY_33 primary key (EXTEND_DEF_ID_);

prompt
prompt Creating table SYS_FILE
prompt =======================
prompt
create table SYS_FILE
(
  file_id_       NUMBER(24) not null,
  tenant_id_     NUMBER(10) default '1',
  file_type_     VARCHAR2(10 CHAR),
  real_name_     VARCHAR2(128 CHAR),
  file_name_     VARCHAR2(255 CHAR),
  file_size_     VARCHAR2(255 CHAR),
  relative_path_ VARCHAR2(255 CHAR),
  descr_         CLOB,
  is_delete_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  upd_time_      DATE,
  crt_user_id_   NUMBER(24),
  upd_user_id_   NUMBER(24)
)
;
comment on column SYS_FILE.tenant_id_
  is '租户ID';
comment on column SYS_FILE.file_type_
  is '文件类型（如：.png,.txt,.doc）';
comment on column SYS_FILE.real_name_
  is '文件真实名称';
comment on column SYS_FILE.file_name_
  is '文件名称';
comment on column SYS_FILE.file_size_
  is '文件大小';
comment on column SYS_FILE.relative_path_
  is '相对路径';
comment on column SYS_FILE.descr_
  is '描述';
comment on column SYS_FILE.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_FILE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_FILE.crt_time_
  is '数据创建时间';
comment on column SYS_FILE.upd_time_
  is '数据最后修改时间';
comment on column SYS_FILE.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_FILE.upd_user_id_
  is '数据修改用户编号';
alter table SYS_FILE
  add constraint PRIMARY_34 primary key (FILE_ID_);

prompt
prompt Creating table SYS_GROUP
prompt ========================
prompt
create table SYS_GROUP
(
  group_id_    NUMBER(24) not null,
  org_id_      NUMBER(24),
  group_code_  VARCHAR2(64 CHAR),
  group_name_  VARCHAR2(64 CHAR),
  eng_name_    VARCHAR2(256 CHAR),
  i18n_code_   VARCHAR2(256 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE default SYSDATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(3),
  upd_user_id_ NUMBER(3)
)
;
comment on column SYS_GROUP.group_id_
  is '职务编号';
comment on column SYS_GROUP.org_id_
  is '部门编号';
comment on column SYS_GROUP.group_code_
  is '职务编码';
comment on column SYS_GROUP.group_name_
  is '职务名称';
comment on column SYS_GROUP.eng_name_
  is '部门英文名称';
comment on column SYS_GROUP.i18n_code_
  is '国际化编码';
comment on column SYS_GROUP.descr_
  is '描述';
comment on column SYS_GROUP.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_GROUP.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_GROUP.crt_time_
  is '数据创建时间';
comment on column SYS_GROUP.upd_time_
  is '数据最后修改时间';
comment on column SYS_GROUP.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_GROUP.upd_user_id_
  is '数据修改用户编号';
alter table SYS_GROUP
  add constraint PRIMARY_35 primary key (GROUP_ID_);

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
create table SYS_USER
(
  user_id_     NUMBER(24) not null,
  tenant_id_   NUMBER(10) default '1',
  user_name_   VARCHAR2(256 CHAR),
  eng_name_    VARCHAR2(256 CHAR),
  gender_      NUMBER(3) default '0',
  birthday_    VARCHAR2(32 CHAR),
  mobile_      VARCHAR2(50 CHAR),
  email_       VARCHAR2(256 CHAR),
  address_     VARCHAR2(256 CHAR),
  telephone_   VARCHAR2(50 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  is_visible_  NUMBER(3) default '1',
  crt_time_    DATE default SYSDATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24),
  head_photo_  NUMBER(24)
)
;
comment on column SYS_USER.user_id_
  is '用户ID';
comment on column SYS_USER.tenant_id_
  is '租户ID';
comment on column SYS_USER.user_name_
  is '用户名';
comment on column SYS_USER.eng_name_
  is '英文名';
comment on column SYS_USER.gender_
  is '性别(1:男;0:女)';
comment on column SYS_USER.birthday_
  is '生日';
comment on column SYS_USER.mobile_
  is '手机';
comment on column SYS_USER.email_
  is '邮箱';
comment on column SYS_USER.address_
  is '地址';
comment on column SYS_USER.telephone_
  is '联系电话';
comment on column SYS_USER.descr_
  is '描述';
comment on column SYS_USER.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_USER.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_USER.is_visible_
  is '是否可见';
comment on column SYS_USER.crt_time_
  is '数据创建时间';
comment on column SYS_USER.upd_time_
  is '数据最后修改时间';
comment on column SYS_USER.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_USER.upd_user_id_
  is '数据修改用户编号';
comment on column SYS_USER.head_photo_
  is '头像：对应系统文件ID';
alter table SYS_USER
  add constraint PRIMARY_52 primary key (USER_ID_);

prompt
prompt Creating table SYS_GROUP_USER
prompt =============================
prompt
create table SYS_GROUP_USER
(
  group_user_id_ NUMBER(24) not null,
  user_id_       NUMBER(24),
  group_id_      NUMBER(24),
  is_leader_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  crt_user_id_   NUMBER(24)
)
;
comment on column SYS_GROUP_USER.group_user_id_
  is '主键ID';
comment on column SYS_GROUP_USER.user_id_
  is '用户ID';
comment on column SYS_GROUP_USER.group_id_
  is '角色ID';
comment on column SYS_GROUP_USER.is_leader_
  is '是否为小组长';
comment on column SYS_GROUP_USER.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_GROUP_USER.crt_time_
  is '数据创建时间';
comment on column SYS_GROUP_USER.crt_user_id_
  is '数据创建用户编号';
create index FK_REFERENCE_20 on SYS_GROUP_USER (GROUP_ID_);
create index USER_ID_ on SYS_GROUP_USER (USER_ID_);
alter table SYS_GROUP_USER
  add constraint PRIMARY_36 primary key (GROUP_USER_ID_);
alter table SYS_GROUP_USER
  add constraint SYS_GROUP_USER_IBFK_2 foreign key (GROUP_ID_)
  references SYS_GROUP (GROUP_ID_);
alter table SYS_GROUP_USER
  add constraint SYS_GROUP_USER_IBFK_3 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table SYS_JOB
prompt ======================
prompt
create table SYS_JOB
(
  job_id_      NUMBER(24) not null,
  tenant_id_   NUMBER(10) default '1',
  job_code_    VARCHAR2(64 CHAR),
  job_name_    VARCHAR2(64 CHAR),
  eng_name_    VARCHAR2(256 CHAR),
  i18n_code_   VARCHAR2(256 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE default SYSDATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(3),
  upd_user_id_ NUMBER(3)
)
;
comment on column SYS_JOB.job_id_
  is '职务编号';
comment on column SYS_JOB.tenant_id_
  is '租户ID';
comment on column SYS_JOB.job_code_
  is '职务编码';
comment on column SYS_JOB.job_name_
  is '职务名称';
comment on column SYS_JOB.eng_name_
  is '英文名称';
comment on column SYS_JOB.i18n_code_
  is '国际化编码';
comment on column SYS_JOB.descr_
  is '描述';
comment on column SYS_JOB.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_JOB.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_JOB.crt_time_
  is '数据创建时间';
comment on column SYS_JOB.upd_time_
  is '数据最后修改时间';
comment on column SYS_JOB.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_JOB.upd_user_id_
  is '数据修改用户编号';
alter table SYS_JOB
  add constraint PRIMARY_38 primary key (JOB_ID_);

prompt
prompt Creating table SYS_LOG
prompt ======================
prompt
create table SYS_LOG
(
  log_id_      NUMBER(24) not null,
  tenant_id_   NUMBER(10) default '1',
  log_type_    NUMBER(3),
  log_level_   NUMBER(3) default '0',
  key1_        VARCHAR2(255 CHAR),
  key2_        VARCHAR2(255 CHAR),
  key3_        VARCHAR2(255 CHAR),
  key4_        VARCHAR2(255 CHAR),
  key5_        VARCHAR2(255 CHAR),
  content_     CLOB,
  crt_time_    DATE default SYSDATE,
  is_final_    NUMBER(3) default '1',
  crt_user_id_ NUMBER(24) default '1'
)
;
comment on column SYS_LOG.log_id_
  is '日志ID';
comment on column SYS_LOG.tenant_id_
  is '租户ID';
comment on column SYS_LOG.log_type_
  is '类型(0:系统操作日志,1:接口类调用日志,2;定时任务调用日志,3异常信息日志)';
comment on column SYS_LOG.log_level_
  is '日志级别（0:DEBUG,1:INFO,2:WARN,3:ERROR,4:FATAL）';
comment on column SYS_LOG.key1_
  is '关键词';
comment on column SYS_LOG.key2_
  is '关键词';
comment on column SYS_LOG.key3_
  is '关键词';
comment on column SYS_LOG.key4_
  is '关键词';
comment on column SYS_LOG.key5_
  is '关键词';
comment on column SYS_LOG.content_
  is '日志内容';
comment on column SYS_LOG.crt_time_
  is '创建时间';
comment on column SYS_LOG.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_LOG.crt_user_id_
  is '数据创建用户编号';
alter table SYS_LOG
  add constraint PRIMARY_39 primary key (LOG_ID_);

prompt
prompt Creating table SYS_META_CONSTRAINT_DEF
prompt ======================================
prompt
create table SYS_META_CONSTRAINT_DEF
(
  def_id_      NUMBER(24) not null,
  tenant_id_   NUMBER(3) default '1',
  entity_id_   NUMBER(24),
  def_code_    VARCHAR2(256 CHAR),
  def_name_    VARCHAR2(256 CHAR),
  def_type_    NUMBER(3) default '3',
  ref_id_      NUMBER(24),
  error_msg_   VARCHAR2(1000 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE default SYSDATE,
  upd_time_    DATE default SYSDATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24)
)
;
comment on column SYS_META_CONSTRAINT_DEF.def_id_
  is '约束定义编号';
comment on column SYS_META_CONSTRAINT_DEF.tenant_id_
  is '租户ID';
comment on column SYS_META_CONSTRAINT_DEF.entity_id_
  is '实体编号';
comment on column SYS_META_CONSTRAINT_DEF.def_code_
  is '约束编码';
comment on column SYS_META_CONSTRAINT_DEF.def_name_
  is '约束名称';
comment on column SYS_META_CONSTRAINT_DEF.def_type_
  is '约束类型(1主键约束，2外键约束，3唯一约束)';
comment on column SYS_META_CONSTRAINT_DEF.ref_id_
  is '关联约束';
comment on column SYS_META_CONSTRAINT_DEF.error_msg_
  is '错误提示信息';
comment on column SYS_META_CONSTRAINT_DEF.descr_
  is '描述';
comment on column SYS_META_CONSTRAINT_DEF.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_META_CONSTRAINT_DEF.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_META_CONSTRAINT_DEF.crt_time_
  is '数据创建时间';
comment on column SYS_META_CONSTRAINT_DEF.upd_time_
  is '数据最后修改时间';
comment on column SYS_META_CONSTRAINT_DEF.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_META_CONSTRAINT_DEF.upd_user_id_
  is '数据修改用户编号';
alter table SYS_META_CONSTRAINT_DEF
  add constraint PRIMARY_40 primary key (DEF_ID_);

prompt
prompt Creating table SYS_META_CONSTRAINT_DETAIL
prompt =========================================
prompt
create table SYS_META_CONSTRAINT_DETAIL
(
  detail_id_     NUMBER(24) not null,
  tenant_id_     NUMBER(3) default '1',
  def_id_        NUMBER(24),
  field_id_      NUMBER(24),
  ref_detail_id_ NUMBER(24),
  descr_         CLOB,
  is_delete_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  upd_time_      DATE default SYSDATE,
  crt_user_id_   NUMBER(24),
  upd_user_id_   NUMBER(24)
)
;
comment on column SYS_META_CONSTRAINT_DETAIL.detail_id_
  is '明细编号';
comment on column SYS_META_CONSTRAINT_DETAIL.tenant_id_
  is '租户ID';
comment on column SYS_META_CONSTRAINT_DETAIL.def_id_
  is '定义编号';
comment on column SYS_META_CONSTRAINT_DETAIL.field_id_
  is '字段编号';
comment on column SYS_META_CONSTRAINT_DETAIL.ref_detail_id_
  is '关联明细编号';
comment on column SYS_META_CONSTRAINT_DETAIL.descr_
  is '描述';
comment on column SYS_META_CONSTRAINT_DETAIL.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_META_CONSTRAINT_DETAIL.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_META_CONSTRAINT_DETAIL.crt_time_
  is '数据创建时间';
comment on column SYS_META_CONSTRAINT_DETAIL.upd_time_
  is '数据最后修改时间';
comment on column SYS_META_CONSTRAINT_DETAIL.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_META_CONSTRAINT_DETAIL.upd_user_id_
  is '数据修改用户编号';
alter table SYS_META_CONSTRAINT_DETAIL
  add constraint PRIMARY_41 primary key (DETAIL_ID_);

prompt
prompt Creating table SYS_MODEL
prompt ========================
prompt
create table SYS_MODEL
(
  model_id_       NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  model_code_     VARCHAR2(100 CHAR),
  model_name_     VARCHAR2(64 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  fid_            NUMBER(24),
  style_          VARCHAR2(256 CHAR),
  bs_style_       VARCHAR2(256 CHAR),
  is_top_menu_    NUMBER(3) default '0',
  is_sub_menu_    NUMBER(3) default '0',
  is_bs_top_menu_ NUMBER(3) default '0',
  is_bs_sub_menu_ NUMBER(3) default '0',
  uri_            VARCHAR2(64 CHAR),
  sort_no_        NUMBER(10),
  is_visible_     NUMBER(3) default '1',
  tip_            VARCHAR2(256 CHAR),
  model_type_     NUMBER(3),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE,
  upd_time_       DATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24),
  icon_id_        NUMBER(24)
)
;
comment on column SYS_MODEL.model_id_
  is '模型编号';
comment on column SYS_MODEL.tenant_id_
  is '租户ID';
comment on column SYS_MODEL.model_code_
  is '编码';
comment on column SYS_MODEL.model_name_
  is '模型名称';
comment on column SYS_MODEL.eng_name_
  is '英文名称';
comment on column SYS_MODEL.i18n_code_
  is '国际化编码';
comment on column SYS_MODEL.fid_
  is '父职务编号';
comment on column SYS_MODEL.style_
  is 'CSS';
comment on column SYS_MODEL.bs_style_
  is 'bootstrap css';
comment on column SYS_MODEL.is_top_menu_
  is '是否是顶部导航菜单（不仅仅是顶级菜单）';
comment on column SYS_MODEL.is_sub_menu_
  is '是否是左侧菜单';
comment on column SYS_MODEL.is_bs_top_menu_
  is '是否是bootstrap顶部导航菜单';
comment on column SYS_MODEL.is_bs_sub_menu_
  is '是否是bootstrap左侧菜单';
comment on column SYS_MODEL.uri_
  is '默认uri';
comment on column SYS_MODEL.sort_no_
  is '排序';
comment on column SYS_MODEL.is_visible_
  is '是否可见';
comment on column SYS_MODEL.tip_
  is '提示信息';
comment on column SYS_MODEL.model_type_
  is '模块类型（区分导航模块，功能模块等）';
comment on column SYS_MODEL.descr_
  is '描述';
comment on column SYS_MODEL.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_MODEL.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_MODEL.crt_time_
  is '数据创建时间';
comment on column SYS_MODEL.upd_time_
  is '数据最后修改时间';
comment on column SYS_MODEL.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_MODEL.upd_user_id_
  is '数据修改用户编号';
comment on column SYS_MODEL.icon_id_
  is 'ICON编号';
create index FK_REFERENCE_23 on SYS_MODEL (FID_);
create index FK_REFERENCE_32 on SYS_MODEL (ICON_ID_);
alter table SYS_MODEL
  add constraint PRIMARY_44 primary key (MODEL_ID_);

prompt
prompt Creating table SYS_OPERATION
prompt ============================
prompt
create table SYS_OPERATION
(
  operation_id_   NUMBER(24) not null,
  tenant_id_      NUMBER(3) default '1',
  operation_code_ VARCHAR2(64 CHAR),
  operation_name_ VARCHAR2(64 CHAR),
  eng_name_       VARCHAR2(256 CHAR),
  i18n_code_      VARCHAR2(256 CHAR),
  style_          VARCHAR2(256 CHAR),
  uri_            VARCHAR2(64 CHAR),
  sort_no_        NUMBER(10),
  is_visible_     NUMBER(3) default '1',
  tip_            VARCHAR2(256 CHAR),
  descr_          CLOB,
  is_delete_      NUMBER(3) default '0',
  is_final_       NUMBER(3) default '0',
  crt_time_       DATE default SYSDATE,
  upd_time_       DATE,
  crt_user_id_    NUMBER(24),
  upd_user_id_    NUMBER(24),
  icon_id_        NUMBER(24)
)
;
comment on column SYS_OPERATION.operation_id_
  is '操作编号';
comment on column SYS_OPERATION.tenant_id_
  is '租户ID';
comment on column SYS_OPERATION.operation_code_
  is '编码';
comment on column SYS_OPERATION.operation_name_
  is '权限名称';
comment on column SYS_OPERATION.eng_name_
  is '部门英文名称';
comment on column SYS_OPERATION.i18n_code_
  is '国际化编码';
comment on column SYS_OPERATION.style_
  is 'CSS';
comment on column SYS_OPERATION.uri_
  is '默认uri';
comment on column SYS_OPERATION.sort_no_
  is '排序';
comment on column SYS_OPERATION.is_visible_
  is '是否可见';
comment on column SYS_OPERATION.tip_
  is '提示信息';
comment on column SYS_OPERATION.descr_
  is '描述';
comment on column SYS_OPERATION.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_OPERATION.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_OPERATION.crt_time_
  is '数据创建时间';
comment on column SYS_OPERATION.upd_time_
  is '数据最后修改时间';
comment on column SYS_OPERATION.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_OPERATION.upd_user_id_
  is '数据修改用户编号';
comment on column SYS_OPERATION.icon_id_
  is 'ICON编号';
create index FK_REFERENCE_33 on SYS_OPERATION (ICON_ID_);
alter table SYS_OPERATION
  add constraint PRIMARY_45 primary key (OPERATION_ID_);
alter table SYS_OPERATION
  add constraint SYS_OPERATION_IBFK_1 foreign key (ICON_ID_)
  references SYS_ICON (ICON_ID_);

prompt
prompt Creating table SYS_ORGANIZATION
prompt ===============================
prompt
create table SYS_ORGANIZATION
(
  org_id_       NUMBER(24) not null,
  tenant_id_    NUMBER(10) default '1',
  org_name_     VARCHAR2(256 CHAR),
  org_fullname_ VARCHAR2(256 CHAR),
  org_code_     VARCHAR2(128 CHAR),
  eng_name_     VARCHAR2(256 CHAR),
  i18n_code_    VARCHAR2(256 CHAR),
  fid_          NUMBER(24),
  descr_        CLOB,
  is_delete_    NUMBER(3) default '0',
  is_final_     NUMBER(3) default '0',
  crt_time_     DATE default SYSDATE,
  upd_time_     DATE,
  crt_user_id_  NUMBER(24),
  upd_user_id_  NUMBER(24)
)
;
comment on column SYS_ORGANIZATION.org_id_
  is '部门编号';
comment on column SYS_ORGANIZATION.tenant_id_
  is '租户ID';
comment on column SYS_ORGANIZATION.org_name_
  is '部门名称';
comment on column SYS_ORGANIZATION.org_fullname_
  is '部门全名';
comment on column SYS_ORGANIZATION.org_code_
  is '部门编码(默认为编号)';
comment on column SYS_ORGANIZATION.eng_name_
  is '部门英文名称';
comment on column SYS_ORGANIZATION.i18n_code_
  is '国际化编码';
comment on column SYS_ORGANIZATION.fid_
  is '父部门';
comment on column SYS_ORGANIZATION.descr_
  is '描述';
comment on column SYS_ORGANIZATION.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_ORGANIZATION.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_ORGANIZATION.crt_time_
  is '数据创建时间';
comment on column SYS_ORGANIZATION.upd_time_
  is '数据最后修改时间';
comment on column SYS_ORGANIZATION.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_ORGANIZATION.upd_user_id_
  is '数据修改用户编号';
alter table SYS_ORGANIZATION
  add constraint PRIMARY_46 primary key (ORG_ID_);

prompt
prompt Creating table SYS_POSITION
prompt ===========================
prompt
create table SYS_POSITION
(
  position_id_   NUMBER(24) not null,
  tenant_id_     NUMBER(10) default '1',
  org_id_        NUMBER(24),
  job_id_        NUMBER(24),
  position_code_ VARCHAR2(64 CHAR),
  position_name_ VARCHAR2(64 CHAR),
  eng_name_      VARCHAR2(256 CHAR),
  i18n_code_     VARCHAR2(256 CHAR),
  fid_           NUMBER(24),
  descr_         CLOB,
  is_delete_     NUMBER(3) default '0',
  is_final_      NUMBER(3) default '0',
  crt_time_      DATE default SYSDATE,
  upd_time_      DATE default SYSDATE,
  crt_user_id_   NUMBER(24),
  upd_user_id_   NUMBER(24)
)
;
comment on column SYS_POSITION.position_id_
  is '权限编号';
comment on column SYS_POSITION.tenant_id_
  is '租户ID';
comment on column SYS_POSITION.org_id_
  is '组织编号';
comment on column SYS_POSITION.job_id_
  is '职务编号';
comment on column SYS_POSITION.position_code_
  is '编码';
comment on column SYS_POSITION.position_name_
  is '权限名称';
comment on column SYS_POSITION.eng_name_
  is '英文名称';
comment on column SYS_POSITION.i18n_code_
  is '国际化编码';
comment on column SYS_POSITION.fid_
  is '父职务编号';
comment on column SYS_POSITION.descr_
  is '描述';
comment on column SYS_POSITION.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_POSITION.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_POSITION.crt_time_
  is '数据创建时间';
comment on column SYS_POSITION.upd_time_
  is '数据最后修改时间';
comment on column SYS_POSITION.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_POSITION.upd_user_id_
  is '数据修改用户编号';
alter table SYS_POSITION
  add constraint PRIMARY_47 primary key (POSITION_ID_);

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table SYS_ROLE
(
  role_id_     NUMBER(24) not null,
  tenant_id_   NUMBER(3) default '1',
  role_name_   VARCHAR2(256 CHAR),
  role_code_   VARCHAR2(128 CHAR),
  descr_       CLOB,
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24)
)
;
comment on column SYS_ROLE.role_id_
  is '角色编号';
comment on column SYS_ROLE.tenant_id_
  is '租户ID';
comment on column SYS_ROLE.role_name_
  is '角色名称';
comment on column SYS_ROLE.role_code_
  is '角色编码(默认值为编号)';
comment on column SYS_ROLE.descr_
  is '描述';
comment on column SYS_ROLE.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_ROLE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_ROLE.crt_time_
  is '数据创建时间';
comment on column SYS_ROLE.upd_time_
  is '数据最后修改时间';
comment on column SYS_ROLE.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_ROLE.upd_user_id_
  is '数据修改用户编号';
alter table SYS_ROLE
  add constraint PRIMARY_48 primary key (ROLE_ID_);

prompt
prompt Creating table SYS_ROLE_AUTH
prompt ============================
prompt
create table SYS_ROLE_AUTH
(
  role_auth_id_ NUMBER(24) not null,
  role_id_      NUMBER(24),
  auth_id_      NUMBER(24),
  is_final_     NUMBER(3) default '0',
  crt_time_     DATE default SYSDATE,
  crt_user_id_  NUMBER(24)
)
;
comment on column SYS_ROLE_AUTH.role_auth_id_
  is '主键ID';
comment on column SYS_ROLE_AUTH.role_id_
  is '角色编号';
comment on column SYS_ROLE_AUTH.auth_id_
  is '权限编号';
comment on column SYS_ROLE_AUTH.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_ROLE_AUTH.crt_time_
  is '数据创建时间';
comment on column SYS_ROLE_AUTH.crt_user_id_
  is '数据创建用户编号';
create index FK_REFERENCE_2 on SYS_ROLE_AUTH (AUTH_ID_);
create index FK_REFERENCE_4 on SYS_ROLE_AUTH (ROLE_ID_);
alter table SYS_ROLE_AUTH
  add constraint PRIMARY_49 primary key (ROLE_AUTH_ID_);
alter table SYS_ROLE_AUTH
  add constraint FK_REFERENCE_2 foreign key (AUTH_ID_)
  references SYS_AUTH (AUTH_ID_);
alter table SYS_ROLE_AUTH
  add constraint FK_REFERENCE_4 foreign key (ROLE_ID_)
  references SYS_ROLE (ROLE_ID_);

prompt
prompt Creating table SYS_STAFF_INFO
prompt =============================
prompt
create table SYS_STAFF_INFO
(
  staff_id_     NUMBER(24) not null,
  tenant_id_    NUMBER(10) default '1',
  staff_code_   VARCHAR2(64 CHAR),
  staff_status_ NUMBER(3) default '1',
  user_id_      NUMBER(24),
  entry_time_   DATE default SYSDATE,
  quit_time_    DATE,
  id_card_      VARCHAR2(18 CHAR),
  bank_card_    VARCHAR2(20 CHAR),
  descr_        CLOB,
  is_delete_    NUMBER(3) default '0',
  is_final_     NUMBER(3) default '0',
  crt_time_     DATE,
  upd_time_     DATE,
  crt_user_id_  NUMBER(24),
  upd_user_id_  NUMBER(24)
)
;
comment on column SYS_STAFF_INFO.staff_id_
  is '员工编号';
comment on column SYS_STAFF_INFO.tenant_id_
  is '租户ID';
comment on column SYS_STAFF_INFO.staff_code_
  is '员工号';
comment on column SYS_STAFF_INFO.staff_status_
  is '员工状态(0离职，1在职)';
comment on column SYS_STAFF_INFO.user_id_
  is '用户编号';
comment on column SYS_STAFF_INFO.entry_time_
  is '入职时间';
comment on column SYS_STAFF_INFO.quit_time_
  is '离职时间';
comment on column SYS_STAFF_INFO.id_card_
  is '身份证号';
comment on column SYS_STAFF_INFO.bank_card_
  is '银行账号';
comment on column SYS_STAFF_INFO.descr_
  is '描述';
comment on column SYS_STAFF_INFO.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_STAFF_INFO.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_STAFF_INFO.crt_time_
  is '数据创建时间';
comment on column SYS_STAFF_INFO.upd_time_
  is '数据最后修改时间';
comment on column SYS_STAFF_INFO.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_STAFF_INFO.upd_user_id_
  is '数据修改用户编号';
create index FK_REFERENCE_27 on SYS_STAFF_INFO (USER_ID_);
alter table SYS_STAFF_INFO
  add constraint PRIMARY_50 primary key (STAFF_ID_);
alter table SYS_STAFF_INFO
  add constraint SYS_STAFF_INFO_IBFK_1 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table SYS_TOKEN
prompt ========================
prompt
create table SYS_TOKEN
(
  token_id_    NUMBER(24) not null,
  account_id_  NUMBER(24),
  tenant_id_   NUMBER(3) default '1',
  token_sign_  VARCHAR2(200 CHAR),
  token_type_  NUMBER(10) default '0',
  extension_   CLOB,
  due_time_    DATE,
  login_count_ NUMBER(10),
  is_delete_   NUMBER(3) default '0',
  is_final_    NUMBER(3) default '0',
  crt_time_    DATE default SYSDATE,
  upd_time_    DATE default SYSDATE,
  crt_user_id_ NUMBER(24),
  upd_user_id_ NUMBER(24)
)
;
comment on column SYS_TOKEN.token_id_
  is '令牌ID';
comment on column SYS_TOKEN.account_id_
  is '账户ID';
comment on column SYS_TOKEN.tenant_id_
  is '租户ID';
comment on column SYS_TOKEN.token_sign_
  is '令牌签名';
comment on column SYS_TOKEN.token_type_
  is '令牌类型';
comment on column SYS_TOKEN.extension_
  is '扩展数据 JSON对象';
comment on column SYS_TOKEN.due_time_
  is '过期时间';
comment on column SYS_TOKEN.login_count_
  is '登录次数';
comment on column SYS_TOKEN.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_TOKEN.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_TOKEN.crt_time_
  is '数据创建时间';
comment on column SYS_TOKEN.upd_time_
  is '数据最后修改时间';
comment on column SYS_TOKEN.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_TOKEN.upd_user_id_
  is '数据修改用户编号';
create index AK_KEY_3 on SYS_TOKEN (ACCOUNT_ID_);
alter table SYS_TOKEN
  add constraint PRIMARY_51 primary key (TOKEN_ID_);
alter table SYS_TOKEN
  add constraint SYS_TOKEN_IBFK_1 foreign key (ACCOUNT_ID_)
  references SYS_ACCOUNT (ACCOUNT_ID_);

prompt
prompt Creating table SYS_USER_AUTH
prompt ============================
prompt
create table SYS_USER_AUTH
(
  user_auth_id_ NUMBER(24) not null,
  user_id_      NUMBER(24),
  auth_id_      NUMBER(24),
  auth_type_    NUMBER(3) default '1',
  is_final_     NUMBER(3) default '0',
  crt_time_     DATE default SYSDATE,
  crt_user_id_  NUMBER(24)
)
;
comment on column SYS_USER_AUTH.user_auth_id_
  is '主键ID';
comment on column SYS_USER_AUTH.user_id_
  is '用户ID';
comment on column SYS_USER_AUTH.auth_id_
  is '权限编号';
comment on column SYS_USER_AUTH.auth_type_
  is '授权类型（1:正授权;-1:负授权）';
comment on column SYS_USER_AUTH.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_USER_AUTH.crt_time_
  is '数据创建时间';
comment on column SYS_USER_AUTH.crt_user_id_
  is '数据创建用户编号';
create index FK_REFERENCE_3 on SYS_USER_AUTH (AUTH_ID_);
create index USER_ID__3 on SYS_USER_AUTH (USER_ID_);
alter table SYS_USER_AUTH
  add constraint PRIMARY_53 primary key (USER_AUTH_ID_);
alter table SYS_USER_AUTH
  add constraint SYS_USER_AUTH_IBFK_1 foreign key (AUTH_ID_)
  references SYS_AUTH (AUTH_ID_);
alter table SYS_USER_AUTH
  add constraint SYS_USER_AUTH_IBFK_2 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table SYS_USER_LOG
prompt ===========================
prompt
create table SYS_USER_LOG
(
  user_log_id_ NUMBER(24) not null,
  user_id_     NUMBER(24),
  oper_code_   VARCHAR2(128 CHAR),
  oper_name_   VARCHAR2(256 CHAR),
  eng_name_    VARCHAR2(256 CHAR),
  req_uri_     VARCHAR2(256 CHAR),
  oper_ip_     VARCHAR2(64 CHAR),
  key1_        VARCHAR2(64 CHAR),
  key2_        VARCHAR2(64 CHAR),
  key3_        VARCHAR2(64 CHAR),
  content_     CLOB,
  oper_res_    VARCHAR2(1 CHAR),
  is_final_    NUMBER(3) default '1',
  crt_time_    DATE default SYSDATE,
  crt_user_id_ NUMBER(24) default '1'
)
;
comment on column SYS_USER_LOG.user_log_id_
  is '日志ID';
comment on column SYS_USER_LOG.user_id_
  is '用户ID';
comment on column SYS_USER_LOG.oper_code_
  is '操作编码（如：USER_ADD）';
comment on column SYS_USER_LOG.oper_name_
  is '中文操作名称（如：新增用户）';
comment on column SYS_USER_LOG.eng_name_
  is '英文操作名称（如：addUser）';
comment on column SYS_USER_LOG.req_uri_
  is '请求URI';
comment on column SYS_USER_LOG.oper_ip_
  is '调用方IP';
comment on column SYS_USER_LOG.key1_
  is '关键词';
comment on column SYS_USER_LOG.key2_
  is '关键词';
comment on column SYS_USER_LOG.key3_
  is '关键词';
comment on column SYS_USER_LOG.content_
  is '日志内容';
comment on column SYS_USER_LOG.oper_res_
  is '操作结果(1：成功  0：失败)';
comment on column SYS_USER_LOG.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_USER_LOG.crt_time_
  is '创建时间';
comment on column SYS_USER_LOG.crt_user_id_
  is '数据创建用户编号';
create index FK_REFERENCE_26 on SYS_USER_LOG (USER_ID_);
alter table SYS_USER_LOG
  add constraint PRIMARY_54 primary key (USER_LOG_ID_);
alter table SYS_USER_LOG
  add constraint SYS_USER_LOG_IBFK_1 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table SYS_USER_PASSWORD_FOUND
prompt ======================================
prompt
create table SYS_USER_PASSWORD_FOUND
(
  found_id_          NUMBER(24) not null,
  login_name_        VARCHAR2(128 CHAR),
  phone_             VARCHAR2(15 CHAR),
  email_             VARCHAR2(256 CHAR),
  verification_code_ CHAR(8 CHAR),
  ip_                CHAR(15 CHAR),
  descr_             CLOB,
  is_delete_         NUMBER(3) default '0',
  is_final_          NUMBER(3) default '0',
  crt_time_          DATE default SYSDATE,
  upd_time_          DATE,
  crt_user_id_       NUMBER(24),
  upd_user_id_       NUMBER(24)
)
;
comment on column SYS_USER_PASSWORD_FOUND.found_id_
  is '主键';
comment on column SYS_USER_PASSWORD_FOUND.login_name_
  is '登录名';
comment on column SYS_USER_PASSWORD_FOUND.phone_
  is '手机号';
comment on column SYS_USER_PASSWORD_FOUND.email_
  is 'email';
comment on column SYS_USER_PASSWORD_FOUND.verification_code_
  is '验证码';
comment on column SYS_USER_PASSWORD_FOUND.ip_
  is 'ip';
comment on column SYS_USER_PASSWORD_FOUND.descr_
  is '描述';
comment on column SYS_USER_PASSWORD_FOUND.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_USER_PASSWORD_FOUND.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_USER_PASSWORD_FOUND.crt_time_
  is '数据创建时间';
comment on column SYS_USER_PASSWORD_FOUND.upd_time_
  is '数据最后修改时间';
comment on column SYS_USER_PASSWORD_FOUND.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_USER_PASSWORD_FOUND.upd_user_id_
  is '数据修改用户编号';
alter table SYS_USER_PASSWORD_FOUND
  add constraint PRIMARY_55 primary key (FOUND_ID_);

prompt
prompt Creating table SYS_USER_POSITION
prompt ================================
prompt
create table SYS_USER_POSITION
(
  user_position_id_ NUMBER(24) not null,
  user_id_          NUMBER(24),
  position_id_      NUMBER(24),
  is_final_         NUMBER(3) default '0',
  crt_time_         DATE default SYSDATE,
  crt_user_id_      NUMBER(24),
  is_major_         NUMBER(3) default '1'
)
;
comment on column SYS_USER_POSITION.user_position_id_
  is '主键ID';
comment on column SYS_USER_POSITION.user_id_
  is '用户ID';
comment on column SYS_USER_POSITION.position_id_
  is '角色ID';
comment on column SYS_USER_POSITION.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_USER_POSITION.crt_time_
  is '数据创建时间';
comment on column SYS_USER_POSITION.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_USER_POSITION.is_major_
  is '是否主岗0否，1是，每个userId，应该只有一个主岗';
create index FK_REFERENCE_10 on SYS_USER_POSITION (POSITION_ID_);
create index USER_ID__2 on SYS_USER_POSITION (USER_ID_);
alter table SYS_USER_POSITION
  add constraint PRIMARY_56 primary key (USER_POSITION_ID_);
alter table SYS_USER_POSITION
  add constraint SYS_USER_POSITION_IBFK_1 foreign key (POSITION_ID_)
  references SYS_POSITION (POSITION_ID_);
alter table SYS_USER_POSITION
  add constraint SYS_USER_POSITION_IBFK_2 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table SYS_USER_PROFILE
prompt ===============================
prompt
create table SYS_USER_PROFILE
(
  user_profile_id_ NUMBER(24) not null,
  tenant_id_       NUMBER(10) default '1',
  user_id_         NUMBER(24),
  profile_key_     VARCHAR2(32 CHAR),
  profile_value_   VARCHAR2(256 CHAR),
  default_value_   VARCHAR2(256 CHAR),
  sort_no_         NUMBER(10),
  profile_type_    VARCHAR2(32 CHAR),
  version_         NUMBER(10) default '1',
  is_current_      NUMBER(3) default '1',
  descr_           CLOB,
  is_delete_       NUMBER(3) default '0',
  crt_time_        DATE default SYSDATE,
  upd_time_        DATE default SYSDATE,
  crt_user_id_     NUMBER(24),
  upd_user_id_     NUMBER(24),
  is_final_        NUMBER(3) default '0'
)
;
comment on column SYS_USER_PROFILE.user_profile_id_
  is '配置编号';
comment on column SYS_USER_PROFILE.tenant_id_
  is '租户ID';
comment on column SYS_USER_PROFILE.user_id_
  is '用户编号';
comment on column SYS_USER_PROFILE.profile_key_
  is '设置KEY';
comment on column SYS_USER_PROFILE.profile_value_
  is '设置值';
comment on column SYS_USER_PROFILE.default_value_
  is '默认值--废弃';
comment on column SYS_USER_PROFILE.sort_no_
  is '排序号';
comment on column SYS_USER_PROFILE.profile_type_
  is '设置类型';
comment on column SYS_USER_PROFILE.version_
  is '版本号';
comment on column SYS_USER_PROFILE.is_current_
  is '是否为当前版本（默认数据为 0）';
comment on column SYS_USER_PROFILE.descr_
  is '设置描述';
comment on column SYS_USER_PROFILE.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column SYS_USER_PROFILE.crt_time_
  is '创建时间';
comment on column SYS_USER_PROFILE.upd_time_
  is '数据最后修改时间';
comment on column SYS_USER_PROFILE.crt_user_id_
  is '数据创建用户编号';
comment on column SYS_USER_PROFILE.upd_user_id_
  is '数据修改用户编号';
comment on column SYS_USER_PROFILE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
create index FK_REFERENCE_29 on SYS_USER_PROFILE (USER_ID_);
alter table SYS_USER_PROFILE
  add constraint PRIMARY_57 primary key (USER_PROFILE_ID_);
alter table SYS_USER_PROFILE
  add constraint FK_REFERENCE_29 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table SYS_USER_ROLE
prompt ============================
prompt
create table SYS_USER_ROLE
(
  user_role_id_ NUMBER(24) not null,
  user_id_      NUMBER(24),
  role_id_      NUMBER(24),
  is_final_     NUMBER(3) default '0',
  crt_time_     DATE default SYSDATE,
  crt_user_id_  NUMBER(24)
)
;
comment on column SYS_USER_ROLE.user_role_id_
  is '关联表主键';
comment on column SYS_USER_ROLE.user_id_
  is '用户ID';
comment on column SYS_USER_ROLE.role_id_
  is '角色ID';
comment on column SYS_USER_ROLE.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SYS_USER_ROLE.crt_time_
  is '数据创建时间';
comment on column SYS_USER_ROLE.crt_user_id_
  is '数据创建用户编号';
create index FK_REFERENCE_1 on SYS_USER_ROLE (ROLE_ID_);
create index USER_ID__1 on SYS_USER_ROLE (USER_ID_);
alter table SYS_USER_ROLE
  add constraint PRIMARY_58 primary key (USER_ROLE_ID_);
alter table SYS_USER_ROLE
  add constraint SYS_USER_ROLE_IBFK_1 foreign key (ROLE_ID_)
  references SYS_ROLE (ROLE_ID_);
alter table SYS_USER_ROLE
  add constraint SYS_USER_ROLE_IBFK_2 foreign key (USER_ID_)
  references SYS_USER (USER_ID_);

prompt
prompt Creating table T_DEPT
prompt =====================
prompt
create table T_DEPT
(
  id_          NUMBER(24) not null,
  dept_name_   VARCHAR2(200 CHAR),
  dept_code_   VARCHAR2(200 CHAR),
  remark_      VARCHAR2(200 CHAR),
  is_delete_   NUMBER(10) default '0',
  crt_time_    DATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(10),
  upd_user_id_ NUMBER(10),
  is_final_    NUMBER(3)
)
;
comment on column T_DEPT.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column T_DEPT.crt_time_
  is '数据创建时间';
comment on column T_DEPT.upd_time_
  is '数据最后修改时间';
comment on column T_DEPT.crt_user_id_
  is '数据创建用户编号';
comment on column T_DEPT.upd_user_id_
  is '数据修改用户编号';
alter table T_DEPT
  add constraint PRIMARY_59 primary key (ID_);

prompt
prompt Creating table T_ORDER
prompt =====================
prompt
create table T_ORDER
(
  id_          NUMBER(10) not null,
  clientname_    VARCHAR2(200 CHAR),
  account_         NUMBER(22,2),
  createtime  DATE,
  is_delete_   NUMBER(10) default '0',
  crt_time_    DATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(10),
  upd_user_id_ NUMBER(10),
  is_final_    NUMBER(3)
)
;
comment on column T_ORDER.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column T_ORDER.crt_time_
  is '数据创建时间';
comment on column T_ORDER.upd_time_
  is '数据最后修改时间';
comment on column T_ORDER.crt_user_id_
  is '数据创建用户编号';
comment on column T_ORDER.upd_user_id_
  is '数据修改用户编号';
alter table T_ORDER
  add constraint PK_T_ORDER primary key (ID_);

prompt
prompt Creating table T_USER
prompt =====================
prompt
create table T_USER
(
  id_          NUMBER(10) not null,
  username_    VARCHAR2(200 CHAR),
  sex_         NUMBER(10),
  createtime_  DATE,
  is_delete_   NUMBER(10) default '0',
  crt_time_    DATE,
  upd_time_    DATE,
  crt_user_id_ NUMBER(10),
  upd_user_id_ NUMBER(10),
  is_final_    NUMBER(3)
)
;
comment on column T_USER.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column T_USER.crt_time_
  is '数据创建时间';
comment on column T_USER.upd_time_
  is '数据最后修改时间';
comment on column T_USER.crt_user_id_
  is '数据创建用户编号';
comment on column T_USER.upd_user_id_
  is '数据修改用户编号';
alter table T_USER
  add constraint PRIMARY_1 primary key (ID_);

-- job_triger_group表主键自增序列，由于已经增加一条数据，故从2开始
create sequence seq_job_triger_group_id
start with 2
increment by 1
nomaxvalue
nocycle
nocache;

-- job_trigger_info表主键自增序列
create sequence seq_job_trigger_info_id
start with 1
increment by 1
nomaxvalue
nocycle
nocache;

-- job_trigger_logglue表主键自增序列
create sequence seq_job_trigger_logglue_id
start with 1
increment by 1
nomaxvalue
nocycle
nocache;

-- job_trigger_log表主键自增序列
create sequence seq_job_trigger_log_id
start with 1
increment by 1
nomaxvalue
nocycle
nocache;

-- job_trigger_registry表主键自增序列
create sequence seq_job_trigger_registry_id
start with 1
increment by 1
nomaxvalue
nocycle
nocache;

spool off

prompt Importing table JOB_TRIGGER_GROUP...
set feedback off
set define off
insert into JOB_TRIGGER_GROUP (ID_, APP_NAME_, TITLE_, ORDER_, ADDRESS_TYPE_, ADDRESS_LIST_)
values ('1', 'hbm-job-executor', 'HBM执行器', '1', '0', null);

prompt Done.
commit;

prompt Importing table SYS_ACCOUNT...
set feedback off
set define off
insert into SYS_ACCOUNT (ACCOUNT_ID_, TENANT_ID_, USER_ID_, LOGIN_NAME_, LOGIN_PWD_, DESCR_, IS_VALID_, IS_LOCK_, LAST_LOGIN_IP_, LAST_LOGIN_TIME_, LAST_PWD_CHANGE_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1', '1', '1', 'super', 'a72982d91c5b9cf054826734494b54024e59e851', null, '1', '0', '0:0:0:0:0:0:0:1', to_date('30-03-2017 20:19:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-11-2016 14:16:12', 'dd-mm-yyyy hh24:mi:ss'), '0', '0', null, to_date('30-03-2017 20:11:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ACCOUNT (ACCOUNT_ID_, TENANT_ID_, USER_ID_, LOGIN_NAME_, LOGIN_PWD_, DESCR_, IS_VALID_, IS_LOCK_, LAST_LOGIN_IP_, LAST_LOGIN_TIME_, LAST_PWD_CHANGE_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('2', '1', '2', 'test', 'eb428ac4cb5e75bdf62a970929ec4fe4b4c3468e', null, '1', '0', '0:0:0:0:0:0:0:1', to_date('30-03-2017 20:19:06', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0', null, to_date('30-03-2017 20:14:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_AUTH...
set feedback off
set define off
insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290838788701', '1', 'sysConfig:create', '系统设置:创建', 'sysConfig:create', 'sysConfig.create', '1052481652945655248', '1', '1052481659203557933', '1', null, null, '/sys/sysConfig/create', '66', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290882828894', '1', 'sysConfig:update', '系统设置:更新', 'sysConfig:update', 'sysConfig.update', '1052481652945655248', '1', '1052481659203557963', '1', null, null, '/sys/sysConfig/update', '67', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290933160543', '1', 'sysConfig:delete', '系统设置:删除', 'sysConfig:delete', 'sysConfig.delete', '1052481652945655248', '1', '1052481659203558275', '1', null, null, '/sys/sysConfig/delete', '68', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290986637920', '1', 'sysDictMenu:view', '字典配置:访问', 'sysDictMenu:view', 'sysDictMenu.view', '1052481653319996881', '1', '1052481659203556933', '1', null, null, '/sys/sysDict/view', '69', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291229907554', '1', 'sysDictGroup:create', '字典组配置:创建', 'sysDictGroup:create', 'sysDictGroup.create', '1052481653695387090', '1', '1052481659203557933', '1', null, null, '/sys/sysDict/addGroup', '74', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:14:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291350493795', '1', 'sysDictGroup:update', '字典组配置:更新', 'sysDictGroup:update', 'sysDictGroup.update', '1052481653695387090', '1', '1052481659203557963', '1', null, null, '/sys/sysDict/updGroup', '75', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:15:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291475274340', '1', 'sysDictGroup:delete', '字典组配置:删除', 'sysDictGroup:delete', 'sysDictGroup.delete', '1052481653695387090', '1', '1052481659203558275', '1', null, null, '/sys/sysDict/delGroup', '76', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:22:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291604249190', '1', 'sysDictItem:create', '字典项配置:创建', 'sysDictItem:create', 'sysDictItem.create', '1052481654041417171', '1', '1052481659203557933', '0', null, null, '/sys/sysDict/addItem', '78', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:23:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291641997927', '1', 'sysDictItem:update', '字典项配置:更新', 'sysDictItem:update', 'sysDictItem.update', '1052481654041417171', '1', '1052481659203557963', '0', null, null, '/sys/sysDict/updItem', '79', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:23:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291687086696', '1', 'sysDictItem:delete', '字典项配置:删除', 'sysDictItem:delete', 'sysDictItem.delete', '1052481654041417171', '1', '1052481659203558275', '0', null, null, '/sys/sysDict/delItem', '80', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:24:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291791944297', '1', 'sysLogMenu:view', '日志管理:访问', 'sysLogMenu:view', 'sysLogMenu.view', '1052481654405273044', '1', '1052481659203556933', '1', null, null, null, '81', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269291956570730', '1', 'sysLog:view', '系统日志:访问', 'sysLog:view', 'sysLog.view', '1052481654405273056', '1', '1052481659203556933', '1', null, null, '/sys/sysLog/view', '85', '1', null, null, '0', '0', to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269292139022958', '1', 'sysUserLog:view', '个人日志:访问', 'sysUserLog:view', 'sysUserLog.view', '1052481654405273057', '1', '1052481659203556933', '1', null, null, '/sys/sysUserLog/view', '89', '1', null, null, '0', '0', to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-01-2017 14:45:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269292326718066', '1', 'sysResourceMenu:view', '资源管理:访问', 'sysResourceMenu:view', 'sysResourceMenu.view', '1052481654739768666', '1', '1052481659203556933', '1', null, null, null, '93', '1', null, null, '0', '0', to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269292373903987', '1', 'sysAttachMenu:view', '附件管理:访问', 'sysAttachMenu:view', 'sysAttachMenu.view', '1052481654739768789', '1', '1052481659203556933', '1', null, null, '/sys/sysFile/view', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:16:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269292864637564', '1', 'sysIcon:view', '图标管理:访问', 'sysIcon:view', 'sysIcon.view', '1052481655604843993', '1', '1052481659203556933', '1', null, null, '/sys/sysIcon/view', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 10:01:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269292932795005', '1', 'sysIcon:create', '图标管理:创建', 'sysIcon:create', 'sysIcon.create', '1052481655604843993', '1', '1052481659203557933', '0', null, null, '/sys/sysIcon/addIcon', '110', '1', null, null, '0', '0', to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 09:50:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269292977883774', '1', 'sysIcon:update', '图标管理:更新', 'sysIcon:update', 'sysIcon.update', '1052481655604843993', '1', '1052481659203557963', '0', null, null, '/sys/sysIcon/updIcon', '111', '1', null, null, '0', '0', to_date('10-12-2016 10:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 09:51:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293014583935', '1', 'sysIcon:delete', '图标管理:删除', 'sysIcon:delete', 'sysIcon.delete', '1052481655604843993', '1', '1052481659203558275', '0', null, null, '/sys/sysIcon/delIcon', '112', '1', null, null, '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 09:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293059672704', '1', 'sysMonitorMenu:view', '系统监控:访问', 'sysMonitorMenu:view', 'sysMonitorMenu.view', '1052481655704243258', '1', '1052481659203556933', '1', null, null, null, '113', '1', null, null, '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293111052929', '1', 'sysJVMMonitor:view', 'JVM信息:访问', 'sysJVMMonitor:view', 'sysJVMMonitor.view', '1052481655704243260', '1', '1052481659203556933', '1', null, null, '/sys/info/jvmView', '117', '1', null, '/sys/sysJVMMonitor/view', '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293281970821', '1', 'sysServerMonitor:view', '服务器信息:访问', 'sysServerMonitor:view', 'sysServerMonitor.view', '1052481655704243262', '1', '1052481659203556933', '1', null, null, '/sys/info/serverView', '121', '1', null, '/sys/sysServerMonitor/view', '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293456034441', '1', 'sysSystemMonitor:view', '系统运行信息:访问', 'sysSystemMonitor:view', 'sysSystemMonitor.view', '1052481655704243263', '1', '1052481659203556933', '1', null, null, '/sys/info/systemView', '125', '1', null, '/sys/sysRunMonitor/view', '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2017 11:16:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293698255501', '1', 'sysReportMenu:view', '系统报表:访问', 'sysReportMenu:view', 'sysReportMenu.view', '1052481655947728344', '1', '1052481659203556933', '1', null, null, null, '129', '1', null, null, '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293742295694', '1', 'sysStatisticalReportMenu:view', '统计报表:访问', 'sysStatisticalReportMenu:view', 'sysStatisticalReportMenu.view', '1052481656350381529', '1', '1052481659203556933', '1', null, null, null, '133', '1', null, null, '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293802064527', '1', 'sysAuditReportMenu:view', '审计报表:访问', 'sysAuditReportMenu:view', 'sysAuditReportMenu.view', '1052481656748840460', '1', '1052481659203556933', '1', null, null, null, '137', '1', null, null, '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269293872319120', '1', 'sysEmployeeOrgReport:view', '员工分布:访问', 'sysEmployeeOrgReport:view', 'sysEmployeeOrgReport.view', '1052481656748840410', '1', '1052481659203556933', '0', null, null, '/sys/report/sysEmployeeOrgReport/view', '141', '1', null, null, '0', '0', to_date('10-12-2016 10:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-03-2017 11:55:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294071548564', '1', 'sysEmployeeJobReport:view', '入职离职:访问', 'sysEmployeeJobReport:view', 'sysEmployeeJobReport.view', '1052481656748840422', '1', '1052481659203556933', '1', null, null, '/sys/report/sysEmployeeJobReport/view', '145', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-03-2017 14:33:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294289652376', '1', 'sysPersonalCenterMenu:view', '个人中心:访问', 'sysPersonalCenterMenu:view', 'sysPersonalCenterMenu.view', '1052481657072850395', '1', '1052481659203556933', '1', null, null, null, '149', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294338935449', '1', 'sysPersonalMenu:view', '个人中心:访问', 'sysPersonalMenu:view', 'sysPersonalMenu.view', '1052481657408394716', '1', '1052481659203556933', '1', null, null, null, '153', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294376684186', '1', 'sysPersonal:view', '我的信息:访问', 'sysPersonal:view', 'sysPersonal.view', '1052481657744987613', '1', '1052481659203556933', '1', null, null, '/sys/sysPersonal/personal/view', '157', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294457424540', '1', 'sysPersonal:update', '我的信息:更新', 'sysPersonal:update', 'sysPersonal.update', '1052481657744987613', '2', '1052481659203557963', '0', null, null, '/sys/sysPersonal/updBasicInfo', '159', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:03:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294561233566', '1', 'sysModifyPwd:view', '修改密码:访问', 'sysModifyPwd:view', 'sysModifyPwd.view', '1052481658097309150', '1', '1052481659203556933', '1', null, null, '/sys/sysPersonal/modifyPwd/view', '161', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294677625504', '1', 'sysModifyPwd:update', '修改密码:更新', 'sysModifyPwd:update', 'sysModifyPwd.update', '1052481658097309150', '2', '1052481659203557963', '0', null, null, '/sys/sysPersonal/modifyPwd/update', '163', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:07:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294762560162', '1', 'sysPersonalSetting:view', '个性化设置:访问', 'sysPersonalSetting:view', 'sysPersonalSetting.view', '1052481658449630687', '1', '1052481659203556933', '1', null, null, '/sys/sysPersonal/personalSetting/view', '165', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269294956546724', '1', 'sysPersonalSetting:update', '个性化设置:更新', 'sysPersonalSetting:update', 'sysPersonalSetting.update', '1052481658449630687', '2', '1052481659203557963', '1', null, null, '/sys/sysPersonal/personalSetting/update', '167', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269295056161446', '1', 'sysTaskMenu:view', '任务中心:访问', 'sysTaskMenu:view', 'sysTaskMenu.view', '1052481658842846688', '1', '1052481659203556933', '1', null, null, null, '169', '1', null, null, '0', '0', to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269295116978855', '1', 'sysMyTask:view', '待办任务:访问', 'sysMyTask:view', 'sysMyTask.view', '1052481659203556833', '1', '1052481659203556933', '1', null, null, '/sys/sysTask/myTask/view', '173', '1', null, null, '0', '0', to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535744735082200', '1', 'sysMetadataField:view', '元数据字段:访问', null, null, '1060535699748026070', '1', '1052481659203556933', '1', null, null, '/sys/sysMetadata/metadataFieldView', '101', '1', null, null, '0', '0', to_date('28-02-2017 15:54:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:54:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535863639406298', '1', 'sysMetadataField:list', '元数据字段:列表', null, null, '1060535699748026070', '2', '1060262570224060575', '1', null, null, '/sys/sysMetadata/fieldList/%d', '102', '1', null, null, '0', '0', to_date('28-02-2017 15:56:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:57:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536006906345181', '1', 'sysMetadataField:getFieldList', '元数据字段:获取字段列表', null, null, '1060535699748026070', '2', '1060262570224060575', '1', null, null, '/sys/sysMetadata/getFieldList/%d/%d', '107', '1', null, null, '0', '0', to_date('28-02-2017 15:58:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:59:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536045116454623', '1', 'sysMetadataField:addField', '元数据字段:新增', null, null, '1060535699748026070', '1', '1052481659203557933', '1', null, null, '/sys/sysMetadata/addField', '104', '1', null, null, '0', '0', to_date('28-02-2017 15:59:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:59:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536117623387875', '1', 'sysMetadataField:updateField', '元数据字段:修改', null, null, '1060535699748026070', '1', '1052481659203557963', '1', null, null, '/sys/sysMetadata/updateField', '105', '1', null, null, '0', '0', to_date('28-02-2017 16:00:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:00:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536158243124965', '1', 'sysMetadataField:deleteField', '元数据字段:删除', null, null, '1060535699748026070', '1', '1052481659203558275', '1', null, null, '/sys/sysMetadata/deleteField', '106', '1', null, null, '0', '0', to_date('28-02-2017 16:01:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:01:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536526409692907', '1', 'dauthVariable:aboutOne', '数据权限变量:关于', null, null, '1060536473503790825', '2', '1060512414373153244', '1', null, null, '/sys/dauthVariable/aboutOne', '103', '1', null, null, '0', '0', to_date('28-02-2017 16:07:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:08:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536599394776813', '1', 'dauthVariable:view', '数据权限变量:访问', null, null, '1060536473503790825', '1', '1052481659203556933', '1', null, null, '/sys/dauthVariable/view', '101', '1', null, null, '0', '0', to_date('28-02-2017 16:08:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:08:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536654727083760', '1', 'dauthVariable:list', '数据权限变量:列表', null, null, '1060536473503790825', '2', '1060262570224060575', '1', null, null, '/sys/dauthVariable/list', '102', '1', null, null, '0', '0', to_date('28-02-2017 16:09:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:09:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536725987260146', '1', 'dauthVariable:selVarView', '数据权限变量:选择变量', null, null, '1060536473503790825', '2', '1060512414373153244', '1', null, null, '/sys/dauthVariable/chooseVariableView', '107', '1', null, null, '0', '0', to_date('28-02-2017 16:10:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:10:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536768554202868', '1', 'dauthVariable:selVarList', '数据权限变量:选择变量列表', null, null, '1060536473503790825', '2', '1060262570224060575', '1', null, null, '/sys/dauthVariable/chooseVariableList', '108', '1', null, null, '0', '0', to_date('28-02-2017 16:10:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:10:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536814721955574', '1', 'dauthVariable:create', '数据权限变量:新增', null, null, '1060536473503790825', '1', '1052481659203557933', '1', null, null, '/sys/dauthVariable/add', '104', '1', null, null, '0', '0', to_date('28-02-2017 16:11:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:11:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536853305358072', '1', 'dauthVariable:update', '数据权限变量:修改', null, null, '1060536473503790825', '1', '1052481659203557963', '1', null, null, '/sys/dauthVariable/update', '105', '1', null, null, '0', '0', to_date('28-02-2017 16:12:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:12:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060536892744398586', '1', 'dauthVariable:delete', '数据权限变量:删除', null, null, '1060536473503790825', '1', '1052481659203558275', '1', null, null, '/sys/dauthVariable/delete', '106', '1', null, null, '0', '0', to_date('28-02-2017 16:12:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:12:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537029762873084', '1', 'dauthUsage:aboutOne', '数据权限应用:关于', null, null, '1052481647455311301', '2', '1060512414373153244', '1', null, null, '/sys/dauthUsage/aboutOne', '103', '1', null, null, '0', '0', to_date('28-02-2017 16:15:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:15:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537076158166782', '1', 'dauthUsage:list', '数据权限应用:列表', null, null, '1052481647455311301', '2', '1060262570224060575', '1', null, null, '/sys/dauthUsage/list', '102', '1', null, null, '0', '0', to_date('28-02-2017 16:15:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:15:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537116852352768', '1', 'dauthUsage:create', '数据权限应用:新增', null, null, '1052481647455311301', '1', '1052481659203557933', '1', null, null, '/sys/dauthUsage/add', '104', '1', null, null, '0', '0', to_date('28-02-2017 16:16:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:16:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537149546952450', '1', 'dauthUsage:update', '数据权限应用:修改', null, null, '1052481647455311301', '1', '1052481659203557963', '1', null, null, '/sys/dauthUsage/update', '105', '1', null, null, '0', '0', to_date('28-02-2017 16:17:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:17:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537199051273988', '1', 'dauthUsage:clearConfig', '数据权限应用:清空配置', null, null, '1052481647455311301', '1', '1052481659203557963', '1', null, null, '/sys/dauthUsage/deleteUsageDauth', '106', '1', null, null, '0', '0', to_date('28-02-2017 16:17:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:17:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537460372141834', '1', 'dauth:aboutDauth', '数据权限:关于', null, null, '1052481647455311300', '2', '1060512414373153244', '1', null, null, '/sys/dauth/aboutDauth', '103', '1', null, null, '0', '0', to_date('28-02-2017 16:21:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:21:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537568121714444', '1', 'dauth:list', '数据权限:列表', null, null, '1052481647455311300', '2', '1060262570224060575', '1', null, null, '/sys/dauth/list', '102', '1', null, null, '0', '0', to_date('28-02-2017 16:23:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:23:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537606721894158', '1', 'dauth:chooseDauthView', '数据权限:选择权限', null, null, '1052481647455311300', '2', '1060512414373153244', '1', null, null, '/sys/dauth/chooseDauthView', '108', '1', null, null, '0', '0', to_date('28-02-2017 16:24:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:24:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537654704731920', '1', 'dauth:chooseDauthList', '数据权限:选择权限列表', null, null, '1052481647455311300', '2', '1060262570224060575', '1', null, null, '/sys/dauth/chooseDauthList', '109', '1', null, null, '0', '0', to_date('28-02-2017 16:25:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:25:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537811049510674', '1', 'dauth:detailView', '数据权限:详情', null, null, '1052481647455311300', '2', '1060262570224060575', '1', null, null, '/sys/dauth/detailView', '107', '1', null, null, '0', '0', to_date('28-02-2017 16:27:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:27:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537905622677270', '1', 'dauthCheck:view', '数据权限:校验', null, null, '1052481647455311300', '1', '1060512414373153244', '1', null, null, '/sys/dauth/checkView/%d', '101', '1', null, null, '0', '0', to_date('28-02-2017 16:29:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 17:01:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537942106830616', '1', 'dauthCheck:check', '数据权限校验:校验', null, null, '1052481647455311300', '2', '1060262570224060575', '1', null, null, '/sys/dauth/checkDauth', '102', '1', null, null, '0', '0', to_date('28-02-2017 16:29:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:29:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060537972850030362', '1', 'dauth:create', '数据权限:新增', null, null, '1052481647455311300', '1', '1052481659203557933', '1', null, null, '/sys/dauth/add', '104', '1', null, null, '0', '0', to_date('28-02-2017 16:30:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:30:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060538012249224988', '1', 'dauth:update', '数据权限:修改', null, null, '1052481647455311300', '1', '1052481659203557963', '1', null, null, '/sys/dauth/update', '105', '1', null, null, '0', '0', to_date('28-02-2017 16:30:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:30:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060538059636471582', '1', 'dauth:delete', '数据权限:删除', null, null, '1052481647455311300', '1', '1052481659203558275', '1', null, null, '/sys/dauth/delete', '106', '1', null, null, '0', '0', to_date('28-02-2017 16:31:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:31:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539098439743266', '1', 'dauthFilter:aboutFilterItem', '过滤器项:关于', null, null, '1060536269074462439', '2', '1060512414373153244', '1', null, null, '/sys/dauthFilter/aboutFilterItem', '103', '1', null, null, '0', '0', to_date('28-02-2017 16:48:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:48:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539139843815204', '1', 'dauthFilter:aboutFilterGroup', '过滤器组:关于', null, null, '1060537266043746054', '2', '1060512414373153244', '1', null, null, '/sys/dauthFilter/aboutFilterGroup', '103', '1', null, null, '0', '0', to_date('28-02-2017 16:48:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:48:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539182585870118', '1', 'dauthFilter:aboutFilterJoin', '过滤器关联:关于', null, null, '1060537285849249544', '2', '1060512414373153244', '1', null, null, '/sys/dauthFilter/aboutFilterJoin', '103', '1', null, null, '0', '0', to_date('28-02-2017 16:49:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539272757114664', '1', 'dauthFilter:filterItemView', '过滤器项管理:访问', null, null, '1060536269074462439', '1', '1052481659203556933', '1', null, null, '/sys/dauthFilter/filterItemView', '101', '1', null, null, '0', '0', to_date('28-02-2017 16:50:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:50:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539337256073002', '1', 'dauthFilter:filterItemList', '过滤器项:列表', null, null, '1060536269074462439', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilter/filterItemList', '102', '1', null, null, '0', '0', to_date('28-02-2017 16:51:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:51:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539514465417008', '1', 'dauthFilterItemSelect:view', '过滤器项选择:访问', null, null, '1060539373376370476', '2', '1052481659203556933', '1', null, null, '/sys/dauthFilter/chooseFilterItemView/%d', '101', '1', null, null, '0', '0', to_date('28-02-2017 16:54:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:55:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539570032604978', '1', 'dauthFilterItemSelect:list', '过滤器项选择:列表', null, null, '1060539373376370476', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilter/chooseFilterItemList/%d', '102', '1', null, null, '0', '0', to_date('28-02-2017 16:55:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:55:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539641341015862', '1', 'dauthFilter:addFilterItem', '过滤器项:新增', null, null, '1060536269074462439', '1', '1052481659203557933', '1', null, null, '/sys/dauthFilter/addFilterItem', '104', '1', null, null, '0', '0', to_date('28-02-2017 16:56:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:56:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539726008284984', '1', 'dauthFilter:updateFilterItem', '过滤器项:修改', null, null, '1060536269074462439', '1', '1052481659203557963', '1', null, null, '/sys/dauthFilter/updateFilterItem', '105', '1', null, null, '0', '0', to_date('28-02-2017 16:57:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:57:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539768441009978', '1', 'dauthFilter:deleteFilterItem', '过滤器项:删除', null, null, '1060536269074462439', '1', '1052481659203558275', '1', null, null, '/sys/dauthFilter/deleteFilterItem', '106', '1', null, null, '0', '0', to_date('28-02-2017 16:58:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:58:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539828406974268', '1', 'dauthFilter:filterGroupView', '过滤器组:访问', null, null, '1060537266043746054', '1', '1052481659203556933', '1', null, null, '/sys/dauthFilter/filterGroupView', '101', '1', null, null, '0', '0', to_date('28-02-2017 16:59:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:59:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060539904442435202', '1', 'sysRoleAuth:deleteBatch', '角色权限删除', null, null, '1060513673827224029', '2', '1052481659203558275', '1', null, null, '/sys/sysRoleAuth/deleteBatch', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:00:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:00:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540003079812926', '1', 'dauthFilter:filterGroupList', '过滤器组:列表', null, null, '1060537266043746054', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilter/filterGroupList', '102', '1', null, null, '0', '0', to_date('28-02-2017 17:02:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:02:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540184194053952', '1', 'dauthFilter:dauthDetailGpList', '过滤器组:权限详情列表', null, null, '1060537266043746054', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilter/dauthDetailGroupList', '107', '1', null, null, '0', '0', to_date('28-02-2017 17:05:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:05:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540230126925634', '1', 'dauthFilter:addFilterGroup', '过滤器组:新增', null, null, '1060537266043746054', '1', '1052481659203557933', '1', null, null, '/sys/dauthFilter/addFilterGroup', '104', '1', null, null, '0', '0', to_date('28-02-2017 17:05:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:05:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540281988446020', '1', 'dauthFilter:updateFilterGroup', '过滤器组:修改', null, null, '1060537266043746054', '1', '1052481659203557963', '1', null, null, '/sys/dauthFilter/updateFilterGroup', '105', '1', null, null, '0', '0', to_date('28-02-2017 17:06:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:06:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269295156824744', '1', 'sysMyTask:create', '待办任务:创建', 'sysMyTask:create', 'sysMyTask.create', '1052481659203556833', '1', '1052481659203557933', '1', null, null, '/sys/sysTask/myTask/create', '174', '1', null, null, '0', '0', to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269295214496425', '1', 'sysMyTask:update', '待办任务:更新', 'sysMyTask:update', 'sysMyTask.update', '1052481659203556833', '1', '1052481659203557963', '1', null, null, '/sys/sysTask/myTask/update', '175', '1', null, null, '0', '0', to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269295260633770', '1', 'sysMyTask:delete', '待办任务:删除', 'sysMyTask:delete', 'sysMyTask.delete', '1052481659203556833', '1', '1052481659203558275', '1', null, null, '/sys/sysTask/myTask/delete', '176', '1', null, null, '0', '0', to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1056744893101518814', '1', 'sysDemo:view', 'DEMO演示:访问', null, 'sysDemo:view', '1056741606000308184', '1', '1052481659203556933', '1', null, null, 'sysDemo:view', '1', '1', null, null, '0', '0', to_date('17-01-2017 19:40:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:08:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1056745852093476833', '1', 'sysDemo1:view', 'DEMO演示:访问', null, 'sysDemo1:view', '1056745429913710559', '1', '1052481659203556933', '0', null, null, ' a', '1', '1', null, null, '0', '0', to_date('17-01-2017 19:55:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:10:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1058615553282663736', '1', 'sysDruidMonitor:view', 'druid监控:访问', 'sysDruidMonitor:view', 'sysDruidMonitor:view', '1058615343450023223', '1', '1052481659203556933', '1', null, null, '/sys/info/druidView', '1', '1', null, '此功能权限只有超级管理员角色才可以访问，其它角色配置也无效。', '0', '0', to_date('07-02-2017 11:14:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2017 11:20:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1058635541087889252', '1', 'ueditor:view', '富文本编辑器:访问', 'ueditor:view', 'ueditor:view', '1058634996701833057', '1', '1052481659203556933', '0', null, null, '/common/demo/ueditor/toDemoPage', '1', '1', null, null, '0', '0', to_date('07-02-2017 16:31:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:10:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1058635600936413029', '1', 'excelDemo:view', 'Excel相关:访问', 'excelDemo:view', 'excelDemo:view', '1058635183551784802', '1', '1052481659203556933', '0', null, null, '/common/demo/excel/toExcelDemoPage', '1', '1', null, null, '0', '0', to_date('07-02-2017 16:32:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:17:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1058635657762940774', '1', 'pdfDemo:view', 'PDF相关:访问', 'pdfDemo:view', 'pdfDemo:view', '1058635416398571363', '1', '1052481659203556933', '0', null, null, '/common/demo/pdf/toPdfDemoPage', '1', '1', null, null, '0', '0', to_date('07-02-2017 16:33:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:17:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1059183295447480819', '1', 'fileDemo:view', '文件上传下载:访问', 'fileDemo:view', 'fileDemo:view', '1059183053449771506', '1', '1052481659203556933', '0', null, null, '/common/demo/fileDemo/toFileDemoPage', '1', '1', null, null, '0', '0', to_date('13-02-2017 17:38:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:12:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1059277407171456111', '1', 'echartsDemo:show', 'ECharts报表:访问', 'echartsDemo:show', 'echartsDemo:show', '1059277349464124526', '1', '1052481659203556933', '0', null, null, '/common/demo/echart/toEchartDemoPage', '1', '1', null, null, '0', '0', to_date('14-02-2017 18:33:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:18:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1059442833175271064', '1', 'mailDemo:show', 'UEditor邮件:访问', 'mailDemo:show', 'mailDemo:show', '1059442767489324695', '1', '1052481659203556933', '0', null, null, '/common/demo/mail/toMailDemoPage', '1', '1', null, null, '0', '0', to_date('16-02-2017 14:23:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:18:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1059970917085303378', '1', 'singleCommitDemo:view', '防重复提交:访问', null, null, '1059970869698056785', '1', '1052481659203556933', '0', null, null, '/common/demo/singleCommit/toSingleCommit', '1', '1', null, null, '0', '0', to_date('22-02-2017 10:17:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:18:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060425623704276216', '1', 'sysAuthMenu:list', '获得功能权限列表', null, null, '1052481648470332868', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/list', '2', '1', null, null, '0', '0', to_date('27-02-2017 10:44:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:44:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060425958750522618', '1', 'sysAuthMenu:detailView', '详情:访问', null, null, '1060425852316912889', '2', '1052481659203556933', '0', null, null, '/sys/sysAuthMenu/detail/%d/%d/%d', '1', '1', null, null, '0', '0', to_date('27-02-2017 10:49:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 16:56:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060426547659115772', '1', 'sysAuthMenu:checkForm', 'URL重复/包含:校验', null, null, '1052481648470332868', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/checkForm', '4', '1', null, null, '0', '0', to_date('27-02-2017 10:59:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 16:58:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060427833277254912', '1', 'authManageWinView', '[公共]权限选择框:访问', null, null, '1060427695770143999', '2', '1052481659203556933', '0', null, null, '/sys/sysAuthMenu/authManageDialogView', '1', '1', null, null, '0', '0', to_date('27-02-2017 11:19:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:20:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060428045272059138', '1', 'sysAuthMenu:aboutDialogView', '关于弹出框:访问', null, null, '1052481648470332868', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/aboutDialogView', '5', '1', null, null, '0', '0', to_date('27-02-2017 11:22:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 16:58:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060428170911386883', '1', 'sysAuthMenu:authManageWinList', '[公共]权限选择框全部数据', null, null, '1060427695770143999', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/authManageDialogList', '2', '1', null, null, '0', '0', to_date('27-02-2017 11:24:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:21:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060428226958822660', '1', 'menuset:view', '功能权限列表主页:访问', null, null, '1060425468402830583', '1', '1052481659203556933', '0', null, null, '/sys/sysAuthMenu/menuset_view', '1', '1', null, null, '0', '0', to_date('27-02-2017 11:25:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:08:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060428307722243333', '1', 'menuset_view:treeList', '菜单树:query', null, null, '1060425468402830583', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/treeList', '2', '1', null, null, '0', '0', to_date('27-02-2017 11:27:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 11:27:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060428430601719046', '1', 'sysAuthMenu:getGrantedAuthList', '[公共]获取已授权的数据列表', null, null, '1060427695770143999', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/getGrantedAuthList', '505', '1', null, null, '0', '0', to_date('27-02-2017 11:28:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:17:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060428592153726216', '1', 'menuSet:update', '顶部菜单更新', null, null, '1060425468402830583', '1', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/updateMenuSet', '7', '1', null, null, '0', '0', to_date('27-02-2017 11:31:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 16:37:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060429383554927902', '1', 'sysRole:pageListByAuthId', '根据权限ID查询角色列表', null, null, '1052481648127448515', '2', '1060262570224060575', '0', null, null, '/sys/sysRole/pageListByAuthId', '10', '1', null, null, '0', '0', to_date('27-02-2017 11:44:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 11:25:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060429497480613151', '1', 'sysUser:pageListByAuthId', '根据权限ID查询角色列表', null, null, '1052481647455311297', '2', '1060262570224060575', '0', null, null, '/sys/sysUser/pageListByAuthId', '1', '1', null, null, '0', '0', to_date('27-02-2017 11:45:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 11:45:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060443227480767902', '1', 'sysOperation:list', '操作权限列表查询', null, null, '1052481649176024518', '2', '1060262570224060575', '0', null, null, '/sys/sysOperation/list', '1', '1', null, null, '0', '0', to_date('27-02-2017 15:24:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 15:24:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060454137317508479', '1', 'sysConfig:aboutOneView', '关于本条信息', null, null, '1052481652945655248', '2', '1060512414373153244', '0', null, null, '/sys/sysConfig/aboutOne', '1', '1', null, null, '0', '0', to_date('27-02-2017 18:17:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 11:26:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060454237634774400', '1', 'sysConfig:list', '系统设置list', null, null, '1052481652945655248', '2', '1060262570224060575', '0', null, null, '/sys/sysConfig/list', '2', '1', null, null, '0', '0', to_date('27-02-2017 18:19:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 18:19:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060455425160725889', '1', 'sysConfig:hisList', '系统设置hisList', null, null, '1052481652945655248', '2', '1060262570224060575', '0', null, null, '/sys/sysConfig/hisList', '3', '1', null, null, '0', '0', to_date('27-02-2017 18:38:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 18:38:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060457336948118351', '1', 'sysDict:groupList', '字典组分页数据', null, null, '1052481653695387090', '2', '1060262570224060575', '0', null, null, '/sys/sysDict/groupList', '1', '1', null, null, '0', '0', to_date('27-02-2017 19:08:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:04:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060457499070550864', '1', 'sysDict:groupIdItemList', '字典项列表', null, null, '1052481654041417171', '2', '1060262570224060575', '0', null, null, '/sys/sysDict/%d/itemList', '2', '1', null, null, '0', '0', to_date('27-02-2017 19:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:11:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060457638798545745', '1', 'sysDict:itemList%s%s', '获取字典项列表', null, null, '1052481653319996881', '1', '1060262570224060575', '0', null, null, '/sys/sysDict/itemList/%s/%s', '3', '1', null, null, '0', '0', to_date('27-02-2017 19:13:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:13:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060460357990747589', '1', 'sysDict:itemView', '字典项管理页面', null, null, '1052481654041417171', '2', '1060512414373153244', '0', null, null, '/sys/sysDict/item/view', '1', '1', null, null, '0', '0', to_date('27-02-2017 19:56:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:04:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060512630049426250', '1', 'sysIcon:chooseIconView', '图标管理:选择图标', null, null, '1052481655604843993', '1', '1060512414373153244', '0', null, null, '/sys/sysIcon/chooseIconView', '1', '1', null, null, '0', '0', to_date('28-02-2017 09:47:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:46:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060512716001200972', '1', 'sysIcon:iconList', '图标管理:分页数据', null, null, '1052481655604843993', '2', '1060262570224060575', '0', null, null, '/sys/sysIcon/iconList', '3', '1', null, null, '0', '0', to_date('28-02-2017 09:48:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:47:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060512989158394705', '1', 'sysIcon:Reconfiguration', '图标管理:一键配置图标', null, null, '1052481655604843993', '1', '1060262570224060575', '0', null, null, '/sys/sysIcon/Reconfiguration', '4', '1', null, null, '0', '0', to_date('28-02-2017 09:53:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:50:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060513898629335518', '1', 'sysRoleAuth:view', '角色权限:访问', 'sysRoleAuth:view', 'sysRoleAuth.view', '1060513673827224029', '2', '1052481659203556933', '1', null, null, '/sys/sysRole/sysRoleAuthView;
/sys/sysAuthMenu/getRoleAuthList', '1', '1', null, null, '0', '0', to_date('28-02-2017 10:07:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 11:48:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060514158411942368', '1', 'sysRoleAuth:manage', '角色权限:管理', 'sysRoleAuth:manage', 'sysRoleAuth.manage', '1060513673827224029', '1', '1060513996837915103', '1', null, null, '/sys/sysRoleAuth/refresh', '3', '1', null, null, '0', '0', to_date('28-02-2017 10:11:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 10:52:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060517440993790435', '1', 'sysRoleUser:list', '角色用户:列表', 'sysRoleUser:list', 'sysRoleUser.list', '1060516871598148066', '2', '1060262570224060575', '1', null, null, '/sys/sysUserRole/list', '1', '1', null, null, '0', '0', to_date('28-02-2017 11:03:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 11:04:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060517625944771045', '1', 'sysRoleUser:create', '角色用户:添加', 'sysRoleUser:create', 'sysRoleUser.create', '1060516871598148066', '1', '1052481659203557933', '1', null, null, '/sys/sysUserRole/add', '3', '1', null, null, '0', '0', to_date('28-02-2017 11:06:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 11:06:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060518192551201254', '1', 'sysRoleUser:delete', '角色用户:删除', 'sysRoleUser:create', 'sysRoleUser.delete', '1060516871598148066', '1', '1052481659203558275', '1', null, null, '/sys/sysUserRole/delete', '5', '1', null, null, '0', '0', to_date('28-02-2017 11:15:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 11:17:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060518473066075753', '1', 'dauthOperatorSupport:create', '运算符支持:创建', null, null, '1052481647455311298', '1', '1052481659203557933', '1', null, null, '/sys/dauthOperator/addSupport', '106', '1', null, null, '0', '0', to_date('28-02-2017 11:20:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 11:20:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060520373898434155', '1', 'dauthOperatorSupport:about', '运算符支持:关于', null, null, '1052481647455311298', '2', '1060512414373153244', '1', null, null, '/sys/dauthOperator/aboutOperatorSupport', '105', '1', null, null, '0', '0', to_date('28-02-2017 11:50:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:02:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060521285249956189', '1', 'dauthOperator:about', '运算符:关于', null, null, '1060521204894431579', '2', '1052481659203556933', '1', null, null, '/sys/dauthOperator/aboutOperator', '103', '1', null, null, '0', '0', to_date('28-02-2017 12:04:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:04:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060521414168181087', '1', 'dauthOperatorSupport:list', '运算符支持:数据列表', null, null, '1052481647455311298', '2', '1060262570224060575', '1', null, null, '/sys/dauthOperator/supportList', '104', '1', null, null, '0', '0', to_date('28-02-2017 12:06:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:06:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060521496474057057', '1', 'dauthOperatorSupport:update', '运算符支持:修改', null, null, '1052481647455311298', '1', '1052481659203557963', '1', null, null, '/sys/dauthOperator/updateSupport', '107', '1', null, null, '0', '0', to_date('28-02-2017 12:08:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:08:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060521622693247331', '1', 'dauthOperatorSupport:delete', '运算符支持:删除', null, null, '1052481647455311298', '1', '1052481659203558275', '1', null, null, '/sys/dauthOperator/deleteSupport', '108', '1', null, null, '0', '0', to_date('28-02-2017 12:10:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:10:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060521729551530342', '1', 'dauthOperator:view', '运算符:访问', null, null, '1060521204894431579', '1', '1052481659203556933', '1', null, null, '/sys/dauthOperator/operatorView', '101', '1', null, null, '0', '0', to_date('28-02-2017 12:11:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:13:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060521817713703273', '1', 'dauthOperator:list', '运算符:数据列表', null, null, '1060521204894431579', '2', '1060262570224060575', '1', null, null, '/sys/dauthOperator/operatorList', '102', '1', null, null, '0', '0', to_date('28-02-2017 12:13:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:13:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060522022291929453', '1', 'dauthOperator:create', '运算符:新增', null, null, '1060521204894431579', '1', '1052481659203557933', '1', null, null, '/sys/dauthOperator/addOperator', '104', '1', null, null, '0', '0', to_date('28-02-2017 12:16:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:16:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060522062648473967', '1', 'dauthOperator:update', '运算符:修改', null, null, '1060521204894431579', '1', '1052481659203557963', '1', null, null, '/sys/dauthOperator/updateOperator', '105', '1', null, null, '0', '0', to_date('28-02-2017 12:17:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:17:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060522106275527025', '1', 'dauthOperator:delete', '运算符:删除', null, null, '1060521204894431579', '1', '1052481659203558275', '1', null, null, '/sys/dauthOperator/deleteOperator', '106', '1', null, null, '0', '0', to_date('28-02-2017 12:17:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:17:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529093387913715', '1', 'sysUserWin:winView', '[公用]用户管理:弹窗页面', 'sysUserWin:winView', 'sysUserWin.winView', '1060530341559306746', '2', '1060512414373153244', '1', null, null, '/sys/sysUser/winView', '1000', '1', null, '与sysOrg:orgTree同时使用', '0', '0', to_date('28-02-2017 14:08:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:31:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529385641773556', '1', 'sysUserWin:winList', '[公共]用户管理:弹窗数据', 'sysUserWin:winList', 'sysUserWin.winList', '1060530341559306746', '2', '1060262570224060575', '1', null, null, '/sys/sysUser/winList', '102', '1', null, '与sysOrg:orgTree同时使用', '0', '0', to_date('28-02-2017 14:13:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:31:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529513805055535', '1', 'sysLog:list', '分页数据list', null, null, '1052481654405273056', '2', '1060262570224060575', '0', null, null, '/sys/sysLog/list', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:15:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:15:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529720687982212', '1', 'dauthOperator:getList', '运算符:选择运算符列表', null, null, '1060521204894431579', '2', '1060262570224060575', '1', null, null, '/sys/dauthOperator/getOperatorList', '107', '1', null, null, '0', '0', to_date('28-02-2017 14:18:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:18:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529782516287036', '1', 'sysUserLog:list', '个人日志:list', null, null, '1052481654405273057', '2', '1060262570224060575', '0', null, null, '/sys/sysUserLog/list', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:19:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:19:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529824024098438', '1', 'dauthOperatorSupport:opList', '运算符支持:获取支持的运算符', null, null, '1052481647455311298', '2', '1060262570224060575', '1', null, null, '/sys/dauthOperator/getSupportOperators/%d', '109', '1', null, null, '0', '0', to_date('28-02-2017 14:20:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:20:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060529924825806473', '1', 'dauthOperatorSupport:vTypes', '运算符支持:获取支持的值类型', null, null, '1052481647455311298', '2', '1060262570224060575', '1', null, null, '/sys/dauthOperator/getSupportValueTypes/%d/%d', '110', '1', null, null, '0', '0', to_date('28-02-2017 14:22:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:22:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060530105551095370', '1', 'info:jvmInfo', 'JVM信息:列表', null, null, '1052481655704243260', '2', '1060262570224060575', '0', null, null, '/sys/info/jvmInfo', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:25:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:54:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060530184971290188', '1', 'sysInfo:serverInfo', '服务器信息:列表', null, null, '1052481655704243262', '2', '1060262570224060575', '0', null, null, '/sys/info/serverInfo', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:26:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:54:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060530241626900046', '1', 'sysInfo:systemInfo', '系统运行信息:列表', null, null, '1052481655704243263', '2', '1060262570224060575', '0', null, null, '/sys/info/systemInfo', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:27:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:55:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060530512527558229', '1', 'sysFile:fileList', '附件管理fileList', null, null, '1052481654739768789', '2', '1060262570224060575', '1', null, null, '/sys/sysFile/fileList', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:31:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:31:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531101189704192', '1', 'sysRoleWin:winView', '[公共]角色选择框:页面', 'sysRoleWin:winView', 'sysRoleWin.winView', '1060531000917527039', '2', '1052481659203556933', '1', null, null, '/sys/sysRole/winView', '1', '1', null, null, '0', '0', to_date('28-02-2017 14:40:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:40:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531180596267521', '1', 'sysRoleWin:winList', '[公共]角色选择框:数据', 'sysRoleWin:winList', 'sysRoleWin.winList', '1060531000917527039', '2', '1060262570224060575', '1', null, null, '/sys/sysRole/winList', '2', '1', null, null, '0', '0', to_date('28-02-2017 14:42:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:42:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531371389945459', '1', 'sysFile:aboutDialogView', '附件管理:关于', null, null, '1052481654739768789', '2', '1060512414373153244', '0', null, null, '/sys/sysFile/aboutDialogView', '3', '1', null, null, '0', '0', to_date('28-02-2017 14:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:45:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531786719295117', '1', 'dauthFilterType:aboutone', '过滤类型:关于', null, null, '1060531546931984011', '2', '1060512414373153244', '1', null, null, '/sys/dauthFilterType/aboutOne', '103', '1', null, null, '0', '0', to_date('28-02-2017 14:51:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:52:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531869244323473', '1', 'dauthFilterType:view', '过滤类型:访问', null, null, '1060531546931984011', '1', '1052481659203556933', '1', null, null, '/sys/dauthFilterType/filterTypeView', '101', '1', null, null, '0', '0', to_date('28-02-2017 14:53:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:53:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531910439728787', '1', 'dauthFilterType:list', '过滤类型:数据列表', null, null, '1060531546931984011', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilterType/filterTypeList', '102', '1', null, null, '0', '0', to_date('28-02-2017 14:53:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:53:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060531956747990677', '1', 'dauthFilterType:getList', '过滤类型:获取过滤类型列表', null, null, '1060531546931984011', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilterType/getFilterTypeList', '107', '1', null, null, '0', '0', to_date('28-02-2017 14:54:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:54:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532031278713347', '1', 'sysRoleWin:list', '[公共]角色选择框:数据列表', 'sysRoleWin:list', 'sysRoleWin.list', '1060531000917527039', '2', '1060262570224060575', '1', null, null, '/sys/sysRole/getList', '3', '1', null, null, '0', '0', to_date('28-02-2017 14:55:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:55:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532034701227671', '1', 'dauthFilterType:create', '过滤类型:新增', null, null, '1060531546931984011', '1', '1052481659203557933', '1', null, null, '/sys/dauthFilterType/addFilterType', '104', '1', null, null, '0', '0', to_date('28-02-2017 14:55:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:55:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532071473739417', '1', 'dauthFilterType:update', '过滤类型:修改', null, null, '1060531546931984011', '1', '1052481659203557963', '1', null, null, '/sys/dauthFilterType/updateFilterType', '105', '1', null, null, '0', '0', to_date('28-02-2017 14:56:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:56:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532126926632603', '1', 'dauthFilterType:delete', '过滤类型:删除', null, null, '1060531546931984011', '1', '1052481659203558275', '1', null, null, '/sys/dauthFilterType/deleteFilterType', '106', '1', null, null, '0', '0', to_date('28-02-2017 14:57:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:57:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532701455054527', '1', 'sysMetadata:aboutEntity', '元数据实体:关于', null, null, '1052481647455311299', '2', '1060512414373153244', '1', null, null, '/sys/sysMetadata/aboutEntity', '103', '1', null, null, '0', '0', to_date('28-02-2017 15:06:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:07:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532757231957697', '1', 'sysMetadata:aboutField', '元数据字段:关于', null, null, '1060535699748026070', '2', '1060512414373153244', '1', null, null, '/sys/sysMetadata/aboutField', '103', '1', null, null, '0', '0', to_date('28-02-2017 15:07:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:07:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532813148321476', '1', 'sysMetadata:entityList', '元数据实体:列表', null, null, '1052481647455311299', '2', '1060262570224060575', '1', null, null, '/sys/sysMetadata/entityList', '102', '1', null, null, '0', '0', to_date('28-02-2017 15:08:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:08:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060532901006407366', '1', 'sysMetadata:getEntityList', '元数据实体:获取实体列表', null, null, '1052481647455311299', '2', '1060262570224060575', '1', null, null, '/sys/sysMetadata/getEntityList', '107', '1', null, null, '0', '0', to_date('28-02-2017 15:09:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:09:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535336045246152', '1', 'sysMetadata:selectTableView', '元数据:选择表', null, null, '1052481647455311299', '2', '1060512414373153244', '1', null, null, '/sys/sysMetadata/sysMetaTableView', '108', '1', null, null, '0', '0', to_date('28-02-2017 15:48:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:48:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535392954611402', '1', 'sysMetadata:tableList', '元数据:选择表数据', null, null, '1052481647455311299', '2', '1060262570224060575', '1', null, null, '/sys/sysMetadata/metaTableList', '109', '1', null, null, '0', '0', to_date('28-02-2017 15:49:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:49:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535506143147724', '1', 'sysMetadata:tableFieldList', '元数据:表字段列表', null, null, '1060535699748026070', '2', '1060262570224060575', '1', null, null, '/sys/sysMetadata/metaFieldList/%s', '108', '1', null, null, '0', '0', to_date('28-02-2017 15:50:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:50:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535560930195150', '1', 'sysMetadata:addEntity', '元数据实体:新增', null, null, '1052481647455311299', '1', '1052481659203557933', '1', null, null, '/sys/sysMetadata/addEntity', '104', '1', null, null, '0', '0', to_date('28-02-2017 15:51:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:51:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535607169251025', '1', 'sysMetadata:updateEntity', '元数据实体:修改', null, null, '1052481647455311299', '1', '1052481659203557963', '1', null, null, '/sys/sysMetadata/updateEntity', '105', '1', null, null, '0', '0', to_date('28-02-2017 15:52:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:52:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060535663224026836', '1', 'sysMetadata:deleteEntity', '元数据实体:删除', null, null, '1052481647455311299', '1', '1052481659203558275', '1', null, null, '/sys/sysMetadata/deleteEntity', '106', '1', null, null, '0', '0', to_date('28-02-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288255097393', '1', 'sysManagementMenu:view', '系统管理:访问', 'sysManagementMenu:view', 'sysManagementMenu.view', '1052481646384715198', '1', '1052481659203556933', '1', null, null, 'v-system', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 16:58:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288340032050', '1', 'sysAuthManagementMenu:view', '权限管理:访问', 'sysAuthManagementMenu:view', 'sysAuthManagementMenu.view', '1052481646805194175', '1', '1052481659203556933', '1', null, null, 'v-auth', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 16:58:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288340032051', '1', 'dauthManagementMenu:view', '数据权限:访问', 'sysDauthManagementMenu:view', 'sysDauthManagementMenu:view', '1052481646805194176', '1', '1052481659203556933', '1', null, null, null, '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288410286643', '1', 'sysUser:view', '用户管理:访问', 'sysUser:view', 'sysUser.view', '1052481647455311297', '1', '1052481659203556933', '1', null, null, '/sys/sysUser/view;/sys/sysUser/list;/sys/sysUser/aboutOne
', '9', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:44:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288410286644', '1', 'dauthOperatorSupport:view', '运算符支持:访问', 'sysDauthOperatorSupport:view', 'sysDauthOperatorSupport:view', '1052481647455311298', '1', '1052481659203556933', '1', null, null, '/sys/dauthOperator/supportView', '103', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:01:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288410286645', '1', 'sysMetadata:view', '实体字段管理:访问', 'sysMetadata:view', 'sysMetadata:view', '1052481647455311299', '1', '1052481659203556933', '1', null, null, '/sys/sysMetadata/metadataView', '101', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288410286646', '1', 'dauth:view', '数据权限:访问', 'sysDauth:view', 'sysDauth:view', '1052481647455311300', '1', '1052481659203556933', '1', null, null, '/sys/dauth/view', '101', '1', null, null, '0', null, to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288410286667', '1', 'dauthUsage:view', '数据权限应用:访问', 'sysDauthUsage:view', 'sysDauthUsage:view', '1052481647455311301', '1', '1052481659203556933', '1', null, null, '/sys/dauthUsage/view', '101', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288579107380', '1', 'sysUser:create', '用户管理:创建', 'sysUser:create', 'sysUser.create', '1052481647455311297', '1', '1052481659203557933', '1', 'icon_auto_colorful__plus', null, '/sys/sysUser/addUser', '10', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-03-2017 10:41:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288618953269', '1', 'sysUser:update', '用户管理:更新', 'sysUser:update', 'sysUser.update', '1052481647455311297', '1', '1052481659203557963', '1', null, null, '/sys/sysUser/updUser', '11', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:27:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288660896310', '1', 'sysUser:delete', '用户管理:删除', 'sysUser:delete', 'sysUser.delete', '1052481647455311297', '1', '1052481659203558275', '1', null, null, '/sys/sysUser/delUser', '12', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:27:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288709130807', '1', 'sysRole:view', '角色管理:访问', 'sysRole:view', 'sysRole.view', '1052481648127448515', '1', '1052481659203556933', '1', null, null, '/sys/sysRole/view;/sys/sysRole/list;/sys/sysRole/aboutOne', '13', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:11:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288764705336', '1', 'sysRole:create', '角色管理:创建', 'sysRole:create', 'sysRole.create', '1052481648127448515', '1', '1052481659203557933', '1', null, null, '/sys/sysRole/create', '14', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288804551225', '1', 'sysRole:update', '角色管理:更新', 'sysRole:update', 'sysRole.update', '1052481648127448515', '1', '1052481659203557963', '1', null, null, '/sys/sysRole/update', '15', '1', null, null, '0', '0', to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288870611514', '1', 'sysRole:delete', '角色管理:删除', 'sysRole:delete', 'sysRole.delete', '1052481648127448515', '1', '1052481659203558275', '1', null, null, '/sys/sysRole/delete', '16', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269288910457403', '1', 'sysAuthMenu:view', '功能权限:访问', 'sysAuthMenu:view', 'sysAuthMenu.view', '1052481648470332868', '1', '1052481659203556933', '1', null, null, '/sys/sysAuthMenu/view', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:43:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289002732093', '1', 'sysModel:create', '模块配置:创建', 'sysModel:create', 'sysModel.create', '1052481648827897285', '1', '1052481659203557933', '1', null, null, '/sys/model/create', '22', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289043626558', '1', 'sysModel:update', '模块配置:更新', 'sysModel:update', 'sysModel.update', '1052481648827897285', '1', '1052481659203557963', '1', null, null, '/sys/model/update', '23', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289082423871', '1', 'sysModel:delete', '模块配置:删除', 'sysModel:delete', 'sysModel.delete', '1052481648827897285', '1', '1052481659203558275', '1', null, null, '/sys/model/delete', '24', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289128561216', '1', 'sysOperation:view', '操作类型配置:访问', 'sysOperation:view', 'sysOperation.view', '1052481649176024518', '1', '1052481659203556933', '1', null, null, '/sys/sysOperation/view', '25', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:12:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289174698561', '1', 'sysOperation:create', '操作类型配置:创建', 'sysOperation:create', 'sysOperation.create', '1052481649176024518', '1', '1052481659203557933', '1', null, null, '/sys/sysOperation/create', '26', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:12:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289259633218', '1', 'sysOperation:update', '操作类型配置:更新', 'sysOperation:update', 'sysOperation.update', '1052481649176024518', '1', '1052481659203557963', '1', null, null, '/sys/sysOperation/update', '27', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:12:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289370782275', '1', 'sysOperation:delete', '操作类型配置:删除', 'sysOperation:delete', 'sysOperation.delete', '1052481649176024518', '1', '1052481659203558275', '1', null, null, '/sys/sysOperation/delete', '28', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:12:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289539603013', '1', 'sysAuth:create', '权限管理:创建', 'sysAuth:create', 'sysAuth.create', '1052481649506325959', '1', '1052481659203557933', '0', null, null, '/sys/sysAuthMenu/create', '30', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:55:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289616149062', '1', 'sysAuth:update', '权限管理:更新', 'sysAuth:update', 'sysAuth.update', '1052481649506325959', '1', '1052481659203557963', '1', null, null, '/sys/sysAuthMenu/update', '31', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:56:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289722055239', '1', 'sysAuth:delete', '权限管理:删除', 'sysAuth:delete', 'sysAuth.delete', '1052481649506325959', '1', '1052481659203558275', '1', null, null, '/sys/sysAuthMenu/delete', '32', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:12:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289776581192', '1', 'sysOrg:view', '组织架构:访问', 'sysOrganizationMenu:view', 'sysOrganizationMenu.view', '1052481649938339272', '1', '1052481659203556933', '1', null, null, '/sys/org/view', '33', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 20:21:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289816427081', '1', 'sysOrg:jobList', '职务配置:分页查询', null, null, '1052481650369304009', '2', '1052481659203556933', '1', null, null, '/sys/org/jobList', '37', '1', null, null, '0', '0', to_date('10-12-2016 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:59:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289870953034', '1', 'sysOrg:allJobs', '职务配置:全部查询', null, null, '1052481650369304009', '2', '1060262570224060575', '1', null, null, '/sys/org/allJobs', '38', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:00:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289921284683', '1', 'sysOrg:updJob', '职务配置:更新', null, null, '1052481650369304009', '1', '1052481659203557963', '1', null, null, '/sys/org/updJob', '40', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:01:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269289975810636', '1', 'sysOrg:delJob', '职务配置:删除', null, null, '1052481650369304009', '1', '1052481659203558275', '1', null, null, '/sys/org/delJob', '42', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:02:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290030336589', '1', 'sysOrg:newPos', '岗位配置:新增', null, null, '1052481650765665738', '1', '1060512414373153244', '1', null, null, '/sys/org/newPos/%s', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 18:55:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290079619662', '1', 'sysOrg:editPos', '岗位配置:修改', null, null, '1052481650765665738', '1', '1052481659203557933', '1', null, null, '/sys/org/editPos/%d', '2', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 18:55:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290156165711', '1', 'sysOrg:aboutPos', '岗位配置:关于', null, null, '1052481650765665738', '2', '1060512414373153244', '1', null, null, '/sys/org/aboutPos/%d', '3', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:11:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290220128848', '1', 'sysOrg:posView', '岗位配置:选择弹窗', null, null, '1052481650765665738', '2', '1060512414373153244', '1', null, null, '/sys/org/posView/%d', '4', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:13:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290258926161', '1', 'sysOrg:newGroup', '小组管理:新增', null, null, '1052481651160978891', '1', '1060512414373153244', '1', null, null, '/sys/org/newGroup/%d', '1', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 18:56:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290312403538', '1', 'sysOrg:editGroup', '小组管理:修改', null, null, '1052481651160978891', '1', '1060512414373153244', '1', null, null, '/sys/org/editGroup/%d', '2', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 18:56:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290354346579', '1', 'sysOrg:aboutGroup', '小组管理:关于', null, null, '1052481651160978891', '2', '1060512414373153244', '1', null, null, '/sys/org/aboutGroup/%d', '3', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:42:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290406775380', '1', 'sysOrg:delGroup', '小组管理:删除', null, null, '1052481651160978891', '1', '1052481659203558275', '1', null, null, '/sys/org/delGroup/%d', '6', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:39:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290698279514', '1', 'sysConfigurationMenu:view', '配置运维:访问', 'sysConfigurationMenu:view', 'sysConfigurationMenu.view', '1052481652225283534', '1', '1052481659203556933', '1', null, null, null, '57', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290745465435', '1', 'sysConfigMenu:view', '系统设置:访问', 'sysConfigMenu:view', 'sysConfigMenu.view', '1052481652225283555', '1', '1052481659203556933', '1', null, null, null, '61', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1053269290790554204', '1', 'sysConfig:view', '系统设置:访问', 'sysConfig:view', 'sysConfig.view', '1052481652945655248', '1', '1052481659203556933', '1', null, null, '/sys/sysConfig/view', '65', '1', null, null, '0', '0', to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-12-2016 10:57:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540292496295560', '1', 'sysUserAuth:addBatch', '用户权限/负授权添加', null, null, '1060542039792034969', '2', '1052481659203557933', '0', null, null, '/sys/sysUserAuth/addBatch', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:06:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:32:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540320044414790', '1', 'dauthFilter:deleteFilterGroup', '过滤器组:删除', null, null, '1060537266043746054', '1', '1052481659203558275', '1', null, null, '/sys/dauthFilter/deleteFilterGroup', '106', '1', null, null, '0', '0', to_date('28-02-2017 17:07:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:07:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540362735158922', '1', 'sysUserAuth:deleteBatch', '用户权限/负授权删除', null, null, '1060542039792034969', '2', '1052481659203558275', '0', null, null, '/sys/sysUserAuth/deleteBatch', '2', '1', null, null, '0', '0', to_date('28-02-2017 17:08:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:33:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540379121186632', '1', 'dauthFilterJoin:view', '过滤器项配置:访问', null, null, '1060537285849249544', '1', '1052481659203556933', '1', null, null, '/sys/dauthFilter/filterJoinView/%d/%d', '101', '1', null, null, '0', '0', to_date('28-02-2017 17:08:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 19:05:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540484947670858', '1', 'dauthFilterJoin:itemViewJoin', '过滤器关联:过滤器项查看关联组', null, null, '1060537285849249544', '2', '1060512414373153244', '1', null, null, '/sys/dauthFilter/filterJoinItemGroupView', '108', '1', null, null, '0', '0', to_date('28-02-2017 17:10:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:10:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540564383594317', '1', 'dauthFilterJoin:list', '过滤器关联:列表', null, null, '1060537285849249544', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilter/filterJoinList', '102', '1', null, null, '0', '0', to_date('28-02-2017 17:11:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:11:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540655986214547', '1', 'sysRoleAuth:addBatch', '角色权限添加', null, null, '1060513673827224029', '2', '1052481659203557933', '0', null, null, '/sys/sysRoleAuth/addBatch', '2', '1', null, null, '0', '0', to_date('28-02-2017 17:12:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:12:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540692990392143', '1', 'dauthFilterJoin:dauthJoinList', '过滤器关联:权限详情获取关联列表', null, null, '1060537285849249544', '2', '1060262570224060575', '1', null, null, '/sys/dauthFilter/dauthDetailFilterJoinList', '107', '1', null, null, '0', '0', to_date('28-02-2017 17:13:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:13:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540733235787601', '1', 'dauthFilterJoin:create', '过滤器项配置:新增', null, null, '1060537285849249544', '1', '1052481659203557933', '1', null, null, '/sys/dauthFilter/addFilterJoin', '104', '1', null, null, '0', '0', to_date('28-02-2017 17:13:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 19:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540774933460819', '1', 'dauthFilterJoin:update', '过滤器项配置:修改', null, null, '1060537285849249544', '1', '1052481659203557963', '1', null, null, '/sys/dauthFilter/updateFilterJoin', '105', '1', null, null, '0', '0', to_date('28-02-2017 17:14:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 19:05:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540810435241095', '1', 'sysUser:detailView', '用户管理:访问详情', 'sysUser:detailView', 'sysUser.detailView', '1052481647455311297', '2', '1060512414373153244', '1', null, null, '/sys/sysUser/detail/view/%s/%d', '9', '1', null, null, '0', '0', to_date('28-02-2017 17:15:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:15:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060540836824610645', '1', 'dauthFilterJoin:delete', '过滤器项配置:删除', null, null, '1060537285849249544', '1', '1052481659203558275', '1', null, null, '/sys/dauthFilter/deleteFilterJoin', '106', '1', null, null, '0', '0', to_date('28-02-2017 17:15:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 19:05:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060541545812075659', '1', 'sysUser:getUserById', '用户管理:获取单条数据', 'sysUser:getUserById', 'sysUser.getUserById', '1052481647455311297', '2', '1060262570224060575', '1', null, null, '/sys/sysUser/getUserById/', '9', '1', null, null, '0', '0', to_date('28-02-2017 17:26:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:26:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060542273644405917', '1', 'sysUserTabLog:view', '用户日志:访问', 'sysUserTabLog:view', 'sysUserTabLog.view', '1060541736768251024', '2', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserTabLogView;/sys/sysUser/sysUserTabLogList', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:38:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:46:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543175201662116', '1', 'sysUserTabPos:view', '用户岗位:访问', 'sysUserTabPos:view', 'sysUserTabPos.view', '1060541793477338258', '2', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserTabPosView;/sys/sysUser/sysUserTabPosList', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:52:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:50:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543305368741032', '1', 'sysUserTabGroup:view', '用户小组:访问', 'sysUserTabGroup:view', 'sysUserTabGroup.view', '1060541832272553108', '2', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserTabGroupView;/sys/sysUser/sysUserTabGroupList', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:54:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:51:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543456489514156', '1', 'sysUserTabRole:view', '用户角色:访问', 'sysUserTabRole:view', 'sysUserTabRole:view', '1060541916079989910', '2', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserTabRoleView;/sys/sysUser/sysUserTabRoleList', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:57:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:53:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543603062613168', '1', 'sysUserTabAuth:view', '用户权限:访问', 'sysUserTabAuth:view', 'sysUserTabAuth.view', '1060542039792034969', '2', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserTabAuthView', '1', '1', null, null, '0', '0', to_date('28-02-2017 17:59:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:59:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543741436896434', '1', 'sysUserTabNAuth:view', '用户负授权:访问', 'sysUserTabNAuth:view', 'sysUserTabNAuth.view', '1060542039792034969', '2', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserTabNAuthView', '10', '1', null, null, '0', '0', to_date('28-02-2017 18:01:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:31:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543772628813471', '1', 'sysFile:webUpload', 'web上传:访问', null, null, '1060543577796052637', '1', '1052481659203556933', '0', null, null, '/sys/sysFile/webUpload', '1', '1', null, null, '0', '0', to_date('28-02-2017 18:02:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:41:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543902148994228', '1', 'sysUserPwd:view', '更新密码:访问', 'sysUserPwd:view', 'sysUserPwd.view', '1060545925224342740', '1', '1052481659203556933', '1', null, null, '/sys/sysUser/sysUserChangePwdView/%d', '1', '1', null, null, '0', '0', to_date('28-02-2017 18:04:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:40:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060543924875757217', '1', 'sysFile:upload', 'web上传:上传', null, null, '1060543577796052637', '1', '1060262570224060575', '0', null, null, '/sys/sysFile/upload', '2', '1', null, null, '0', '0', to_date('28-02-2017 18:04:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:41:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060544004342089379', '1', 'sysFile:updateAttach', 'web上传:修改', null, null, '1060543577796052637', '1', '1052481659203557963', '0', null, null, '/sys/sysFile/updateAttach', '3', '1', null, null, '0', '0', to_date('28-02-2017 18:05:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:41:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060544086428812965', '1', 'sysFile:deleteAttach', 'web上传:删除', null, null, '1060543577796052637', '1', '1052481659203558275', '0', null, null, '/sys/sysFile/deleteAttach', '4', '1', null, null, '0', '0', to_date('28-02-2017 18:07:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:42:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060544158464935591', '1', 'sysFile:downFile', 'web上传:下载', null, null, '1060543577796052637', '1', '1060512414373153244', '0', null, null, '/sys/sysFile/downFile/%d/%d', '3', '1', null, null, '0', '0', to_date('28-02-2017 18:08:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060545898669371360', '1', 'sysOrg:jobManage', '组织架构:职务配置', null, null, '1052481650369304009', '1', '1060512414373153244', '1', null, null, '/sys/org/jobManage', '34', '1', null, null, '0', '0', to_date('28-02-2017 18:36:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:50:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060546235097425111', '1', 'sysUserPwd:update', '更新密码:保存', 'sysUserPwd:update', 'sysUserPwd.update', '1060545925224342740', '2', '1052481659203557963', '1', null, null, '/sys/sysUser/updUserPwd', '2', '1', null, null, '0', '0', to_date('28-02-2017 18:41:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:41:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060546419125874659', '1', 'sysOrg:newOrg', '组织架构:新增部门', null, null, '1052481649938339272', '1', '1060512414373153244', '1', null, null, '/sys/org/newOrg/%d', '35', '1', null, null, '0', '0', to_date('28-02-2017 18:44:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 18:55:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060546527206797285', '1', 'sysOrg:editOrg', '组织架构:修改部门', null, null, '1052481649938339272', '1', '1060512414373153244', '1', null, null, '/sys/org/editOrg/%d', '36', '1', null, null, '0', '0', to_date('28-02-2017 18:46:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 18:55:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060546777792344040', '1', 'sysOrg:aboutOrg', '组织架构:关于', null, null, '1052481649938339272', '2', '1060512414373153244', '1', null, null, '/sys/org/aboutOrg/%d', '37', '1', null, null, '0', '0', to_date('28-02-2017 18:50:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:50:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060546910797918189', '1', 'sysOrg:orgTree', '[公共]组织架构:组织树查询', null, null, '1052481649938339272', '2', '1060262570224060575', '1', null, null, '/sys/org/orgTree', '38', '1', null, null, '0', '0', to_date('28-02-2017 18:52:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 20:05:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060546993337626607', '1', 'sysOrg:addOrg', '组织架构:新增部门', null, null, '1052481649938339272', '2', '1052481659203557933', '1', null, null, '/sys/org/addOrg', '39', '1', null, null, '0', '0', to_date('28-02-2017 18:53:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:08:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060547128443498482', '1', 'sysOrg:updOrg', '组织架构:修改部门', null, null, '1052481649938339272', '2', '1052481659203557963', '1', null, null, '/sys/org/updOrg', '40', '1', null, null, '0', '0', to_date('28-02-2017 18:55:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:08:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060547171395268596', '1', 'sysOrg:delOrg', '组织架构:删除部门', null, null, '1052481649938339272', '1', '1052481659203558275', '1', null, null, '/sys/org/delOrg/%d', '41', '1', null, null, '0', '0', to_date('28-02-2017 18:56:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:08:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060547474314194937', '1', 'sysOrg:addJob', '职务配置:新增', null, null, '1052481650369304009', '1', '1052481659203557933', '1', null, null, '/sys/org/addJob', '39', '1', null, null, '0', '0', to_date('28-02-2017 19:01:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:01:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060547630236397565', '1', 'sysOrg:chooseSysJobView', '职务配置:选择弹窗', null, null, '1052481650369304009', '2', '1060512414373153244', '1', null, null, '/sys/org/chooseSysJobView', '43', '1', null, null, '0', '0', to_date('28-02-2017 19:03:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:03:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060547877732839423', '1', 'sysOrg:chooseSysJobList', '职务配置:弹窗列表', null, null, '1052481650369304009', '2', '1060262570224060575', '1', null, null, '/sys/org/chooseSysJobList', '44', '1', null, null, '0', '0', to_date('28-02-2017 19:07:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:07:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548020285317108', '1', 'sysPersonalSetting:list', '个性化设置数据', null, null, '1052481658449630687', '2', '1060262570224060575', '0', null, null, '/sys/sysPersonal/personalSetting/list', '1', '1', null, null, '0', '0', to_date('28-02-2017 19:09:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:09:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548320109227017', '1', 'sysOrg:addPos', '岗位配置:新增', null, null, '1052481650765665738', '2', '1052481659203557933', '1', null, null, '/sys/org/addPos', '5', '1', null, null, '0', '0', to_date('28-02-2017 19:14:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:14:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548372414295051', '1', 'sysOrg:updPos', '岗位配置:修改', null, null, '1052481650765665738', '2', '1052481659203557963', '1', null, null, '/sys/org/updPos', '6', '1', null, null, '0', '0', to_date('28-02-2017 19:15:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:15:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548409359440896', '1', 'sysPersonal:logView', '我的日志页面', null, null, '1052481657744987613', '2', '1060512414373153244', '0', null, null, '/sys/sysPersonal/logView', '1', '1', null, null, '0', '0', to_date('28-02-2017 19:16:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:16:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548445786303501', '1', 'sysOrg:delPos', '岗位配置:删除', null, null, '1052481650765665738', '1', '1052481659203558275', '1', null, null, '/sys/org/delPos/%d', '7', '1', null, null, '0', '0', to_date('28-02-2017 19:16:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:16:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548460813065218', '1', 'sysPersonal:logList', '我的日志数据查询', null, null, '1052481657744987613', '2', '1060262570224060575', '0', null, null, '/sys/sysPersonal/logList', '2', '1', null, null, '0', '0', to_date('28-02-2017 19:16:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:16:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548509240499204', '1', 'sysPersonal:roleView', '我的角色页面', null, null, '1052481657744987613', '2', '1060512414373153244', '1', null, null, '/sys/sysPersonal/roleView', '3', '1', null, null, '0', '0', to_date('28-02-2017 19:17:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:17:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548547256622086', '1', 'sysPersonal:roleList', '我的角色数据查询', null, null, '1052481657744987613', '2', '1060262570224060575', '1', null, null, '/sys/sysPersonal/roleList', '4', '1', null, null, '0', '0', to_date('28-02-2017 19:18:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:18:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548604316982280', '1', 'sysPersonal:authView', '我的权限页面', null, null, '1052481657744987613', '2', '1060512414373153244', '1', null, null, '/sys/sysPersonal/authView', '5', '1', null, null, '0', '0', to_date('28-02-2017 19:19:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:19:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548650538212362', '1', 'sysPersonal:authList', '我的权限数据查询', null, null, '1052481657744987613', '2', '1060262570224060575', '1', null, null, '/sys/sysPersonal/authList', '6', '1', null, null, '0', '0', to_date('28-02-2017 19:19:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548696499395596', '1', 'sysPersonal:posView', '我的岗位页面', null, null, '1052481657744987613', '2', '1060512414373153244', '1', null, null, '/sys/sysPersonal/posView', '7', '1', null, null, '0', '0', to_date('28-02-2017 19:20:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:20:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548738777979918', '1', 'sysPersonal:posList', '我的岗位数据查询', null, null, '1052481657744987613', '2', '1060262570224060575', '1', null, null, '/sys/sysPersonal/posList', '8', '1', null, null, '0', '0', to_date('28-02-2017 19:21:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:21:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548783610895376', '1', 'sysPersonal:groupView', '我的用户组页面', null, null, '1052481657744987613', '2', '1060512414373153244', '1', null, null, '/sys/sysPersonal/groupView', '9', '1', null, null, '0', '0', to_date('28-02-2017 19:21:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:21:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060548823386528786', '1', 'sysPersonal:groupList', '我的用户组数据查询', null, null, '1052481657744987613', '2', '1060262570224060575', '1', null, null, '/sys/sysPersonal/groupList', '10', '1', null, null, '0', '0', to_date('28-02-2017 19:22:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:22:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060549276660100111', '1', 'sysOrg:posList', '岗位配置:岗位列表', null, null, '1052481650765665738', '2', '1060262570224060575', '1', null, null, '/sys/org/posList/%d', '8', '1', null, null, '0', '0', to_date('28-02-2017 19:29:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:29:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060549604763724817', '1', 'sysOrg:chooseSysPositionView', '[公共]岗位配置:树形弹窗', null, null, '1052481650765665738', '2', '1060512414373153244', '1', null, null, '/sys/org/chooseSysPositionView', '9', '1', null, null, '0', '0', to_date('28-02-2017 19:35:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 20:05:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060549946271507752', '1', 'sysOrg:addGroup', '小组管理:新增', null, null, '1052481651160978891', '2', '1052481659203557933', '1', null, null, '/sys/org/addGroup', '4', '1', null, null, '0', '0', to_date('28-02-2017 19:40:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:42:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550019723207980', '1', 'sysOrg:updGroup', '小组管理:修改', null, null, '1052481651160978891', '2', '1052481659203557963', '1', null, null, '/sys/org/updGroup', '5', '1', null, null, '0', '0', to_date('28-02-2017 19:41:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:41:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550128646137138', '1', 'sysOrg:updateUserGroup', '小组管理:人员更新', null, null, '1060541832272553108', '2', '1052481659203557963', '1', null, null, '/sys/org/updateUserGroup', '7', '1', null, null, '0', '0', to_date('28-02-2017 19:43:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:43:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550232467744052', '1', 'sysOrg:updateUserPosition', '岗位管理:用户更新', null, null, '1052481650765665738', '1', '1052481659203557963', '1', null, null, '/sys/org/updateUserPosition', '10', '1', null, null, '0', '0', to_date('28-02-2017 19:44:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:44:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550321210828086', '1', 'sysOrg:orgUser:view', '组织人员:访问', null, null, '1060545472174714840', '2', '1060512414373153244', '1', null, null, '/sys/org/orgUser/view/%d', '1', '1', null, null, '0', '0', to_date('28-02-2017 19:46:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:46:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550397229442360', '1', 'sysOrg:orgUser:list', '组织人员:查询', null, null, '1060545472174714840', '2', '1060262570224060575', '1', null, null, '/sys/org/orgUser/list/%d', '2', '1', null, null, '0', '0', to_date('28-02-2017 19:47:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:47:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550493994132794', '1', 'syOrg:posUser:view', '岗位人员:访问', null, null, '1060545543841738715', '2', '1060512414373153244', '1', null, null, '/sys/org/posUser/view/%d', '1', '1', null, null, '0', '0', to_date('28-02-2017 19:49:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:49:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550543534105916', '1', 'sysOrg:posUser:list', '岗位人员:查询', null, null, '1060545543841738715', '2', '1060262570224060575', '1', null, null, '/sys/org/posUser/list/%d', '2', '1', null, null, '0', '0', to_date('28-02-2017 19:49:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:49:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550604366193982', '1', 'sysOrg:posUser:add', '岗位人员:新增', null, null, '1060545543841738715', '1', '1052481659203557933', '1', null, null, '/sys/org/posUser/add', '3', '1', null, null, '0', '0', to_date('28-02-2017 19:50:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:50:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550649891169780', '1', 'sysOrg:posUser:del', '岗位人员:删除', null, null, '1060545543841738715', '1', '1052481659203558275', '1', null, null, '/sys/org/posUser/del', '4', '1', null, null, '0', '0', to_date('28-02-2017 19:51:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:51:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550715204871670', '1', 'sysOrg:posUser:setMajor', '岗位人员:设置主岗', null, null, '1060545543841738715', '1', '1052481659203557963', '1', null, null, '/sys/org/posUser/setMajor', '5', '1', null, null, '0', '0', to_date('28-02-2017 19:52:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:52:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550896685065720', '1', 'sysOrg:groupUser:view', '小组人员:访问', null, null, '1060545574796750813', '2', '1060512414373153244', '1', null, null, '/sys/org/groupUser/view/%d', '1', '1', null, null, '0', '0', to_date('28-02-2017 19:55:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:55:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060550974426490362', '1', 'sysOrg:groupUser:list', '小组人员:列表', null, null, '1060545574796750813', '2', '1060262570224060575', '1', null, null, '/sys/org/groupUser/list/%d', '2', '1', null, null, '0', '0', to_date('28-02-2017 19:56:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:15:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060551024781207036', '1', 'sysOrg:groupUser:add', '小组人员:新增', null, null, '1060545574796750813', '1', '1052481659203557933', '1', null, null, '/sys/org/groupUser/add', '3', '1', null, null, '0', '0', to_date('28-02-2017 19:57:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060551066653992446', '1', 'sysOrg:groupUser:del', '小组人员:删除', null, null, '1060545574796750813', '1', '1052481659203558275', '1', null, null, '/sys/org/groupUser/del', '4', '1', null, null, '0', '0', to_date('28-02-2017 19:58:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:58:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1060551124526999040', '1', 'sysOrg:groupUser:setLeader', '小组人员:设置组长', null, null, '1060545574796750813', '1', '1052481659203557963', '1', null, null, '/sys/org/groupUser/setLeader', '5', '1', null, null, '0', '0', to_date('28-02-2017 19:59:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:59:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1061265498981571428', '1', 'webSocketDemo:view', '消息推送:访问', null, null, '1061265384278891362', '1', '1052481659203556933', '0', null, null, '/common/demo/webSocket/toDemoView', '1', '1', null, null, '0', '0', to_date('08-03-2017 17:13:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:19:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1061888394816547457', '1', '1111', 'xsdf', null, null, '1052481646384715198', '2', '1052481659203556933', '1', null, null, '112', '1', '1', null, null, '0', '0', to_date('15-03-2017 14:14:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-03-2017 14:14:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1061890423631800967', '1', 'vdbv', 'vfd', null, null, '1052481646384715198', '2', '1061329205799676383', '1', null, null, '212e', '12', '1', null, null, '0', '0', to_date('15-03-2017 14:46:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-03-2017 14:46:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1062715158343155066', '1', 'sysAuthMenu:getUserAuthList', '[公共]获取用户授权列表', 'sysAuthMenu:getUserAuthList', 'sysAuthMenu.getUserAuthList', '1060427695770143999', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/getUserAuthList', '10', '1', null, null, '0', '0', to_date('24-03-2017 17:15:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 17:15:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1062715239701118332', '1', 'sysAuthMenu:getUserNAuthList', '[公共]获取用户负授权列表', 'sysAuthMenu.getUserNAuthList', 'sysAuthMenu.getUserNAuthList', '1060427695770143999', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/getUserNAuthList', '11', '1', null, null, '0', '0', to_date('24-03-2017 17:16:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 17:16:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063085635986630521', '1', 'mainAttach:manage', '主附权限管理:访问', null, null, '1063084084742170457', '2', '1052481659203556933', '1', null, null, '/sys/sysAuthMenu/mainAttachAuthJoinView/%d', '1', '1', null, null, '0', '0', to_date('28-03-2017 19:24:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:25:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063085695328692091', '1', 'mainAttach:list', '主附权限管理:列表', null, null, '1063084084742170457', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/authJoinList', '2', '1', null, null, '0', '0', to_date('28-03-2017 19:25:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:25:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063085797168490366', '1', 'mainAttach:chooseAuth', '主附权限管理:选择权限', null, null, '1063084084742170457', '2', '1060512414373153244', '1', null, null, '/sys/sysAuthMenu/chooseMainAttachAuthView', '3', '1', null, null, '0', '0', to_date('28-03-2017 19:26:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:26:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063085844650108800', '1', 'mainAttach:chooseAuthList', '主附权限管理:选择权限列表', null, null, '1063084084742170457', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/chooseMainAttachAuthList', '4', '1', null, null, '0', '0', to_date('28-03-2017 19:27:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:27:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063085973985666946', '1', 'mainAttach:joinedList', '主附权限管理:已关联列表', null, null, '1063084084742170457', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/getMainAttachJoinedList', '5', '1', null, null, '0', '0', to_date('28-03-2017 19:29:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:29:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063086049155983236', '1', 'mainAttach:saveMainAuthJoinList', '主附权限管理:保存主权限关联', null, null, '1063084084742170457', '2', '1052481659203557963', '1', null, null, '/sys/sysAuthMenu/saveMainAuthJoinList', '7', '1', null, null, '0', '0', to_date('28-03-2017 19:30:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:30:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063086099806398342', '1', 'mainAttach:saveAttachAuthJoinList', '主附权限管理:保存附属权限关联', null, null, '1063084084742170457', '2', '1052481659203557963', '1', null, null, '/sys/sysAuthMenu/saveAttachAuthJoinList', '8', '1', null, null, '0', '0', to_date('28-03-2017 19:31:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:31:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063086183253125000', '1', 'mainAttach:joinManage', '主附权限管理:管理', null, null, '1063084084742170457', '1', '1052481659203557963', '1', null, null, '/sys/sysAuthMenu/mainAttach:joinManage', '2', '1', null, '虚拟URL，主要配置 管理  按钮权限', '0', '0', to_date('28-03-2017 19:32:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:11:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063086218756859786', '1', 'mainAttach:deleteJoin', '主附权限管理:删除', null, null, '1063084084742170457', '1', '1052481659203558275', '1', null, null, '/sys/sysAuthMenu/deleteBatchAuthJoin', '2', '1', null, null, '0', '0', to_date('28-03-2017 19:33:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 19:33:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063088912725599228', '1', 'common:sysUserDetail', '查看用户详情', null, null, '1063088840446206970', '1', '1060512414373153244', '1', null, null, '/common/sysUser/detail/%d', '1', '1', null, null, '0', '0', to_date('28-03-2017 20:16:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 17:36:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063147339691241342', '1', 'sysAuth_authJoinTab:view', '主附属权限:访问', null, null, '1063084084742170457', '1', '1052481659203556933', '0', null, null, '/sys/sysAuthMenu/mainAttachAuthJoinView/%d', '1', '0', null, null, '0', '0', to_date('29-03-2017 11:44:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:11:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063147781809680259', '1', 'sysAuth:authJoinList', '主附权限关联分页数据', null, null, '1063084084742170457', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/authJoinList', '1', '0', null, null, '0', '0', to_date('29-03-2017 11:51:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:51:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063343110077830378', '1', 'sysEmployeeOrgReport:orgUserPie', '员工分布饼图数据查询', null, null, '1052481656748840410', '2', '1060262570224060575', '0', null, null, '/sys/report/sysEmployeeOrgReport/getOrgUserPieData', '1', '1', null, null, '0', '0', to_date('31-03-2017 15:36:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2017 15:36:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063343187702751034', '1', 'sysPersonalSetting:themeColor', '个性化设置:主题修改', null, null, '1052481658449630687', '2', '1052481659203557963', '1', null, null, '/sys/sysPersonal/personalSetting/update/%s/%s', '3', '1', null, null, '0', '0', to_date('31-03-2017 15:37:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2017 15:37:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063343214615614700', '1', 'sysEmployeeJobReport:UserInOutJobBar', '入职离职柱图数据查询', null, null, '1052481656748840422', '2', '1060262570224060575', '0', null, null, '/sys/report/sysEmployeeJobReport/getUserInOutJobBar', '1', '1', null, null, '0', '0', to_date('31-03-2017 15:38:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2017 15:38:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063343762846687046', '1', 'sysConfig:pagesize', '系统设置:获取分页配置', null, null, '1052481652945655248', '2', '1060262570224060575', '1', null, null, '/sys/sysConfig/defaultPageSize/%s', '4', '1', null, null, '0', '0', to_date('31-03-2017 15:46:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2017 15:46:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1063346679122140324', '1', 'sysAuthMenu:checkAuthRelation', '删除:校验', null, null, '1052481648470332868', '2', '1060262570224060575', '1', null, null, '/sys/sysAuthMenu/checkAuthRelation', '5', '1', null, null, '0', '0', to_date('31-03-2017 16:33:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-03-2017 16:33:18', 'dd-mm-yyyy hh24:mi:ss'), '2', '2', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1065515347409828075', '1', 'sysAuthmanage:tabs', '功能权限tabs', null, null, '1052481648470332868', '2', '1060512414373153244', '1', null, null, '/sys/sysAuthMenu/authManage_view_tabs', '1', '1', null, null, '0', '0', to_date('24-04-2017 15:03:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2017 15:03:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1065516080032053505', '1', 'sysAuthMenu:getModelTree', '获取模块树', null, null, '1060425852316912889', '2', '1060262570224060575', '0', null, null, '/sys/sysAuthMenu/getModelTree', '2', '1', null, null, '0', '0', to_date('24-04-2017 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2017 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1065516637426743584', '1', 'sysOrg:getOrgTree', '组织架构树', null, null, '1052481649938339272', '2', '1060262570224060575', '1', null, null, '/sys/org/getOrgTree', '1', '1', null, null, '0', '0', to_date('24-04-2017 15:23:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2017 15:23:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1065516787538786594', '1', 'sysPos:getPosTree', '获取岗位树', null, null, '1052481650765665738', '2', '1060262570224060575', '0', null, null, '/sys/org/getPosTree', '1', '1', null, null, '0', '0', to_date('24-04-2017 15:26:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2017 15:26:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1066770651876922650', '1', 'sysMetaManage:view', '元数据管理：访问', 'sysMetaManage:view', null, '1066770481759098136', '1', '1052481659203556933', '1', null, null, 'v-sysMeta', '1', '1', null, null, '0', '0', to_date('08-05-2017 11:35:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2017 11:37:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1066770920083789089', '1', 'sysConstraint:view', '约束管理:访问', 'sysConstraint:view', null, '1066770861760943391', '1', '1052481659203556933', '1', null, null, '/sys/meta/constraint/', '1', '1', null, null, '0', '0', to_date('08-05-2017 11:40:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2017 11:56:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1067147372089647824', '1', 'printdemo:view', '访问', null, null, '1067147241363677900', '1', '1052481659203556933', '0', null, null, '/common/demo/print/toPrintDemoPage', '1', '1', null, null, '0', '0', to_date('12-05-2017 15:23:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 15:23:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068058186915200682', '1', 'sysDruidMonitor:attachAuth', 'druid监控:附属权限', null, null, '1058615343450023223', '2', '1060512414373153244', '1', null, null, '/druid;
/druid/%s;
/druid/%s/%s;
/druid/%s/%s/%s;
/druid/%s/%s/%s/%s;
/druid/%s/%s/%s/%s/%s;', '1', '1', null, null, '0', '0', to_date('22-05-2017 16:40:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-05-2017 16:40:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068213102472182993', '1', 'filterItem_sysMetadata:entityFieldView', '过滤器项_实体字段:访问', null, null, '1052481647455311299', '2', '1060512414373153244', '1', null, null, '/sys/sysMetadata/metadataEntityFilterItemView;
/sys/sysMetadata/metadataFieldFilterItemView;', '901', '1', null, null, '0', '0', to_date('24-05-2017 09:43:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-05-2017 09:48:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068213411453975770', '1', 'constraint_sysMetadata:entityFieldView', '约束_实体字段:访问', null, null, '1052481647455311299', '2', '1060512414373153244', '1', null, null, '/sys/sysMetadata/metadataEntityConstraintView;
/sys/sysMetadata/metadataFieldConstraintView', '902', '1', null, null, '0', '0', to_date('24-05-2017 09:47:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-05-2017 09:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068491236841899401', '1', 'sysConstraintDefList', '约束定义:列表', null, null, '1066770861760943391', '2', '1060262570224060575', '1', null, null, '/sys/meta/constraintList', '1', '1', null, null, '0', '0', to_date('27-05-2017 11:23:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:32:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068491379960989069', '1', 'sysConstraintDefAbout', '约束定义:关于', null, null, '1066770861760943391', '2', '1060512414373153244', '1', null, null, '/sys/meta/aboutDef', '2', '1', null, null, '0', '0', to_date('27-05-2017 11:26:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:26:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068491641576506767', '1', 'sysConstrainDefAllList', '约束定义:全部列表', null, null, '1066770861760943391', '2', '1060262570224060575', '1', null, null, '/sys/meta/getDefList', '3', '1', null, null, '0', '0', to_date('27-05-2017 11:30:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:30:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068491783701546385', '1', 'sysConstraintDetailList', '约束字段:列表', null, null, '1066770861760943391', '2', '1060262570224060575', '1', null, null, '/sys/meta/constraintDetailList', '4', '1', null, null, '0', '0', to_date('27-05-2017 11:32:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:32:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068491877466260884', '1', 'sysConstraintDetailAbout', '约束字段:关于', null, null, '1066770861760943391', '2', '1060512414373153244', '1', null, null, '/sys/meta/aboutDetail', '5', '1', null, null, '0', '0', to_date('27-05-2017 11:34:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:34:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068492077929874847', '1', 'sysConstraintDef:add', '约束定义:新增', null, null, '1066770861760943391', '1', '1052481659203557933', '1', null, null, '/sys/meta/addDef', '2', '1', null, null, '0', '0', to_date('27-05-2017 11:37:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:37:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068492132623599009', '1', 'sysConstraintDef:update', '约束定义:修改', null, null, '1066770861760943391', '1', '1052481659203557963', '1', null, null, '/sys/meta/updateDef', '3', '1', null, null, '0', '0', to_date('27-05-2017 11:38:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:38:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068492181048935843', '1', 'sysConstraintDef:del', '约束定义:删除', null, null, '1066770861760943391', '1', '1052481659203558275', '1', null, null, '/sys/meta/delDef', '4', '1', null, null, '0', '0', to_date('27-05-2017 11:38:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:38:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068492242982028709', '1', 'sysConstraintDetail:add', '约束字段:新增', null, null, '1066770861760943391', '1', '1052481659203557933', '1', null, null, '/sys/meta/addDetail', '5', '1', null, null, '0', '0', to_date('27-05-2017 11:39:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:39:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068492318879008167', '1', 'sysConstraintDetail:update', '约束字段:修改', null, null, '1066770861760943391', '1', '1052481659203557963', '1', null, null, '/sys/meta/updateDetail', '6', '1', null, null, '0', '0', to_date('27-05-2017 11:41:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:41:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

insert into SYS_AUTH (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC)
values ('1068492373356725673', '1', 'sysConstraintDetail:del', '约束字段:删除', null, null, '1066770861760943391', '1', '1052481659203558275', '1', null, null, '/sys/meta/delDetail', '8', '1', null, null, '0', '0', to_date('27-05-2017 11:41:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2017 11:41:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1');

prompt Done.
commit;

prompt Importing table SYS_AUTH_JOIN...
set feedback off
set define off
insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062695084782875539', '1053269289002732093', '1060426547659115772', '0', to_date('24-03-2017 11:56:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062695145589797781', '1060428226958822660', '1060428307722243333', '0', to_date('24-03-2017 11:57:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062695250099270551', '1053269289128561216', '1060443227480767902', '0', to_date('24-03-2017 11:59:07', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062703691014307104', '1053269288709130807', '1060513898629335518', '0', to_date('24-03-2017 14:13:17', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062703691081415969', '1053269288709130807', '1060517440993790435', '0', to_date('24-03-2017 14:13:17', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062703893003335303', '1053269288255097393', '1061888394816547457', '0', to_date('24-03-2017 14:16:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062703893006481032', '1053269288340032050', '1061888394816547457', '0', to_date('24-03-2017 14:16:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062704299991332524', '1053269290258926161', '1060549946271507752', '0', to_date('24-03-2017 14:22:57', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062704355523917487', '1053269290312403538', '1060550019723207980', '0', to_date('24-03-2017 14:23:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062704890652359974', '1060514158411942368', '1060427833277254912', '0', to_date('24-03-2017 14:32:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062704890716323111', '1060514158411942368', '1060428170911386883', '0', to_date('24-03-2017 14:32:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062704890781334824', '1060514158411942368', '1060428430601719046', '0', to_date('24-03-2017 14:32:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062705142840130859', '1060517625944771045', '1060529385641773556', '0', to_date('24-03-2017 14:36:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062705142926114092', '1060517625944771045', '1060529093387913715', '0', to_date('24-03-2017 14:36:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062705996409042663', '1060550604366193982', '1053269290220128848', '0', to_date('24-03-2017 14:49:55', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062705996414285544', '1060550604366193982', '1060549276660100111', '0', to_date('24-03-2017 14:49:55', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706052410341098', '1053269290079619662', '1053269289870953034', '0', to_date('24-03-2017 14:50:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706052414535403', '1053269290079619662', '1060548372414295051', '0', to_date('24-03-2017 14:50:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706088148956909', '1053269290030336589', '1053269289870953034', '0', to_date('24-03-2017 14:51:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706088152102638', '1053269290030336589', '1060548320109227017', '0', to_date('24-03-2017 14:51:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706404473927438', '1060545898669371360', '1053269289816427081', '0', to_date('24-03-2017 14:56:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706470923237146', '1060546419125874659', '1060546993337626607', '0', to_date('24-03-2017 14:57:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706507353913116', '1060546527206797285', '1060547128443498482', '0', to_date('24-03-2017 14:58:02', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706844591683378', '1060531869244323473', '1060531910439728787', '0', to_date('24-03-2017 15:03:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706844594829107', '1060531869244323473', '1060531786719295117', '0', to_date('24-03-2017 15:03:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706859339904822', '1060521729551530342', '1060521817713703273', '0', to_date('24-03-2017 15:03:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706859343050551', '1060521729551530342', '1060521285249956189', '0', to_date('24-03-2017 15:03:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706877684741947', '1053269288410286644', '1060521414168181087', '0', to_date('24-03-2017 15:03:56', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706877688936252', '1053269288410286644', '1060520373898434155', '0', to_date('24-03-2017 15:03:56', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706906113734462', '1060535744735082200', '1060532757231957697', '0', to_date('24-03-2017 15:04:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062706906117928767', '1060535744735082200', '1060535863639406298', '0', to_date('24-03-2017 15:04:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712525128431537', '1053269288410286645', '1060532813148321476', '0', to_date('24-03-2017 16:33:41', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712525132625842', '1053269288410286645', '1060532701455054527', '0', to_date('24-03-2017 16:33:41', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712539361802164', '1060536599394776813', '1060536654727083760', '0', to_date('24-03-2017 16:33:55', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712539365996469', '1060536599394776813', '1060536526409692907', '0', to_date('24-03-2017 16:33:55', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712568411551674', '1060539272757114664', '1060539337256073002', '0', to_date('24-03-2017 16:34:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712568415745979', '1060539272757114664', '1060539098439743266', '0', to_date('24-03-2017 16:34:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712586262509501', '1060539828406974268', '1060540003079812926', '0', to_date('24-03-2017 16:34:40', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712586265655230', '1060539828406974268', '1060539139843815204', '0', to_date('24-03-2017 16:34:40', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712603054405568', '1060540379121186632', '1060540564383594317', '0', to_date('24-03-2017 16:34:56', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712603058599873', '1060540379121186632', '1060539182585870118', '0', to_date('24-03-2017 16:34:56', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712622083962819', '1053269288410286646', '1060537568121714444', '0', to_date('24-03-2017 16:35:14', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712622087108548', '1053269288410286646', '1060537460372141834', '0', to_date('24-03-2017 16:35:14', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712635115665350', '1060537905622677270', '1060537942106830616', '0', to_date('24-03-2017 16:35:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712653343061960', '1053269288410286667', '1060537076158166782', '0', to_date('24-03-2017 16:35:44', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712653356693449', '1053269288410286667', '1060537029762873084', '0', to_date('24-03-2017 16:35:44', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712694649616333', '1053269288410286644', '1060531956747990677', '0', to_date('24-03-2017 16:36:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712694652762062', '1060518473066075753', '1060531956747990677', '0', to_date('24-03-2017 16:36:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712694655907791', '1060521496474057057', '1060531956747990677', '0', to_date('24-03-2017 16:36:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712721584388049', '1053269288410286644', '1060529720687982212', '0', to_date('24-03-2017 16:36:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712721588582354', '1060518473066075753', '1060529720687982212', '0', to_date('24-03-2017 16:36:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712721591728083', '1060521496474057057', '1060529720687982212', '0', to_date('24-03-2017 16:36:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712972209780702', '1060539641341015862', '1060529824024098438', '0', to_date('24-03-2017 16:40:48', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712972213975007', '1060539726008284984', '1060529824024098438', '0', to_date('24-03-2017 16:40:48', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712984447711201', '1060539641341015862', '1060529924825806473', '0', to_date('24-03-2017 16:40:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062712984450856930', '1060539726008284984', '1060529924825806473', '0', to_date('24-03-2017 16:40:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713227055691759', '1060536045116454623', '1060535506143147724', '0', to_date('24-03-2017 16:44:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713227059886064', '1060536117623387875', '1060535506143147724', '0', to_date('24-03-2017 16:44:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713252693374964', '1060539641341015862', '1060536006906345181', '0', to_date('24-03-2017 16:45:15', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713252696520693', '1060539726008284984', '1060536006906345181', '0', to_date('24-03-2017 16:45:15', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713287621441528', '1060537972850030362', '1060532901006407366', '0', to_date('24-03-2017 16:45:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713287774533625', '1060538012249224988', '1060532901006407366', '0', to_date('24-03-2017 16:45:49', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713307727886331', '1060535560930195150', '1060535336045246152', '0', to_date('24-03-2017 16:46:08', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713307732080636', '1060535607169251025', '1060535336045246152', '0', to_date('24-03-2017 16:46:08', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713323523635198', '1060535560930195150', '1060535392954611402', '0', to_date('24-03-2017 16:46:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713323532023807', '1060535607169251025', '1060535392954611402', '0', to_date('24-03-2017 16:46:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713369290830849', '1060539641341015862', '1060536725987260146', '0', to_date('24-03-2017 16:47:06', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713369295025154', '1060539726008284984', '1060536725987260146', '0', to_date('24-03-2017 16:47:06', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713381652493316', '1060539641341015862', '1060536768554202868', '0', to_date('24-03-2017 16:47:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713381656687621', '1060539726008284984', '1060536768554202868', '0', to_date('24-03-2017 16:47:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713484474807303', '1060540733235787601', '1060539514465417008', '0', to_date('24-03-2017 16:48:56', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713484479001608', '1060540774933460819', '1060539514465417008', '0', to_date('24-03-2017 16:48:56', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713501140874250', '1060540733235787601', '1060539570032604978', '0', to_date('24-03-2017 16:49:12', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713501144019979', '1060540774933460819', '1060539570032604978', '0', to_date('24-03-2017 16:49:12', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713552894391309', '1053269288410286667', '1060540184194053952', '0', to_date('24-03-2017 16:50:02', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713613173879824', '1053269288410286667', '1060540692990392143', '0', to_date('24-03-2017 16:50:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713676386235413', '1053269288410286667', '1060537811049510674', '0', to_date('24-03-2017 16:51:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713695173571608', '1060537116852352768', '1060537606721894158', '0', to_date('24-03-2017 16:52:17', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713695176717337', '1060537149546952450', '1060537606721894158', '0', to_date('24-03-2017 16:52:17', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713708268188699', '1060537116852352768', '1060537654704731920', '0', to_date('24-03-2017 16:52:30', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713708271334428', '1060537149546952450', '1060537654704731920', '0', to_date('24-03-2017 16:52:30', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713757168530463', '1060539641341015862', '1060547630236397565', '0', to_date('24-03-2017 16:53:16', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713757171676192', '1060539726008284984', '1060547630236397565', '0', to_date('24-03-2017 16:53:16', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713770390025250', '1060539641341015862', '1060547877732839423', '0', to_date('24-03-2017 16:53:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713770394219555', '1060539726008284984', '1060547877732839423', '0', to_date('24-03-2017 16:53:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713808288707622', '1060539641341015862', '1060549604763724817', '0', to_date('24-03-2017 16:54:05', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713808291853351', '1060539726008284984', '1060549604763724817', '0', to_date('24-03-2017 16:54:05', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713929277865304', '1053269288579107380', '1060540810435241095', '0', to_date('24-03-2017 16:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713929361751385', '1053269288579107380', '1060428430601719046', '0', to_date('24-03-2017 16:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713929441443162', '1053269288579107380', '1060532031278713347', '0', to_date('24-03-2017 16:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713929515892059', '1053269288579107380', '1060546910797918189', '0', to_date('24-03-2017 16:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713929590340956', '1053269288579107380', '1060428170911386883', '0', to_date('24-03-2017 16:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713990553501022', '1053269288618953269', '1060540810435241095', '0', to_date('24-03-2017 16:56:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713990626901343', '1053269288618953269', '1060428430601719046', '0', to_date('24-03-2017 16:56:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713990695058784', '1053269288618953269', '1060428170911386883', '0', to_date('24-03-2017 16:56:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713990806207841', '1053269288618953269', '1060532031278713347', '0', to_date('24-03-2017 16:56:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062713990882753890', '1053269288618953269', '1060546910797918189', '0', to_date('24-03-2017 16:56:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715427782098313', '1053269288410286643', '1060428430601719046', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715427892198794', '1053269288410286643', '1062715239701118332', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715427972939147', '1053269288410286643', '1060543741436896434', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428048436620', '1053269288410286643', '1060543603062613168', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428120788365', '1053269288410286643', '1060543456489514156', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428188945806', '1053269288410286643', '1060543305368741032', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428266540431', '1053269288410286643', '1060543175201662116', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428347280784', '1053269288410286643', '1060542273644405917', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428418583953', '1053269288410286643', '1060541545812075659', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1062715428490935698', '1053269288410286643', '1062715158343155066', '0', to_date('24-03-2017 17:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063086247471064972', '1063086183253125000', '1063085797168490366', '0', to_date('28-03-2017 19:33:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063086247541319565', '1063086183253125000', '1063085844650108800', '0', to_date('28-03-2017 19:33:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063086247609477006', '1063086183253125000', '1063085973985666946', '0', to_date('28-03-2017 19:33:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063086247676585871', '1063086183253125000', '1063086049155983236', '0', to_date('28-03-2017 19:33:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063086247747889040', '1063086183253125000', '1063086099806398342', '0', to_date('28-03-2017 19:33:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063144595149672125', '1053269290986637920', '1060457336948118351', '0', to_date('29-03-2017 11:01:16', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063144595230412478', '1053269290986637920', '1060460357990747589', '0', to_date('29-03-2017 11:01:16', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063144595314298559', '1053269290986637920', '1060457499070550864', '0', to_date('29-03-2017 11:01:16', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063144965657710276', '1053269290790554204', '1060454137317508479', '0', to_date('29-03-2017 11:07:09', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063144965736353477', '1053269290790554204', '1060454237634774400', '0', to_date('29-03-2017 11:07:09', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063144965814996678', '1053269290790554204', '1060455425160725889', '0', to_date('29-03-2017 11:07:09', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063145042703929032', '1053269291956570730', '1060529513805055535', '0', to_date('29-03-2017 11:08:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063145079173402314', '1053269292139022958', '1060529782516287036', '0', to_date('29-03-2017 11:08:57', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060153462644', '1053269288910457403', '1060429497480613151', '0', to_date('29-03-2017 11:40:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060458598261', '1053269288910457403', '1060428045272059138', '0', to_date('29-03-2017 11:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060584427382', '1053269288910457403', '1060425623704276216', '0', to_date('29-03-2017 11:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060653633399', '1053269288910457403', '1060425958750522618', '0', to_date('29-03-2017 11:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060756393848', '1053269288910457403', '1063085635986630521', '0', to_date('29-03-2017 11:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060826648441', '1053269288910457403', '1063085695328692091', '0', to_date('29-03-2017 11:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147060902145914', '1053269288910457403', '1060429383554927902', '0', to_date('29-03-2017 11:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147781852876542', '1053269292864637564', '1060512716001200972', '0', to_date('29-03-2017 11:51:55', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147832586973061', '1063147339691241342', '1063147781809680259', '0', to_date('29-03-2017 11:52:43', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147869079719680', '1053269293111052929', '1060530105551095370', '0', to_date('29-03-2017 11:53:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147889924361986', '1053269293281970821', '1060530184971290188', '0', to_date('29-03-2017 11:53:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063147906891370244', '1053269293456034441', '1060530241626900046', '0', to_date('29-03-2017 11:53:54', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148343610691351', '1053269294376684186', '1060548823386528786', '0', to_date('29-03-2017 12:00:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148343688285976', '1053269294376684186', '1060548783610895376', '0', to_date('29-03-2017 12:00:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148343766929177', '1053269294376684186', '1060548738777979918', '0', to_date('29-03-2017 12:00:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148343844523802', '1053269294376684186', '1060548696499395596', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148343922118427', '1053269294376684186', '1060548650538212362', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148344296460060', '1053269294376684186', '1060548604316982280', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148344434872093', '1053269294376684186', '1060548547256622086', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148344516661022', '1053269294376684186', '1060548509240499204', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148344607887135', '1053269294376684186', '1060548460813065218', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148344688627488', '1053269294376684186', '1060548409359440896', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148344770416417', '1053269294376684186', '1053269294457424540', '0', to_date('29-03-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148406422490915', '1053269294561233566', '1053269294677625504', '0', to_date('29-03-2017 12:01:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148734637264677', '1053269294762560162', '1060548020285317108', '0', to_date('29-03-2017 12:07:03', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063148734824959782', '1053269294762560162', '1053269294956546724', '0', to_date('29-03-2017 12:07:03', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063165893187075362', '1060543902148994228', '1060546235097425111', '0', to_date('29-03-2017 16:39:47', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169389667941681', '1053269289776581192', '1060546910797918189', '0', to_date('29-03-2017 17:35:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169389753924914', '1053269289776581192', '1060546777792344040', '0', to_date('29-03-2017 17:35:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169389834665267', '1053269289776581192', '1053269290156165711', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169389914357044', '1053269289776581192', '1053269290354346579', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169389997194549', '1053269289776581192', '1060550397229442360', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169390082129206', '1053269289776581192', '1060550493994132794', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169390162869559', '1053269289776581192', '1060550543534105916', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169390243609912', '1053269289776581192', '1060550896685065720', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169390325398841', '1053269289776581192', '1060550974426490362', '0', to_date('29-03-2017 17:35:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282154', '1053269288910457403', '1060531101189704192', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282155', '1053269288910457403', '1060531180596267521', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282156', '1053269288910457403', '1060529385641773556', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282157', '1053269288910457403', '1060529093387913715', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282158', '1053269288910457403', '1060540655986214547', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282159', '1053269288910457403', '1060539904442435202', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282160', '1053269288910457403', '1060546910797918189', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282161', '1053269288910457403', '1060540292496295560', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282162', '1053269288910457403', '1060540362735158922', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282163', '1053269289082423871', '1063346679122140324', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282164', '1053269289722055239', '1063346679122140324', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282940', '1053269289776581192', '1060550321210828086', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282941', '1053269292373903987', '1060530512527558229', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282942', '1053269292373903987', '1060531371389945459', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282943', '1060537905622677270', '1060529385641773556', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282944', '1060537905622677270', '1060529093387913715', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282945', '1060537905622677270', '1060546910797918189', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282946', '1060517625944771045', '1060546910797918189', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282947', '1053269294762560162', '1063343187702751034', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282948', '1053269294762560162', '1063343762846687046', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282950', '1060550604366193982', '1060529385641773556', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282951', '1060550604366193982', '1060529093387913715', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282952', '1060551024781207036', '1060529385641773556', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063169522992282953', '1060551024781207036', '1060529093387913715', '0', to_date('29-03-2017 17:37:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063343246182995182', '1053269293872319120', '1063343110077830378', '0', to_date('31-03-2017 15:38:44', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063343263826334960', '1053269294071548564', '1063343214615614700', '0', to_date('31-03-2017 15:39:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063343263826334961', '1063088912725599228', '1060543175201662116', '0', to_date('31-03-2017 15:39:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063343263826334962', '1063088912725599228', '1060543305368741032', '0', to_date('31-03-2017 15:39:01', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516174408087812', '1053269289002732093', '1065516080032053505', '0', to_date('24-04-2017 15:16:30', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516273342281990', '1053269289043626558', '1065516080032053505', '0', to_date('24-04-2017 15:18:04', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516313320290568', '1053269289539603013', '1065516080032053505', '0', to_date('24-04-2017 15:18:42', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516333588216074', '1053269289616149062', '1065516080032053505', '0', to_date('24-04-2017 15:19:02', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516358506576140', '1053269288910457403', '1065515347409828075', '0', to_date('24-04-2017 15:19:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516359987165469', '1053269288910457403', '1065516080032053505', '0', to_date('24-04-2017 15:19:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516826446199078', '1053269290030336589', '1065516787538786594', '0', to_date('24-04-2017 15:26:52', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516845624654122', '1053269290079619662', '1065516787538786594', '0', to_date('24-04-2017 15:27:10', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516921636976941', '1060546419125874659', '1065516637426743584', '0', to_date('24-04-2017 15:28:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1065516939160779056', '1060546527206797285', '1065516637426743584', '0', to_date('24-04-2017 15:28:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068058229240970924', '1058615553282663736', '1068058186915200682', '0', to_date('22-05-2017 16:41:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068213559799168224', '1060539272757114664', '1068213102472182993', '0', to_date('24-05-2017 09:50:17', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068213583763324130', '1066770920083789089', '1068213411453975770', '0', to_date('24-05-2017 09:50:40', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068214107491706982', '1060539272757114664', '1060535863639406298', '0', to_date('24-05-2017 09:58:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068214107495901287', '1060539272757114664', '1060532813148321476', '0', to_date('24-05-2017 09:58:59', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068215709021677708', '1060539272757114664', '1060540484947670858', '0', to_date('24-05-2017 10:24:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068216299643644054', '1060539272757114664', '1060540564383594317', '0', to_date('24-05-2017 10:33:50', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068216822673352886', '1066770920083789089', '1060535863639406298', '0', to_date('24-05-2017 10:42:09', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068216822677547191', '1066770920083789089', '1060532813148321476', '0', to_date('24-05-2017 10:42:09', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068219194696753288', '1053269288410286645', '1060531956747990677', '0', to_date('24-05-2017 11:19:51', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068491957937128857', '1066770920083789089', '1068491236841899401', '0', to_date('27-05-2017 11:35:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068491957943420314', '1066770920083789089', '1068491379960989069', '0', to_date('27-05-2017 11:35:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068491957950760347', '1066770920083789089', '1068491641576506767', '0', to_date('27-05-2017 11:35:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068491957957051804', '1066770920083789089', '1068491783701546385', '0', to_date('27-05-2017 11:35:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_AUTH_JOIN (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1068491957962294685', '1066770920083789089', '1068491877466260884', '0', to_date('27-05-2017 11:35:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

prompt Done.
commit;

prompt Importing table SYS_CONFIG...
set feedback off
set define off
insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054368604333830512', '1', 'sysLoginVerifCode', '1', '登录验证码开关', 'sys', '1', '9', '1', '0', null, '0', '0', to_date('22-12-2016 14:10:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2016 14:11:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054368644869681521', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '2', '0', null, '0', '0', to_date('22-12-2016 14:11:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-12-2016 10:56:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054369247988576626', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '1', '0', null, '0', '0', to_date('22-12-2016 14:20:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2016 17:04:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054369443150590323', '1', 'userOnlineTimeout', '1800', '用户非活跃自动退出的时间(秒)', 'user', '1800', '11', '1', '0', null, '0', '0', to_date('22-12-2016 14:23:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-02-2017 16:24:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054379524154664714', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '2', '0', null, '0', '0', to_date('22-12-2016 17:04:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2016 17:15:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054380203558512396', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '3', '0', null, '0', '0', to_date('22-12-2016 17:15:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2016 17:15:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054380211029616397', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '4', '0', null, '0', '0', to_date('22-12-2016 17:15:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2016 17:15:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054380225200072462', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '5', '0', null, '0', '0', to_date('22-12-2016 17:15:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2016 17:15:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054380235385939727', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '6', '0', null, '0', '0', to_date('22-12-2016 17:15:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2017 10:59:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054718804590220616', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '3', '0', null, '0', '0', to_date('26-12-2016 10:56:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-02-2017 16:23:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1055710190726003464', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '1', '0', null, '0', '0', to_date('06-01-2017 09:34:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2017 14:29:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056893266407022349', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '7', '0', null, '0', '0', to_date('19-01-2017 10:59:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2017 10:59:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056893276582403855', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '8', '0', null, '0', '0', to_date('19-01-2017 10:59:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056906511141211870', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '2', '0', null, '0', '0', to_date('19-01-2017 14:29:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1058791157042642781', '1', 'dauthFlag', '0', '数据权限是否启用开关(1:启用;0:禁用)', 'sys', '0', '12', '1', '1', null, '0', '1', to_date('09-02-2017 09:45:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2017 09:45:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059514707179879550', '1', 'sysDefenseCsrf', '1', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '1', '0', null, '0', '0', to_date('17-02-2017 09:25:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-02-2017 09:38:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059515529840180351', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '2', '0', null, '0', '0', to_date('17-02-2017 09:38:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-02-2017 09:39:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059515548276243584', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '3', '0', null, '0', '0', to_date('17-02-2017 09:39:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:23:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059903402372432249', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '4', '0', null, '0', '0', to_date('21-02-2017 16:23:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:42:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059903430477414778', '1', 'userOnlineTimeout', '1800', '用户非活跃自动退出的时间(秒)', 'user', '1800', '11', '2', '1', null, '0', '0', to_date('21-02-2017 16:24:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-02-2017 16:24:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060058559543549904', '1', 'xs', '1', '23dsa', 'sys', '1', '2', '1', '0', null, '0', '0', to_date('23-02-2017 09:30:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 09:30:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060061909569806306', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '4', '0', null, '0', '0', to_date('23-02-2017 10:23:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 09:20:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063114412990446', '1', 'userLoginVerifcode', '3', null, 'd', '1', '12', '1', '0', null, '0', '0', to_date('23-02-2017 10:42:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 11:08:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063130572595183', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '5', '0', null, '0', '0', to_date('23-02-2017 10:42:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:42:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063130951131120', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '6', '0', null, '0', '0', to_date('23-02-2017 10:42:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:43:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063161922920433', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '7', '0', null, '0', '0', to_date('23-02-2017 10:43:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063237379497970', '1', ' sysName', 'as', 'as', 'c', 'as', '4', '1', '0', null, '0', '0', to_date('23-02-2017 10:44:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:44:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063250179465203', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '2', '0', null, '0', '0', to_date('23-02-2017 10:44:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063293027426292', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '3', '0', null, '0', '0', to_date('23-02-2017 10:45:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063305107021813', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '1', '0', null, '0', '0', to_date('23-02-2017 10:45:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063311110119414', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '2', '0', null, '0', '0', to_date('23-02-2017 10:45:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063313021673463', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '3', '0', null, '0', '0', to_date('23-02-2017 10:45:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063313248165880', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '4', '0', null, '0', '0', to_date('23-02-2017 10:45:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063320846147577', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '3', '0', null, '0', '0', to_date('23-02-2017 10:45:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063322103390202', '1', 'cdxs', 'dxsa', 'dxs', 'cdxsa', 's', '2', '4', '0', null, '0', '0', to_date('23-02-2017 10:45:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 10:45:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063329790500860', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '4', '0', null, '0', '0', to_date('23-02-2017 10:45:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-02-2017 12:52:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060063334443032573', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '5', '0', null, '0', '0', to_date('23-02-2017 10:45:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 11:01:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060064314519756798', '1', 'sysName', '鸿冠业务管理', '系统名称', 'sys', '鸿冠业务管理系统', '8', '6', '0', null, '0', '0', to_date('23-02-2017 11:01:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 11:02:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060064347782684671', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '7', '0', null, '0', '0', to_date('23-02-2017 11:02:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:47:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060064775348984832', '1', 'userLoginVerifcode', '3', null, 'd', '1', '12', '2', '0', null, '0', '0', to_date('23-02-2017 11:08:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 11:10:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060064899235093505', '1', 'userLoginVerifcode', 'super', null, 'password', 'super', '12', '3', '0', null, '0', '0', to_date('23-02-2017 11:10:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-02-2017 11:15:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060161915517302606', '1', ' sysName', 'as', 'as', 'sys', 'as', '4', '5', '0', null, '0', '0', to_date('24-02-2017 12:52:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:00:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '2');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060456848023343950', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '6', '0', null, '0', '0', to_date('27-02-2017 19:00:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-03-2017 15:02:06', 'dd-mm-yyyy hh24:mi:ss'), '2', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060628948726426734', '1', 'defaultPageList', '[10,20,30,50,100]', '数据表格展示数据供选择的数量，格式必须为[10,20,30,50,100]', 'sys', '[10,20,30,50,100]', '13', '1', '0', null, '0', '0', to_date('01-03-2017 16:36:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-03-2017 16:41:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060629280416181361', '1', 'defaultPageList', '[10,20,30,50,100]', '数据表格展示数据供选择的数量，格式必须为[10,20,30,50,100]', 'sys', '[10,20,30,50,100]', '13', '2', '0', null, '0', '1', to_date('01-03-2017 16:41:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 15:54:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060713629858223340', '1', ' sysName', 'as', 'asq&lt;a&gt;1;*&amp;', 'sys', 'as', '4', '7', '0', null, '0', '0', to_date('02-03-2017 15:02:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-03-2017 15:02:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060713657655973102', '1', ' sysName', 'as', 'asq&amp;lt;a&amp;gt;1;*&amp;amp;', 'sys', 'as', '4', '8', '0', null, '0', '0', to_date('02-03-2017 15:02:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-03-2017 15:02:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060713664701355248', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '9', '0', null, '0', '0', to_date('02-03-2017 15:02:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:20:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061169949813203103', '1', 'key', 'key', null, 'sys', 'a', '12', '1', '0', null, '0', '0', to_date('07-03-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-03-2017 15:57:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061252342215968177', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认为10', 'profile', '10', '12', '1', '0', null, '0', '0', to_date('08-03-2017 13:44:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 13:45:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061252391255770547', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认数据', 'profile', '10', '12', '2', '0', null, '0', '0', to_date('08-03-2017 13:45:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 13:47:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061252496293725621', '1', 'themeColor', 'metro', '系统主题配色，默认为metro', 'profile', 'default', '12', '1', '0', null, '0', '0', to_date('08-03-2017 13:47:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 14:13:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061252521005516215', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认数据为10', 'profile', '10', '12', '3', '0', null, '0', '0', to_date('08-03-2017 13:47:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 14:13:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061254161811014369', '1', 'defaultPageSize', '10', '数据表格展示数据数量，默认数据为10', 'profile', '数据表格展示数据数量', '12', '4', '0', null, '0', '0', to_date('08-03-2017 14:13:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 15:08:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061254170120979171', '1', 'themeColor', 'metro', '系统主题配色，默认为metro', 'profile', '系统主题配色', '12', '2', '1', null, '0', '1', to_date('08-03-2017 14:13:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 14:13:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061257638702321050', '1', 'defaultPageSize', '20', '数据表格展示数据数量，默认数据为10', 'profile', '数据表格展示数据数量', '12', '5', '1', null, '0', '1', to_date('08-03-2017 15:08:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 15:08:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061260524390092501', '1', 'defaultPageList', '[10,20,30,50,100]', '数据表格展示数据供选择的数量，格式必须为[10,20,30,50,100]', 'sys', '[10,20,30,50,100]', '13', '3', '1', null, '0', '0', to_date('08-03-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061264423937501773', '1', 'sysLogTimeout', '10', '系统日志过期时间（单位：天）过期将自动删除', 'sys', '10', '18', '1', '1', null, '0', '0', to_date('08-03-2017 16:56:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 16:56:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061416895362299273', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '10', '0', null, '0', '0', to_date('10-03-2017 09:20:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:21:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061416971501499788', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '11', '0', null, '0', '0', to_date('10-03-2017 09:21:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:44:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418409448371599', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '12', '0', null, '0', '0', to_date('10-03-2017 09:44:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:44:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418429970052498', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '13', '0', null, '0', '0', to_date('10-03-2017 09:44:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:44:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418437165381013', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '14', '0', null, '0', '0', to_date('10-03-2017 09:44:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:44:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418446097151384', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '15', '0', null, '0', '0', to_date('10-03-2017 09:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:45:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418454891558299', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '16', '0', null, '0', '0', to_date('10-03-2017 09:45:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:45:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418465343763870', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '17', '0', null, '0', '0', to_date('10-03-2017 09:45:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:46:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418526681265569', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '18', '0', null, '0', '0', to_date('10-03-2017 09:46:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:46:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418574741697956', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '19', '0', null, '0', '0', to_date('10-03-2017 09:46:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 14:06:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418603326928295', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '8', '0', null, '0', '0', to_date('10-03-2017 09:47:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 09:47:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061418607249651114', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '9', '0', null, '0', '0', to_date('10-03-2017 09:47:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:56:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061434905612449199', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '20', '0', null, '0', '0', to_date('10-03-2017 14:06:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:46:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441173620192691', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '21', '0', null, '0', '0', to_date('10-03-2017 15:46:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:48:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441320225797558', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '22', '0', null, '0', '0', to_date('10-03-2017 15:48:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:48:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441348330780089', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '23', '0', null, '0', '0', to_date('10-03-2017 15:48:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:49:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441407566935484', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '24', '0', null, '0', '0', to_date('10-03-2017 15:49:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:51:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441528303121855', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '25', '0', null, '0', '0', to_date('10-03-2017 15:51:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:51:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441541259326914', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '26', '0', null, '0', '0', to_date('10-03-2017 15:51:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441548596213189', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '27', '0', null, '0', '0', to_date('10-03-2017 15:52:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441552372135368', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '28', '0', null, '0', '0', to_date('10-03-2017 15:52:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441557951608267', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '29', '0', null, '0', '0', to_date('10-03-2017 15:52:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441560489162190', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '30', '0', null, '0', '0', to_date('10-03-2017 15:52:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441564321707473', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '31', '0', null, '0', '0', to_date('10-03-2017 15:52:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441567469532628', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '32', '0', null, '0', '0', to_date('10-03-2017 15:52:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441571323049431', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '33', '0', null, '0', '0', to_date('10-03-2017 15:52:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:52:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441573992723930', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '34', '0', null, '0', '0', to_date('10-03-2017 15:52:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441653569156573', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '35', '0', null, '0', '0', to_date('10-03-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441689504904672', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '36', '0', null, '0', '0', to_date('10-03-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441693878515171', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '37', '0', null, '0', '0', to_date('10-03-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441701813089766', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '38', '0', null, '0', '0', to_date('10-03-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441704971400681', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '39', '0', null, '0', '0', to_date('10-03-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441710649439724', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '40', '0', null, '0', '0', to_date('10-03-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441715909096943', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '41', '0', null, '0', '0', to_date('10-03-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441721107936754', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '42', '0', null, '0', '0', to_date('10-03-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441787513206261', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '43', '0', null, '0', '0', to_date('10-03-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:56:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441833474389496', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '44', '0', null, '0', '0', to_date('10-03-2017 15:56:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:57:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441837953906170', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '10', '0', null, '0', '0', to_date('10-03-2017 15:56:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:56:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441846041572860', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '11', '0', null, '0', '0', to_date('10-03-2017 15:56:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:56:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441847255823870', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '12', '0', null, '0', '0', to_date('10-03-2017 15:56:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-03-2017 15:57:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441859548280320', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '13', '0', null, '0', '0', to_date('10-03-2017 15:57:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-03-2017 17:14:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061441869703738882', '1', ' sysName', 'as', 'asq', 'sys', 'as', '4', '45', '0', null, '0', '0', to_date('10-03-2017 15:57:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-03-2017 11:33:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061537323593743695', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '14', '0', null, '0', '0', to_date('11-03-2017 17:14:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061960476082391514', '1', 'sysDefenseCsrf', '1', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '5', '0', null, '0', '0', to_date('16-03-2017 09:20:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 09:26:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061960888449555057', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '6', '0', null, '0', '0', to_date('16-03-2017 09:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 09:27:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061960934371940979', '1', 'sysDefenseCsrf', '1', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '7', '0', null, '0', '0', to_date('16-03-2017 09:27:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-03-2017 16:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061961519968082566', '1', '22', '22', null, '22', '22', '12', '1', '0', null, '0', '0', to_date('16-03-2017 09:36:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 09:39:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061967399646190285', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '15', '0', null, '0', '0', to_date('16-03-2017 11:10:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061967402705935055', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '8', '0', null, '0', '0', to_date('16-03-2017 11:10:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061967407394118353', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '9', '0', null, '0', '0', to_date('16-03-2017 11:10:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061967416175942355', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '16', '0', null, '0', '0', to_date('16-03-2017 11:10:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 15:27:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061967426388024021', '1', 'sysLoginVerifCode', '0', '登录验证码开关(1:启用;0:禁用)', 'sys', '1', '9', '10', '1', null, '0', '0', to_date('16-03-2017 11:10:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061967430022388439', '1', 'userSingleOnline', '0', '是否单一用户(同一用户只有一个在线1:启用;0:禁用)', 'user', '0', '10', '9', '1', null, '0', '0', to_date('16-03-2017 11:10:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-03-2017 11:10:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061983575865080698', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '17', '0', null, '0', '0', to_date('16-03-2017 15:27:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 17:34:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1062077346889137721', '1', 'xsx', 'csac', null, 'xsa', 'sc', '12', '1', '0', null, '0', '0', to_date('17-03-2017 16:17:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-03-2017 16:18:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1062440873932079965', '1', 'name', '0', null, 'sys', '0', '12', '1', '0', null, '0', '0', to_date('21-03-2017 16:35:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-03-2017 16:36:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1062531756334870570', '1', 'sysDefenseCsrf', '0', 'Referer检测防御CSRF攻击(1:启用;0:禁用)', 'sys', '0', '16', '8', '1', null, '0', '0', to_date('22-03-2017 16:40:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-03-2017 16:40:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1062691636119351214', '1', '1111111111', '1', null, '11111', '1', '1', '1', '0', null, '0', '0', to_date('24-03-2017 11:01:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 11:01:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1062706414284404499', '1', 'sdwedwf', 'frg', null, 'de', 'der', '1', '1', '0', null, '0', '0', to_date('24-03-2017 14:56:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 14:56:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1062710248319711107', '1', 'sa', 'dsf', null, 'sad', 'fdv', '1', '1', '0', null, '0', '0', to_date('24-03-2017 15:57:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2017 15:57:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1063259920665755762', '1', 'sysName', '鸿冠业务管理系统', '系统名称', 'sys', '鸿冠业务管理系统', '8', '18', '1', null, '0', '0', to_date('30-03-2017 17:34:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 17:34:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1064879811563183922', '1', 'isUsingCache', '0', 'js缓存使用标记,(0使用时间戳值,1使用系统时间版本值)', 'sys', '1', '20', '1', '1', null, '0', '0', to_date('17-04-2017 14:41:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 14:41:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1065138732049337769', '1', 'sysTimerVerson', '1492658232602', '系统时间版本值,该值跟随系统启动进行更新', 'sys', '1', '19', '1', '1', null, '0', '0', to_date('20-04-2017 11:17:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2017 16:12:11', 'dd-mm-yyyy hh24:mi:ss'), '-1', '-1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1065513867577587797', '1', 'sysDefultLeftMenu', 'sysAuthManagementMenu', '系统默认左侧菜单,值设定为访问权限code值', 'sys', 'sysPersonalMenu', '21', '1', '1', null, '0', '0', to_date('24-04-2017 14:39:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2017 14:39:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1065521702166992466', '1', 'sysVersion', 'V3.0.2-BETA', '版本控制', 'sys', 'V3.0.0.RELEASE', '22', '1', '1', null, '0', '0', to_date('24-04-2017 16:44:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2017 16:44:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_CONFIG (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066978750681198755', '1', 'sysContainerStyle', 'tabs', '移动端系统主面板样式(tabs:tab多页面;single:单页面)', 'sys', 'tabs', '20', '1', '1', null, '0', '0', to_date('10-05-2017 18:43:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 18:43:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_DAUTH_FILTER_TYPE...
set feedback off
set define off
insert into SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_, TENANT_ID_, FILTER_TYPE_CODE_, FILTER_TYPE_NAME_, ENG_NAME_, I18N_CODE_, TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054555673109101532', '1', 'NumberField', '数值型表字段', 'NumberField', 'NumberField', '2', null, '0', '1', to_date('24-12-2016 15:44:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-12-2016 15:44:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_, TENANT_ID_, FILTER_TYPE_CODE_, FILTER_TYPE_NAME_, ENG_NAME_, I18N_CODE_, TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054555696913873885', '1', 'StringField', '字符型表字段', 'StringField', 'StringField', '2', null, '0', '1', to_date('24-12-2016 15:44:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-02-2017 18:07:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_, TENANT_ID_, FILTER_TYPE_CODE_, FILTER_TYPE_NAME_, ENG_NAME_, I18N_CODE_, TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054555727166340062', '1', 'CurrentUserPosition', '当前用户岗位', 'CurrentUserPosition', 'CurrentUserPosition', '1', null, '0', '1', to_date('24-12-2016 15:44:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:13:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_, TENANT_ID_, FILTER_TYPE_CODE_, FILTER_TYPE_NAME_, ENG_NAME_, I18N_CODE_, TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059815909991603084', '1', 'CurrentUserJob', '当前用户职务', 'CurrentUserJob', 'CurrentUserJob', '1', null, '0', '1', to_date('20-02-2017 17:13:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:16:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_FILTER_TYPE (FILTER_TYPE_ID_, TENANT_ID_, FILTER_TYPE_CODE_, FILTER_TYPE_NAME_, ENG_NAME_, I18N_CODE_, TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059816042813676429', '1', 'NoField', '无字段', 'NoField', 'NoField', '1', null, '0', '1', to_date('20-02-2017 17:15:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:15:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_DAUTH_OPERATOR...
set feedback off
set define off
insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054555069516250074', '1', 'equal', '等于', 'equal', null, '=', 'sql 运算符', '0', '1', to_date('24-12-2016 15:34:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:20:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054555182964833243', '1', 'notequal', '不等于', 'not equal', null, '!=', 'sql 运算符', '0', '1', to_date('24-12-2016 15:36:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:20:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166209455078845', '1', 'greater', '大于', 'greater', null, '>', 'sql 运算符', '0', '1', to_date('11-01-2017 10:22:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:20:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166251053137342', '1', 'greaterorequal', '大于等于', 'greater or equal', null, '>=', 'sql 运算符', '0', '1', to_date('11-01-2017 10:23:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:20:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166272403193279', '1', 'less', '小于', 'less', null, '<', 'sql 运算符', '0', '1', to_date('11-01-2017 10:23:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:19:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166292126907840', '1', 'lessorequal', '小于等于', 'less or equal', null, '<=', 'sql 运算符', '0', '1', to_date('11-01-2017 10:24:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:19:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166348158614977', '1', 'in', '包含在', 'in', null, 'in', 'sql 运算符', '0', '1', to_date('11-01-2017 10:25:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:19:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166366257036738', '1', 'notin', '不包含在', 'not in', null, 'not in', 'sql 运算符', '0', '1', to_date('11-01-2017 10:25:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:19:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166430197104067', '1', 'contains', '存在', 'contains', null, 'contains', 'Java解析，比较的2个范围存相同项', '0', '1', to_date('11-01-2017 10:26:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:19:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166493978836420', '1', 'notcontains', '不存在', 'not contains', null, 'notcontains', 'Java解析，比较的2个范围无相同项', '0', '1', to_date('11-01-2017 10:27:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 17:19:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166787370401221', '1', 'match', '符合', 'match', null, 'match', '符合某个自定义SQL', '0', '1', to_date('11-01-2017 10:31:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2017 10:31:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DAUTH_OPERATOR (OPERATOR_ID_, TENANT_ID_, OPERATOR_CODE_, OPERATOR_NAME_, ENG_NAME_, I18N_CODE_, OPERATOR_VALUE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1056166813950754246', '1', 'notmatch', '不符合', 'not match', null, 'notmatch', '不符合某个自定义SQL', '0', '1', to_date('11-01-2017 10:32:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2017 10:32:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_DICT_GROUP...
set feedback off
set define off
insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1053724760099904075', '1', 'trueOrFalse', null, '是否', null, null, '(不要删除)', '0', '1', to_date('15-12-2016 11:37:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-12-2016 18:20:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054288832070383792', '1', 'maleOrFemale', null, '男女', null, null, '(不要删除)', '0', '1', to_date('21-12-2016 17:02:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-12-2016 17:02:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054442420881083477', '1', 'orgNodeType', null, '组织树节点类型', null, null, '（不要删除）', '0', '1', to_date('23-12-2016 09:43:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-12-2016 09:43:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054469676774435390', '1', 'easyuiOrBootstrap', null, '图标配置类型', null, null, '图标配置类型(不要删除)', '0', '1', to_date('23-12-2016 16:57:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-12-2016 16:57:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054542916654603125', '1', 'DAUTH_FILTER_TYPE_TYPE', null, '过滤器类型的类型', null, null, '(不要删除)', '0', '1', to_date('24-12-2016 12:21:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-12-2016 12:21:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054542933943524214', '1', 'DAUTH_FILTER_VALUE_TYPE', null, '过滤器值类型', null, null, '数据权限过滤器项值类型(不要删除)', '0', '1', to_date('24-12-2016 12:21:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-12-2016 12:21:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054720559232210249', '1', 'STAFF_STATUS', null, '员工状态', null, null, '(不要删除)', '0', '1', to_date('26-12-2016 11:24:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-12-2016 11:24:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054897906824244748', '1', 'sysGroupDuty', null, '小组职责', null, null, '（不要删除）组长，组员', '0', '1', to_date('28-12-2016 10:23:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-12-2016 10:23:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925484891733426', '1', 'LOG_TYPE', null, '日志类型', null, null, '系统日志类型', '0', '1', to_date('28-12-2016 17:42:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-12-2016 17:42:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925752870010295', '1', 'LOG_LEVEL', null, '日志级别', null, null, '系统日志级别', '0', '1', to_date('28-12-2016 17:46:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-12-2016 17:46:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054992436591932679', '1', 'isMajorPztn', null, '岗位类别', null, null, '（不要删除）', '0', '1', to_date('29-12-2016 11:26:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-12-2016 11:26:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1057161130082243193', '1', 'DAUTH_USAGE_METHOD_VALID', null, '方法是否在用', null, null, null, '0', '1', to_date('22-01-2017 09:56:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-01-2017 09:56:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059270135917928043', '1', 'defaultPageSize', null, '表格展示数据数量', null, null, '表格展示数据数量', '0', '1', to_date('14-02-2017 16:38:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-02-2017 16:38:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355057992395012', '1', 'colorList', null, '系统主题配色', null, null, '系统主题配色', '0', '1', to_date('15-02-2017 15:08:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-02-2017 15:08:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355057992395013', '1', 'bsColorList', null, 'bootstrap系统主题配色', null, null, 'bootstrap系统主题配色', '0', '1', to_date('15-02-2017 15:08:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-02-2017 15:08:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355057992395063', '1', 'mcColorList', null, '移动端系统主题配色', null, null, '移动端系统主题配色', '0', '1', to_date('15-05-2017 15:08:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-05-2017 15:08:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060456525103533971', '1', 'LOG_RESULT', null, '用户日志结果', null, null, '00000', '0', '1', to_date('27-02-2017 18:55:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-03-2017 17:03:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061261238468542429', '1', 'AUTH_CATEGORY', null, '权限类别', null, null, '1：主权限  2：附属权限', '0', '1', to_date('08-03-2017 16:06:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 16:06:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066982789165309216', '1', 'sysConstraintType', null, '数据约束类型', null, null, '（不要删除）', '0', '0', to_date('10-05-2017 19:47:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_GROUP (DICT_GROUP_ID_, TENANT_ID_, DICT_GROUP_CODE_, GROUP_TYPE_, GROUP_NAME_, ENG_NAME_, I18N_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066982789165309217', '1', 'sysFieldType', null, '字段类型', null, null, '（不要删除）', '0', '1', to_date('10-05-2017 19:47:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_DICT_ITEM...
set feedback off
set define off
insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1053725174320978509', '1', '1053724760099904075', '1', '是', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1053725193561299534', '1', '1053724760099904075', '0', '否', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054288856757008561', '1', '1054288832070383792', '1', '男', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054288870098041010', '1', '1054288832070383792', '0', '女', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054442641536076886', '1', '1054442420881083477', '1', '部门', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054442659663858775', '1', '1054442420881083477', '2', '岗位', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054442676363480152', '1', '1054442420881083477', '3', '小组', null, null, '1', '3', '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054469777534200383', '1', '1054469676774435390', '1', 'easyui', null, null, '1', '1', '1', '1', null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054469798206876224', '1', '1054469676774435390', '0', 'bootstrap', null, null, '1', '2', '2', '1', null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543009819532151', '1', '1054542933943524214', '1', '自定义SQL', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543016697142136', '1', '1054542933943524214', '2', '自定义值', null, null, '1', null, '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543023564266361', '1', '1054542933943524214', '3', '数据权限变量', null, null, '1', null, '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543029511789434', '1', '1054542933943524214', '4', '岗位', null, null, '1', null, '8', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543035888180091', '1', '1054542933943524214', '5', '职务', null, null, '1', null, '16', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543043010108284', '1', '1054542933943524214', '6', '当前用户', null, null, '1', null, '32', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543059687709565', '1', '1054542916654603125', '1', '系统变量', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054543065240968062', '1', '1054542916654603125', '2', '普通类型', null, null, '1', null, '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054720696817964362', '1', '1054720559232210249', '0', '离职', null, null, '1', '2', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054720704458937675', '1', '1054720559232210249', '1', '在职', null, null, '1', '1', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054897947849780749', '1', '1054897906824244748', '1', '组长', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054897964913257998', '1', '1054897906824244748', '0', '组员', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925603656596915', '1', '1054925484891733426', '0', '系统操作日志', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925621557886388', '1', '1054925484891733426', '1', '接口类调用日志', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925640846441909', '1', '1054925484891733426', '2', '定时任务调用日志', null, null, '1', '3', '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925663668698550', '1', '1054925484891733426', '3', '异常信息日志', null, null, '1', '4', '8', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925788504817080', '1', '1054925752870010295', '0', 'DEBUG', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925800926248377', '1', '1054925752870010295', '1', 'INFO', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925848727682490', '1', '1054925752870010295', '2', 'WARN', null, null, '1', '3', '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925866706566587', '1', '1054925752870010295', '3', 'ERROR', null, null, '1', '4', '8', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054925894837763516', '1', '1054925752870010295', '4', 'FATAL', null, null, '1', '5', '16', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054992459137365256', '1', '1054992436591932679', '1', '主岗', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054992480914191625', '1', '1054992436591932679', '0', '副岗', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1057161150905913978', '1', '1057161130082243193', '0', '在用', null, null, '1', '1', '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1057161158363386491', '1', '1057161130082243193', '1', '不再用', null, null, '1', '2', '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059270159572754028', '1', '1059270135917928043', '10', '10', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059270173669809773', '1', '1059270135917928043', '20', '20', null, null, '1', null, '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059270184222678638', '1', '1059270135917928043', '30', '30', null, null, '1', null, '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355090484619525', '1', '1059355057992395012', 'default', '#95B8E7', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355090484619526', '1', '1059355057992395013', 'bule', '#5DB2FF', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355090484619561', '1', '1059355057992395063', 'metro', 'metro', null, null, '1', null, '1', null, null, '0', '1', to_date('15-05-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-05-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355103639005446', '1', '1059355057992395012', 'gray', '#D3D3D3', null, null, '1', null, '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355103639005447', '1', '1059355057992395013', 'metro', '#2dc3e8', null, null, '1', null, '2', null, null, '0', '1', to_date('01-06-2017 10:15:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:15:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355116460992775', '1', '1059355057992395012', 'metro', '#cce6ff', null, null, '1', null, '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355116460992776', '1', '1059355057992395013', 'cyan', '#03B3B2', null, null, '1', null, '4', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355128791197960', '1', '1059355057992395012', 'bootstrap', '#0081c2', null, null, '1', null, '8', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355128791197961', '1', '1059355057992395013', 'green', '#53a93f', null, null, '1', null, '8', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355140782713097', '1', '1059355057992395012', 'black', '#000', null, null, '1', null, '16', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355140782713098', '1', '1059355057992395013', 'yellow', '#FF8F32', null, null, '1', null, '16', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355151988844810', '1', '1059355057992395012', 'material', '#f5f5f5', null, null, '1', null, '32', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059355151988844811', '1', '1059355057992395013', 'red', '#cc324b', null, null, '1', null, '32', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060456537757749140', '1', '1060456525103533971', '0', '失败', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1060456542360997781', '1', '1060456525103533971', '1', '成功', null, null, '1', null, '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061261250984345567', '1', '1061261238468542429', '1', '主权限', null, null, '1', null, '1', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1061261258525704161', '1', '1061261238468542429', '2', '附属权限', null, null, '1', null, '2', null, null, '0', '1', to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:01:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066982825938869531', '1', '1066982789165309217', 'NumberField', '数值型字段', null, null, '1', '1', '1', '1', null, '0', '1', to_date('10-05-2017 19:56:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066982825938869538', '1', '1066982789165309216', '3', '唯一约束', null, null, '1', '3', '1', '3', null, '0', '0', to_date('10-05-2017 19:56:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066982853787999522', '1', '1066982789165309217', 'StringField', '字符型字段', null, null, '1', '2', '2', '2', null, '0', '1', to_date('10-05-2017 19:56:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066982853787999524', '1', '1066982789165309216', '1', '主键约束', null, null, '1', '1', '2', '1', null, '0', '0', to_date('10-05-2017 19:56:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066983275836693800', '1', '1066982789165309216', '2', '外键约束', null, null, '1', '2', '4', '2', null, '0', '0', to_date('10-05-2017 19:56:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2017 19:56:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067146575226413761', '1', '1059355057992395012', 'ui-cupertino', '#D7EBF9', null, null, '1', null, '64', null, null, '0', '0', to_date('12-05-2017 15:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 15:11:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067146598308717251', '1', '1059355057992395012', 'ui-pepper-grinder', '#ECEADF', null, null, '1', null, '128', null, null, '0', '0', to_date('12-05-2017 15:11:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 15:11:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067146620867781317', '1', '1059355057992395012', 'ui-dark-hive', '#000000', null, null, '1', null, '256', null, null, '0', '0', to_date('12-05-2017 15:11:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 15:11:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_DICT_ITEM (DICT_ITEM_ID_, TENANT_ID_, DICT_GROUP_ID_, ITEM_VALUE_, ITEM_NAME_, ENG_NAME_, I18N_CODE_, IS_VISIBLE_, SORT_NO_, PRIORITY_NO_, SUB_GROUP_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067146638284628679', '1', '1059355057992395012', 'ui-sunny', '#FEEEBD', null, null, '1', null, '512', null, null, '0', '0', to_date('12-05-2017 15:12:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 15:12:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_ICON...
set feedback off
set define off
insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821217668473790', '1', '122', 'icon_auto_blue__jewelry', '/static/images/icons/blue/jewelry.png', null, null, null, '122', '1', '0', '1', null, to_date('18-01-2017 15:53:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821218050155455', '1', '123', 'icon_auto_blue__jvm', '/static/images/icons/blue/jvm.png', null, null, null, '123', '1', '0', '1', null, to_date('18-01-2017 15:53:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821218675106752', '1', '124', 'icon_auto_blue__less', '/static/images/icons/blue/less.png', null, null, null, '124', '1', '0', '1', null, to_date('18-01-2017 15:53:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821219004359617', '1', '125', 'icon_auto_blue__libra', '/static/images/icons/blue/libra.png', null, null, null, '125', '1', '0', '1', null, to_date('18-01-2017 15:53:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821219460490178', '1', '126', 'icon_auto_blue__lights', '/static/images/icons/blue/lights.png', null, null, null, '126', '1', '0', '1', null, to_date('18-01-2017 15:53:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821219836928963', '1', '127', 'icon_auto_blue__link', '/static/images/icons/blue/link.png', null, null, null, '127', '1', '0', '1', null, to_date('18-01-2017 15:53:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821220173521860', '1', '128', 'icon_auto_blue__log', '/static/images/icons/blue/log.png', null, null, null, '128', '1', '0', '1', null, to_date('18-01-2017 15:53:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821220551009221', '1', '129', 'icon_auto_blue__logistic', '/static/images/icons/blue/logistic.png', null, null, null, '129', '1', '0', '1', null, to_date('18-01-2017 15:53:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821220900185030', '1', '130', 'icon_auto_blue__machinery', '/static/images/icons/blue/machinery.png', null, null, null, '130', '1', '0', '1', null, to_date('18-01-2017 15:53:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821221245166535', '1', '131', 'icon_auto_blue__manage-order', '/static/images/icons/blue/manage-order.png', null, null, null, '131', '1', '0', '1', null, to_date('18-01-2017 15:53:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821221580710856', '1', '132', 'icon_auto_blue__map', '/static/images/icons/blue/map.png', null, null, null, '132', '1', '0', '1', null, to_date('18-01-2017 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821221926740937', '1', '133', 'icon_auto_blue__metadata', '/static/images/icons/blue/metadata.png', null, null, null, '133', '1', '0', '1', null, to_date('18-01-2017 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821222336734154', '1', '134', 'icon_auto_blue__Mobile-phone', '/static/images/icons/blue/Mobile-phone.png', null, null, null, '134', '1', '0', '1', null, to_date('18-01-2017 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821222754067403', '1', '135', 'icon_auto_blue__more', '/static/images/icons/blue/more.png', null, null, null, '135', '1', '0', '1', null, to_date('18-01-2017 15:53:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821223111631820', '1', '136', 'icon_auto_blue__more_unfold', '/static/images/icons/blue/more_unfold.png', null, null, null, '136', '1', '0', '1', null, to_date('18-01-2017 15:53:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821223531062221', '1', '137', 'icon_auto_blue__move', '/static/images/icons/blue/move.png', null, null, null, '137', '1', '0', '1', null, to_date('18-01-2017 15:53:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821223908549582', '1', '138', 'icon_auto_blue__nav-list', '/static/images/icons/blue/nav-list.png', null, null, null, '138', '1', '0', '1', null, to_date('18-01-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821224254579663', '1', '139', 'icon_auto_blue__office', '/static/images/icons/blue/office.png', null, null, null, '139', '1', '0', '1', null, to_date('18-01-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821224614241232', '1', '140', 'icon_auto_blue__onepage', '/static/images/icons/blue/onepage.png', null, null, null, '140', '1', '0', '1', null, to_date('18-01-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821224991728593', '1', '141', 'icon_auto_blue__operation', '/static/images/icons/blue/operation.png', null, null, null, '141', '1', '0', '1', null, to_date('18-01-2017 15:54:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821225406964690', '1', '142', 'icon_auto_blue__Operator', '/static/images/icons/blue/Operator.png', null, null, null, '142', '1', '0', '1', null, to_date('18-01-2017 15:54:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821225745654739', '1', '143', 'icon_auto_blue__original-image', '/static/images/icons/blue/original-image.png', null, null, null, '143', '1', '0', '1', null, to_date('18-01-2017 15:54:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821226130482132', '1', '144', 'icon_auto_blue__pdf', '/static/images/icons/blue/pdf.png', null, null, null, '144', '1', '0', '1', null, to_date('18-01-2017 15:54:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821226514260949', '1', '145', 'icon_auto_blue__personal-center', '/static/images/icons/blue/personal-center.png', null, null, null, '145', '1', '0', '1', null, to_date('18-01-2017 15:54:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821226895942614', '1', '146', 'icon_auto_blue__phone', '/static/images/icons/blue/phone.png', null, null, null, '146', '1', '0', '1', null, to_date('18-01-2017 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821227316421591', '1', '147', 'icon_auto_blue__pic-filling', '/static/images/icons/blue/pic-filling.png', null, null, null, '147', '1', '0', '1', null, to_date('18-01-2017 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821227698103256', '1', '148', 'icon_auto_blue__pic', '/static/images/icons/blue/pic.png', null, null, null, '148', '1', '0', '1', null, to_date('18-01-2017 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821228070347737', '1', '149', 'icon_auto_blue__pin', '/static/images/icons/blue/pin.png', null, null, null, '149', '1', '0', '1', null, to_date('18-01-2017 15:54:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821228441543642', '1', '150', 'icon_auto_blue__play', '/static/images/icons/blue/play.png', null, null, null, '150', '1', '0', '1', null, to_date('18-01-2017 15:54:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821228835808219', '1', '151', 'icon_auto_blue__print', '/static/images/icons/blue/print.png', null, null, null, '151', '1', '0', '1', null, to_date('18-01-2017 15:54:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821229196518364', '1', '152', 'icon_auto_blue__process', '/static/images/icons/blue/process.png', null, null, null, '152', '1', '0', '1', null, to_date('18-01-2017 15:54:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821229548839901', '1', '153', 'icon_auto_blue__product-features', '/static/images/icons/blue/product-features.png', null, null, null, '153', '1', '0', '1', null, to_date('18-01-2017 15:54:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821229948347358', '1', '154', 'icon_auto_blue__profile', '/static/images/icons/blue/profile.png', null, null, null, '154', '1', '0', '1', null, to_date('18-01-2017 15:54:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821230347854815', '1', '155', 'icon_auto_blue__QRCode', '/static/images/icons/blue/QRCode.png', null, null, null, '155', '1', '0', '1', null, to_date('18-01-2017 15:54:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821230697030624', '1', '156', 'icon_auto_blue__raw', '/static/images/icons/blue/raw.png', null, null, null, '156', '1', '0', '1', null, to_date('18-01-2017 15:54:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821231156306913', '1', '157', 'icon_auto_blue__refresh', '/static/images/icons/blue/refresh.png', null, null, null, '157', '1', '0', '1', null, to_date('18-01-2017 15:54:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821231523308514', '1', '158', 'icon_auto_blue__rejected-order', '/static/images/icons/blue/rejected-order.png', null, null, null, '158', '1', '0', '1', null, to_date('18-01-2017 15:54:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821231864095715', '1', '159', 'icon_auto_blue__remind', '/static/images/icons/blue/remind.png', null, null, null, '159', '1', '0', '1', null, to_date('18-01-2017 15:54:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821232222708708', '1', '160', 'icon_auto_blue__RFQ-filling', '/static/images/icons/blue/RFQ-filling.png', null, null, null, '160', '1', '0', '1', null, to_date('18-01-2017 15:54:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821232569787365', '1', '161', 'icon_auto_blue__rfq-qm', '/static/images/icons/blue/rfq-qm.png', null, null, null, '161', '1', '0', '1', null, to_date('18-01-2017 15:54:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821232913720294', '1', '162', 'icon_auto_blue__rfq-quantity', '/static/images/icons/blue/rfq-quantity.png', null, null, null, '162', '1', '0', '1', null, to_date('18-01-2017 15:54:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821233293304807', '1', '163', 'icon_auto_blue__RFQ', '/static/images/icons/blue/RFQ.png', null, null, null, '163', '1', '0', '1', null, to_date('18-01-2017 15:54:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821233678132200', '1', '164', 'icon_auto_blue__save', '/static/images/icons/blue/save.png', null, null, null, '164', '1', '0', '1', null, to_date('18-01-2017 15:54:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821234038842345', '1', '165', 'icon_auto_blue__scanning', '/static/images/icons/blue/scanning.png', null, null, null, '165', '1', '0', '1', null, to_date('18-01-2017 15:54:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821234414232554', '1', '166', 'icon_auto_blue__search', '/static/images/icons/blue/search.png', null, null, null, '166', '1', '0', '1', null, to_date('18-01-2017 15:54:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821234764456939', '1', '167', 'icon_auto_blue__security', '/static/images/icons/blue/security.png', null, null, null, '167', '1', '0', '1', null, to_date('18-01-2017 15:54:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821235108389868', '1', '168', 'icon_auto_blue__selected', '/static/images/icons/blue/selected.png', null, null, null, '168', '1', '0', '1', null, to_date('18-01-2017 15:54:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821235721806829', '1', '169', 'icon_auto_blue__service', '/static/images/icons/blue/service.png', null, null, null, '169', '1', '0', '1', null, to_date('18-01-2017 15:54:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821236079371246', '1', '170', 'icon_auto_blue__set', '/static/images/icons/blue/set.png', null, null, null, '170', '1', '0', '1', null, to_date('18-01-2017 15:54:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821236433789935', '1', '171', 'icon_auto_blue__share', '/static/images/icons/blue/share.png', null, null, null, '171', '1', '0', '1', null, to_date('18-01-2017 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821236752557040', '1', '172', 'icon_auto_blue__ship', '/static/images/icons/blue/ship.png', null, null, null, '172', '1', '0', '1', null, to_date('18-01-2017 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821237162550257', '1', '173', 'icon_auto_blue__shoes', '/static/images/icons/blue/shoes.png', null, null, null, '173', '1', '0', '1', null, to_date('18-01-2017 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821237528503282', '1', '174', 'icon_auto_blue__shuffling-banner', '/static/images/icons/blue/shuffling-banner.png', null, null, null, '174', '1', '0', '1', null, to_date('18-01-2017 15:54:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821237869290483', '1', '175', 'icon_auto_blue__signboard', '/static/images/icons/blue/signboard.png', null, null, null, '175', '1', '0', '1', null, to_date('18-01-2017 15:54:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821238224757748', '1', '176', 'icon_auto_blue__similar-product', '/static/images/icons/blue/similar-product.png', null, null, null, '176', '1', '0', '1', null, to_date('18-01-2017 15:54:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821238560302069', '1', '177', 'icon_auto_blue__skip', '/static/images/icons/blue/skip.png', null, null, null, '177', '1', '0', '1', null, to_date('18-01-2017 15:54:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821239549109238', '1', '178', 'icon_auto_blue__Smile', '/static/images/icons/blue/Smile.png', null, null, null, '178', '1', '0', '1', null, to_date('18-01-2017 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821239887799287', '1', '179', 'icon_auto_blue__sorting', '/static/images/icons/blue/sorting.png', null, null, null, '179', '1', '0', '1', null, to_date('18-01-2017 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821259041087534', '1', '234', 'icon_auto_colorful__bookmark', '/static/images/icons/colorful/bookmark.png', null, null, null, '234', '1', '0', '1', null, to_date('18-01-2017 15:54:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821259405991983', '1', '235', 'icon_auto_colorful__briefcase', '/static/images/icons/colorful/briefcase.png', null, null, null, '235', '1', '0', '1', null, to_date('18-01-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821259780333616', '1', '236', 'icon_auto_colorful__broken_link', '/static/images/icons/colorful/broken_link.png', null, null, null, '236', '1', '0', '1', null, to_date('18-01-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821260126363697', '1', '237', 'icon_auto_colorful__bullish', '/static/images/icons/colorful/bullish.png', null, null, null, '237', '1', '0', '1', null, to_date('18-01-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821260483928114', '1', '238', 'icon_auto_colorful__business', '/static/images/icons/colorful/business.png', null, null, null, '238', '1', '0', '1', null, to_date('18-01-2017 15:54:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821260837298227', '1', '239', 'icon_auto_colorful__businessman', '/static/images/icons/colorful/businessman.png', null, null, null, '239', '1', '0', '1', null, to_date('18-01-2017 15:54:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821261199056948', '1', '240', 'icon_auto_colorful__businesswoman', '/static/images/icons/colorful/businesswoman.png', null, null, null, '240', '1', '0', '1', null, to_date('18-01-2017 15:54:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821261551378485', '1', '241', 'icon_auto_colorful__business_contact', '/static/images/icons/colorful/business_contact.png', null, null, null, '241', '1', '0', '1', null, to_date('18-01-2017 15:54:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821261958225974', '1', '242', 'icon_auto_colorful__butting_in', '/static/images/icons/colorful/butting_in.png', null, null, null, '242', '1', '0', '1', null, to_date('18-01-2017 15:54:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821262381850679', '1', '243', 'icon_auto_colorful__cable_release', '/static/images/icons/colorful/cable_release.png', null, null, null, '243', '1', '0', '1', null, to_date('18-01-2017 15:54:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821262728929336', '1', '244', 'icon_auto_colorful__calculator', '/static/images/icons/colorful/calculator.png', null, null, null, '244', '1', '0', '1', null, to_date('18-01-2017 15:54:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821263149408313', '1', '245', 'icon_auto_colorful__calendar', '/static/images/icons/colorful/calendar.png', null, null, null, '245', '1', '0', '1', null, to_date('18-01-2017 15:54:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821263657967674', '1', '246', 'icon_auto_colorful__callback', '/static/images/icons/colorful/callback.png', null, null, null, '246', '1', '0', '1', null, to_date('18-01-2017 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821264037552187', '1', '247', 'icon_auto_colorful__call_transfer', '/static/images/icons/colorful/call_transfer.png', null, null, null, '247', '1', '0', '1', null, to_date('18-01-2017 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821264424476732', '1', '248', 'icon_auto_colorful__camcorder', '/static/images/icons/colorful/camcorder.png', null, null, null, '248', '1', '0', '1', null, to_date('18-01-2017 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821264754778173', '1', '249', 'icon_auto_colorful__camcorder_pro', '/static/images/icons/colorful/camcorder_pro.png', null, null, null, '249', '1', '0', '1', null, to_date('18-01-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821265081933886', '1', '250', 'icon_auto_colorful__camera', '/static/images/icons/colorful/camera.png', null, null, null, '250', '1', '0', '1', null, to_date('18-01-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821265451032639', '1', '251', 'icon_auto_colorful__camera_addon', '/static/images/icons/colorful/camera_addon.png', null, null, null, '251', '1', '0', '1', null, to_date('18-01-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821265782382656', '1', '252', 'icon_auto_colorful__camera_identification', '/static/images/icons/colorful/camera_identification.png', null, null, null, '252', '1', '0', '1', null, to_date('18-01-2017 15:54:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821266096955457', '1', '253', 'icon_auto_colorful__cancel', '/static/images/icons/colorful/cancel.png', null, null, null, '253', '1', '0', '1', null, to_date('18-01-2017 15:54:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821266416771138', '1', '254', 'icon_auto_colorful__candle_sticks', '/static/images/icons/colorful/candle_sticks.png', null, null, null, '254', '1', '0', '1', null, to_date('18-01-2017 15:54:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821266753364035', '1', '255', 'icon_auto_colorful__capacitor', '/static/images/icons/colorful/capacitor.png', null, null, null, '255', '1', '0', '1', null, to_date('18-01-2017 15:54:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821267059548228', '1', '256', 'icon_auto_colorful__cell_phone', '/static/images/icons/colorful/cell_phone.png', null, null, null, '256', '1', '0', '1', null, to_date('18-01-2017 15:54:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821267518824517', '1', '257', 'icon_auto_colorful__charge_battery', '/static/images/icons/colorful/charge_battery.png', null, null, null, '257', '1', '0', '1', null, to_date('18-01-2017 15:54:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821267880583238', '1', '258', 'icon_auto_colorful__checkmark', '/static/images/icons/colorful/checkmark.png', null, null, null, '258', '1', '0', '1', null, to_date('18-01-2017 15:54:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821268264362055', '1', '259', 'icon_auto_colorful__cloth', '/static/images/icons/colorful/cloth.png', null, null, null, '259', '1', '0', '1', null, to_date('18-01-2017 15:54:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821268619829320', '1', '260', 'icon_auto_colorful__comments', '/static/images/icons/colorful/comments.png', null, null, null, '260', '1', '0', '1', null, to_date('18-01-2017 15:54:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821268985782345', '1', '261', 'icon_auto_colorful__compact_camera', '/static/images/icons/colorful/compact_camera.png', null, null, null, '261', '1', '0', '1', null, to_date('18-01-2017 15:54:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821269372706890', '1', '262', 'icon_auto_colorful__conference_call', '/static/images/icons/colorful/conference_call.png', null, null, null, '262', '1', '0', '1', null, to_date('18-01-2017 15:54:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821269766971467', '1', '263', 'icon_auto_colorful__contacts', '/static/images/icons/colorful/contacts.png', null, null, null, '263', '1', '0', '1', null, to_date('18-01-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821270180110412', '1', '264', 'icon_auto_colorful__copyleft', '/static/images/icons/colorful/copyleft.png', null, null, null, '264', '1', '0', '1', null, to_date('18-01-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821270635192397', '1', '265', 'icon_auto_colorful__copyright', '/static/images/icons/colorful/copyright.png', null, null, null, '265', '1', '0', '1', null, to_date('18-01-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821271095517262', '1', '266', 'icon_auto_colorful__crystal_oscillator', '/static/images/icons/colorful/crystal_oscillator.png', null, null, null, '266', '1', '0', '1', null, to_date('18-01-2017 15:54:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821271443644495', '1', '267', 'icon_auto_colorful__currency_exchange', '/static/images/icons/colorful/currency_exchange.png', null, null, null, '267', '1', '0', '1', null, to_date('18-01-2017 15:54:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821271797014608', '1', '268', 'icon_auto_colorful__cursor', '/static/images/icons/colorful/cursor.png', null, null, null, '268', '1', '0', '1', null, to_date('18-01-2017 15:54:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821272235319377', '1', '269', 'icon_auto_colorful__customer_support', '/static/images/icons/colorful/customer_support.png', null, null, null, '269', '1', '0', '1', null, to_date('18-01-2017 15:54:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821272598126674', '1', '270', 'icon_auto_colorful__dam', '/static/images/icons/colorful/dam.png', null, null, null, '270', '1', '0', '1', null, to_date('18-01-2017 15:54:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821272995536979', '1', '271', 'icon_auto_colorful__database', '/static/images/icons/colorful/database.png', null, null, null, '271', '1', '0', '1', null, to_date('18-01-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821273436987476', '1', '272', 'icon_auto_colorful__data_backup', '/static/images/icons/colorful/data_backup.png', null, null, null, '272', '1', '0', '1', null, to_date('18-01-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821273785114709', '1', '273', 'icon_auto_colorful__data_configuration', '/static/images/icons/colorful/data_configuration.png', null, null, null, '273', '1', '0', '1', null, to_date('18-01-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821274233905238', '1', '274', 'icon_auto_colorful__data_encryption', '/static/images/icons/colorful/data_encryption.png', null, null, null, '274', '1', '0', '1', null, to_date('18-01-2017 15:54:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821274622926935', '1', '275', 'icon_auto_colorful__data_protection', '/static/images/icons/colorful/data_protection.png', null, null, null, '275', '1', '0', '1', null, to_date('18-01-2017 15:54:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821275006705752', '1', '276', 'icon_auto_colorful__data_recovery', '/static/images/icons/colorful/data_recovery.png', null, null, null, '276', '1', '0', '1', null, to_date('18-01-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821275352735833', '1', '277', 'icon_auto_colorful__data_sheet', '/static/images/icons/colorful/data_sheet.png', null, null, null, '277', '1', '0', '1', null, to_date('18-01-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821275714494554', '1', '278', 'icon_auto_colorful__debt', '/static/images/icons/colorful/debt.png', null, null, null, '278', '1', '0', '1', null, to_date('18-01-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821276094079067', '1', '279', 'icon_auto_colorful__decision', '/static/images/icons/colorful/decision.png', null, null, null, '279', '1', '0', '1', null, to_date('18-01-2017 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821276462129244', '1', '280', 'icon_auto_colorful__delete_column', '/static/images/icons/colorful/delete_column.png', null, null, null, '280', '1', '0', '1', null, to_date('18-01-2017 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821276855345245', '1', '281', 'icon_auto_colorful__delete_database', '/static/images/icons/colorful/delete_database.png', null, null, null, '281', '1', '0', '1', null, to_date('18-01-2017 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821277259047006', '1', '282', 'icon_auto_colorful__delete_row', '/static/images/icons/colorful/delete_row.png', null, null, null, '282', '1', '0', '1', null, to_date('18-01-2017 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821277595639903', '1', '283', 'icon_auto_colorful__department', '/static/images/icons/colorful/department.png', null, null, null, '283', '1', '0', '1', null, to_date('18-01-2017 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821277923844192', '1', '284', 'icon_auto_colorful__deployment', '/static/images/icons/colorful/deployment.png', null, null, null, '284', '1', '0', '1', null, to_date('18-01-2017 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821278292942945', '1', '285', 'icon_auto_colorful__diploma_1', '/static/images/icons/colorful/diploma_1.png', null, null, null, '285', '1', '0', '1', null, to_date('18-01-2017 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821240208663544', '1', '180', 'icon_auto_blue__sports', '/static/images/icons/blue/sports.png', null, null, null, '180', '1', '0', '1', null, to_date('18-01-2017 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821240577762297', '1', '181', 'icon_auto_blue__stop', '/static/images/icons/blue/stop.png', null, null, null, '181', '1', '0', '1', null, to_date('18-01-2017 15:54:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821240958395386', '1', '182', 'icon_auto_blue__store', '/static/images/icons/blue/store.png', null, null, null, '182', '1', '0', '1', null, to_date('18-01-2017 15:54:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821241321202683', '1', '183', 'icon_auto_blue__subtract', '/static/images/icons/blue/subtract.png', null, null, null, '183', '1', '0', '1', null, to_date('18-01-2017 15:54:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821241680864252', '1', '184', 'icon_auto_blue__success', '/static/images/icons/blue/success.png', null, null, null, '184', '1', '0', '1', null, to_date('18-01-2017 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821242021651453', '1', '185', 'icon_auto_blue__supplier-features', '/static/images/icons/blue/supplier-features.png', null, null, null, '185', '1', '0', '1', null, to_date('18-01-2017 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821242366632958', '1', '186', 'icon_auto_blue__survey', '/static/images/icons/blue/survey.png', null, null, null, '186', '1', '0', '1', null, to_date('18-01-2017 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821242709517311', '1', '187', 'icon_auto_blue__sysAuditReportMenu', '/static/images/icons/blue/sysAuditReportMenu.png', null, null, null, '187', '1', '0', '1', null, to_date('18-01-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821243024089088', '1', '188', 'icon_auto_blue__sysDauth', '/static/images/icons/blue/sysDauth.png', null, null, null, '188', '1', '0', '1', null, to_date('18-01-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821243334467585', '1', '189', 'icon_auto_blue__sysEmployee', '/static/images/icons/blue/sysEmployee.png', null, null, null, '189', '1', '0', '1', null, to_date('18-01-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821243730829314', '1', '190', 'icon_auto_blue__sysEmployeeJobReport', '/static/images/icons/blue/sysEmployeeJobReport.png', null, null, null, '190', '1', '0', '1', null, to_date('18-01-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821244055887875', '1', '191', 'icon_auto_blue__sysModifyPwd', '/static/images/icons/blue/sysModifyPwd.png', null, null, null, '191', '1', '0', '1', null, to_date('18-01-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821244418695172', '1', '192', 'icon_auto_blue__sysPersonal', '/static/images/icons/blue/sysPersonal.png', null, null, null, '192', '1', '0', '1', null, to_date('18-01-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821244735365125', '1', '193', 'icon_auto_blue__sysRunMonitor', '/static/images/icons/blue/sysRunMonitor.png', null, null, null, '193', '1', '0', '1', null, to_date('18-01-2017 15:54:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821245068812294', '1', '194', 'icon_auto_blue__sysServerMonitor', '/static/images/icons/blue/sysServerMonitor.png', null, null, null, '194', '1', '0', '1', null, to_date('18-01-2017 15:54:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821245404356615', '1', '195', 'icon_auto_blue__sysStatisticalReportMenu', '/static/images/icons/blue/sysStatisticalReportMenu.png', null, null, null, '195', '1', '0', '1', null, to_date('18-01-2017 15:54:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821245770309640', '1', '196', 'icon_auto_blue__Task-Management', '/static/images/icons/blue/Task-Management.png', null, null, null, '196', '1', '0', '1', null, to_date('18-01-2017 15:54:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821246113193993', '1', '197', 'icon_auto_blue__template-default', '/static/images/icons/blue/template-default.png', null, null, null, '197', '1', '0', '1', null, to_date('18-01-2017 15:54:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821246442446858', '1', '198', 'icon_auto_blue__text', '/static/images/icons/blue/text.png', null, null, null, '198', '1', '0', '1', null, to_date('18-01-2017 15:54:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821246837760011', '1', '199', 'icon_auto_blue__toys', '/static/images/icons/blue/toys.png', null, null, null, '199', '1', '0', '1', null, to_date('18-01-2017 15:54:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821247173304332', '1', '200', 'icon_auto_blue__trade-assurance', '/static/images/icons/blue/trade-assurance.png', null, null, null, '200', '1', '0', '1', null, to_date('18-01-2017 15:54:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821247545548813', '1', '201', 'icon_auto_blue__trade', '/static/images/icons/blue/trade.png', null, null, null, '201', '1', '0', '1', null, to_date('18-01-2017 15:54:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821247873753102', '1', '202', 'icon_auto_blue__training', '/static/images/icons/blue/training.png', null, null, null, '202', '1', '0', '1', null, to_date('18-01-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821248203005967', '1', '203', 'icon_auto_blue__userLog', '/static/images/icons/blue/userLog.png', null, null, null, '203', '1', '0', '1', null, to_date('18-01-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821248514433040', '1', '204', 'icon_auto_blue__ViewGallery', '/static/images/icons/blue/ViewGallery.png', null, null, null, '204', '1', '0', '1', null, to_date('18-01-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821248857317393', '1', '205', 'icon_auto_blue__Viewlist', '/static/images/icons/blue/Viewlist.png', null, null, null, '205', '1', '0', '1', null, to_date('18-01-2017 15:54:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821249242144786', '1', '206', 'icon_auto_blue__warning', '/static/images/icons/blue/warning.png', null, null, null, '206', '1', '0', '1', null, to_date('18-01-2017 15:54:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821249567203347', '1', '207', 'icon_auto_blue__wrong', '/static/images/icons/blue/wrong.png', null, null, null, '207', '1', '0', '1', null, to_date('18-01-2017 15:54:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821249944690708', '1', '208', 'icon_auto_blue__zip', '/static/images/icons/blue/zip.png', null, null, null, '208', '1', '0', '1', null, to_date('18-01-2017 15:54:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821250270797845', '1', '209', 'icon_auto_colorful__about', '/static/images/icons/colorful/about.png', null, null, null, '209', '1', '0', '1', null, to_date('18-01-2017 15:54:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821250602147862', '1', '210', 'icon_auto_colorful__accept_database', '/static/images/icons/colorful/accept_database.png', null, null, null, '210', '1', '0', '1', null, to_date('18-01-2017 15:54:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821250954469399', '1', '211', 'icon_auto_colorful__address_book', '/static/images/icons/colorful/address_book.png', null, null, null, '211', '1', '0', '1', null, to_date('18-01-2017 15:54:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821251285819416', '1', '212', 'icon_auto_colorful__add_column', '/static/images/icons/colorful/add_column.png', null, null, null, '212', '1', '0', '1', null, to_date('18-01-2017 15:54:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821251652821017', '1', '213', 'icon_auto_colorful__add_database', '/static/images/icons/colorful/add_database.png', null, null, null, '213', '1', '0', '1', null, to_date('18-01-2017 15:54:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821252053377050', '1', '214', 'icon_auto_colorful__add_image', '/static/images/icons/colorful/add_image.png', null, null, null, '214', '1', '0', '1', null, to_date('18-01-2017 15:54:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821252428767259', '1', '215', 'icon_auto_colorful__add_row', '/static/images/icons/colorful/add_row.png', null, null, null, '215', '1', '0', '1', null, to_date('18-01-2017 15:54:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821252780040220', '1', '216', 'icon_auto_colorful__advance', '/static/images/icons/colorful/advance.png', null, null, null, '216', '1', '0', '1', null, to_date('18-01-2017 15:54:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821253119778845', '1', '217', 'icon_auto_colorful__advertising', '/static/images/icons/colorful/advertising.png', null, null, null, '217', '1', '0', '1', null, to_date('18-01-2017 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821253458468894', '1', '218', 'icon_auto_colorful__alarm_clock', '/static/images/icons/colorful/alarm_clock.png', null, null, null, '218', '1', '0', '1', null, to_date('18-01-2017 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821253813936159', '1', '219', 'icon_auto_colorful__alphabetical_sorting_az', '/static/images/icons/colorful/alphabetical_sorting_az.png', null, null, null, '219', '1', '0', '1', null, to_date('18-01-2017 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821254137946144', '1', '220', 'icon_auto_colorful__alphabetical_sorting_za', '/static/images/icons/colorful/alphabetical_sorting_za.png', null, null, null, '220', '1', '0', '1', null, to_date('18-01-2017 15:54:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821254475587617', '1', '221', 'icon_auto_colorful__answers', '/static/images/icons/colorful/answers.png', null, null, null, '221', '1', '0', '1', null, to_date('18-01-2017 15:54:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821254821617698', '1', '222', 'icon_auto_colorful__approval', '/static/images/icons/colorful/approval.png', null, null, null, '222', '1', '0', '1', null, to_date('18-01-2017 15:54:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821255148773411', '1', '223', 'icon_auto_colorful__approve', '/static/images/icons/colorful/approve.png', null, null, null, '223', '1', '0', '1', null, to_date('18-01-2017 15:54:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821255505289252', '1', '224', 'icon_auto_colorful__area_chart', '/static/images/icons/colorful/area_chart.png', null, null, null, '224', '1', '0', '1', null, to_date('18-01-2017 15:54:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821255841882149', '1', '225', 'icon_auto_colorful__assistant', '/static/images/icons/colorful/assistant.png', null, null, null, '225', '1', '0', '1', null, to_date('18-01-2017 15:54:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821256186863654', '1', '226', 'icon_auto_colorful__automatic', '/static/images/icons/colorful/automatic.png', null, null, null, '226', '1', '0', '1', null, to_date('18-01-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821256552816679', '1', '227', 'icon_auto_colorful__bad_decision', '/static/images/icons/colorful/bad_decision.png', null, null, null, '227', '1', '0', '1', null, to_date('18-01-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821256899895336', '1', '228', 'icon_auto_colorful__bar_chart', '/static/images/icons/colorful/bar_chart.png', null, null, null, '228', '1', '0', '1', null, to_date('18-01-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821257255362601', '1', '229', 'icon_auto_colorful__bearish', '/static/images/icons/colorful/bearish.png', null, null, null, '229', '1', '0', '1', null, to_date('18-01-2017 15:54:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821257605586986', '1', '230', 'icon_auto_colorful__binoculars', '/static/images/icons/colorful/binoculars.png', null, null, null, '230', '1', '0', '1', null, to_date('18-01-2017 15:54:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821257980977195', '1', '231', 'icon_auto_colorful__biohazard', '/static/images/icons/colorful/biohazard.png', null, null, null, '231', '1', '0', '1', null, to_date('18-01-2017 15:54:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821258333298732', '1', '232', 'icon_auto_colorful__biomass', '/static/images/icons/colorful/biomass.png', null, null, null, '232', '1', '0', '1', null, to_date('18-01-2017 15:54:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821258651017261', '1', '233', 'icon_auto_colorful__biotech', '/static/images/icons/colorful/biotech.png', null, null, null, '233', '1', '0', '1', null, to_date('18-01-2017 15:54:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821172734894917', '1', '1', 'icon_auto_add', '/static/images/icons/add.gif', null, null, null, '1', '1', '0', '1', null, to_date('18-01-2017 15:53:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821173515035462', '1', '2', 'icon_auto_add_16px', '/static/images/icons/add_16px.png', null, null, null, '2', '1', '0', '1', null, to_date('18-01-2017 15:53:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821173870502727', '1', '3', 'icon_auto_almirah_24px', '/static/images/icons/almirah_24px.png', null, null, null, '3', '1', '0', '1', null, to_date('18-01-2017 15:53:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821174198707016', '1', '4', 'icon_auto_bank_24px', '/static/images/icons/bank_24px.png', null, null, null, '4', '1', '0', '1', null, to_date('18-01-2017 15:53:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821174555222857', '1', '5', 'icon_auto_blue_refresh', '/static/images/icons/blue_refresh.png', null, null, null, '5', '1', '0', '1', null, to_date('18-01-2017 15:53:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821174952633162', '1', '6', 'icon_auto_blue_remove', '/static/images/icons/blue_remove.png', null, null, null, '6', '1', '0', '1', null, to_date('18-01-2017 15:53:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821175326974795', '1', '7', 'icon_auto_blue_trash', '/static/images/icons/blue_trash.png', null, null, null, '7', '1', '0', '1', null, to_date('18-01-2017 15:53:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821175748502348', '1', '8', 'icon_auto_browser_16px', '/static/images/icons/browser_16px.png', null, null, null, '8', '1', '0', '1', null, to_date('18-01-2017 15:53:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821176333607757', '1', '9', 'icon_auto_browser_24px', '/static/images/icons/browser_24px.png', null, null, null, '9', '1', '0', '1', null, to_date('18-01-2017 15:53:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821176721580878', '1', '10', 'icon_auto_brush_16px', '/static/images/icons/brush_16px.png', null, null, null, '10', '1', '0', '1', null, to_date('18-01-2017 15:53:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821177078096719', '1', '11', 'icon_auto_cart_16px', '/static/images/icons/cart_16px.png', null, null, null, '11', '1', '0', '1', null, to_date('18-01-2017 15:53:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821177445098320', '1', '12', 'icon_auto_cart_24px', '/static/images/icons/cart_24px.png', null, null, null, '12', '1', '0', '1', null, to_date('18-01-2017 15:53:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821177773302609', '1', '13', 'icon_auto_center_16px', '/static/images/icons/center_16px.png', null, null, null, '13', '1', '0', '1', null, to_date('18-01-2017 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821178105701202', '1', '14', 'icon_auto_chart_organisation', '/static/images/icons/chart_organisation.png', null, null, null, '14', '1', '0', '1', null, to_date('18-01-2017 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821178473751379', '1', '15', 'icon_auto_clear_16px', '/static/images/icons/clear_16px.png', null, null, null, '15', '1', '0', '1', null, to_date('18-01-2017 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821178822927188', '1', '16', 'icon_auto_cog_edit', '/static/images/icons/cog_edit.png', null, null, null, '16', '1', '0', '1', null, to_date('18-01-2017 15:53:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821179192025941', '1', '17', 'icon_auto_delete', '/static/images/icons/delete.gif', null, null, null, '17', '1', '0', '1', null, to_date('18-01-2017 15:53:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821179572659030', '1', '18', 'icon_auto_delete_16px', '/static/images/icons/delete_16px.png', null, null, null, '18', '1', '0', '1', null, to_date('18-01-2017 15:53:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821179999429463', '1', '19', 'icon_auto_doc_16px', '/static/images/icons/doc_16px.png', null, null, null, '19', '1', '0', '1', null, to_date('18-01-2017 15:53:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821180310856536', '1', '20', 'icon_auto_doc_24px', '/static/images/icons/doc_24px.png', null, null, null, '20', '1', '0', '1', null, to_date('18-01-2017 15:53:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821180638012249', '1', '21', 'icon_auto_dot', '/static/images/icons/dot.png', null, null, null, '21', '1', '0', '1', null, to_date('18-01-2017 15:53:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821181002916698', '1', '22', 'icon_auto_edit', '/static/images/icons/edit.gif', null, null, null, '22', '1', '0', '1', null, to_date('18-01-2017 15:53:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821181377258331', '1', '23', 'icon_auto_email', '/static/images/icons/email.png', null, null, null, '23', '1', '0', '1', null, to_date('18-01-2017 15:53:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821181733774172', '1', '24', 'icon_auto_export', '/static/images/icons/export.png', null, null, null, '24', '1', '0', '1', null, to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821182058832733', '1', '25', 'icon_auto_group', '/static/images/icons/group.png', null, null, null, '25', '1', '0', '1', null, to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821182360822622', '1', '26', 'icon_auto_info_16px', '/static/images/icons/info_16px.png', null, null, null, '26', '1', '0', '1', null, to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821182687978335', '1', '27', 'icon_auto_list', '/static/images/icons/list.png', null, null, null, '27', '1', '0', '1', null, to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821183030862688', '1', '28', 'icon_auto_loading1', '/static/images/icons/loading1.gif', null, null, null, '28', '1', '0', '1', null, to_date('18-01-2017 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821183367455585', '1', '29', 'icon_auto_logout', '/static/images/icons/logout.png', null, null, null, '29', '1', '0', '1', null, to_date('18-01-2017 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821183708242786', '1', '30', 'icon_auto_other_16px', '/static/images/icons/other_16px.png', null, null, null, '30', '1', '0', '1', null, to_date('18-01-2017 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821184174859107', '1', '31', 'icon_auto_position', '/static/images/icons/position.png', null, null, null, '31', '1', '0', '1', null, to_date('18-01-2017 15:53:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821184512500580', '1', '32', 'icon_auto_receive', '/static/images/icons/receive.png', null, null, null, '32', '1', '0', '1', null, to_date('18-01-2017 15:53:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821184858530661', '1', '33', 'icon_auto_refresh_16px', '/static/images/icons/refresh_16px.png', null, null, null, '33', '1', '0', '1', null, to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821185171006310', '1', '34', 'icon_auto_refresh_2', '/static/images/icons/refresh_2.png', null, null, null, '34', '1', '0', '1', null, to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821185486627687', '1', '35', 'icon_auto_remove_all_16px', '/static/images/icons/remove_all_16px.png', null, null, null, '35', '1', '0', '1', null, to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821185820074856', '1', '36', 'icon_auto_report_16px', '/static/images/icons/report_16px.png', null, null, null, '36', '1', '0', '1', null, to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821186170299241', '1', '37', 'icon_auto_save_16px', '/static/images/icons/save_16px.png', null, null, null, '37', '1', '0', '1', null, to_date('18-01-2017 15:53:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821186497454954', '1', '38', 'icon_auto_search_16px', '/static/images/icons/search_16px.png', null, null, null, '38', '1', '0', '1', null, to_date('18-01-2017 15:53:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821186819367787', '1', '39', 'icon_auto_search_2', '/static/images/icons/search_2.png', null, null, null, '39', '1', '0', '1', null, to_date('18-01-2017 15:53:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821187227263852', '1', '40', 'icon_auto_settings_16px', '/static/images/icons/settings_16px.png', null, null, null, '40', '1', '0', '1', null, to_date('18-01-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821187574342509', '1', '41', 'icon_auto_set_16px', '/static/images/icons/set_16px.png', null, null, null, '41', '1', '0', '1', null, to_date('18-01-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821187920372590', '1', '42', 'icon_auto_signals_16px', '/static/images/icons/signals_16px.png', null, null, null, '42', '1', '0', '1', null, to_date('18-01-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821188280034159', '1', '43', 'icon_auto_system_16px', '/static/images/icons/system_16px.png', null, null, null, '43', '1', '0', '1', null, to_date('18-01-2017 15:53:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821188642841456', '1', '44', 'icon_auto_system_24px', '/static/images/icons/system_24px.png', null, null, null, '44', '1', '0', '1', null, to_date('18-01-2017 15:53:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821189001454449', '1', '45', 'icon_auto_tasktodo', '/static/images/icons/tasktodo.png', null, null, null, '45', '1', '0', '1', null, to_date('18-01-2017 15:53:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821189727069042', '1', '46', 'icon_auto_undo_16px', '/static/images/icons/undo_16px.png', null, null, null, '46', '1', '0', '1', null, to_date('18-01-2017 15:53:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821190080439155', '1', '47', 'icon_auto_user_center', '/static/images/icons/user_center.png', null, null, null, '47', '1', '0', '1', null, to_date('18-01-2017 15:53:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821190457926516', '1', '48', 'icon_auto_user_man_24px', '/static/images/icons/user_man_24px.png', null, null, null, '48', '1', '0', '1', null, to_date('18-01-2017 15:53:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821190834365301', '1', '49', 'icon_auto_warning', '/static/images/icons/warning.png', null, null, null, '49', '1', '0', '1', null, to_date('18-01-2017 15:53:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821191156278134', '1', '50', 'icon_auto_zhuzhi_24px', '/static/images/icons/zhuzhi_24px.png', null, null, null, '50', '1', '0', '1', null, to_date('18-01-2017 15:53:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821191518036855', '1', '51', 'icon_auto_zuzhi_16', '/static/images/icons/zuzhi_16.png', null, null, null, '51', '1', '0', '1', null, to_date('18-01-2017 15:53:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821191873504120', '1', '52', 'icon_auto_blue__3column', '/static/images/icons/blue/3column.png', null, null, null, '52', '1', '0', '1', null, to_date('18-01-2017 15:53:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821192241554297', '1', '53', 'icon_auto_blue__4column', '/static/images/icons/blue/4column.png', null, null, null, '53', '1', '0', '1', null, to_date('18-01-2017 15:53:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821192617993082', '1', '54', 'icon_auto_blue__account-filling', '/static/images/icons/blue/account-filling.png', null, null, null, '54', '1', '0', '1', null, to_date('18-01-2017 15:53:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821192996529019', '1', '55', 'icon_auto_blue__account', '/static/images/icons/blue/account.png', null, null, null, '55', '1', '0', '1', null, to_date('18-01-2017 15:53:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821193320539004', '1', '56', 'icon_auto_blue__add', '/static/images/icons/blue/add.png', null, null, null, '56', '1', '0', '1', null, to_date('18-01-2017 15:53:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821193666569085', '1', '57', 'icon_auto_blue__agriculture', '/static/images/icons/blue/agriculture.png', null, null, null, '57', '1', '0', '1', null, to_date('18-01-2017 15:53:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821194022036350', '1', '58', 'icon_auto_blue__all', '/static/images/icons/blue/all.png', null, null, null, '58', '1', '0', '1', null, to_date('18-01-2017 15:53:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821194385892223', '1', '59', 'icon_auto_blue__apparel', '/static/images/icons/blue/apparel.png', null, null, null, '59', '1', '0', '1', null, to_date('18-01-2017 15:53:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821194752893824', '1', '60', 'icon_auto_blue__assessed-Badge', '/static/images/icons/blue/assessed-Badge.png', null, null, null, '60', '1', '0', '1', null, to_date('18-01-2017 15:53:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821195113603969', '1', '61', 'icon_auto_blue__atm-away', '/static/images/icons/blue/atm-away.png', null, null, null, '61', '1', '0', '1', null, to_date('18-01-2017 15:53:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821195470119810', '1', '62', 'icon_auto_blue__atm', '/static/images/icons/blue/atm.png', null, null, null, '62', '1', '0', '1', null, to_date('18-01-2017 15:53:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821195821392771', '1', '63', 'icon_auto_blue__attachment', '/static/images/icons/blue/attachment.png', null, null, null, '63', '1', '0', '1', null, to_date('18-01-2017 15:53:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821196141208452', '1', '64', 'icon_auto_blue__auth', '/static/images/icons/blue/auth.png', null, null, null, '64', '1', '0', '1', null, to_date('18-01-2017 15:53:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821196550153093', '1', '65', 'icon_auto_blue__authMenu', '/static/images/icons/blue/authMenu.png', null, null, null, '65', '1', '0', '1', null, to_date('18-01-2017 15:53:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821196900377478', '1', '66', 'icon_auto_blue__auto', '/static/images/icons/blue/auto.png', null, null, null, '66', '1', '0', '1', null, to_date('18-01-2017 15:53:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821197233824647', '1', '67', 'icon_auto_blue__back', '/static/images/icons/blue/back.png', null, null, null, '67', '1', '0', '1', null, to_date('18-01-2017 15:53:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821197592437640', '1', '68', 'icon_auto_blue__bad', '/static/images/icons/blue/bad.png', null, null, null, '68', '1', '0', '1', null, to_date('18-01-2017 15:53:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821197927981961', '1', '69', 'icon_auto_blue__bags', '/static/images/icons/blue/bags.png', null, null, null, '69', '1', '0', '1', null, to_date('18-01-2017 15:53:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821198266672010', '1', '70', 'icon_auto_blue__beauty', '/static/images/icons/blue/beauty.png', null, null, null, '70', '1', '0', '1', null, to_date('18-01-2017 15:53:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821198607459211', '1', '71', 'icon_auto_blue__box', '/static/images/icons/blue/box.png', null, null, null, '71', '1', '0', '1', null, to_date('18-01-2017 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821198949294988', '1', '72', 'icon_auto_blue__browse', '/static/images/icons/blue/browse.png', null, null, null, '72', '1', '0', '1', null, to_date('18-01-2017 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821199324685197', '1', '73', 'icon_auto_blue__bussiness-card', '/static/images/icons/blue/bussiness-card.png', null, null, null, '73', '1', '0', '1', null, to_date('18-01-2017 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821199701123982', '1', '74', 'icon_auto_blue__bussiness-man', '/static/images/icons/blue/bussiness-man.png', null, null, null, '74', '1', '0', '1', null, to_date('18-01-2017 15:53:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821200212829071', '1', '75', 'icon_auto_blue__Calculator', '/static/images/icons/blue/Calculator.png', null, null, null, '75', '1', '0', '1', null, to_date('18-01-2017 15:53:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821200524256144', '1', '76', 'icon_auto_blue__calendar', '/static/images/icons/blue/calendar.png', null, null, null, '76', '1', '0', '1', null, to_date('18-01-2017 15:53:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821200859800465', '1', '77', 'icon_auto_blue__cart', '/static/images/icons/blue/cart.png', null, null, null, '77', '1', '0', '1', null, to_date('18-01-2017 15:53:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821201186956178', '1', '78', 'icon_auto_blue__Category', '/static/images/icons/blue/Category.png', null, null, null, '78', '1', '0', '1', null, to_date('18-01-2017 15:53:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821201529840531', '1', '79', 'icon_auto_blue__clock', '/static/images/icons/blue/clock.png', null, null, null, '79', '1', '0', '1', null, to_date('18-01-2017 15:53:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821201890550676', '1', '80', 'icon_auto_blue__close', '/static/images/icons/blue/close.png', null, null, null, '80', '1', '0', '1', null, to_date('18-01-2017 15:53:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821202209317781', '1', '81', 'icon_auto_blue__color-filling', '/static/images/icons/blue/color-filling.png', null, null, null, '81', '1', '0', '1', null, to_date('18-01-2017 15:53:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821202536473494', '1', '82', 'icon_auto_blue__color', '/static/images/icons/blue/color.png', null, null, null, '82', '1', '0', '1', null, to_date('18-01-2017 15:53:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821202879357847', '1', '83', 'icon_auto_blue__comments', '/static/images/icons/blue/comments.png', null, null, null, '83', '1', '0', '1', null, to_date('18-01-2017 15:53:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821203199173528', '1', '84', 'icon_auto_blue__compare', '/static/images/icons/blue/compare.png', null, null, null, '84', '1', '0', '1', null, to_date('18-01-2017 15:53:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821203538912153', '1', '85', 'icon_auto_blue__compass', '/static/images/icons/blue/compass.png', null, null, null, '85', '1', '0', '1', null, to_date('18-01-2017 15:53:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821203895427994', '1', '86', 'icon_auto_blue__component-filling', '/static/images/icons/blue/component-filling.png', null, null, null, '86', '1', '0', '1', null, to_date('18-01-2017 15:53:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821204226778011', '1', '87', 'icon_auto_blue__component', '/static/images/icons/blue/component.png', null, null, null, '87', '1', '0', '1', null, to_date('18-01-2017 15:53:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821204603216796', '1', '88', 'icon_auto_blue__config', '/static/images/icons/blue/config.png', null, null, null, '88', '1', '0', '1', null, to_date('18-01-2017 15:53:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821204956586909', '1', '89', 'icon_auto_blue__copy', '/static/images/icons/blue/copy.png', null, null, null, '89', '1', '0', '1', null, to_date('18-01-2017 15:53:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821205601461150', '1', '90', 'icon_auto_blue__credit-level-filling', '/static/images/icons/blue/credit-level-filling.png', null, null, null, '90', '1', '0', '1', null, to_date('18-01-2017 15:53:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821205934908319', '1', '91', 'icon_auto_blue__credit-level', '/static/images/icons/blue/credit-level.png', null, null, null, '91', '1', '0', '1', null, to_date('18-01-2017 15:53:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821206259966880', '1', '92', 'icon_auto_blue__cry', '/static/images/icons/blue/cry.png', null, null, null, '92', '1', '0', '1', null, to_date('18-01-2017 15:53:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821206579782561', '1', '93', 'icon_auto_blue__cut', '/static/images/icons/blue/cut.png', null, null, null, '93', '1', '0', '1', null, to_date('18-01-2017 15:53:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821206911132578', '1', '94', 'icon_auto_blue__data', '/static/images/icons/blue/data.png', null, null, null, '94', '1', '0', '1', null, to_date('18-01-2017 15:53:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821207414449059', '1', '95', 'icon_auto_blue__delete', '/static/images/icons/blue/delete.png', null, null, null, '95', '1', '0', '1', null, to_date('18-01-2017 15:53:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821207733216164', '1', '96', 'icon_auto_blue__dict', '/static/images/icons/blue/dict.png', null, null, null, '96', '1', '0', '1', null, to_date('18-01-2017 15:53:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821208097072037', '1', '97', 'icon_auto_blue__discount', '/static/images/icons/blue/discount.png', null, null, null, '97', '1', '0', '1', null, to_date('18-01-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821208451490726', '1', '98', 'icon_auto_blue__dollar', '/static/images/icons/blue/dollar.png', null, null, null, '98', '1', '0', '1', null, to_date('18-01-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821208799617959', '1', '99', 'icon_auto_blue__download', '/static/images/icons/blue/download.png', null, null, null, '99', '1', '0', '1', null, to_date('18-01-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821209207514024', '1', '100', 'icon_auto_blue__edit', '/static/images/icons/blue/edit.png', null, null, null, '100', '1', '0', '1', null, to_date('18-01-2017 15:53:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821209993946025', '1', '101', 'icon_auto_blue__electrical', '/static/images/icons/blue/electrical.png', null, null, null, '101', '1', '0', '1', null, to_date('18-01-2017 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821210361996202', '1', '102', 'icon_auto_blue__electronics', '/static/images/icons/blue/electronics.png', null, null, null, '102', '1', '0', '1', null, to_date('18-01-2017 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821210824418219', '1', '103', 'icon_auto_blue__email-filling', '/static/images/icons/blue/email-filling.png', null, null, null, '103', '1', '0', '1', null, to_date('18-01-2017 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821211188274092', '1', '104', 'icon_auto_blue__email', '/static/images/icons/blue/email.png', null, null, null, '104', '1', '0', '1', null, to_date('18-01-2017 15:53:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821211502846893', '1', '105', 'icon_auto_blue__exl', '/static/images/icons/blue/exl.png', null, null, null, '105', '1', '0', '1', null, to_date('18-01-2017 15:53:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821211828954030', '1', '106', 'icon_auto_blue__favorite', '/static/images/icons/blue/favorite.png', null, null, null, '106', '1', '0', '1', null, to_date('18-01-2017 15:53:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821212193858479', '1', '107', 'icon_auto_blue__favorites-filling', '/static/images/icons/blue/favorites-filling.png', null, null, null, '107', '1', '0', '1', null, to_date('18-01-2017 15:53:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821212531499952', '1', '108', 'icon_auto_blue__favorites', '/static/images/icons/blue/favorites.png', null, null, null, '108', '1', '0', '1', null, to_date('18-01-2017 15:53:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821212888015793', '1', '109', 'icon_auto_blue__filter', '/static/images/icons/blue/filter.png', null, null, null, '109', '1', '0', '1', null, to_date('18-01-2017 15:53:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821213264454578', '1', '110', 'icon_auto_blue__folder', '/static/images/icons/blue/folder.png', null, null, null, '110', '1', '0', '1', null, to_date('18-01-2017 15:53:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821213620970419', '1', '111', 'icon_auto_blue__form', '/static/images/icons/blue/form.png', null, null, null, '111', '1', '0', '1', null, to_date('18-01-2017 15:53:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821213937640372', '1', '112', 'icon_auto_blue__gifts', '/static/images/icons/blue/gifts.png', null, null, null, '112', '1', '0', '1', null, to_date('18-01-2017 15:53:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821214323516341', '1', '113', 'icon_auto_blue__good', '/static/images/icons/blue/good.png', null, null, null, '113', '1', '0', '1', null, to_date('18-01-2017 15:53:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821214663254966', '1', '114', 'icon_auto_blue__help', '/static/images/icons/blue/help.png', null, null, null, '114', '1', '0', '1', null, to_date('18-01-2017 15:53:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821214986216375', '1', '115', 'icon_auto_blue__history', '/static/images/icons/blue/history.png', null, null, null, '115', '1', '0', '1', null, to_date('18-01-2017 15:53:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821215361606584', '1', '116', 'icon_auto_blue__home', '/static/images/icons/blue/home.png', null, null, null, '116', '1', '0', '1', null, to_date('18-01-2017 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821215728608185', '1', '117', 'icon_auto_blue__hot', '/static/images/icons/blue/hot.png', null, null, null, '117', '1', '0', '1', null, to_date('18-01-2017 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821216138601402', '1', '118', 'icon_auto_blue__image-text', '/static/images/icons/blue/image-text.png', null, null, null, '118', '1', '0', '1', null, to_date('18-01-2017 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821216504554427', '1', '119', 'icon_auto_blue__information', '/static/images/icons/blue/information.png', null, null, null, '119', '1', '0', '1', null, to_date('18-01-2017 15:53:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821216862118844', '1', '120', 'icon_auto_blue__inquiry-template', '/static/images/icons/blue/inquiry-template.png', null, null, null, '120', '1', '0', '1', null, to_date('18-01-2017 15:53:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821217239606205', '1', '121', 'icon_auto_blue__integral', '/static/images/icons/blue/integral.png', null, null, null, '121', '1', '0', '1', null, to_date('18-01-2017 15:53:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:53:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821278675673186', '1', '286', 'icon_auto_colorful__diploma_2', '/static/images/icons/colorful/diploma_2.png', null, null, null, '286', '1', '0', '1', null, to_date('18-01-2017 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821279053160547', '1', '287', 'icon_auto_colorful__disapprove', '/static/images/icons/colorful/disapprove.png', null, null, null, '287', '1', '0', '1', null, to_date('18-01-2017 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821279433793636', '1', '288', 'icon_auto_colorful__disclaimer', '/static/images/icons/colorful/disclaimer.png', null, null, null, '288', '1', '0', '1', null, to_date('18-01-2017 15:54:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821279761997925', '1', '289', 'icon_auto_colorful__dislike', '/static/images/icons/colorful/dislike.png', null, null, null, '289', '1', '0', '1', null, to_date('18-01-2017 15:54:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821280091250790', '1', '290', 'icon_auto_colorful__display', '/static/images/icons/colorful/display.png', null, null, null, '290', '1', '0', '1', null, to_date('18-01-2017 15:54:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821280478175335', '1', '291', 'icon_auto_colorful__document', '/static/images/icons/colorful/document.png', null, null, null, '291', '1', '0', '1', null, to_date('18-01-2017 15:54:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821280813719656', '1', '292', 'icon_auto_colorful__donate', '/static/images/icons/colorful/donate.png', null, null, null, '292', '1', '0', '1', null, to_date('18-01-2017 15:54:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821281171284073', '1', '293', 'icon_auto_colorful__doughnut_chart', '/static/images/icons/colorful/doughnut_chart.png', null, null, null, '293', '1', '0', '1', null, to_date('18-01-2017 15:54:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821281623220330', '1', '294', 'icon_auto_colorful__down', '/static/images/icons/colorful/down.png', null, null, null, '294', '1', '0', '1', null, to_date('18-01-2017 15:54:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821281989173355', '1', '295', 'icon_auto_colorful__download', '/static/images/icons/colorful/download.png', null, null, null, '295', '1', '0', '1', null, to_date('18-01-2017 15:54:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821282356174956', '1', '296', 'icon_auto_colorful__down_left', '/static/images/icons/colorful/down_left.png', null, null, null, '296', '1', '0', '1', null, to_date('18-01-2017 15:54:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821282726322285', '1', '297', 'icon_auto_colorful__down_right', '/static/images/icons/colorful/down_right.png', null, null, null, '297', '1', '0', '1', null, to_date('18-01-2017 15:54:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821283792724078', '1', '298', 'icon_auto_colorful__do_not_inhale', '/static/images/icons/colorful/do_not_inhale.png', null, null, null, '298', '1', '0', '1', null, to_date('18-01-2017 15:54:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821284141899887', '1', '299', 'icon_auto_colorful__do_not_insert', '/static/images/icons/colorful/do_not_insert.png', null, null, null, '299', '1', '0', '1', null, to_date('18-01-2017 15:54:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821284559233136', '1', '300', 'icon_auto_colorful__do_not_mix', '/static/images/icons/colorful/do_not_mix.png', null, null, null, '300', '1', '0', '1', null, to_date('18-01-2017 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821284982857841', '1', '301', 'icon_auto_colorful__edit_image', '/static/images/icons/colorful/edit_image.png', null, null, null, '301', '1', '0', '1', null, to_date('18-01-2017 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821285325742194', '1', '302', 'icon_auto_colorful__electrical_sensor', '/static/images/icons/colorful/electrical_sensor.png', null, null, null, '302', '1', '0', '1', null, to_date('18-01-2017 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821285696938099', '1', '303', 'icon_auto_colorful__electricity', '/static/images/icons/colorful/electricity.png', null, null, null, '303', '1', '0', '1', null, to_date('18-01-2017 15:54:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821286009413748', '1', '304', 'icon_auto_colorful__electronics', '/static/images/icons/colorful/electronics.png', null, null, null, '304', '1', '0', '1', null, to_date('18-01-2017 15:54:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821286380609653', '1', '305', 'icon_auto_colorful__electro_devices', '/static/images/icons/colorful/electro_devices.png', null, null, null, '305', '1', '0', '1', null, to_date('18-01-2017 15:54:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821286798991478', '1', '306', 'icon_auto_colorful__empty_battery', '/static/images/icons/colorful/empty_battery.png', null, null, null, '306', '1', '0', '1', null, to_date('18-01-2017 15:54:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821287127195767', '1', '307', 'icon_auto_colorful__empty_filter', '/static/images/icons/colorful/empty_filter.png', null, null, null, '307', '1', '0', '1', null, to_date('18-01-2017 15:54:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821287504683128', '1', '308', 'icon_auto_colorful__empty_trash', '/static/images/icons/colorful/empty_trash.png', null, null, null, '308', '1', '0', '1', null, to_date('18-01-2017 15:54:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:54:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821287966056569', '1', '309', 'icon_auto_colorful__end_call', '/static/images/icons/colorful/end_call.png', null, null, null, '309', '1', '0', '1', null, to_date('18-01-2017 15:55:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821288352981114', '1', '310', 'icon_auto_colorful__engineering', '/static/images/icons/colorful/engineering.png', null, null, null, '310', '1', '0', '1', null, to_date('18-01-2017 15:55:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821288703205499', '1', '311', 'icon_auto_colorful__entering_heaven_alive', '/static/images/icons/colorful/entering_heaven_alive.png', null, null, null, '311', '1', '0', '1', null, to_date('18-01-2017 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821289059721340', '1', '312', 'icon_auto_colorful__expand', '/static/images/icons/colorful/expand.png', null, null, null, '312', '1', '0', '1', null, to_date('18-01-2017 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821289423577213', '1', '313', 'icon_auto_colorful__expired', '/static/images/icons/colorful/expired.png', null, null, null, '313', '1', '0', '1', null, to_date('18-01-2017 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821289828327550', '1', '314', 'icon_auto_colorful__export', '/static/images/icons/colorful/export.png', null, null, null, '314', '1', '0', '1', null, to_date('18-01-2017 15:55:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821290157580415', '1', '315', 'icon_auto_colorful__external', '/static/images/icons/colorful/external.png', null, null, null, '315', '1', '0', '1', null, to_date('18-01-2017 15:55:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821290521436288', '1', '316', 'icon_auto_colorful__factory', '/static/images/icons/colorful/factory.png', null, null, null, '316', '1', '0', '1', null, to_date('18-01-2017 15:55:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821290954498177', '1', '317', 'icon_auto_colorful__factory_breakdown', '/static/images/icons/colorful/factory_breakdown.png', null, null, null, '317', '1', '0', '1', null, to_date('18-01-2017 15:55:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821291341422722', '1', '318', 'icon_auto_colorful__faq', '/static/images/icons/colorful/faq.png', null, null, null, '318', '1', '0', '1', null, to_date('18-01-2017 15:55:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821291671724163', '1', '319', 'icon_auto_colorful__feedback', '/static/images/icons/colorful/feedback.png', null, null, null, '319', '1', '0', '1', null, to_date('18-01-2017 15:55:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821292139389060', '1', '320', 'icon_auto_colorful__feed_in', '/static/images/icons/colorful/feed_in.png', null, null, null, '320', '1', '0', '1', null, to_date('18-01-2017 15:55:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821293112467589', '1', '321', 'icon_auto_colorful__file', '/static/images/icons/colorful/file.png', null, null, null, '321', '1', '0', '1', null, to_date('18-01-2017 15:55:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821293838082182', '1', '322', 'icon_auto_colorful__filing_cabinet', '/static/images/icons/colorful/filing_cabinet.png', null, null, null, '322', '1', '0', '1', null, to_date('18-01-2017 15:55:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821294519656583', '1', '323', 'icon_auto_colorful__filled_filter', '/static/images/icons/colorful/filled_filter.png', null, null, null, '323', '1', '0', '1', null, to_date('18-01-2017 15:55:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821294878269576', '1', '324', 'icon_auto_colorful__film', '/static/images/icons/colorful/film.png', null, null, null, '324', '1', '0', '1', null, to_date('18-01-2017 15:55:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821295218008201', '1', '325', 'icon_auto_colorful__film_reel', '/static/images/icons/colorful/film_reel.png', null, null, null, '325', '1', '0', '1', null, to_date('18-01-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821295572426890', '1', '326', 'icon_auto_colorful__fine_print', '/static/images/icons/colorful/fine_print.png', null, null, null, '326', '1', '0', '1', null, to_date('18-01-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821295934185611', '1', '327', 'icon_auto_colorful__flash_auto', '/static/images/icons/colorful/flash_auto.png', null, null, null, '327', '1', '0', '1', null, to_date('18-01-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821296320061580', '1', '328', 'icon_auto_colorful__flash_off', '/static/images/icons/colorful/flash_off.png', null, null, null, '328', '1', '0', '1', null, to_date('18-01-2017 15:55:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821296669237389', '1', '329', 'icon_auto_colorful__flash_on', '/static/images/icons/colorful/flash_on.png', null, null, null, '329', '1', '0', '1', null, to_date('18-01-2017 15:55:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821297010024590', '1', '330', 'icon_auto_colorful__flow_chart', '/static/images/icons/colorful/flow_chart.png', null, null, null, '330', '1', '0', '1', null, to_date('18-01-2017 15:55:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821297399046287', '1', '331', 'icon_auto_colorful__folder', '/static/images/icons/colorful/folder.png', null, null, null, '331', '1', '0', '1', null, to_date('18-01-2017 15:55:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821297747173520', '1', '332', 'icon_auto_colorful__frame', '/static/images/icons/colorful/frame.png', null, null, null, '332', '1', '0', '1', null, to_date('18-01-2017 15:55:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821298158215313', '1', '333', 'icon_auto_colorful__full_battery', '/static/images/icons/colorful/full_battery.png', null, null, null, '333', '1', '0', '1', null, to_date('18-01-2017 15:55:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821298534654098', '1', '334', 'icon_auto_colorful__full_trash', '/static/images/icons/colorful/full_trash.png', null, null, null, '334', '1', '0', '1', null, to_date('18-01-2017 15:55:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821299248734355', '1', '335', 'icon_auto_colorful__gallery', '/static/images/icons/colorful/gallery.png', null, null, null, '335', '1', '0', '1', null, to_date('18-01-2017 15:55:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821299890462868', '1', '336', 'icon_auto_colorful__genealogy', '/static/images/icons/colorful/genealogy.png', null, null, null, '336', '1', '0', '1', null, to_date('18-01-2017 15:55:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821300258513045', '1', '337', 'icon_auto_colorful__generic_sorting_asc', '/static/images/icons/colorful/generic_sorting_asc.png', null, null, null, '337', '1', '0', '1', null, to_date('18-01-2017 15:55:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821300677943446', '1', '338', 'icon_auto_colorful__generic_sorting_desc', '/static/images/icons/colorful/generic_sorting_desc.png', null, null, null, '338', '1', '0', '1', null, to_date('18-01-2017 15:55:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821301028167831', '1', '339', 'icon_auto_colorful__globe', '/static/images/icons/colorful/globe.png', null, null, null, '339', '1', '0', '1', null, to_date('18-01-2017 15:55:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821301483249816', '1', '340', 'icon_auto_colorful__good_decision', '/static/images/icons/colorful/good_decision.png', null, null, null, '340', '1', '0', '1', null, to_date('18-01-2017 15:55:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821301817745561', '1', '341', 'icon_auto_colorful__graduation_cap', '/static/images/icons/colorful/graduation_cap.png', null, null, null, '341', '1', '0', '1', null, to_date('18-01-2017 15:55:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821302212010138', '1', '342', 'icon_auto_colorful__grid', '/static/images/icons/colorful/grid.png', null, null, null, '342', '1', '0', '1', null, to_date('18-01-2017 15:55:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821302649266331', '1', '343', 'icon_auto_colorful__headset', '/static/images/icons/colorful/headset.png', null, null, null, '343', '1', '0', '1', null, to_date('18-01-2017 15:55:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821302990053532', '1', '344', 'icon_auto_colorful__heat_map', '/static/images/icons/colorful/heat_map.png', null, null, null, '344', '1', '0', '1', null, to_date('18-01-2017 15:55:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821304020803741', '1', '345', 'icon_auto_colorful__high_battery', '/static/images/icons/colorful/high_battery.png', null, null, null, '345', '1', '0', '1', null, to_date('18-01-2017 15:55:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821304397242526', '1', '346', 'icon_auto_colorful__high_priority', '/static/images/icons/colorful/high_priority.png', null, null, null, '346', '1', '0', '1', null, to_date('18-01-2017 15:55:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821304782069919', '1', '347', 'icon_auto_colorful__home', '/static/images/icons/colorful/home.png', null, null, null, '347', '1', '0', '1', null, to_date('18-01-2017 15:55:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821305102934176', '1', '348', 'icon_auto_colorful__icons8_cup', '/static/images/icons/colorful/icons8_cup.png', null, null, null, '348', '1', '0', '1', null, to_date('18-01-2017 15:55:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821305784508577', '1', '349', 'icon_auto_colorful__idea', '/static/images/icons/colorful/idea.png', null, null, null, '349', '1', '0', '1', null, to_date('18-01-2017 15:55:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821306179821730', '1', '350', 'icon_auto_colorful__image_file', '/static/images/icons/colorful/image_file.png', null, null, null, '350', '1', '0', '1', null, to_date('18-01-2017 15:55:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821306551017635', '1', '351', 'icon_auto_colorful__import', '/static/images/icons/colorful/import.png', null, null, null, '351', '1', '0', '1', null, to_date('18-01-2017 15:55:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821307205329060', '1', '352', 'icon_auto_colorful__info', '/static/images/icons/colorful/info.png', null, null, null, '352', '1', '0', '1', null, to_date('18-01-2017 15:55:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821307922555045', '1', '353', 'icon_auto_colorful__inspection', '/static/images/icons/colorful/inspection.png', null, null, null, '353', '1', '0', '1', null, to_date('18-01-2017 15:55:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821308643975334', '1', '354', 'icon_auto_colorful__integrated_webcam', '/static/images/icons/colorful/integrated_webcam.png', null, null, null, '354', '1', '0', '1', null, to_date('18-01-2017 15:55:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821309000491175', '1', '355', 'icon_auto_colorful__internal', '/static/images/icons/colorful/internal.png', null, null, null, '355', '1', '0', '1', null, to_date('18-01-2017 15:55:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821309344424104', '1', '356', 'icon_auto_colorful__invite', '/static/images/icons/colorful/invite.png', null, null, null, '356', '1', '0', '1', null, to_date('18-01-2017 15:55:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821309734494377', '1', '357', 'icon_auto_colorful__in_transit', '/static/images/icons/colorful/in_transit.png', null, null, null, '357', '1', '0', '1', null, to_date('18-01-2017 15:55:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821310149730474', '1', '358', 'icon_auto_colorful__ipad', '/static/images/icons/colorful/ipad.png', null, null, null, '358', '1', '0', '1', null, to_date('18-01-2017 15:55:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821310516732075', '1', '359', 'icon_auto_colorful__iphone', '/static/images/icons/colorful/iphone.png', null, null, null, '359', '1', '0', '1', null, to_date('18-01-2017 15:55:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821310856470700', '1', '360', 'icon_auto_colorful__key', '/static/images/icons/colorful/key.png', null, null, null, '360', '1', '0', '1', null, to_date('18-01-2017 15:55:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821311202500781', '1', '361', 'icon_auto_colorful__kindle', '/static/images/icons/colorful/kindle.png', null, null, null, '361', '1', '0', '1', null, to_date('18-01-2017 15:55:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821311562162350', '1', '362', 'icon_auto_colorful__landscape', '/static/images/icons/colorful/landscape.png', null, null, null, '362', '1', '0', '1', null, to_date('18-01-2017 15:55:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821311938601135', '1', '363', 'icon_auto_colorful__leave', '/static/images/icons/colorful/leave.png', null, null, null, '363', '1', '0', '1', null, to_date('18-01-2017 15:55:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821312363274416', '1', '364', 'icon_auto_colorful__left', '/static/images/icons/colorful/left.png', null, null, null, '364', '1', '0', '1', null, to_date('18-01-2017 15:55:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821312736567473', '1', '365', 'icon_auto_colorful__left_down', '/static/images/icons/colorful/left_down.png', null, null, null, '365', '1', '0', '1', null, to_date('18-01-2017 15:55:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821313130832050', '1', '366', 'icon_auto_colorful__left_down2', '/static/images/icons/colorful/left_down2.png', null, null, null, '366', '1', '0', '1', null, to_date('18-01-2017 15:55:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821313499930803', '1', '367', 'icon_auto_colorful__left_up', '/static/images/icons/colorful/left_up.png', null, null, null, '367', '1', '0', '1', null, to_date('18-01-2017 15:55:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821313875321012', '1', '368', 'icon_auto_colorful__left_up2', '/static/images/icons/colorful/left_up2.png', null, null, null, '368', '1', '0', '1', null, to_date('18-01-2017 15:55:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821314243371189', '1', '369', 'icon_auto_colorful__library', '/static/images/icons/colorful/library.png', null, null, null, '369', '1', '0', '1', null, to_date('18-01-2017 15:55:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821314586255542', '1', '370', 'icon_auto_colorful__light_at_the_end_of_tunnel', '/static/images/icons/colorful/light_at_the_end_of_tunnel.png', null, null, null, '370', '1', '0', '1', null, to_date('18-01-2017 15:55:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821314917605559', '1', '371', 'icon_auto_colorful__like', '/static/images/icons/colorful/like.png', null, null, null, '371', '1', '0', '1', null, to_date('18-01-2017 15:55:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821315270975672', '1', '372', 'icon_auto_colorful__like_placeholder', '/static/images/icons/colorful/like_placeholder.png', null, null, null, '372', '1', '0', '1', null, to_date('18-01-2017 15:55:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821315984007353', '1', '373', 'icon_auto_colorful__line_chart', '/static/images/icons/colorful/line_chart.png', null, null, null, '373', '1', '0', '1', null, to_date('18-01-2017 15:55:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821316371980474', '1', '374', 'icon_auto_colorful__link', '/static/images/icons/colorful/link.png', null, null, null, '374', '1', '0', '1', null, to_date('18-01-2017 15:55:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821316728496315', '1', '375', 'icon_auto_colorful__list', '/static/images/icons/colorful/list.png', null, null, null, '375', '1', '0', '1', null, to_date('18-01-2017 15:55:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821317116469436', '1', '376', 'icon_auto_colorful__lock', '/static/images/icons/colorful/lock.png', null, null, null, '376', '1', '0', '1', null, to_date('18-01-2017 15:55:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821317527511229', '1', '377', 'icon_auto_colorful__lock_landscape', '/static/images/icons/colorful/lock_landscape.png', null, null, null, '377', '1', '0', '1', null, to_date('18-01-2017 15:55:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821317916532926', '1', '378', 'icon_auto_colorful__lock_portrait', '/static/images/icons/colorful/lock_portrait.png', null, null, null, '378', '1', '0', '1', null, to_date('18-01-2017 15:55:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821318289825983', '1', '379', 'icon_auto_colorful__low_battery', '/static/images/icons/colorful/low_battery.png', null, null, null, '379', '1', '0', '1', null, to_date('18-01-2017 15:55:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821318642147520', '1', '380', 'icon_auto_colorful__low_priority', '/static/images/icons/colorful/low_priority.png', null, null, null, '380', '1', '0', '1', null, to_date('18-01-2017 15:55:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821318990274753', '1', '381', 'icon_auto_colorful__make_decision', '/static/images/icons/colorful/make_decision.png', null, null, null, '381', '1', '0', '1', null, to_date('18-01-2017 15:55:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821319327916226', '1', '382', 'icon_auto_colorful__manager', '/static/images/icons/colorful/manager.png', null, null, null, '382', '1', '0', '1', null, to_date('18-01-2017 15:55:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821319996907715', '1', '383', 'icon_auto_colorful__medium_priority', '/static/images/icons/colorful/medium_priority.png', null, null, null, '383', '1', '0', '1', null, to_date('18-01-2017 15:55:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821320337694916', '1', '384', 'icon_auto_colorful__menu', '/static/images/icons/colorful/menu.png', null, null, null, '384', '1', '0', '1', null, to_date('18-01-2017 15:55:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821320671142085', '1', '385', 'icon_auto_colorful__middle_battery', '/static/images/icons/colorful/middle_battery.png', null, null, null, '385', '1', '0', '1', null, to_date('18-01-2017 15:55:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821321027657926', '1', '386', 'icon_auto_colorful__mind_map', '/static/images/icons/colorful/mind_map.png', null, null, null, '386', '1', '0', '1', null, to_date('18-01-2017 15:55:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821321421922503', '1', '387', 'icon_auto_colorful__minus', '/static/images/icons/colorful/minus.png', null, null, null, '387', '1', '0', '1', null, to_date('18-01-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821321803604168', '1', '388', 'icon_auto_colorful__missed_call', '/static/images/icons/colorful/missed_call.png', null, null, null, '388', '1', '0', '1', null, to_date('18-01-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821322162217161', '1', '389', 'icon_auto_colorful__mms', '/static/images/icons/colorful/mms.png', null, null, null, '389', '1', '0', '1', null, to_date('18-01-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821322527121610', '1', '390', 'icon_auto_colorful__money_transfer', '/static/images/icons/colorful/money_transfer.png', null, null, null, '390', '1', '0', '1', null, to_date('18-01-2017 15:55:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821322895171787', '1', '391', 'icon_auto_colorful__multiple_cameras', '/static/images/icons/colorful/multiple_cameras.png', null, null, null, '391', '1', '0', '1', null, to_date('18-01-2017 15:55:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821323250639052', '1', '392', 'icon_auto_colorful__multiple_devices', '/static/images/icons/colorful/multiple_devices.png', null, null, null, '392', '1', '0', '1', null, to_date('18-01-2017 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821323595620557', '1', '393', 'icon_auto_colorful__multiple_inputs', '/static/images/icons/colorful/multiple_inputs.png', null, null, null, '393', '1', '0', '1', null, to_date('18-01-2017 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821323941650638', '1', '394', 'icon_auto_colorful__multiple_smartphones', '/static/images/icons/colorful/multiple_smartphones.png', null, null, null, '394', '1', '0', '1', null, to_date('18-01-2017 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821324299215055', '1', '395', 'icon_auto_colorful__music', '/static/images/icons/colorful/music.png', null, null, null, '395', '1', '0', '1', null, to_date('18-01-2017 15:55:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821324760588496', '1', '396', 'icon_auto_colorful__negative_dynamic', '/static/images/icons/colorful/negative_dynamic.png', null, null, null, '396', '1', '0', '1', null, to_date('18-01-2017 15:55:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821325396025553', '1', '397', 'icon_auto_colorful__neutral_decision', '/static/images/icons/colorful/neutral_decision.png', null, null, null, '397', '1', '0', '1', null, to_date('18-01-2017 15:55:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821325756735698', '1', '398', 'icon_auto_colorful__neutral_trading', '/static/images/icons/colorful/neutral_trading.png', null, null, null, '398', '1', '0', '1', null, to_date('18-01-2017 15:55:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821326113251539', '1', '399', 'icon_auto_colorful__news', '/static/images/icons/colorful/news.png', null, null, null, '399', '1', '0', '1', null, to_date('18-01-2017 15:55:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821326438310100', '1', '400', 'icon_auto_colorful__next', '/static/images/icons/colorful/next.png', null, null, null, '400', '1', '0', '1', null, to_date('18-01-2017 15:55:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821326795874517', '1', '401', 'icon_auto_colorful__night_landscape', '/static/images/icons/colorful/night_landscape.png', null, null, null, '401', '1', '0', '1', null, to_date('18-01-2017 15:55:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821327142953174', '1', '402', 'icon_auto_colorful__night_portrait', '/static/images/icons/colorful/night_portrait.png', null, null, null, '402', '1', '0', '1', null, to_date('18-01-2017 15:55:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821327499469015', '1', '403', 'icon_auto_colorful__no_idea', '/static/images/icons/colorful/no_idea.png', null, null, null, '403', '1', '0', '1', null, to_date('18-01-2017 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821327846547672', '1', '404', 'icon_auto_colorful__numerical_sorting_12', '/static/images/icons/colorful/numerical_sorting_12.png', null, null, null, '404', '1', '0', '1', null, to_date('18-01-2017 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821328182091993', '1', '405', 'icon_auto_colorful__numerical_sorting_21', '/static/images/icons/colorful/numerical_sorting_21.png', null, null, null, '405', '1', '0', '1', null, to_date('18-01-2017 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821328560627930', '1', '406', 'icon_auto_colorful__ok', '/static/images/icons/colorful/ok.png', null, null, null, '406', '1', '0', '1', null, to_date('18-01-2017 15:55:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821328918192347', '1', '407', 'icon_auto_colorful__old_time_camera', '/static/images/icons/colorful/old_time_camera.png', null, null, null, '407', '1', '0', '1', null, to_date('18-01-2017 15:55:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821329257930972', '1', '408', 'icon_auto_colorful__online_support', '/static/images/icons/colorful/online_support.png', null, null, null, '408', '1', '0', '1', null, to_date('18-01-2017 15:55:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821329625981149', '1', '409', 'icon_auto_colorful__opened_folder', '/static/images/icons/colorful/opened_folder.png', null, null, null, '409', '1', '0', '1', null, to_date('18-01-2017 15:55:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821330306506974', '1', '410', 'icon_auto_colorful__organization', '/static/images/icons/colorful/organization.png', null, null, null, '410', '1', '0', '1', null, to_date('18-01-2017 15:55:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821330664071391', '1', '411', 'icon_auto_colorful__org_unit', '/static/images/icons/colorful/org_unit.png', null, null, null, '411', '1', '0', '1', null, to_date('18-01-2017 15:55:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821331023732960', '1', '412', 'icon_auto_colorful__overtime', '/static/images/icons/colorful/overtime.png', null, null, null, '412', '1', '0', '1', null, to_date('18-01-2017 15:55:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821331371860193', '1', '413', 'icon_auto_colorful__package', '/static/images/icons/colorful/package.png', null, null, null, '413', '1', '0', '1', null, to_date('18-01-2017 15:55:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821331726278882', '1', '414', 'icon_auto_colorful__paid', '/static/images/icons/colorful/paid.png', null, null, null, '414', '1', '0', '1', null, to_date('18-01-2017 15:55:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821332196040931', '1', '415', 'icon_auto_colorful__panorama', '/static/images/icons/colorful/panorama.png', null, null, null, '415', '1', '0', '1', null, to_date('18-01-2017 15:55:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821332541022436', '1', '416', 'icon_auto_colorful__parallel_tasks', '/static/images/icons/colorful/parallel_tasks.png', null, null, null, '416', '1', '0', '1', null, to_date('18-01-2017 15:55:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821332935287013', '1', '417', 'icon_auto_colorful__phone', '/static/images/icons/colorful/phone.png', null, null, null, '417', '1', '0', '1', null, to_date('18-01-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821333316968678', '1', '418', 'icon_auto_colorful__phone_android', '/static/images/icons/colorful/phone_android.png', null, null, null, '418', '1', '0', '1', null, to_date('18-01-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821333668241639', '1', '419', 'icon_auto_colorful__photo_reel', '/static/images/icons/colorful/photo_reel.png', null, null, null, '419', '1', '0', '1', null, to_date('18-01-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821334050971880', '1', '420', 'icon_auto_colorful__picture', '/static/images/icons/colorful/picture.png', null, null, null, '420', '1', '0', '1', null, to_date('18-01-2017 15:55:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821334417973481', '1', '421', 'icon_auto_colorful__pie_chart', '/static/images/icons/colorful/pie_chart.png', null, null, null, '421', '1', '0', '1', null, to_date('18-01-2017 15:55:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821334766100714', '1', '422', 'icon_auto_colorful__planner', '/static/images/icons/colorful/planner.png', null, null, null, '422', '1', '0', '1', null, to_date('18-01-2017 15:55:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821335138345195', '1', '423', 'icon_auto_colorful__plus', '/static/images/icons/colorful/plus.png', null, null, null, '423', '1', '0', '1', null, to_date('18-01-2017 15:55:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821335499055340', '1', '424', 'icon_auto_colorful__podium_without_speaker', '/static/images/icons/colorful/podium_without_speaker.png', null, null, null, '424', '1', '0', '1', null, to_date('18-01-2017 15:55:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821335825162477', '1', '425', 'icon_auto_colorful__podium_with_audience', '/static/images/icons/colorful/podium_with_audience.png', null, null, null, '425', '1', '0', '1', null, to_date('18-01-2017 15:55:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821336184824046', '1', '426', 'icon_auto_colorful__podium_with_speaker', '/static/images/icons/colorful/podium_with_speaker.png', null, null, null, '426', '1', '0', '1', null, to_date('18-01-2017 15:55:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821336541339887', '1', '427', 'icon_auto_colorful__portrait_mode', '/static/images/icons/colorful/portrait_mode.png', null, null, null, '427', '1', '0', '1', null, to_date('18-01-2017 15:55:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821336903098608', '1', '428', 'icon_auto_colorful__positive_dynamic', '/static/images/icons/colorful/positive_dynamic.png', null, null, null, '428', '1', '0', '1', null, to_date('18-01-2017 15:55:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821337251225841', '1', '429', 'icon_auto_colorful__previous', '/static/images/icons/colorful/previous.png', null, null, null, '429', '1', '0', '1', null, to_date('18-01-2017 15:55:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821337705259250', '1', '430', 'icon_auto_colorful__print', '/static/images/icons/colorful/print.png', null, null, null, '430', '1', '0', '1', null, to_date('18-01-2017 15:55:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821338077503731', '1', '431', 'icon_auto_colorful__privacy', '/static/images/icons/colorful/privacy.png', null, null, null, '431', '1', '0', '1', null, to_date('18-01-2017 15:55:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821338465476852', '1', '432', 'icon_auto_colorful__process', '/static/images/icons/colorful/process.png', null, null, null, '432', '1', '0', '1', null, to_date('18-01-2017 15:55:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821338821992693', '1', '433', 'icon_auto_colorful__puzzle', '/static/images/icons/colorful/puzzle.png', null, null, null, '433', '1', '0', '1', null, to_date('18-01-2017 15:55:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821339209965814', '1', '434', 'icon_auto_colorful__questions', '/static/images/icons/colorful/questions.png', null, null, null, '434', '1', '0', '1', null, to_date('18-01-2017 15:55:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821339615764727', '1', '435', 'icon_auto_colorful__radar_plot', '/static/images/icons/colorful/radar_plot.png', null, null, null, '435', '1', '0', '1', null, to_date('18-01-2017 15:55:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821340004786424', '1', '436', 'icon_auto_colorful__rating', '/static/images/icons/colorful/rating.png', null, null, null, '436', '1', '0', '1', null, to_date('18-01-2017 15:55:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821340344525049', '1', '437', 'icon_auto_colorful__ratings', '/static/images/icons/colorful/ratings.png', null, null, null, '437', '1', '0', '1', null, to_date('18-01-2017 15:55:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821340720963834', '1', '438', 'icon_auto_colorful__reading', '/static/images/icons/colorful/reading.png', null, null, null, '438', '1', '0', '1', null, to_date('18-01-2017 15:55:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821341129908475', '1', '439', 'icon_auto_colorful__reading_ebook', '/static/images/icons/colorful/reading_ebook.png', null, null, null, '439', '1', '0', '1', null, to_date('18-01-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821341467549948', '1', '440', 'icon_auto_colorful__redo', '/static/images/icons/colorful/redo.png', null, null, null, '440', '1', '0', '1', null, to_date('18-01-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821341819871485', '1', '441', 'icon_auto_colorful__refresh', '/static/images/icons/colorful/refresh.png', null, null, null, '441', '1', '0', '1', null, to_date('18-01-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821342238253310', '1', '442', 'icon_auto_colorful__registered_trademark', '/static/images/icons/colorful/registered_trademark.png', null, null, null, '442', '1', '0', '1', null, to_date('18-01-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821342587429119', '1', '443', 'icon_auto_colorful__remove_image', '/static/images/icons/colorful/remove_image.png', null, null, null, '443', '1', '0', '1', null, to_date('18-01-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821342921924864', '1', '444', 'icon_auto_colorful__reuse', '/static/images/icons/colorful/reuse.png', null, null, null, '444', '1', '0', '1', null, to_date('18-01-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821343277392129', '1', '445', 'icon_auto_colorful__right', '/static/images/icons/colorful/right.png', null, null, null, '445', '1', '0', '1', null, to_date('18-01-2017 15:55:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821343641248002', '1', '446', 'icon_auto_colorful__right_down', '/static/images/icons/colorful/right_down.png', null, null, null, '446', '1', '0', '1', null, to_date('18-01-2017 15:55:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821344000909571', '1', '447', 'icon_auto_colorful__right_down2', '/static/images/icons/colorful/right_down2.png', null, null, null, '447', '1', '0', '1', null, to_date('18-01-2017 15:55:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821344358473988', '1', '448', 'icon_auto_colorful__right_up', '/static/images/icons/colorful/right_up.png', null, null, null, '448', '1', '0', '1', null, to_date('18-01-2017 15:55:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821344747495685', '1', '449', 'icon_auto_colorful__right_up2', '/static/images/icons/colorful/right_up2.png', null, null, null, '449', '1', '0', '1', null, to_date('18-01-2017 15:55:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821345132323078', '1', '450', 'icon_auto_colorful__rotate_camera', '/static/images/icons/colorful/rotate_camera.png', null, null, null, '450', '1', '0', '1', null, to_date('18-01-2017 15:55:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821345511907591', '1', '451', 'icon_auto_colorful__rotate_to_landscape', '/static/images/icons/colorful/rotate_to_landscape.png', null, null, null, '451', '1', '0', '1', null, to_date('18-01-2017 15:55:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821345857937672', '1', '452', 'icon_auto_colorful__rotate_to_portrait', '/static/images/icons/colorful/rotate_to_portrait.png', null, null, null, '452', '1', '0', '1', null, to_date('18-01-2017 15:55:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821346245910793', '1', '453', 'icon_auto_colorful__ruler', '/static/images/icons/colorful/ruler.png', null, null, null, '453', '1', '0', '1', null, to_date('18-01-2017 15:55:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821346624446730', '1', '454', 'icon_auto_colorful__rules', '/static/images/icons/colorful/rules.png', null, null, null, '454', '1', '0', '1', null, to_date('18-01-2017 15:55:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821347000885515', '1', '455', 'icon_auto_colorful__safe', '/static/images/icons/colorful/safe.png', null, null, null, '455', '1', '0', '1', null, to_date('18-01-2017 15:55:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821347326992652', '1', '456', 'icon_auto_colorful__sales_performance', '/static/images/icons/colorful/sales_performance.png', null, null, null, '456', '1', '0', '1', null, to_date('18-01-2017 15:55:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821347671974157', '1', '457', 'icon_auto_colorful__scatter_plot', '/static/images/icons/colorful/scatter_plot.png', null, null, null, '457', '1', '0', '1', null, to_date('18-01-2017 15:55:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821348063093006', '1', '458', 'icon_auto_colorful__search', '/static/images/icons/colorful/search.png', null, null, null, '458', '1', '0', '1', null, to_date('18-01-2017 15:55:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821348618838287', '1', '459', 'icon_auto_colorful__selfie', '/static/images/icons/colorful/selfie.png', null, null, null, '459', '1', '0', '1', null, to_date('18-01-2017 15:55:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821349290975504', '1', '460', 'icon_auto_colorful__self_service_kiosk', '/static/images/icons/colorful/self_service_kiosk.png', null, null, null, '460', '1', '0', '1', null, to_date('18-01-2017 15:55:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821349712503057', '1', '461', 'icon_auto_colorful__serial_tasks', '/static/images/icons/colorful/serial_tasks.png', null, null, null, '461', '1', '0', '1', null, to_date('18-01-2017 15:55:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821350125642002', '1', '462', 'icon_auto_colorful__services', '/static/images/icons/colorful/services.png', null, null, null, '462', '1', '0', '1', null, to_date('18-01-2017 15:55:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:55:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821350514663699', '1', '463', 'icon_auto_colorful__service_mark', '/static/images/icons/colorful/service_mark.png', null, null, null, '463', '1', '0', '1', null, to_date('18-01-2017 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821350849159444', '1', '464', 'icon_auto_colorful__settings', '/static/images/icons/colorful/settings.png', null, null, null, '464', '1', '0', '1', null, to_date('18-01-2017 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821351205675285', '1', '465', 'icon_auto_colorful__share', '/static/images/icons/colorful/share.png', null, null, null, '465', '1', '0', '1', null, to_date('18-01-2017 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821351586308374', '1', '466', 'icon_auto_colorful__shipped', '/static/images/icons/colorful/shipped.png', null, null, null, '466', '1', '0', '1', null, to_date('18-01-2017 15:56:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821351939678487', '1', '467', 'icon_auto_colorful__shop', '/static/images/icons/colorful/shop.png', null, null, null, '467', '1', '0', '1', null, to_date('18-01-2017 15:56:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821352338137368', '1', '468', 'icon_auto_colorful__signature', '/static/images/icons/colorful/signature.png', null, null, null, '468', '1', '0', '1', null, to_date('18-01-2017 15:56:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821352694653209', '1', '469', 'icon_auto_colorful__sim_card', '/static/images/icons/colorful/sim_card.png', null, null, null, '469', '1', '0', '1', null, to_date('18-01-2017 15:56:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821353051169050', '1', '470', 'icon_auto_colorful__sim_card_chip', '/static/images/icons/colorful/sim_card_chip.png', null, null, null, '470', '1', '0', '1', null, to_date('18-01-2017 15:56:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821353398247707', '1', '471', 'icon_auto_colorful__slr_back_side', '/static/images/icons/colorful/slr_back_side.png', null, null, null, '471', '1', '0', '1', null, to_date('18-01-2017 15:56:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821353732743452', '1', '472', 'icon_auto_colorful__smartphone_tablet', '/static/images/icons/colorful/smartphone_tablet.png', null, null, null, '472', '1', '0', '1', null, to_date('18-01-2017 15:56:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821354424803613', '1', '473', 'icon_auto_colorful__sms', '/static/images/icons/colorful/sms.png', null, null, null, '473', '1', '0', '1', null, to_date('18-01-2017 15:56:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821354856816926', '1', '474', 'icon_auto_colorful__sound_recording_copyright', '/static/images/icons/colorful/sound_recording_copyright.png', null, null, null, '474', '1', '0', '1', null, to_date('18-01-2017 15:56:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821355219624223', '1', '475', 'icon_auto_colorful__speaker', '/static/images/icons/colorful/speaker.png', null, null, null, '475', '1', '0', '1', null, to_date('18-01-2017 15:56:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821355609694496', '1', '476', 'icon_auto_colorful__sports_mode', '/static/images/icons/colorful/sports_mode.png', null, null, null, '476', '1', '0', '1', null, to_date('18-01-2017 15:56:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821356016541985', '1', '477', 'icon_auto_colorful__stack_of_photos', '/static/images/icons/colorful/stack_of_photos.png', null, null, null, '477', '1', '0', '1', null, to_date('18-01-2017 15:56:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821356731670818', '1', '478', 'icon_auto_colorful__start', '/static/images/icons/colorful/start.png', null, null, null, '478', '1', '0', '1', null, to_date('18-01-2017 15:56:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821357444702499', '1', '479', 'icon_auto_colorful__statistics', '/static/images/icons/colorful/statistics.png', null, null, null, '479', '1', '0', '1', null, to_date('18-01-2017 15:56:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821357815898404', '1', '480', 'icon_auto_colorful__support', '/static/images/icons/colorful/support.png', null, null, null, '480', '1', '0', '1', null, to_date('18-01-2017 15:56:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:06', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821358199677221', '1', '481', 'icon_auto_colorful__survey', '/static/images/icons/colorful/survey.png', null, null, null, '481', '1', '0', '1', null, to_date('18-01-2017 15:56:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821358556193062', '1', '482', 'icon_auto_colorful__switch_camera', '/static/images/icons/colorful/switch_camera.png', null, null, null, '482', '1', '0', '1', null, to_date('18-01-2017 15:56:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821358901174567', '1', '483', 'icon_auto_colorful__synchronize', '/static/images/icons/colorful/synchronize.png', null, null, null, '483', '1', '0', '1', null, to_date('18-01-2017 15:56:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821359289147688', '1', '484', 'icon_auto_colorful__tablet_android', '/static/images/icons/colorful/tablet_android.png', null, null, null, '484', '1', '0', '1', null, to_date('18-01-2017 15:56:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821362311143721', '1', '485', 'icon_auto_colorful__template', '/static/images/icons/colorful/template.png', null, null, null, '485', '1', '0', '1', null, to_date('18-01-2017 15:56:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821362658222378', '1', '486', 'icon_auto_colorful__timeline', '/static/images/icons/colorful/timeline.png', null, null, null, '486', '1', '0', '1', null, to_date('18-01-2017 15:56:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821363026272555', '1', '487', 'icon_auto_colorful__todo_list', '/static/images/icons/colorful/todo_list.png', null, null, null, '487', '1', '0', '1', null, to_date('18-01-2017 15:56:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821363401662764', '1', '488', 'icon_auto_colorful__trademark', '/static/images/icons/colorful/trademark.png', null, null, null, '488', '1', '0', '1', null, to_date('18-01-2017 15:56:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821363782295853', '1', '489', 'icon_auto_colorful__tree_structure', '/static/images/icons/colorful/tree_structure.png', null, null, null, '489', '1', '0', '1', null, to_date('18-01-2017 15:56:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821364126228782', '1', '490', 'icon_auto_colorful__two_smartphones', '/static/images/icons/colorful/two_smartphones.png', null, null, null, '490', '1', '0', '1', null, to_date('18-01-2017 15:56:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821364956700975', '1', '491', 'icon_auto_colorful__undo', '/static/images/icons/colorful/undo.png', null, null, null, '491', '1', '0', '1', null, to_date('18-01-2017 15:56:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821365317411120', '1', '492', 'icon_auto_colorful__unlock', '/static/images/icons/colorful/unlock.png', null, null, null, '492', '1', '0', '1', null, to_date('18-01-2017 15:56:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821365696995633', '1', '493', 'icon_auto_colorful__up', '/static/images/icons/colorful/up.png', null, null, null, '493', '1', '0', '1', null, to_date('18-01-2017 15:56:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821366032539954', '1', '494', 'icon_auto_colorful__upload', '/static/images/icons/colorful/upload.png', null, null, null, '494', '1', '0', '1', null, to_date('18-01-2017 15:56:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821366403735859', '1', '495', 'icon_auto_colorful__up_left', '/static/images/icons/colorful/up_left.png', null, null, null, '495', '1', '0', '1', null, to_date('18-01-2017 15:56:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821366729842996', '1', '496', 'icon_auto_colorful__up_right', '/static/images/icons/colorful/up_right.png', null, null, null, '496', '1', '0', '1', null, to_date('18-01-2017 15:56:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821367077970229', '1', '497', 'icon_auto_colorful__video_call', '/static/images/icons/colorful/video_call.png', null, null, null, '497', '1', '0', '1', null, to_date('18-01-2017 15:56:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821367456506166', '1', '498', 'icon_auto_colorful__video_file', '/static/images/icons/colorful/video_file.png', null, null, null, '498', '1', '0', '1', null, to_date('18-01-2017 15:56:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821367802536247', '1', '499', 'icon_auto_colorful__video_projector', '/static/images/icons/colorful/video_projector.png', null, null, null, '499', '1', '0', '1', null, to_date('18-01-2017 15:56:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821368166392120', '1', '500', 'icon_auto_colorful__view_details', '/static/images/icons/colorful/view_details.png', null, null, null, '500', '1', '0', '1', null, to_date('18-01-2017 15:56:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821368537588025', '1', '501', 'icon_auto_colorful__vip', '/static/images/icons/colorful/vip.png', null, null, null, '501', '1', '0', '1', null, to_date('18-01-2017 15:56:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821368940241210', '1', '502', 'icon_auto_colorful__voicemail', '/static/images/icons/colorful/voicemail.png', null, null, null, '502', '1', '0', '1', null, to_date('18-01-2017 15:56:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821369301999931', '1', '503', 'icon_auto_colorful__voice_presentation', '/static/images/icons/colorful/voice_presentation.png', null, null, null, '503', '1', '0', '1', null, to_date('18-01-2017 15:56:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1056821369699410236', '1', '504', 'icon_auto_colorful__webcam', '/static/images/icons/colorful/webcam.png', null, null, null, '504', '1', '0', '1', null, to_date('18-01-2017 15:56:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:56:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1063139897532472765', '1', '505', 'icon_auto_colorful__bumen', '/static/images/icons/colorful/bumen.png', null, null, null, '505', '1', '0', '1', null, to_date('29-03-2017 09:46:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 09:46:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1063139983793577407', '1', '506', 'icon_auto_colorful__fill', '/static/images/icons/colorful/fill.png', null, null, null, '506', '1', '0', '1', null, to_date('29-03-2017 09:47:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 09:47:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1063140037415656897', '1', '507', 'icon_auto_colorful__gangwei', '/static/images/icons/colorful/gangwei.png', null, null, null, '507', '1', '0', '1', null, to_date('29-03-2017 09:48:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 09:48:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064880437790709156', '1', '508', 'icon_auto_colorful__editor', '/static/images/icons/colorful/editor.png', null, null, null, '508', '1', '0', '1', null, to_date('17-04-2017 14:51:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 14:51:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064881024030676390', '1', '509', 'icon_auto_colorful__changePassword', '/static/images/icons/colorful/changePassword.png', null, null, null, '509', '1', '0', '1', null, to_date('17-04-2017 15:01:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 15:01:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064882125993874856', '1', '510', 'icon_auto_colorful__close_all', '/static/images/icons/colorful/close_all.png', null, null, null, '510', '1', '0', '1', null, to_date('17-04-2017 15:18:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 15:18:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064882187001075115', '1', '511', 'icon_auto_colorful__close', '/static/images/icons/colorful/close.png', null, null, null, '511', '1', '0', '1', null, to_date('17-04-2017 15:19:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 15:19:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064891738157564746', '1', '512', 'icon_auto_colorful__Administration', '/static/images/icons/colorful/Administration.png', null, null, null, '512', '1', '0', '1', null, to_date('17-04-2017 17:51:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 17:51:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064891792756917068', '1', '513', 'icon_auto_colorful__check', '/static/images/icons/colorful/check.png', null, null, null, '513', '1', '0', '1', null, to_date('17-04-2017 17:52:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 17:52:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064892222319706958', '1', '514', 'icon_auto_colorful__download1', '/static/images/icons/colorful/download1.png', null, null, null, '514', '1', '0', '1', null, to_date('17-04-2017 17:59:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 17:59:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064892278196224848', '1', '515', 'icon_auto_colorful__editmenu', '/static/images/icons/colorful/editmenu.png', null, null, null, '515', '1', '0', '1', null, to_date('17-04-2017 17:59:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 17:59:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064892399346598738', '1', '516', 'icon_auto_colorful__upload1', '/static/images/icons/colorful/upload1.png', null, null, null, '516', '1', '0', '1', null, to_date('17-04-2017 18:01:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 18:01:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ICON (ICON_ID_, ICON_TYPE_, SKIN_CODE_, ICON_CSS_, IMAGE_PATH_, IMAGE_PATH_2_, IMAGE_PATH_3_, TIP_, SORT_NO_, IS_VISIBLE, IS_DELETE_, IS_FINAL_, DESCR_, UPD_TIME_, CRT_TIME_, UPD_USER_ID_, CRT_USER_ID_)
values ('1064898141630806100', '1', '517', 'icon_auto_colorful__post', '/static/images/icons/colorful/post.png', null, null, null, '517', '1', '0', '1', null, to_date('17-04-2017 19:33:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2017 19:33:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_META_CONSTRAINT_DEF...
set feedback off
set define off
insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067051767457441934', '1', '1066769867392128276', 'uk_sysDictGroupCode', '系统字典编码', '3', null, '系统字典编码已存在！', null, '0', '0', to_date('11-05-2017 06:04:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-05-2017 02:07:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067602907763295913', '1', '1066769867392128276', 'uk_sysDictGroupCode', '系统字典编码', '3', null, '系统字典编码已存在！', null, '1', '0', to_date('17-05-2017 08:04:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2017 08:04:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067602985768961708', '1', '1067403191985956964', 'uk_sysMetaConstraintDefCode', '约束定义编码', '3', null, '约束定义编码已存在！', null, '0', '0', to_date('17-05-2017 08:05:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2017 08:05:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067608054799542495', '1', '1066769867392128276', 'uk_sysDictGroupCode', '系统字典编码', '3', null, '约束定义编码已存在！', null, '1', '0', to_date('17-05-2017 09:26:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2017 09:26:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688792153528430', '1', '1067688715183855724', 'uk_sysUserProfile', '用户设置', '3', null, '用户设置不允许重复！', null, '0', '0', to_date('18-05-2017 06:49:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067690393967804575', '1', '1067690041355813017', 'uk_sysConstraintDetailField', '约束字段', '3', null, '约束字段不能重复！', null, '0', '0', to_date('18-05-2017 07:14:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 07:14:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067760194832921250', '1', '1067759988064219804', 'uk_sysMetadataEntityCode', '元数据实体编码', '3', null, '元数据实体编码不能重复！', null, '0', '0', to_date('19-05-2017 01:44:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 01:44:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067760274859192998', '1', '1067759988064219804', 'uk_sysMetadataEntityTableName', '元数据实体表名', '3', null, '元数据实体表名不能重复！', null, '0', '0', to_date('19-05-2017 01:45:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 01:45:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768083467940710', '1', '1067767917818098528', 'uk_sysRoleAuth', '角色权限', '3', null, '角色权限组合不能重复！', null, '0', '0', to_date('19-05-2017 03:49:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:49:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768591641424754', '1', '1067768429968831340', 'uk_sysMetadataField', '元数据字段', '3', null, '元数据字段不能重复！', null, '0', '0', to_date('19-05-2017 03:57:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:57:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782219608070450', '1', '1067782107168217390', 'uk_sysAccountLoginName', '账号登录名', '3', null, '账号登录名不能重复！', null, '0', '0', to_date('19-05-2017 07:34:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:34:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782679369849146', '1', '1067782594549487926', 'uk_sysAttachment', '系统附件编码', '3', null, '系统附件编码不能重复！', null, '0', '0', to_date('19-05-2017 07:41:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:41:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783492708309314', '1', '1067783427275069758', 'uk_sysAuthCode', '系统权限编码', '3', null, '系统权限编码不能重复！', null, '0', '0', to_date('19-05-2017 07:54:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:54:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783919830014284', '1', '1067783715108133190', 'uk_sysAuthJoin', '系统权限关联组合', '3', null, '系统权限关联组合不能重复！', null, '0', '0', to_date('19-05-2017 08:01:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:01:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067784749990779224', '1', '1067784637587626322', 'uk_sysConfig', '系统设置Key', '3', null, '系统设置Key不能重复！', null, '0', '0', to_date('19-05-2017 08:14:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:14:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785310586771810', '1', '1067785233634924894', 'uk_sysDauth', '数据权限编码', '3', null, '数据权限编码不能重复！', null, '0', '0', to_date('19-05-2017 08:23:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:23:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786014590212460', '1', '1067785850500651366', 'uk_sysDauthFilterJoin', '数据权限过滤器关联', '3', null, '数据权限过滤器关联不能重复！', null, '0', '0', to_date('19-05-2017 08:34:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:34:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786481557805430', '1', '1067786390398802290', 'uk_sysDauthFilterType', '数据权限过滤类型', '3', null, '数据权限过滤类型编码不能重复！', null, '0', '0', to_date('19-05-2017 08:42:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:42:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786900685166974', '1', '1067786796778625402', 'uk_sysDauthOperator', '数据权限运算符编码', '3', null, '数据权限运算符编码不能重复！', null, '0', '0', to_date('19-05-2017 08:48:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:48:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787485679425930', '1', '1067787278903384450', 'uk_sysDauthOperatorSupport', '权限权限运算符支持', '3', null, '数据权限运算符组合不能重复！', null, '0', '0', to_date('19-05-2017 08:58:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:58:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787913181763990', '1', '1067787811732035986', 'uk_sysDauthMethod', '数据权限应用方法名', '3', null, '数据权限应用方法名不能重复！', null, '0', '0', to_date('19-05-2017 09:04:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:04:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067788542363015582', '1', '1067788465944893850', 'uk_sysDauthVariable', '数据权限变量编码', '3', null, '数据权限变量编码不能重复！', null, '0', '0', to_date('19-05-2017 09:14:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:14:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789203999791528', '1', '1067789032995920290', 'uk_sysExtendField', '系统扩展字段', '3', null, '系统扩展字段值不能重复！', null, '0', '0', to_date('19-05-2017 09:25:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:25:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789630634957236', '1', '1067789500016990638', 'uk_sysExtendFieldDef', '系统扩展字段定义', '3', null, '系统扩展字段定义不能重复！', null, '0', '0', to_date('19-05-2017 09:32:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:32:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789939451075006', '1', '1067789866165049786', 'uk_sysGroupCode', '小组编码', '3', null, '小组编码不能重复！', null, '0', '0', to_date('19-05-2017 09:37:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:37:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792217071393225', '1', '1067792117253249475', 'uk_sysGroupUser', '小组用户', '3', null, '小组用户不能重复！', null, '0', '0', to_date('19-05-2017 10:13:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:13:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792457281280467', '1', '1067792369514420687', 'uk_SysIcon', '系统图标路径', '3', null, '系统图标图片路径不能重复！', null, '0', '0', to_date('19-05-2017 10:17:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:17:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792670170520027', '1', '1067792612071021015', 'uk_sysJobCode', '职务编码', '3', null, '职务编码不能重复！', null, '0', '0', to_date('19-05-2017 10:20:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:20:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793160265505251', '1', '1067793083969018335', 'uk_sysOperationCode', '操作类型编码', '3', null, '操作类型编码不能重复！', null, '0', '0', to_date('19-05-2017 10:28:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:28:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793395101440491', '1', '1067793323016034791', 'uk_sysOrgCode', '部门编码', '3', null, '部门编码不能重复！', null, '0', '0', to_date('19-05-2017 10:31:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:31:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793649774336499', '1', '1067793546809416175', 'uk_sysPositionCode', '岗位编码', '3', null, '岗位编码不能重复！', null, '0', '0', to_date('19-05-2017 10:36:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:36:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793854851684859', '1', '1067793797082487287', 'uk_sysRoleCode', '角色编码', '3', null, '角色编码不能重复！', null, '0', '0', to_date('19-05-2017 10:39:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:39:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795139563854339', '1', '1067795029384731135', 'uk_sysStaffCode', '员工号', '3', null, '员工号不能重复！', null, '0', '0', to_date('19-05-2017 10:59:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:59:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795361596676619', '1', '1067795300434287111', 'uk_sysTokenSign', '令牌签名', '3', null, '令牌签名不能重复！', null, '0', '0', to_date('19-05-2017 11:03:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:03:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796151580203541', '1', '1067796056679881231', 'uk_sysUserPosition', '用户岗位', '3', null, '用户岗位不能重复！', null, '0', '0', to_date('19-05-2017 11:15:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:15:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DEF (DEF_ID_, TENANT_ID_, ENTITY_ID_, DEF_CODE_, DEF_NAME_, DEF_TYPE_, REF_ID_, ERROR_MSG_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796461723818529', '1', '1067796327340415515', 'uk_sysUserRole', '用户角色', '3', null, '用户角色不能重复！', null, '0', '0', to_date('19-05-2017 11:20:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:20:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_META_CONSTRAINT_DETAIL...
set feedback off
set define off
insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067163513371335990', '1', '1067051767457441934', '1066770029490443542', null, null, '1', '0', to_date('12-05-2017 11:40:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 11:40:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067594942169327466', '1', '1067051767457441934', '1066770029490443542', null, null, '0', '0', to_date('17-05-2017 05:57:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2017 05:57:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067603786637756078', '1', '1067602985768961708', '1067403246977476710', null, null, '0', '0', to_date('17-05-2017 08:18:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-05-2017 08:18:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688953047029880', '1', '1067688792153528430', '1067688854670678128', null, null, '0', '0', to_date('18-05-2017 06:51:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:51:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688963621918842', '1', '1067688792153528430', '1067688895726622834', null, null, '0', '0', to_date('18-05-2017 06:52:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:52:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688971061565564', '1', '1067688792153528430', '1067688942988040310', null, null, '0', '0', to_date('18-05-2017 06:52:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:52:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067691223736379974', '1', '1067690393967804575', '1067690284835160219', null, null, '0', '0', to_date('18-05-2017 07:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 07:27:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067691626523064452', '1', '1067690393967804575', '1067690320226697373', null, null, '0', '0', to_date('18-05-2017 07:34:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 07:34:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067760202659492516', '1', '1067760194832921250', '1067760050317128350', null, null, '0', '0', to_date('19-05-2017 01:44:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 01:44:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067760282589295272', '1', '1067760274859192998', '1067760085580739232', null, null, '0', '0', to_date('19-05-2017 01:45:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 01:45:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768098800218984', '1', '1067768083467940710', '1067767999136215908', null, null, '0', '0', to_date('19-05-2017 03:49:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:49:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768106282857322', '1', '1067768083467940710', '1067767966694323042', null, null, '0', '0', to_date('19-05-2017 03:49:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:49:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768608760476532', '1', '1067768591641424754', '1067768530556629872', null, null, '0', '0', to_date('19-05-2017 03:57:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:57:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768616032351094', '1', '1067768591641424754', '1067768477768168302', null, null, '0', '0', to_date('19-05-2017 03:58:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:58:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782230409451828', '1', '1067782219608070450', '1067782147843529008', null, null, '0', '0', to_date('19-05-2017 07:34:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:34:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782685728414012', '1', '1067782679369849146', '1067782639571147064', null, null, '0', '0', to_date('19-05-2017 07:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:41:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783498621229380', '1', '1067783492708309314', '1067783456243030336', null, null, '0', '0', to_date('19-05-2017 07:54:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:54:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783928023587150', '1', '1067783919830014284', '1067783856847296842', null, null, '0', '0', to_date('19-05-2017 08:01:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:01:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783932604815696', '1', '1067783919830014284', '1067783807616653640', null, null, '0', '0', to_date('19-05-2017 08:01:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:01:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067784757342345562', '1', '1067784749990779224', '1067784707739457878', null, null, '0', '0', to_date('19-05-2017 08:14:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:14:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067784761528260956', '1', '1067784749990779224', '1067784677515303252', null, null, '0', '0', to_date('19-05-2017 08:14:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:14:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785317269346660', '1', '1067785310586771810', '1067785268867078496', null, null, '0', '0', to_date('19-05-2017 08:23:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:23:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786027831630190', '1', '1067786014590212460', '1067785915305793896', null, null, '0', '0', to_date('19-05-2017 08:34:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:34:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786031590775152', '1', '1067786014590212460', '1067785954462767466', null, null, '0', '0', to_date('19-05-2017 08:34:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:34:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786488121891192', '1', '1067786481557805430', '1067786426486593908', null, null, '0', '0', to_date('19-05-2017 08:42:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:42:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786907575359872', '1', '1067786900685166974', '1067786829416601980', null, null, '0', '0', to_date('19-05-2017 08:48:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:48:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787493584640396', '1', '1067787485679425930', '1067787416108505480', null, null, '0', '0', to_date('19-05-2017 08:58:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:58:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787497588103566', '1', '1067787485679425930', '1067787378329360774', null, null, '0', '0', to_date('19-05-2017 08:58:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:58:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787502440913296', '1', '1067787485679425930', '1067787323379784068', null, null, '0', '0', to_date('19-05-2017 08:58:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:58:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787919247776152', '1', '1067787913181763990', '1067787850899495316', null, null, '0', '0', to_date('19-05-2017 09:04:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:04:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067788551266474400', '1', '1067788542363015582', '1067788502286440860', null, null, '0', '0', to_date('19-05-2017 09:14:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:14:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789211259083178', '1', '1067789203999791528', '1067789071282575780', null, null, '0', '0', to_date('19-05-2017 09:25:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:25:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789214877718956', '1', '1067789203999791528', '1067789130161166758', null, null, '0', '0', to_date('19-05-2017 09:25:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:25:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789638062021046', '1', '1067789630634957236', '1067789545883802032', null, null, '0', '0', to_date('19-05-2017 09:32:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:32:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789643235695032', '1', '1067789630634957236', '1067789575791286706', null, null, '0', '0', to_date('19-05-2017 09:32:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:32:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789946602363328', '1', '1067789939451075006', '1067789897646447036', null, null, '0', '0', to_date('19-05-2017 09:37:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:37:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792224065395147', '1', '1067792217071393225', '1067792155081677253', null, null, '0', '0', to_date('19-05-2017 10:13:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:13:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792228773501389', '1', '1067792217071393225', '1067792183642790343', null, null, '0', '0', to_date('19-05-2017 10:13:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:13:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792463610485205', '1', '1067792457281280467', '1067792401360722385', null, null, '0', '0', to_date('19-05-2017 10:17:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:17:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792676767111645', '1', '1067792670170520027', '1067792633315170777', null, null, '0', '0', to_date('19-05-2017 10:20:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:20:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793166712150501', '1', '1067793160265505251', '1067793124635941345', null, null, '0', '0', to_date('19-05-2017 10:28:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:28:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793400998631917', '1', '1067793395101440491', '1067793360660961769', null, null, '0', '0', to_date('19-05-2017 10:32:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:32:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793655802599925', '1', '1067793649774336499', '1067793597609777649', null, null, '0', '0', to_date('19-05-2017 10:36:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:36:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793861186132477', '1', '1067793854851684859', '1067793823338830329', null, null, '0', '0', to_date('19-05-2017 10:39:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:39:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795145758841349', '1', '1067795139563854339', '1067795095032928769', null, null, '0', '0', to_date('19-05-2017 10:59:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:59:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795369505036813', '1', '1067795361596676619', '1067795328310680073', null, null, '0', '0', to_date('19-05-2017 11:03:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:03:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796158715763223', '1', '1067796151580203541', '1067796119413037587', null, null, '0', '0', to_date('19-05-2017 11:15:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:15:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796165980297753', '1', '1067796151580203541', '1067796086259161617', null, null, '0', '0', to_date('19-05-2017 11:15:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:15:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796470206798371', '1', '1067796461723818529', '1067796383118367261', null, null, '0', '0', to_date('19-05-2017 11:20:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:20:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_META_CONSTRAINT_DETAIL (DETAIL_ID_, TENANT_ID_, DEF_ID_, FIELD_ID_, REF_DETAIL_ID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796474889738789', '1', '1067796461723818529', '1067796412965034527', null, null, '0', '0', to_date('19-05-2017 11:20:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:20:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_METADATA_ENTITY...
set feedback off
set define off
insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066769867392128276', '1', 'sys_dict_group', '系统字典组表', 'dict_group', null, 'sys_dict_group', 'sdg', '系统字典组表', '0', '0', to_date('08-05-2017 03:23:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067403191985956964', '1', 'sys_meta_cnstraint_def', '约束定义表', 'meta_constraint_def', null, 'sys_meta_constraint_def', 'smcd', '约束定义表', '0', '0', to_date('15-05-2017 03:09:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688715183855724', '1', 'sys_user_profile', '用户设置表', 'user_profile', null, 'sys_user_profile', 'sup', '用户设置表', '0', '0', to_date('18-05-2017 06:48:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067690041355813017', '1', 'sys_meta_constraint_detail', '约束字段表', 'constraint_field', null, 'sys_meta_constraint_detail', 'smcd', '约束字段表', '0', '0', to_date('18-05-2017 07:09:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067759988064219804', '1', 'sys_metadata_entity', '元数据实体表', 'metadata_entity', null, 'sys_metadata_entity', 'sme', '元数据实体', '0', '0', to_date('19-05-2017 01:40:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067767917818098528', '1', 'sys_role_auth', '角色权限表', 'role_auth', null, 'sys_role_auth', 'sra', '角色权限表', '0', '0', to_date('19-05-2017 03:47:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768429968831340', '1', 'sys_metadata_field', '元数据字段表', 'metadata_field', null, 'sys_metadata_field', 'smf', '元数据字段表', '0', '0', to_date('19-05-2017 03:55:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782107168217390', '1', 'sys_account', '系统用户表', 'account', null, 'sys_account', 'sa', '系统用户表', '0', '0', to_date('19-05-2017 07:32:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782594549487926', '1', 'sys_attachment', '系统附件表', 'attachment', null, 'sys_attachment', 'sa', '系统附件表', '0', '0', to_date('19-05-2017 07:40:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783427275069758', '1', 'sys_auth', '系统权限表', 'auth', null, 'sys_auth', 'sa', '系统权限表', '0', '0', to_date('19-05-2017 07:53:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783715108133190', '1', 'sys_auth_join', '系统权限关联表', 'auth_join', null, 'sys_auth_join', 'saj', '系统权限关联表', '0', '0', to_date('19-05-2017 07:58:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067784637587626322', '1', 'sys_config', '系统设置表', 'config', null, 'sys_config', 'sc', '系统设置表', '0', '0', to_date('19-05-2017 08:12:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785233634924894', '1', 'sys_dauth', '数据权限表', 'dauth', null, 'sys_dauth', 'sd', '数据权限表', '0', '0', to_date('19-05-2017 08:22:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785850500651366', '1', 'sys_dauth_filter_join', '数据权限过滤器关联表', 'dauth_filter_join', null, 'sys_dauth_filter_join', 'sdfj', '数据权限过滤器关联表', '0', '0', to_date('19-05-2017 08:32:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786390398802290', '1', 'sys_dauth_filter_type', '数据权限过滤类型表', 'dauth_filter_type', null, 'sys_dauth_filter_type', 'sdft', '数据权限过滤类型表', '0', '0', to_date('19-05-2017 08:40:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786796778625402', '1', 'sys_dauth_operator', '数据权限运算符表', 'dauth_operator', null, 'sys_dauth_operator', 'sdo', '数据权限运算符表', '0', '0', to_date('19-05-2017 08:47:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787278903384450', '1', 'sys_dauth_operator_support', '数据权限运算符支持表', 'dauth_operator_support', null, 'sys_dauth_operator_support', 'sdos', '数据权限运算符支持表', '0', '0', to_date('19-05-2017 08:54:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787811732035986', '1', 'sys_dauth_usage', '数据权限应用表', 'dauth_usage', null, 'sys_dauth_usage', 'sdu', '数据权限应用表', '0', '0', to_date('19-05-2017 09:03:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067788465944893850', '1', 'sys_dauth_variable', '数据权限变量表', 'auth_variable', null, 'sys_dauth_variable', 'sdv', '数据权限变量表', '0', '0', to_date('19-05-2017 09:13:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789032995920290', '1', 'sys_extend_field', '扩展字段表', 'extend_field', null, 'sys_extend_field', 'sef', '扩展字段表', '0', '0', to_date('19-05-2017 09:22:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789500016990638', '1', 'sys_extend_field_def', '扩展字段定义表', 'extend_field_def', null, 'sys_extend_field_def', 'sefd', '扩展字段定义表', '0', '0', to_date('19-05-2017 09:30:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789866165049786', '1', 'sys_group', '小组表', 'group', null, 'sys_group', 'sg', '小组表', '0', '0', to_date('19-05-2017 09:35:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792117253249475', '1', 'sys_group_user', '小组用户表', 'group_user', null, 'sys_group_user', 'sgu', '小组用户表', '0', '0', to_date('19-05-2017 10:11:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792369514420687', '1', 'sys_icon', '系统图标表', 'icon', null, 'sys_icon', 'si', '系统图标表', '0', '0', to_date('19-05-2017 10:15:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792612071021015', '1', 'sys_job', '职务表', 'job', null, 'sys_job', 'sj', '职务表', '0', '0', to_date('19-05-2017 10:19:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793083969018335', '1', 'sys_operation', '系统操作类型表', 'operation', null, 'sys_operation', 'so', '系统操作类型表', '0', '0', to_date('19-05-2017 10:27:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793323016034791', '1', 'sys_organization', '组织架构表', 'organization', null, 'sys_organization', 'so', '组织架构表', '0', '0', to_date('19-05-2017 10:30:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793546809416175', '1', 'sys_position', '岗位表', 'position', null, 'sys_position', 'sp', '岗位表', '0', '0', to_date('19-05-2017 10:34:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793797082487287', '1', 'sys_role', '系统角色表', 'role', null, 'sys_role', 'sr', '系统角色表', '0', '0', to_date('19-05-2017 10:38:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795029384731135', '1', 'sys_staff_info', '员工信息表', 'stafffInfo', null, 'sys_staff_info', 'ssi', '员工信息表', '0', '0', to_date('19-05-2017 10:57:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795300434287111', '1', 'sys_token', '系统密钥表', 'token', null, 'sys_token', 'st', '系统密钥表', '0', '0', to_date('19-05-2017 11:02:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796056679881231', '1', 'sys_user_position', '用户岗位表', 'user_position', null, 'sys_user_position', 'sup', '用户岗位表', '0', '0', to_date('19-05-2017 11:14:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_ENTITY (ENTITY_ID_, TENANT_ID_, ENTITY_CODE_, ENTITY_NAME_, ENG_NAME_, I18N_CODE_, TABLE_NAME_, TABLE_ALIAS_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796327340415515', '1', 'sys_user_role', '用户角色表', 'user_role', null, 'sys_user_role', 'sur', '用户角色表', '0', '0', to_date('19-05-2017 11:18:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2017 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_METADATA_FIELD...
set feedback off
set define off
insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1066770029490443542', '1', '1066769867392128276', '1054555696913873885', 'dictGroupCode', '字典编码', 'dictGroupCode', null, 'DICT_GROUP_CODE_', '字典编码', '0', '0', to_date('08-05-2017 03:25:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2017 03:25:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067403246977476710', '1', '1067403191985956964', '1054555696913873885', 'def_code', '约束编码', 'defCode', null, 'DEF_CODE_', '约束编码', '0', '0', to_date('15-05-2017 03:10:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-05-2017 03:10:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688854670678128', '1', '1067688715183855724', '1054555673109101532', 'user_id', '用户编号', 'userId', null, 'USER_ID_', null, '0', '0', to_date('18-05-2017 06:50:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:51:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688895726622834', '1', '1067688715183855724', '1054555696913873885', 'profile_key', '设置key', 'profileKey', null, 'PROFILE_KEY_', null, '0', '0', to_date('18-05-2017 06:50:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:51:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067688942988040310', '1', '1067688715183855724', '1054555673109101532', 'version', '版本号', 'version', null, 'VERSION_', null, '0', '0', to_date('18-05-2017 06:51:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 06:51:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067690284835160219', '1', '1067690041355813017', '1054555673109101532', 'field_id', '字段编号', 'fieldId', null, 'FIELD_ID_', null, '0', '0', to_date('18-05-2017 07:13:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 07:13:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067690320226697373', '1', '1067690041355813017', '1054555673109101532', 'def_id', '定义编号', 'defId', null, 'DEF_ID_', null, '0', '0', to_date('18-05-2017 07:13:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-05-2017 07:13:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067760050317128350', '1', '1067759988064219804', '1054555696913873885', 'entity_code', '实体编码', 'entityCode', null, 'ENTITY_CODE_', '实体编码', '0', '0', to_date('19-05-2017 01:41:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 01:41:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067760085580739232', '1', '1067759988064219804', '1054555696913873885', 'table_name', '表名', 'tableName', null, 'TABLE_NAME_', '表名', '0', '0', to_date('19-05-2017 01:42:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 01:42:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067767966694323042', '1', '1067767917818098528', '1054555673109101532', 'role_id', '角色编号', 'roleId', null, 'ROLE_ID_', '角色编号', '0', '0', to_date('19-05-2017 03:47:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:47:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067767999136215908', '1', '1067767917818098528', '1054555673109101532', 'auth_id', '权限编号', 'authId', null, 'AUTH_ID_', '权限编号', '0', '0', to_date('19-05-2017 03:48:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:48:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768477768168302', '1', '1067768429968831340', '1054555673109101532', 'entity_id', '实体编号', 'entityId', null, 'ENTITY_ID_', '实体编号', '0', '0', to_date('19-05-2017 03:55:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:55:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067768530556629872', '1', '1067768429968831340', '1054555696913873885', 'column_name', '列名', 'columnName', null, 'COLUMN_NAME_', '列名', '0', '0', to_date('19-05-2017 03:56:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 03:56:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782147843529008', '1', '1067782107168217390', '1054555696913873885', 'login_name', '登录名', 'loginName', null, 'LOGIN_NAME_', '登录名', '0', '0', to_date('19-05-2017 07:33:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:33:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067782639571147064', '1', '1067782594549487926', '1054555696913873885', 'att_code', '附件编码', 'attCode', null, 'ATT_CODE_', '附件编码', '0', '0', to_date('19-05-2017 07:40:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:40:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783456243030336', '1', '1067783427275069758', '1054555696913873885', 'auth_code', '权限编码', 'authCode', null, 'AUTH_CODE_', '权限编码', '0', '0', to_date('19-05-2017 07:53:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:53:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783807616653640', '1', '1067783715108133190', '1054555673109101532', 'main_auth_id', '主权限编号', 'mainAuthId', null, 'MAIN_AUTH_ID_', '主权限编号', '0', '0', to_date('19-05-2017 07:59:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 07:59:33', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067783856847296842', '1', '1067783715108133190', '1054555673109101532', 'attach_auth_id', '附属权限编号', 'attachAuthId', null, 'ATTACH_AUTH_ID_', '附属权限编号', '0', '0', to_date('19-05-2017 08:00:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:00:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067784677515303252', '1', '1067784637587626322', '1054555696913873885', 'config_key', '设置Key', 'configKey', null, 'CONFIG_KEY_', '设置Key', '0', '0', to_date('19-05-2017 08:13:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:13:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067784707739457878', '1', '1067784637587626322', '1054555673109101532', 'version', '版本号', 'version', null, 'VERSION_', '版本号', '0', '0', to_date('19-05-2017 08:13:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:13:52', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785268867078496', '1', '1067785233634924894', '1054555696913873885', 'dauth_code', '数据权限编码', 'dauthCode', null, 'DAUTH_CODE_', '数据权限编码', '0', '0', to_date('19-05-2017 08:22:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785915305793896', '1', '1067785850500651366', '1054555673109101532', 'filter_group_id', '过滤器组编号', 'filterGroupId', null, 'FILTER_GROUP_ID_', '过滤器组编号', '0', '0', to_date('19-05-2017 08:33:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:33:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067785954462767466', '1', '1067785850500651366', '1054555673109101532', 'filter_item_id', '过滤器项ID', 'filterItemId', null, 'FILTER_ITEM_ID_', '过滤器项ID', '0', '0', to_date('19-05-2017 08:33:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:33:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786426486593908', '1', '1067786390398802290', '1054555696913873885', 'filter_type', '过滤类型编码', 'filterType', null, 'FILTER_TYPE_CODE_', '过滤类型编码', '0', '0', to_date('19-05-2017 08:41:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:41:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067786829416601980', '1', '1067786796778625402', '1054555696913873885', 'operator_code', '运算符编码', 'operatorCode', null, 'OPERATOR_CODE_', '运算符编码', '0', '0', to_date('19-05-2017 08:47:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:47:35', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787323379784068', '1', '1067787278903384450', '1054555673109101532', 'filter_type_id', '过滤类型ID', 'filterTypeId', null, 'FILTER_TYPE_ID_', '过滤类型ID', '0', '0', to_date('19-05-2017 08:55:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:55:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787378329360774', '1', '1067787278903384450', '1054555673109101532', 'operator_id', '条件ID', 'operatorId', null, 'OPERATOR_ID_', '条件ID', '0', '0', to_date('19-05-2017 08:56:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:56:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787416108505480', '1', '1067787278903384450', '1054555673109101532', 'value_type', '值类型', 'valueType', null, 'VALUE_TYPE_', '值类型', '0', '0', to_date('19-05-2017 08:56:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 08:56:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067787850899495316', '1', '1067787811732035986', '1054555696913873885', 'method_name', '方法名', 'methodName', null, 'METHOD_NAME_', '方法名', '0', '0', to_date('19-05-2017 09:03:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:03:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067788502286440860', '1', '1067788465944893850', '1054555696913873885', 'variable_code', '变量编码', 'variableCode', null, 'VARIABLE_CODE_', '变量编码', '0', '0', to_date('19-05-2017 09:14:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:14:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789071282575780', '1', '1067789032995920290', '1054555673109101532', 'extend_def_id', '扩展字段定义编号', 'extendDefId', null, 'EXTEND_DEF_ID_', '扩展字段定义编号', '0', '0', to_date('19-05-2017 09:23:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:23:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789130161166758', '1', '1067789032995920290', '1054555673109101532', 'biz_id', '被扩展表编号', 'bizId', null, 'BIZ_ID_', '被扩展表编号', '0', '0', to_date('19-05-2017 09:24:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:24:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789545883802032', '1', '1067789500016990638', '1054555696913873885', 'table_code', '扩展表编码', 'tableCode', null, 'TABLE_CODE_', '扩展表编码', '0', '0', to_date('19-05-2017 09:30:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:30:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789575791286706', '1', '1067789500016990638', '1054555696913873885', 'field_code', '扩展字段编码', 'fieldCode', null, 'FIELD_CODE_', '扩展字段编码', '0', '0', to_date('19-05-2017 09:31:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:31:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067789897646447036', '1', '1067789866165049786', '1054555696913873885', 'group_code', '小组编码', 'groupCode', null, 'GROUP_CODE_', '小组编码', '0', '0', to_date('19-05-2017 09:36:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 09:36:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792155081677253', '1', '1067792117253249475', '1054555673109101532', 'group_id', '小组ID', 'groupId', null, 'GROUP_ID_', '小组ID', '0', '0', to_date('19-05-2017 10:12:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:12:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792183642790343', '1', '1067792117253249475', '1054555673109101532', 'user_id', '用户ID', 'userId', null, 'USER_ID_', '用户ID', '0', '0', to_date('19-05-2017 10:12:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:12:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792401360722385', '1', '1067792369514420687', '1054555696913873885', 'image_path', '图片路径', 'imagePath', null, 'IMAGE_PATH_', '图片路径', '0', '0', to_date('19-05-2017 10:16:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:16:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067792633315170777', '1', '1067792612071021015', '1054555696913873885', 'job_code', '职务编码', 'jobCode', null, 'JOB_CODE_', '职务编码', '0', '0', to_date('19-05-2017 10:19:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:19:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793124635941345', '1', '1067793083969018335', '1054555696913873885', 'operation_code', '操作类型编码', 'operationCode', null, 'OPERATION_CODE_', '操作类型编码', '0', '0', to_date('19-05-2017 10:27:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:27:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793360660961769', '1', '1067793323016034791', '1054555696913873885', 'org_code', '部门编码', 'orgCode', null, 'ORG_CODE_', '部门编码', '0', '0', to_date('19-05-2017 10:31:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:31:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793597609777649', '1', '1067793546809416175', '1054555696913873885', 'position_code', '岗位编码', 'positionCode', null, 'POSITION_CODE_', '岗位编码', '0', '0', to_date('19-05-2017 10:35:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:35:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067793823338830329', '1', '1067793797082487287', '1054555696913873885', 'role_code', '角色编码', 'roleCode', null, 'ROLE_CODE_', '角色编码', '0', '0', to_date('19-05-2017 10:38:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:38:45', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795095032928769', '1', '1067795029384731135', '1054555696913873885', 'staff_code', '员工号', 'staffCode', null, 'STAFF_CODE_', '员工号', '0', '0', to_date('19-05-2017 10:58:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 10:58:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067795328310680073', '1', '1067795300434287111', '1054555696913873885', 'token_sign', '令牌签名', 'tokenSign', null, 'TOKEN_SIGN_', '令牌签名', '0', '0', to_date('19-05-2017 11:02:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:02:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796086259161617', '1', '1067796056679881231', '1054555673109101532', 'user_id', '用户ID', 'userId', null, 'USER_ID_', '用户ID', '0', '0', to_date('19-05-2017 11:14:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:14:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796119413037587', '1', '1067796056679881231', '1054555673109101532', 'position_id', '岗位ID', 'positionId', null, 'POSITION_ID_', '岗位ID', '0', '0', to_date('19-05-2017 11:15:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:15:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796383118367261', '1', '1067796327340415515', '1054555673109101532', 'role_id', '角色ID', 'roleId', null, 'ROLE_ID_', '角色ID', '0', '0', to_date('19-05-2017 11:19:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:19:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_METADATA_FIELD (FIELD_ID_, TENANT_ID_, ENTITY_ID_, FILTER_TYPE_ID_, FIELD_CODE_, FIELD_NAME_, ENG_NAME_, I18N_CODE_, COLUMN_NAME_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1067796412965034527', '1', '1067796327340415515', '1054555673109101532', 'user_id', '用户ID', 'userId', null, 'USER_ID_', '用户ID', '0', '0', to_date('19-05-2017 11:19:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-05-2017 11:19:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_MODEL...
set feedback off
set define off
insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481646384715197', '1', 'sys', '系统', null, 'sys', null, 'icon_system_16', null, '0', '0', '0', '0', null, '1', '1', null, '0', null, '0', '1', to_date('01-12-2016 18:18:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481646384715198', '1', 'sysManagementMenu', '系统管理', null, 'sysManagementMenu', '1052481646384715197', 'icon_system_16', 'fa fa-medium', '1', '0', '1', '0', null, '6', '1', 'test_test', '0', 'test_test', '0', '0', to_date('01-12-2016 18:18:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-02-2017 16:00:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481646805194175', '1', 'sysAuthManagementMenu', '权限管理', null, 'sysAuthManagementMenu', '1052481646384715198', 'icon_auto_blue__supplier-features', 'fa fa-user-secret', '1', '0', '0', '1', null, '11', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:18:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481646805194176', '1', 'dauthManagementMenu', '数据权限', null, 'dauthManagementMenu', '1052481646384715198', 'icon_auto_blue__link', 'fa fa-cubes', '1', '0', '0', '1', null, '12', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:06:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481647455311297', '1', 'sysUser', '用户管理', null, 'sysUser', '1052481646805194175', 'icon_auto_blue__bussiness-card', 'fa fa-user', '0', '1', '0', '1', '/sys/sysUser/', '2', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:15:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481647455311298', '1', 'dauthOperatorSupport', '运算符支持', null, 'dauthOperatorSupport', '1052481646805194176', 'icon_auto_blue__Operator', 'fa fa-calculator', '0', '1', '0', '1', '/sys/dauthOperator/', '2', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 14:40:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481647455311299', '1', 'sysMetadata', '实体字段管理', null, 'sysMetadata', '1066770481759098136', 'icon_auto_blue__integral', 'fa fa-database', '0', '1', '0', '1', '/sys/sysMetadata/', '2', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 14:39:14', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481647455311300', '1', 'dauth', '数据权限', null, 'dauth', '1052481646805194176', 'icon_auto_blue__sysDauth', 'fa fa-cube', '0', '1', '0', '1', '/sys/dauth/', '5', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 14:51:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481647455311301', '1', 'dauthUsage', '数据权限应用', null, 'dauthUsage', '1052481646805194176', 'icon_auto_blue__all', 'fa fa-filter', '0', '1', '0', '1', '/sys/dauthUsage/', '6', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2017 11:47:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481648127448515', '1', 'sysRole', '角色管理', null, 'sysRole', '1052481646805194175', 'icon_auto_blue__electrical', 'fa fa-users', '0', '1', '0', '1', '/sys/sysRole/', '3', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:16:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481648470332868', '1', 'sysAuthMenu', '功能权限', null, 'sysAuthMenu', '1052481646805194175', 'icon_auto_blue__trade-assurance', 'fa fa-navicon', '0', '1', '0', '1', null, '4', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:42:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481648827897285', '1', 'sysModel', '模块配置', null, 'sysModel', '1052481648470332868', null, null, '0', '1', '0', '1', '/sys/sysModel/', '41', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481649176024518', '1', 'sysOperation', '操作类型配置', null, 'sysOperation', '1052481648470332868', null, null, '0', '0', '0', '0', null, '46', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 17:12:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481649506325959', '1', 'sysAuth', '权限管理', null, 'sysAuth', '1052481648470332868', null, null, '0', '1', '0', '1', null, '51', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:54:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481649938339272', '1', 'sysOrganizationMenu', '组织架构', null, 'sysOrganizationMenu', '1052481646805194175', 'icon_auto_blue__nav-list', 'fa fa-magnet', '0', '1', '0', '1', '/sys/org/view', '56', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 13:47:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481650369304009', '1', 'sysPosition', '职务配置', null, 'sysPosition', '1052481649938339272', null, null, '0', '0', '0', '0', '/sys/sysPosition/', '61', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481650765665738', '1', 'sysJob', '岗位配置', null, 'sysJob', '1052481649938339272', null, null, '0', '1', '0', '1', '/sys/sysJob/', '66', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481651160978891', '1', 'sysGroup', '小组管理', null, 'sysGroup', '1052481649938339272', null, null, '0', '1', '0', '1', '/sys/sysGroup/', '71', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481652225283534', '1', 'sysConfigurationMenu', '配置运维', null, 'sysConfigurationMenu', '1052481646384715198', 'icon_auto_blue__box', 'fa fa-cogs', '1', '0', '0', '1', null, '86', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2017 09:54:04', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481652225283555', '1', 'sysConfigMenu', '系统设置', null, 'sysConfigMenu', '1052481652225283534', 'icon_auto_blue__set', 'fa fa-cog', '1', '0', '0', '1', null, '87', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:51:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481652945655248', '1', 'sysConfig', '系统设置', null, 'sysConfig', '1052481652225283555', 'icon_auto_blue__config', 'fa fa-wrench', '0', '1', '0', '1', null, '96', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 18:15:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481653319996881', '1', 'sysDictMenu', '字典配置', null, 'sysDictMenu', '1052481652225283555', 'icon_auto_blue__dict', 'fa fa-table', '0', '1', '0', '1', null, '101', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 19:07:19', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481653695387090', '1', 'sysDictGroup', '字典组配置', null, 'sysDictGroup', '1052481653319996881', null, null, '0', '0', '0', '0', null, '106', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481654041417171', '1', 'sysDictItem', '字典项配置', null, 'sysDictItem', '1052481653319996881', null, null, '0', '0', '0', '0', null, '111', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481654405273044', '1', 'sysLogMenu', '日志管理', null, 'sysLogMenu', '1052481652225283534', 'icon_auto_blue__comments', 'fa fa-file-text', '1', '0', '0', '1', null, '116', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:47:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481654405273056', '1', 'sysLog', '系统日志', null, 'sysLog', '1052481654405273044', 'icon_auto_blue__log', 'fa fa-file-text-o', '0', '1', '0', '1', null, '117', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:13:29', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481654405273057', '1', 'sysUserLog', '用户日志', null, 'sysUserLog', '1052481654405273044', 'icon_auto_blue__userLog', 'fa fa-file-text-o', '0', '1', '0', '1', null, '118', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-03-2017 16:19:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481654739768666', '1', 'sysResourceMenu', '资源管理', null, 'sysResourceMenu', '1052481652225283534', 'icon_auto_blue__folder', 'fa fa-th-large', '1', '0', '0', '1', null, '120', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:48:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481654739768789', '1', 'sysAttachMenu', '附件管理', null, 'sysAttachMenu', '1052481654739768666', 'icon_auto_blue__attachment', 'fa fa-upload', '0', '1', '0', '1', null, '121', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:21:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481655604843993', '1', 'sysIcon', '图标管理', null, 'sysIcon', '1052481654739768666', 'icon_auto_blue__toys', 'fa fa-picture-o', '0', '1', '0', '1', null, '132', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 09:34:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481655704243258', '1', 'sysMonitorMenu', '系统监控', null, 'sysMonitorMenu', '1052481652225283534', 'icon_auto_blue__similar-product', 'fa fa-tachometer', '1', '0', '0', '1', null, '133', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:49:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481655704243260', '1', 'sysJVMMonitor', 'JVM信息', null, 'sysJVMMonitor', '1052481655704243258', 'icon_auto_blue__jvm', 'fa fa-connectdevelop', '0', '1', '0', '1', null, '134', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2017 11:17:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481655704243262', '1', 'sysServerMonitor', '服务器信息', null, 'sysServerMonitor', '1052481655704243258', 'icon_auto_blue__sysServerMonitor', 'fa fa-diamond', '0', '1', '0', '1', null, '135', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2017 11:16:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481655704243263', '1', 'sysSystemMonitor', '系统运行信息', null, 'sysSystemMonitor', '1052481655704243258', 'icon_auto_blue__sysRunMonitor', 'fa fa-sellsy', '0', '1', '0', '1', null, '136', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2017 11:15:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481655947728344', '1', 'sysReportMenu', '系统报表', null, 'sysReportMenu', '1052481646384715197', 'icon_report_16', 'fa fa-area-chart', '1', '0', '1', '0', null, '136', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481656350381529', '1', 'sysStatisticalReportMenu', '统计报表', null, 'sysStatisticalReportMenu', '1052481655947728344', 'icon_auto_blue__sysStatisticalReportMenu', 'fa fa-pie-chart', '1', '0', '0', '1', null, '141', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 16:02:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481656748840410', '1', 'sysEmployeeOrgReport', '员工分布', null, 'sysEmployeeOrgReport', '1052481656350381529', 'icon_auto_blue__sysEmployee', 'fa fa-bar-chart-o', '0', '1', '0', '1', null, '145', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-03-2017 11:55:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481656748840422', '1', 'sysEmployeeJobReport', '入职离职', null, 'sysEmployeeJobReport', '1052481656350381529', 'icon_auto_blue__sysEmployeeJobReport', 'fa fa-bar-chart', '0', '1', '0', '1', '/sys/sysEmployeeJobReport/', '146', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 15:39:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481656748840460', '1', 'sysAuditReportMenu', '审计报表', null, 'sysAuditReportMenu', '1052481655947728344', 'icon_auto_blue__sysAuditReportMenu', 'fa fa-line-chart', '1', '0', '0', '1', null, '143', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 16:04:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481657072850395', '1', 'sysPersonalCenterMenu', '个人中心', null, 'sysPersonalCenterMenu', '1052481646384715197', 'icon_center_16', 'fa fa-user', '1', '0', '1', '0', null, '151', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:25', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481657408394716', '1', 'sysPersonalMenu', '个人中心', null, 'sysPersonalMenu', '1052481657072850395', 'icon_auto_blue__account', 'fa fa-user', '1', '0', '0', '1', null, '156', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:41:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481657744987613', '1', 'sysPersonal', '我的信息', null, 'sysPersonal', '1052481657408394716', 'icon_auto_blue__sysPersonal', 'fa fa-info-circle', '0', '1', '0', '1', null, '161', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:02:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481658097309150', '1', 'sysModifyPwd', '修改密码', null, 'sysModifyPwd', '1052481657408394716', 'icon_auto_blue__sysModifyPwd', 'fa fa-lock', '0', '1', '0', '1', null, '166', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:05:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481658449630687', '1', 'sysPersonalSetting', '个性化设置', null, 'sysPersonalSetting', '1052481657408394716', 'icon_auto_blue__color', 'fa fa-dot-circle-o', '0', '1', '0', '1', null, '171', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 19:08:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481658842846688', '1', 'sysTaskMenu', '任务中心', null, 'sysTaskMenu', '1052481657072850395', 'icon_auto_blue__discount', 'fa fa-tasks', '1', '0', '0', '1', null, '176', '1', null, '0', null, '0', '0', to_date('01-12-2016 18:18:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-01-2017 11:42:28', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481659203556833', '1', 'sysMyTask', '待办任务', null, 'sysMyTask', '1052481658842846688', null, null, '0', '1', '0', '1', '/sys/sysTask/myTask/', '181', '0', null, '0', null, '0', '0', to_date('01-12-2016 18:18:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 18:18:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1056741606000308184', '1', 'sysDemo', 'DEMO演示', null, 'sysDemo', '1052481646384715197', 'icon_auto_colorful__org_unit', 'fa fa-tint', '1', '0', '1', '0', null, '152', '1', null, null, null, '0', '0', to_date('17-01-2017 18:48:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-03-2017 11:02:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1056745429913710559', '1', 'sysDemo1', 'DEMO演示', null, 'sysDemo1', '1056741606000308184', 'icon_auto_colorful__org_unit', 'fa fa-recycle', '1', '0', '0', '1', null, '1', '1', null, null, null, '0', '0', to_date('17-01-2017 19:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2017 19:49:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1058615343450023223', '1', 'sysDruidMonitor', 'druid监控', 'sysDruidMonitor', 'sysDruidMonitor', '1052481655704243258', 'icon_auto_blue__browse', 'fa fa-binoculars', '0', '1', '0', '1', null, '150', '1', null, null, '此功能模块只有超级管理员角色才可以访问。', '0', '0', to_date('07-02-2017 11:10:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2017 11:11:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1058634996701833057', '1', 'ueditorDemo', '富文本编辑器', 'ueditorDemo', 'ueditorDemo', '1056745429913710559', 'icon_auto_colorful__statistics', 'fa fa-edit', '0', '1', '0', '1', null, '11', '1', null, null, null, '0', '0', to_date('07-02-2017 16:23:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 11:15:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1058635183551784802', '1', 'excelDemo', 'Excel相关', 'excelDemo', 'excelDemo', '1056745429913710559', 'icon_auto_blue__text', 'fa fa-file-excel-o', '0', '1', '0', '1', null, '12', '1', null, null, null, '0', '0', to_date('07-02-2017 16:26:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:16:32', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1058635416398571363', '1', 'pdfDemo', 'PDF相关', 'pdfDemo', 'pdfDemo', '1056745429913710559', 'icon_auto_colorful__survey', 'fa fa-file-pdf-o', '0', '1', '0', '1', null, '13', '1', null, null, null, '0', '0', to_date('07-02-2017 16:29:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:17:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1059183053449771506', '1', 'fileDemo', '文件上传下载', 'fileDemo', 'fileDemo', '1056745429913710559', 'icon_auto_colorful__opened_folder', 'fa fa-upload', '0', '1', '0', '1', null, '15', '1', null, null, null, '0', '0', to_date('13-02-2017 17:34:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:17:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1059277349464124526', '1', 'echartsDemo', 'ECharts报表', 'echartsDemo', 'echartsDemo', '1056745429913710559', 'icon_auto_colorful__negative_dynamic', 'fa fa-pie-chart', '0', '1', '0', '1', null, '16', '1', null, null, null, '0', '0', to_date('14-02-2017 18:33:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:17:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1059442767489324695', '1', 'mailDemo', 'UEditor邮件', 'mailDemo', 'mailDemo', '1056745429913710559', 'icon_auto_email', 'fa fa-inbox', '0', '1', '0', '1', null, '16', '1', null, null, null, '0', '0', to_date('16-02-2017 14:22:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:18:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1059970869698056785', '1', 'singleCommitDemo', '防重复提交', 'singleCommitDemo', 'singleCommitDemo', '1056745429913710559', 'icon_auto_colorful__do_not_mix', 'fa fa-repeat', '0', '1', '0', '1', null, '17', '1', null, null, null, '0', '0', to_date('22-02-2017 10:16:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:18:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060425468402830583', '1', 'sysAuthMenu:menuset_view', '功能权限查询', null, null, '1052481648470332868', null, null, '0', '0', '0', '0', null, '5', '1', null, null, null, '0', '0', to_date('27-02-2017 10:41:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 10:41:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060425852316912889', '1', 'sysAuthMenu:detail', '查看详情', null, null, '1052481648470332868', null, null, '0', '0', '0', '0', null, '3', '1', null, null, null, '0', '0', to_date('27-02-2017 10:48:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 16:56:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060427695770143999', '1', 'sysAuthMenu:authManageWin', '功能权限选择框', null, null, '1052481646805194175', null, null, '0', '0', '0', '0', null, '6', '1', null, null, null, '0', '0', to_date('27-02-2017 11:17:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-02-2017 11:17:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060513673827224029', '1', 'sysRoleAuth', '角色权限', 'sysRoleAuth', 'sysRoleAuth', '1052481648127448515', null, null, '0', '0', '0', '0', null, '1', '1', null, null, null, '0', '0', to_date('28-02-2017 10:03:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 10:03:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060516871598148066', '1', 'sysRoleUser', '角色用户', 'sysRoleUser', 'sysRoleUser', '1052481648127448515', null, null, '0', '0', '0', '0', null, '2', '1', null, null, null, '0', '0', to_date('28-02-2017 10:54:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 10:54:43', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060521204894431579', '1', 'dauthOperator', '运算符', null, null, '1052481647455311298', null, null, '0', '0', '0', '0', null, '102', '1', null, null, null, '0', '0', to_date('28-02-2017 12:03:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 12:03:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060530341559306746', '1', 'sysUserWin', '用户选择框', 'sysUserWin', 'sysUserWin', '1052481647455311297', null, null, '0', '0', '0', '0', null, '200', '1', null, null, null, '0', '0', to_date('28-02-2017 14:28:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:44:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060531000917527039', '1', 'sysRoleWin', '角色选择框', 'sysRoleWin', 'sysRoleWin', '1052481648127448515', null, null, '0', '0', '0', '0', null, '3', '1', null, null, null, '0', '0', to_date('28-02-2017 14:39:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:39:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060531546931984011', '1', 'dauthFilterType', '过滤类型', null, null, '1052481647455311298', null, null, '0', '0', '0', '0', null, '101', '1', null, null, null, '0', '0', to_date('28-02-2017 14:47:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 14:47:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060535699748026070', '1', 'sysMetadataField', '元数据字段', null, null, '1052481647455311299', null, null, '0', '0', '0', '0', null, '1', '1', null, null, null, '0', '0', to_date('28-02-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 15:53:59', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060536269074462439', '1', 'dauthFilterItem', '过滤器项配置', null, null, '1052481646805194176', 'icon_auto_blue__filter', 'fa fa-filter', '0', '1', '0', '1', null, '3', '1', null, null, null, '0', '0', to_date('28-02-2017 16:03:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:03:02', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060536473503790825', '1', 'dauthVariable', '数据权限变量', null, null, '1060536269074462439', null, null, '0', '0', '0', '0', null, '1', '1', null, null, null, '0', '0', to_date('28-02-2017 16:06:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:06:17', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060537266043746054', '1', 'dauthFilterGroup', '过滤器组', null, null, '1052481647455311300', null, null, '0', '0', '0', '0', null, '2', '1', null, null, null, '0', '0', to_date('28-02-2017 16:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:18:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060537285849249544', '1', 'dauthFilterJoin', '过滤器项配置', null, null, '1060537266043746054', null, null, '0', '0', '0', '0', null, '3', '1', null, null, null, '0', '0', to_date('28-02-2017 16:19:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 19:05:18', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060539373376370476', '1', 'dauthFilterItemSelect', '过滤器项选择', null, null, '1060536269074462439', null, null, '0', '0', '0', '0', null, '2', '1', null, null, null, '0', '0', to_date('28-02-2017 16:52:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:55:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060541736768251024', '1', 'sysUserTabLog', '用户日志', 'sysUserTabLog', 'sysUserTabLog', '1052481647455311297', null, null, '0', '0', '0', '0', null, '101', '1', null, null, null, '0', '0', to_date('28-02-2017 17:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:29:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060541793477338258', '1', 'sysUserTabPos', '用户岗位', 'sysUserTabPos', 'sysUserTabPos', '1052481647455311297', null, null, '0', '0', '0', '0', null, '102', '1', null, null, null, '0', '0', to_date('28-02-2017 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060541832272553108', '1', 'sysUserTabGroup', '用户小组', 'sysUserTabGroup', 'sysUserTabGroup', '1052481647455311297', null, null, '0', '0', '0', '0', null, '103', '1', null, null, null, '0', '0', to_date('28-02-2017 17:31:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:31:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060541916079989910', '1', 'sysUserTabRole', '用户角色', 'sysUserTabRole', 'sysUserTabRole', '1052481647455311297', null, null, '0', '0', '0', '0', null, '105', '1', null, null, null, '0', '0', to_date('28-02-2017 17:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 17:33:15', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060542039792034969', '1', 'sysUserTabAuth', '用户权限', 'sysUserTabAuth', 'sysUserTabAuth', '1052481647455311297', null, null, '0', '0', '0', '0', null, '106', '1', null, null, null, '0', '0', to_date('28-02-2017 17:34:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:27:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060543577796052637', '1', 'sysFileWebupload', 'web上传', null, null, '1052481654739768789', null, null, '0', '0', '0', '0', null, '4', '1', null, null, null, '0', '0', to_date('28-02-2017 17:59:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 11:40:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060545472174714840', '1', 'sysOrgUser', '组织人员', null, null, '1052481649938339272', null, null, '0', '0', '0', '0', null, '81', '1', null, null, null, '0', '0', to_date('28-02-2017 18:29:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:29:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060545543841738715', '1', 'sysPosUser', '岗位人员', null, null, '1052481649938339272', null, null, '0', '0', '0', '0', null, '91', '1', null, null, null, '0', '0', to_date('28-02-2017 18:30:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:30:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060545574796750813', '1', 'sysGroupUser', '小组人员', null, null, '1052481649938339272', null, null, '0', '0', '0', '0', null, '101', '1', null, null, null, '0', '0', to_date('28-02-2017 18:30:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:30:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060545925224342740', '1', 'sysUserPwd', '更新密码', 'sysUserPwd', 'sysUserPwd', '1052481647455311297', null, null, '0', '0', '0', '0', null, '100', '1', null, null, null, '0', '0', to_date('28-02-2017 18:36:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 18:36:31', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1061265384278891362', '1', 'websocketDemo', '消息推送', null, null, '1056745429913710559', 'icon_auto_colorful__end_call', 'fa fa-wechat', '0', '1', '0', '1', null, '18', '1', null, null, null, '0', '0', to_date('08-03-2017 17:12:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-03-2017 12:19:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1063084084742170457', '1', 'sysAuth:mainAttachAuth', '主附权限管理', null, null, '1052481648470332868', null, null, '0', '0', '0', '0', null, '6', '1', null, null, null, '0', '0', to_date('28-03-2017 18:59:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2017 18:59:44', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1063088840446206970', '1', 'common', '公共模块', null, null, '1052481646384715197', null, null, '0', '0', '0', '0', null, '1', '1', null, null, '公共模块，不显示菜单，只分配权限用', '0', '0', to_date('28-03-2017 20:15:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 17:33:55', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1066770481759098136', '1', 'sysMetaManage', '元数据管理', null, null, '1052481646384715198', 'icon_auto_blue__similar-product', 'fa fa-th-large', '1', '0', '0', '1', null, '99', '1', null, null, null, '0', '0', to_date('08-05-2017 11:33:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2017 11:45:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1066770861760943391', '1', 'sysConstraintManage', '约束管理', null, null, '1066770481759098136', 'icon_auto_blue__metadata', 'fa fa-random', '0', '1', '0', '1', null, '3', '1', null, null, null, '0', '0', to_date('08-05-2017 11:39:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2017 11:45:50', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_MODEL (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1067147241363677900', '1', 'printdemo', '打印demo', null, null, '1056745429913710559', 'icon_auto_colorful__print', null, '0', '1', '0', '0', null, '19', '1', null, null, null, '0', '0', to_date('12-05-2017 15:21:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-05-2017 15:22:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

prompt Done.
commit;

prompt Importing table SYS_OPERATION...
set feedback off
set define off
insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481659203556933', '1', 'view', '访问', 'view', 'view', null, 'view', '1', '1', null, null, '0', '1', to_date('01-12-2016 19:47:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 19:47:11', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481659203557933', '1', 'create', '创建', 'create', 'create', null, 'create', '2', '1', null, null, '0', '1', to_date('01-12-2016 19:48:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 19:48:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481659203557963', '1', 'update', '更新', 'update', 'update', null, 'update', '3', '1', null, null, '0', '1', to_date('01-12-2016 19:50:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 19:50:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1052481659203558275', '1', 'delete', '删除', 'delete', 'delete', null, 'delete', '4', '1', null, null, '0', '1', to_date('01-12-2016 19:50:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-12-2016 19:50:12', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060262570224060575', '1', 'query', '数据查询', 'query', 'query', null, 'query', '5', '1', null, null, '0', '0', to_date('25-02-2017 15:32:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-02-2017 15:50:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '2', null);

insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060512414373153244', '1', 'subView', '子视图访问', 'subView', 'subView', null, 'subView', '2', '1', null, '子视图访问', '0', '0', to_date('28-02-2017 09:43:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 16:31:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_OPERATION (OPERATION_ID_, TENANT_ID_, OPERATION_CODE_, OPERATION_NAME_, ENG_NAME_, I18N_CODE_, STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_)
values ('1060513996837915103', '1', 'manage', '管理', 'manage', 'manage', null, 'manage', '6', '1', null, null, '0', '0', to_date('28-02-2017 10:09:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-02-2017 10:09:01', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

prompt Done.
commit;

prompt Importing table SYS_ORGANIZATION...
set feedback off
set define off
insert into SYS_ORGANIZATION (ORG_ID_, TENANT_ID_, ORG_NAME_, ORG_FULLNAME_, ORG_CODE_, ENG_NAME_, I18N_CODE_, FID_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1', '1', '鸿冠信息', '上海鸿冠信息科技股份有限公司', 'hg', 'Hongguan Info', 'sysOrg:hg', null, null, '0', '0', to_date('22-12-2016 19:43:06', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '1');

prompt Done.
commit;

prompt Importing table SYS_ROLE...
set feedback off
set define off
insert into SYS_ROLE (ROLE_ID_, TENANT_ID_, ROLE_NAME_, ROLE_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1054552046249782277', '1', '超级管理员', 'superAdmin', '超级管理员', '0', '1', to_date('24-12-2016 14:46:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-12-2016 15:26:54', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_ROLE (ROLE_ID_, TENANT_ID_, ROLE_NAME_, ROLE_CODE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1059883554957176097', '1', '普通用户', 'staff', '普通用户', '0', '1', to_date('21-02-2017 11:08:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 19:51:23', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_ROLE_AUTH...
set feedback off
set define off
insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423705095956', '1054552046249782277', '1053269293742295694', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423772204821', '1054552046249782277', '1053269293872319120', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423853993750', '1054552046249782277', '1053269294071548564', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423923199767', '1054552046249782277', '1053269293802064527', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423991357208', '1054552046249782277', '1053269294289652376', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424060563225', '1054552046249782277', '1053269294338935449', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424132914970', '1054552046249782277', '1053269294376684186', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424202120987', '1054552046249782277', '1053269294561233566', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424271327004', '1054552046249782277', '1053269294762560162', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424340533021', '1054552046249782277', '1053269295056161446', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424407641886', '1054552046249782277', '1053269295116978855', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424475799327', '1054552046249782277', '1053269295156824744', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424546053920', '1054552046249782277', '1053269295214496425', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424614211361', '1054552046249782277', '1053269295260633770', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424682368802', '1054552046249782277', '1056744893101518814', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424793517859', '1054552046249782277', '1056745852093476833', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424862723876', '1054552046249782277', '1058635541087889252', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268424931929893', '1054552046249782277', '1058635600936413029', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268425012670246', '1054552046249782277', '1058635657762940774', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268425079779111', '1054552046249782277', '1059183295447480819', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268425147936552', '1054552046249782277', '1059277407171456111', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268425216093993', '1054552046249782277', '1059442833175271064', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268425286348586', '1054552046249782277', '1059970917085303378', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268425356603179', '1054552046249782277', '1061265498981571428', '0', to_date('30-03-2017 19:49:29', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560136367922', '1059883554957176097', '1053269294289652376', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560204525363', '1059883554957176097', '1053269294338935449', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560272682804', '1059883554957176097', '1053269294376684186', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560340840245', '1059883554957176097', '1053269294561233566', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560412143414', '1059883554957176097', '1053269294762560162', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560489738039', '1059883554957176097', '1053269295056161446', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560557895480', '1059883554957176097', '1053269295116978855', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560637587257', '1059883554957176097', '1053269295156824744', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560795922234', '1059883554957176097', '1053269295214496425', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560867225403', '1059883554957176097', '1053269295260633770', '0', to_date('30-03-2017 19:51:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268560940625724', '1059883554957176097', '1056744893101518814', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561008783165', '1059883554957176097', '1056745852093476833', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561076940606', '1059883554957176097', '1058635541087889252', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561148243775', '1059883554957176097', '1058635600936413029', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561216401216', '1059883554957176097', '1058635657762940774', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561287704385', '1059883554957176097', '1059183295447480819', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561357958978', '1059883554957176097', '1059277407171456111', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561426116419', '1059883554957176097', '1059442833175271064', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561496371012', '1059883554957176097', '1059970917085303378', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268561565577029', '1059883554957176097', '1061265498981571428', '0', to_date('30-03-2017 19:51:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268413976407694', '1054552046249782277', '1063088912725599228', '0', to_date('30-03-2017 19:49:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414046662287', '1054552046249782277', '1053269288255097393', '0', to_date('30-03-2017 19:49:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414114819728', '1054552046249782277', '1053269288340032050', '0', to_date('30-03-2017 19:49:18', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414186122897', '1054552046249782277', '1053269288410286643', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414254280338', '1054552046249782277', '1053269288579107380', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414323486355', '1054552046249782277', '1053269288618953269', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414391643796', '1054552046249782277', '1053269288660896310', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414462946965', '1054552046249782277', '1060543902148994228', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414534250134', '1054552046249782277', '1060514158411942368', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414604504727', '1054552046249782277', '1060517625944771045', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414674759320', '1054552046249782277', '1060518192551201254', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414765985433', '1054552046249782277', '1053269288709130807', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414837288602', '1054552046249782277', '1053269288764705336', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414908591771', '1054552046249782277', '1053269288804551225', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268414977797788', '1054552046249782277', '1053269288870611514', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415047003805', '1054552046249782277', '1053269288910457403', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415116209822', '1054552046249782277', '1060428226958822660', '0', to_date('30-03-2017 19:49:19', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415184367263', '1054552046249782277', '1060428592153726216', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415252524704', '1054552046249782277', '1063147339691241342', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415322779297', '1054552046249782277', '1063086183253125000', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415391985314', '1054552046249782277', '1063086218756859786', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415460142755', '1054552046249782277', '1053269289002732093', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415529348772', '1054552046249782277', '1053269289043626558', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415597506213', '1054552046249782277', '1053269289082423871', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415664615078', '1054552046249782277', '1053269289128561216', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415733821095', '1054552046249782277', '1053269289174698561', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415804075688', '1054552046249782277', '1053269289259633218', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415873281705', '1054552046249782277', '1053269289370782275', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268415942487722', '1054552046249782277', '1053269289539603013', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416011693739', '1054552046249782277', '1053269289616149062', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416079851180', '1054552046249782277', '1053269289722055239', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416150105773', '1054552046249782277', '1053269289776581192', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416219311790', '1054552046249782277', '1060546419125874659', '0', to_date('30-03-2017 19:49:20', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416287469231', '1054552046249782277', '1060546527206797285', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416356675248', '1054552046249782277', '1060547171395268596', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416430075569', '1054552046249782277', '1060545898669371360', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416498233010', '1054552046249782277', '1060547474314194937', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416568487603', '1054552046249782277', '1053269289921284683', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416638742196', '1054552046249782277', '1053269289975810636', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416707948213', '1054552046249782277', '1053269290030336589', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416777154230', '1054552046249782277', '1053269290079619662', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416845311671', '1054552046249782277', '1060548445786303501', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416913469112', '1054552046249782277', '1060550232467744052', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268416982675129', '1054552046249782277', '1053269290258926161', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417061318330', '1054552046249782277', '1053269290312403538', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417130524347', '1054552046249782277', '1053269290406775380', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417199730364', '1054552046249782277', '1060550604366193982', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417267887805', '1054552046249782277', '1060550649891169780', '0', to_date('30-03-2017 19:49:21', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417336045246', '1054552046249782277', '1060550715204871670', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417403154111', '1054552046249782277', '1060551024781207036', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417472360128', '1054552046249782277', '1060551066653992446', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417541566145', '1054552046249782277', '1060551124526999040', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417610772162', '1054552046249782277', '1053269288340032051', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417679978179', '1054552046249782277', '1060531869244323473', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417749184196', '1054552046249782277', '1060532034701227671', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417817341637', '1054552046249782277', '1060532071473739417', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417888644806', '1054552046249782277', '1060532126926632603', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268417957850823', '1054552046249782277', '1060521729551530342', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418027056840', '1054552046249782277', '1060522022291929453', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418095214281', '1054552046249782277', '1060522062648473967', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418194829002', '1054552046249782277', '1060522106275527025', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418264035019', '1054552046249782277', '1053269288410286644', '0', to_date('30-03-2017 19:49:22', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418332192460', '1054552046249782277', '1060518473066075753', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418400349901', '1054552046249782277', '1060521496474057057', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418470604494', '1054552046249782277', '1060521622693247331', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418540859087', '1054552046249782277', '1060535744735082200', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418610065104', '1054552046249782277', '1060536045116454623', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418679271121', '1054552046249782277', '1060536117623387875', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418747428562', '1054552046249782277', '1060536158243124965', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418820828883', '1054552046249782277', '1060536599394776813', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418900520660', '1054552046249782277', '1060536814721955574', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268418981261013', '1054552046249782277', '1060536853305358072', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419065147094', '1054552046249782277', '1060536892744398586', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419138547415', '1054552046249782277', '1060539272757114664', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419220336344', '1054552046249782277', '1060539641341015862', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419303173849', '1054552046249782277', '1060539726008284984', '0', to_date('30-03-2017 19:49:23', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419387059930', '1054552046249782277', '1060539768441009978', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419456265947', '1054552046249782277', '1053269288410286645', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419524423388', '1054552046249782277', '1060535560930195150', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419592580829', '1054552046249782277', '1060535607169251025', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419662835422', '1054552046249782277', '1060535663224026836', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419732041439', '1054552046249782277', '1060540379121186632', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419800198880', '1054552046249782277', '1060540733235787601', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419873599201', '1054552046249782277', '1060540774933460819', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268419942805218', '1054552046249782277', '1060540836824610645', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420012011235', '1054552046249782277', '1060539828406974268', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420082265828', '1054552046249782277', '1060540230126925634', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420150423269', '1054552046249782277', '1060540281988446020', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420221726438', '1054552046249782277', '1060540320044414790', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420290932455', '1054552046249782277', '1053269288410286646', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420360138472', '1054552046249782277', '1060537905622677270', '0', to_date('30-03-2017 19:49:24', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420429344489', '1054552046249782277', '1060537972850030362', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420497501930', '1054552046249782277', '1060538012249224988', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420566707947', '1054552046249782277', '1060538059636471582', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420633816812', '1054552046249782277', '1053269288410286667', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420703022829', '1054552046249782277', '1060537116852352768', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420773277422', '1054552046249782277', '1060537149546952450', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268420842483439', '1054552046249782277', '1060537199051273988', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421178027760', '1054552046249782277', '1053269290698279514', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421259816689', '1054552046249782277', '1053269290745465435', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421338459890', '1054552046249782277', '1053269290790554204', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421416054515', '1054552046249782277', '1053269290838788701', '0', to_date('30-03-2017 19:49:25', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421486309108', '1054552046249782277', '1053269290882828894', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421555515125', '1054552046249782277', '1053269290933160543', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421624721142', '1054552046249782277', '1060457638798545745', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421693927159', '1054552046249782277', '1053269290986637920', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421762084600', '1054552046249782277', '1053269291229907554', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421831290617', '1054552046249782277', '1053269291350493795', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421899448058', '1054552046249782277', '1053269291475274340', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268421968654075', '1054552046249782277', '1053269291604249190', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422036811516', '1054552046249782277', '1053269291641997927', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422104968957', '1054552046249782277', '1053269291687086696', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422173126398', '1054552046249782277', '1053269291791944297', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422242332415', '1054552046249782277', '1053269291956570730', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422310489856', '1054552046249782277', '1053269292139022958', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422380744449', '1054552046249782277', '1053269292326718066', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422448901890', '1054552046249782277', '1053269292373903987', '0', to_date('30-03-2017 19:49:26', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422517059331', '1054552046249782277', '1060543772628813471', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422586265348', '1054552046249782277', '1060543924875757217', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422655471365', '1054552046249782277', '1060544004342089379', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422742503174', '1054552046249782277', '1060544158464935591', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422810660615', '1054552046249782277', '1060544086428812965', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422878818056', '1054552046249782277', '1053269292864637564', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268422949072649', '1054552046249782277', '1060512630049426250', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423017230090', '1054552046249782277', '1060512989158394705', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423086436107', '1054552046249782277', '1053269292932795005', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423154593548', '1054552046249782277', '1053269292977883774', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423224848141', '1054552046249782277', '1053269293014583935', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423294054158', '1054552046249782277', '1053269293059672704', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423362211599', '1054552046249782277', '1053269293111052929', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423430369040', '1054552046249782277', '1053269293281970821', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423499575057', '1054552046249782277', '1053269293456034441', '0', to_date('30-03-2017 19:49:27', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423567732498', '1054552046249782277', '1058615553282663736', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_ROLE_AUTH (ROLE_AUTH_ID_, ROLE_ID_, AUTH_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063268423637987091', '1054552046249782277', '1053269293698255501', '0', to_date('30-03-2017 19:49:28', 'dd-mm-yyyy hh24:mi:ss'), '1');

prompt Done.
commit;

prompt Importing table SYS_USER...
set feedback off
set define off
insert into SYS_USER (USER_ID_, TENANT_ID_, USER_NAME_, ENG_NAME_, GENDER_, BIRTHDAY_, MOBILE_, EMAIL_, ADDRESS_, TELEPHONE_, DESCR_, IS_DELETE_, IS_FINAL_, IS_VISIBLE_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, HEAD_PHOTO_)
values ('1', '1', '超级管理员', 'super', '1', null, null, null, null, null, null, '0', '1', '1', to_date('29-11-2016 19:20:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:10:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

insert into SYS_USER (USER_ID_, TENANT_ID_, USER_NAME_, ENG_NAME_, GENDER_, BIRTHDAY_, MOBILE_, EMAIL_, ADDRESS_, TELEPHONE_, DESCR_, IS_DELETE_, IS_FINAL_, IS_VISIBLE_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, HEAD_PHOTO_)
values ('2', '1', '测试账户', 'test', '0', null, null, null, null, null, null, '0', '0', '1', to_date('23-01-2017 10:41:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:14:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null);

prompt Done.
commit;

prompt Importing table SYS_STAFF_INFO...
set feedback off
set define off
insert into SYS_STAFF_INFO (STAFF_ID_, TENANT_ID_, STAFF_CODE_, STAFF_STATUS_, USER_ID_, ENTRY_TIME_, QUIT_TIME_, ID_CARD_, BANK_CARD_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('1', '1', '001', '1', '1', to_date('30-01-2017 20:10:39', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, '0', '0', null, to_date('30-03-2017 20:10:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

insert into SYS_STAFF_INFO (STAFF_ID_, TENANT_ID_, STAFF_CODE_, STAFF_STATUS_, USER_ID_, ENTRY_TIME_, QUIT_TIME_, ID_CARD_, BANK_CARD_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_)
values ('2', '1', '002', '1', '2', to_date('30-01-2017 20:14:40', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, '0', '0', null, to_date('30-03-2017 20:14:38', 'dd-mm-yyyy hh24:mi:ss'), '1', '1');

prompt Done.
commit;

prompt Importing table SYS_USER_PROFILE...
set feedback off
set define off
insert into SYS_USER_PROFILE (USER_PROFILE_ID_, TENANT_ID_, USER_ID_, PROFILE_KEY_, PROFILE_VALUE_, DEFAULT_VALUE_, SORT_NO_, PROFILE_TYPE_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, IS_FINAL_)
values ('1063270295823249293', '1', '2', 'defaultPageSize', '20', null, '1', '数据表格展示数据数量', '1', '1', '数据表格展示数据数量，默认数据为10', '0', to_date('30-03-2017 20:19:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:19:13', 'dd-mm-yyyy hh24:mi:ss'), '2', '2', '0');

insert into SYS_USER_PROFILE (USER_PROFILE_ID_, TENANT_ID_, USER_ID_, PROFILE_KEY_, PROFILE_VALUE_, DEFAULT_VALUE_, SORT_NO_, PROFILE_TYPE_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, IS_FINAL_)
values ('1063270295944884110', '1', '2', 'themeColor', 'metro', null, '1', '系统主题配色', '1', '1', '系统主题配色，默认为metro', '0', to_date('30-03-2017 20:19:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:19:13', 'dd-mm-yyyy hh24:mi:ss'), '2', '2', '0');

insert into SYS_USER_PROFILE (USER_PROFILE_ID_, TENANT_ID_, USER_ID_, PROFILE_KEY_, PROFILE_VALUE_, DEFAULT_VALUE_, SORT_NO_, PROFILE_TYPE_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, IS_FINAL_)
values ('1063270395470475152', '1', '1', 'defaultPageSize', '20', null, '1', '数据表格展示数据数量', '1', '1', '数据表格展示数据数量，默认数据为10', '0', to_date('30-03-2017 20:20:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:20:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', '0');

insert into SYS_USER_PROFILE (USER_PROFILE_ID_, TENANT_ID_, USER_ID_, PROFILE_KEY_, PROFILE_VALUE_, DEFAULT_VALUE_, SORT_NO_, PROFILE_TYPE_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, CRT_TIME_, UPD_TIME_, CRT_USER_ID_, UPD_USER_ID_, IS_FINAL_)
values ('1063270395592109969', '1', '1', 'themeColor', 'metro', null, '1', '系统主题配色', '1', '1', '系统主题配色，默认为metro', '0', to_date('30-03-2017 20:20:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2017 20:20:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', '0');

prompt Done.
commit;

prompt Importing table SYS_USER_ROLE...
set feedback off
set define off
insert into SYS_USER_ROLE (USER_ROLE_ID_, USER_ID_, ROLE_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063269755341041534', '1', '1054552046249782277', '0', to_date('30-03-2017 20:10:38', 'dd-mm-yyyy hh24:mi:ss'), '1');

insert into SYS_USER_ROLE (USER_ROLE_ID_, USER_ID_, ROLE_ID_, IS_FINAL_, CRT_TIME_, CRT_USER_ID_)
values ('1063270008095043463', '2', '1059883554957176097', '0', to_date('30-03-2017 20:14:39', 'dd-mm-yyyy hh24:mi:ss'), '1');

prompt Done.
commit;

alter table SYS_MODEL
  add constraint SYS_MODEL_IBFK_1 foreign key (FID_)
  references SYS_MODEL (MODEL_ID_);
alter table SYS_MODEL
  add constraint SYS_MODEL_IBFK_2 foreign key (ICON_ID_)
  references SYS_ICON (ICON_ID_);

update sys_config set CONFIG_VALUE_ = 'V3.0.3-RC1' where CONFIG_KEY_ = 'sysVersion';
commit;
-- 更新元数据字段为大写
UPDATE sys_metadata_entity SET table_name_ = upper(table_name_);
UPDATE sys_metadata_field SET column_name_ = UPPER(column_name_);

/*****任务中心sql*****/
INSERT INTO sys_config (CONFIG_ID_, TENANT_ID_, CONFIG_KEY_, CONFIG_VALUE_, CONFIG_DESC_, CONFIG_TYPE_, DEFAULT_VALUE_, SORT_NO_, VERSION_, IS_CURRENT_, DESCR_, IS_DELETE_, IS_FINAL_,  CRT_USER_ID_, UPD_USER_ID_) VALUES (1070299965235607514, 1, 'sysTaskWebSocketTimer', '10', '任务中心推送间隔秒值(需填正整数,0为不推送)', 'sys', '0', 23, 1, 1, NULL, 0, 0,  1, 1);

-- 任务中心建表语句
--  Create table
create table sys_task
(
  task_id_            number(20) not null,
  business_id_        number(20),
  task_type_id_       number(20),
  task_name_          varchar2(64),
  crossdomain_appurl_ varchar2(128),
  task_handle_url_    varchar2(2048),
  task_view_url_      varchar2(2048),
  task_crt_time_      timestamp,
  task_end_time_      timestamp,
  task_later_time_    timestamp,
  task_status_        varchar2(64),
  descr_              clob,
  is_delete_          number(4),
  is_final_           number(4),
  crt_time_           timestamp,
  upd_time_           timestamp,
  crt_user_id_        number(20),
  upd_user_id_        number(20)
)
;
-- Add comments to the table 
comment on table sys_task
  is '任务表';
-- Add comments to the columns 
comment on column sys_task.task_id_
  is '主键';
comment on column sys_task.business_id_
  is '业务数据主键';
comment on column sys_task.task_type_id_
  is '任务类型ID';
comment on column sys_task.task_name_
  is '任务名称';
comment on column sys_task.crossdomain_appurl_
  is '跨域应用地址,本机时不需填写';
comment on column sys_task.task_handle_url_
  is '任务办理url';
comment on column sys_task.task_view_url_
  is '任务查看url';
comment on column sys_task.task_crt_time_
  is '任务添加时间';
comment on column sys_task.task_end_time_
  is '任务办理时限';
comment on column sys_task.task_later_time_
  is '任务延时后时限';
comment on column sys_task.task_status_
  is '任务状态';
comment on column sys_task.descr_
  is '描述';
comment on column sys_task.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column sys_task.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column sys_task.crt_time_
  is '数据创建时间';
comment on column sys_task.upd_time_
  is '数据最后修改时间';
comment on column sys_task.crt_user_id_
  is '数据创建用户编号';
comment on column sys_task.upd_user_id_
  is '数据修改用户编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sys_task
  add constraint PK_sys_task primary key (TASK_ID_);

  -- Create table
create table sys_task_handler
(
  task_handler_id_ number(20) not null,
  task_id_         number(20),
  user_id_         number(20)
)
;
-- Add comments to the table 
comment on table sys_task_handler
  is '任务办理人表';
-- Add comments to the columns 
comment on column sys_task_handler.task_handler_id_
  is '主键';
comment on column sys_task_handler.task_id_
  is '任务表主键';
comment on column sys_task_handler.user_id_
  is '人员表主键';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sys_task_handler
  add constraint pk_sys_task_handler primary key (TASK_HANDLER_ID_);
  
-- Create table
create table sys_task_handle_log
(
  task_handle_log_id_ number(20) not null,
  task_id_            number(20),
  user_id_            number(20),
  task_handle_time_   timestamp,
  task_handle_type_   varchar2(64),
  descr_             clob
)
;
-- Add comments to the table 
comment on table sys_task_handle_log
  is '任务办理日志';
-- Add comments to the columns 
comment on column sys_task_handle_log.task_handle_log_id_
  is '主键';
comment on column sys_task_handle_log.task_id_
  is '任务表主键';
comment on column sys_task_handle_log.user_id_
  is '人员表主键';
comment on column sys_task_handle_log.task_handle_time_
  is '任务处理时间';
comment on column sys_task_handle_log.task_handle_type_
  is '任务处理类型';
comment on column sys_task_handle_log.descr_
  is '描述';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sys_task_handle_log
  add constraint pk_sys_task_handle_log primary key (TASK_HANDLE_LOG_ID_);
  
-- Create table
create table sys_task_type
(
  task_type_id_      number(20),
  task_type_code_    varchar2(64),
  task_type_name_    varchar2(64),
  handle_win_height_ number(8),
  handle_win_width_  number(8),
  task_handle_mode_  number(4),
  descr_             clob,
  is_delete_         number(4),
  is_final_          number(4),
  crt_time_          timestamp,
  upd_time_          timestamp,
  crt_user_id_       number(20),
  upd_user_id_       number(20)
)
;
-- Add comments to the table 
comment on table sys_task_type
  is '任务类型表';
-- Add comments to the columns 
comment on column sys_task_type.task_type_id_
  is '主键';
comment on column sys_task_type.task_type_code_
  is '任务类型编码';
comment on column sys_task_type.task_type_name_
  is '任务类型名称';
comment on column sys_task_type.handle_win_height_
  is '任务办理弹窗高度';
comment on column sys_task_type.handle_win_width_
  is '任务办理弹窗宽度';
comment on column sys_task_type.task_handle_mode_
  is '任务办理方式(0:winform,1:newwindow)';
comment on column sys_task_type.descr_
  is '描述';
comment on column sys_task_type.is_delete_
  is '删除标识(1:已删除;0:正常)';
comment on column sys_task_type.is_final_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column sys_task_type.crt_time_
  is '数据创建时间';
comment on column sys_task_type.upd_time_
  is '数据最后修改时间';
comment on column sys_task_type.crt_user_id_
  is '数据创建用户编号';
comment on column sys_task_type.upd_user_id_
  is '数据修改用户编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sys_task_type
  add constraint pk_sys_task_type primary key (TASK_TYPE_ID_);

-- 任务中心模块权限
-- 删除错误的菜单配置
DELETE FROM Sys_Role_Auth WHERE auth_id_ IN(SELECT auth_id_ FROM Sys_Auth WHERE model_id_ = 1052481659203556833);
DELETE FROM Sys_Auth WHERE model_id_ = 1052481659203556833;
DELETE FROM sys_model WHERE MODEL_ID_ = 1052481659203556833;

-- 模块
INSERT INTO sys_model (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_) VALUES (1052481659203556833, 1, 'sysMyTask', '待办任务', '', 'sysMyTask', 1052481658842846688, 'icon_auto_blue__remind', NULL, 0, 1, 0, 1, '/sys/sysTask/myTask/', 181, 1, '', 0, '', 0, 0, 1, 1, NULL);
INSERT INTO sys_model (MODEL_ID_, TENANT_ID_, MODEL_CODE_, MODEL_NAME_, ENG_NAME_, I18N_CODE_, FID_, STYLE_, BS_STYLE_, IS_TOP_MENU_, IS_SUB_MENU_, IS_BS_TOP_MENU_, IS_BS_SUB_MENU_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, MODEL_TYPE_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_) VALUES (1070234276045852458, 1, 'taskHistory', '已办任务', '', '', 1052481658842846688, 'icon_auto_blue__rejected-order', NULL, 0, 1, 0, 0, '', 182, 1, '', NULL, '', 0, 0, 1, 1, NULL);

-- 权限
INSERT INTO sys_auth (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_,  CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1053269295116978855, 1, 'sysTask:view', '待办任务:访问', 'sysTask:view', 'sysTask.view', 1052481659203556833, 1, 1052481659203556933, 0, '', NULL, '/sys/sysTask/view', 173, 1, '', '', 0, 0, 1, 1, NULL, 1);
INSERT INTO sys_auth (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_,  CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1070234741027442478, 1, 'taskHistory:view', 'taskHistory:view', '', '', 1070234276045852458, 1, 1052481659203556933, 0, '', NULL, '/sys/sysTask/taskHistoryView', 0, 1, '', '', 0, 0, 1, 1, NULL, 1);
INSERT INTO sys_auth (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_,  CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1070587318650416325, 1, 'sysTask:getDoTasklist', '查询待办任务列表', '', '', 1052481659203556833, 2, 1060262570224060575, 0, '', NULL, '/sys/sysTask/getDoTasklist', 0, 1, '', '', 0, 0, 1, 1, NULL, 1);
INSERT INTO sys_auth (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_,  CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1070587427993824455, 1, 'sysTask:getSysTaskTypeList', '待办任务类型查询', '', '', 1052481659203556833, 2, 1060262570224060575, 0, '', NULL, '/sys/sysTaskType/getSysTaskTypeList', 1, 1, '', '', 0, 0, 1, 1, NULL, 1);
INSERT INTO sys_auth (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1070588422649949385, 1, 'sysTask:crossDomainWin', '任务中心:跨域弹窗', '', '', 1052481659203556833, 2, 1060512414373153244, 0, '', NULL, '/sys/sysTask/taskCrossDomainWin%s', 2, 1, '', '', 0, 0,  1, 1, NULL, 1);
INSERT INTO sys_auth (AUTH_ID_, TENANT_ID_, AUTH_CODE_, AUTH_NAME_, ENG_NAME_, I18N_CODE_, MODEL_ID_, AUTH_CATEGORY_, OPERATION_ID_, IS_INHERITABLE_, STYLE_, BS_STYLE_, URI_, SORT_NO_, IS_VISIBLE_, TIP_, DESCR_, IS_DELETE_, IS_FINAL_, CRT_USER_ID_, UPD_USER_ID_, ICON_ID_, IS_PUBLIC) VALUES (1070591118113749537, 1, 'sysTaskHistory:getHistoryTasklist', '任务历史:列表查询', '', '', 1070234276045852458, 2, 1060262570224060575, 0, '', NULL, '/sys/sysTask/getHistoryTasklist', 0, 1, '', '', 0, 0, 1, 1, NULL, 1);

-- 主从权限
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_,  CRT_USER_ID_) VALUES (1070588460363033803, 1053269295116978855, 1070587318650416325, 0,1);
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_,  CRT_USER_ID_) VALUES (1070588460403928268, 1053269295116978855, 1070587427993824455, 0,1);
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_,  CRT_USER_ID_) VALUES (1070588460411268301, 1053269295116978855, 1070588422649949385, 0,1);
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_,  CRT_USER_ID_) VALUES (1070591159632116259, 1070234741027442478, 1070591118113749537, 0,1);
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_,  CRT_USER_ID_) VALUES (1070591159640504868, 1070234741027442478, 1070587427993824455, 0,1);
INSERT INTO sys_auth_join (AUTH_JOIN_ID_, MAIN_AUTH_ID_, ATTACH_AUTH_ID_, IS_FINAL_,  CRT_USER_ID_) VALUES (1070591159649942053, 1070234741027442478, 1070588422649949385, 0,1);


/*** SRV ***/

create table SRV_INTERFACE
(
  IF_ID_      NUMBER(24) not null,
  REQ_URI_    VARCHAR2(255 CHAR),
  REQ_METHOD  VARCHAR2(6 CHAR),
  ENABLED_    NUMBER(3) default '1',
  IF_SWITCH_  NUMBER(3) default '1',
  CLASS_NAME_ VARCHAR2(200 CHAR),
  METHOD_NAME_ VARCHAR2(100 CHAR),
  PARAMETERS_  VARCHAR2(255 CHAR),
  DESCR_  CLOB,
  IS_DELETE_       NUMBER(3) default '0',
  IS_FINAL_        NUMBER(3) default '0',
  CRT_TIME_        DATE,
  UPD_TIME_        DATE default SYSDATE,
  CRT_USER_ID_     NUMBER(24),
  UPD_USER_ID_     NUMBER(24)
)
;
comment on column SRV_INTERFACE.IF_ID_
  is '主键';
comment on column SRV_INTERFACE.REQ_URI_
  is '请求地址';
comment on column SRV_INTERFACE.REQ_METHOD
  is '请求方法类型';
comment on column SRV_INTERFACE.ENABLED_
  is '是否可用(1:是;0:否)';
comment on column SRV_INTERFACE.IF_SWITCH_
  is '开关(1:开;0:关)';
comment on column SRV_INTERFACE.CLASS_NAME_
  is '类名';
comment on column SRV_INTERFACE.METHOD_NAME_
  is '方法名';
comment on column SRV_INTERFACE.PARAMETERS_
  is '参数类型';
comment on column SRV_INTERFACE.descr_
  is '接口描述';
comment on column SRV_INTERFACE.IS_DELETE_
  is '删除标识(1:已删除;0:正常)';
comment on column SRV_INTERFACE.IS_FINAL_
  is '是否不可修改(1:不可修改;0:可修改)';
comment on column SRV_INTERFACE.CRT_TIME_
  is '数据创建时间';
comment on column SRV_INTERFACE.UPD_TIME_
  is '数据最后修改时间';
comment on column SRV_INTERFACE.CRT_USER_ID_
  is '数据创建用户编号';
comment on column SRV_INTERFACE.UPD_USER_ID_
  is '数据修改用户编号';
alter table SRV_INTERFACE
  add constraint PK_SRV_INTERFACE primary key (IF_ID_);
create index IDX_SRV_INTERFACE_CRT_TIME_ on SRV_INTERFACE (CRT_TIME_);
create index IDX_SRV_INTERFACE_CLASS_NAME_ on SRV_INTERFACE (CLASS_NAME_,METHOD_NAME_ );

create table SRV_LOG
(
  LOG_ID_  NUMBER(24) not null,
  IF_ID_  NUMBER(24) not null,
  REQ_TYPE_  VARCHAR2(6 CHAR),
  REQ_URI_  VARCHAR2(255 CHAR),
  REQ_USERID_  NUMBER(24)，
  BEGIN_TIME_  DATE default SYSDATE,
  END_TIME_  DATE,
  PROCESS_TIME_ NUMBER(10),
  CONSUMER_IP_  VARCHAR2(50 CHAR),
  PROVIDER_IP_  VARCHAR2(50 CHAR),
  IP_  VARCHAR2(50 CHAR),
  RESULT_ NUMBER(4)
)
;
comment on column SRV_LOG.LOG_ID_
  is '主键';
comment on column SRV_LOG.IF_ID_
  is '接口主键';
comment on column SRV_LOG.REQ_TYPE_
  is '请求方法类型';
comment on column SRV_LOG.REQ_URI_
  is '请求地址';
comment on column SRV_LOG.REQ_USERID_
  is '请求用户';
comment on column SRV_LOG.BEGIN_TIME_
  is '请求开始时间'; 
comment on column SRV_LOG.END_TIME_
  is '请求结束时间';
comment on column SRV_LOG.PROCESS_TIME_
  is '处理时间（毫秒）';
comment on column SRV_LOG.CONSUMER_IP_
  is '消费者机器IP';
comment on column SRV_LOG.PROVIDER_IP_
  is '提供者机器IP';
comment on column SRV_LOG.IP_
  is '客户端请求IP';
comment on column SRV_LOG.RESULT_
  is '结果(1:成功;0:失败)';
alter table SRV_LOG
  add constraint PK_SRV_LOG primary key (LOG_ID_);
create index IDX_SRV_LOG_IF_ID_ on SRV_LOG (IF_ID_);
create index IDX_SRV_LOG_BEGIN_TIME_ on SRV_LOG (BEGIN_TIME_);
create index IDX_SRV_LOG_PROCESS_TIME_ on SRV_LOG (PROCESS_TIME_);

create table SRV_LOG_EXT
(
  LOG_EXT_ID_  NUMBER(24) not null,
  PARAMETER_  CLOB,
  RESPONSE_  CLOB
)
;
alter table SRV_LOG_EXT
  add constraint PK_SRV_LOG_EXT primary key (LOG_EXT_ID_);
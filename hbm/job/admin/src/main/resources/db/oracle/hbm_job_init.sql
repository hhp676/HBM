
CREATE TABLE job_job_details
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    JOB_NAME  VARCHAR2(200) NOT NULL,
    JOB_GROUP VARCHAR2(200) NOT NULL,
    DESCRIPTION VARCHAR2(250) NULL,
    JOB_CLASS_NAME   VARCHAR2(250) NOT NULL, 
    IS_DURABLE VARCHAR2(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR2(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR2(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR2(1) NOT NULL,
    JOB_DATA BLOB NULL,
    CONSTRAINT JOB_JOB_DETAILS_PK PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);
CREATE TABLE job_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    JOB_NAME  VARCHAR2(200) NOT NULL, 
    JOB_GROUP VARCHAR2(200) NOT NULL,
    DESCRIPTION VARCHAR2(250) NULL,
    NEXT_FIRE_TIME NUMBER(13) NULL,
    PREV_FIRE_TIME NUMBER(13) NULL,
    PRIORITY NUMBER(13) NULL,
    TRIGGER_STATE VARCHAR2(16) NOT NULL,
    TRIGGER_TYPE VARCHAR2(8) NOT NULL,
    START_TIME NUMBER(13) NOT NULL,
    END_TIME NUMBER(13) NULL,
    CALENDAR_NAME VARCHAR2(200) NULL,
    MISFIRE_INSTR NUMBER(2) NULL,
    JOB_DATA BLOB NULL,
    CONSTRAINT JOB_TRIGGERS_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT JOB_TRIGGER_TO_JOBS_FK FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP) 
      REFERENCES JOB_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP) 
);
CREATE TABLE job_simple_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    REPEAT_COUNT NUMBER(7) NOT NULL,
    REPEAT_INTERVAL NUMBER(12) NOT NULL,
    TIMES_TRIGGERED NUMBER(10) NOT NULL,
    CONSTRAINT JOB_SIMPLE_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT JOB_SIMPLE_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
	REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE job_cron_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    CRON_EXPRESSION VARCHAR2(120) NOT NULL,
    TIME_ZONE_ID VARCHAR2(80),
    CONSTRAINT JOB_CRON_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT JOB_CRON_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
      REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE job_simprop_triggers
  (          
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    STR_PROP_1 VARCHAR2(512) NULL,
    STR_PROP_2 VARCHAR2(512) NULL,
    STR_PROP_3 VARCHAR2(512) NULL,
    INT_PROP_1 NUMBER(10) NULL,
    INT_PROP_2 NUMBER(10) NULL,
    LONG_PROP_1 NUMBER(13) NULL,
    LONG_PROP_2 NUMBER(13) NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR2(1) NULL,
    BOOL_PROP_2 VARCHAR2(1) NULL,
    CONSTRAINT JOB_SIMPROP_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT JOB_SIMPROP_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
      REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE job_blob_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    CONSTRAINT JOB_BLOB_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT JOB_BLOB_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
        REFERENCES JOB_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE job_calendars
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    CALENDAR_NAME  VARCHAR2(200) NOT NULL, 
    CALENDAR BLOB NOT NULL,
    CONSTRAINT JOB_CALENDARS_PK PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);
CREATE TABLE job_paused_trigger_grps
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR2(200) NOT NULL, 
    CONSTRAINT JOB_PAUSED_TRIG_GRPS_PK PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);
CREATE TABLE job_fired_triggers 
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    ENTRY_ID VARCHAR2(95) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    INSTANCE_NAME VARCHAR2(200) NOT NULL,
    FIRED_TIME NUMBER(13) NOT NULL,
    SCHED_TIME NUMBER(13) NOT NULL,
    PRIORITY NUMBER(13) NOT NULL,
    STATE VARCHAR2(16) NOT NULL,
    JOB_NAME VARCHAR2(200) NULL,
    JOB_GROUP VARCHAR2(200) NULL,
    IS_NONCONCURRENT VARCHAR2(1) NULL,
    REQUESTS_RECOVERY VARCHAR2(1) NULL,
    CONSTRAINT JOB_FIRED_TRIGGER_PK PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);
CREATE TABLE job_scheduler_state 
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    INSTANCE_NAME VARCHAR2(200) NOT NULL,
    LAST_CHECKIN_TIME NUMBER(13) NOT NULL,
    CHECKIN_INTERVAL NUMBER(13) NOT NULL,
    CONSTRAINT JOB_SCHEDULER_STATE_PK PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);
CREATE TABLE job_locks
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    LOCK_NAME  VARCHAR2(40) NOT NULL, 
    CONSTRAINT JOB_LOCKS_PK PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);

create index idx_job_j_req_recovery on job_job_details(SCHED_NAME,REQUESTS_RECOVERY);
create index idx_job_j_grp on job_job_details(SCHED_NAME,JOB_GROUP);

create index idx_job_t_j on job_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_job_t_jg on job_triggers(SCHED_NAME,JOB_GROUP);
create index idx_job_t_c on job_triggers(SCHED_NAME,CALENDAR_NAME);
create index idx_job_t_g on job_triggers(SCHED_NAME,TRIGGER_GROUP);
create index idx_job_t_state on job_triggers(SCHED_NAME,TRIGGER_STATE);
create index idx_job_t_n_state on job_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_job_t_n_g_state on job_triggers(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_job_t_next_fire_time on job_triggers(SCHED_NAME,NEXT_FIRE_TIME);
create index idx_job_t_nft_st on job_triggers(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
create index idx_job_t_nft_misfire on job_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
create index idx_job_t_nft_st_misfire on job_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
create index idx_job_t_nft_st_misfire_grp on job_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

create index idx_job_ft_trig_inst_name on job_fired_triggers(SCHED_NAME,INSTANCE_NAME);
create index idx_job_ft_inst_job_req_rcvry on job_fired_triggers(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
create index idx_job_ft_j_g on job_fired_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_job_ft_jg on job_fired_triggers(SCHED_NAME,JOB_GROUP);
create index idx_job_ft_t_g on job_fired_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
create index idx_job_ft_tg on job_fired_triggers(SCHED_NAME,TRIGGER_GROUP);


CREATE TABLE job_trigger_group (
	id_ NUMBER(11) NOT NULL ,
	app_name_ NVARCHAR2(64) NOT NULL ,
	title_ NVARCHAR2(12) NOT NULL ,
	order_ NUMBER(4) NOT NULL ,
	address_type_ NUMBER(4) NOT NULL ,
	address_list_ NVARCHAR2(200) NULL 
);
COMMENT ON COLUMN job_trigger_group.app_name_ IS '执行器AppName';
COMMENT ON COLUMN job_trigger_group.title_ IS '执行器名称';
COMMENT ON COLUMN job_trigger_group.order_ IS '排序';
COMMENT ON COLUMN job_trigger_group.address_type_ IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN job_trigger_group.address_list_ IS '执行器地址列表，多地址逗号分隔';

-- ----------------------------
-- Table structure for job_trigger_info
-- ----------------------------
CREATE TABLE job_trigger_info (
	id_ NUMBER(11) NOT NULL ,
	job_group_ NUMBER(11) NOT NULL ,
	job_cron_ NVARCHAR2(128) NOT NULL ,
	job_desc_ NVARCHAR2(255) NOT NULL ,
	add_time_ DATE NULL ,
	update_time_ DATE NULL ,
	author_ NVARCHAR2(64) NULL ,
	alarm_email_ NVARCHAR2(255) NULL ,
	executor_route_strategy_ NVARCHAR2(50) NULL ,
	executor_handler_ NVARCHAR2(255) NULL ,
	executor_param_ NVARCHAR2(255) NULL ,
	glue_type_ NVARCHAR2(50) NOT NULL ,
	glue_source_ NCLOB NULL ,
	glue_remark_ NVARCHAR2(128) NULL ,
	glue_updatetime_ DATE NULL ,
	child_jobkey_ NVARCHAR2(255) NULL 
);
COMMENT ON COLUMN job_trigger_info.job_group_ IS '执行器主键ID';
COMMENT ON COLUMN job_trigger_info.job_cron_ IS '任务执行CRON';
COMMENT ON COLUMN job_trigger_info.author_ IS '作者';
COMMENT ON COLUMN job_trigger_info.alarm_email_ IS '报警邮件';
COMMENT ON COLUMN job_trigger_info.executor_route_strategy_ IS '执行器路由策略';
COMMENT ON COLUMN job_trigger_info.executor_handler_ IS '执行器任务handler';
COMMENT ON COLUMN job_trigger_info.executor_param_ IS '执行器任务参数';
COMMENT ON COLUMN job_trigger_info.glue_type_ IS 'GLUE类型';
COMMENT ON COLUMN job_trigger_info.glue_source_ IS 'GLUE源代码';
COMMENT ON COLUMN job_trigger_info.glue_remark_ IS 'GLUE备注';
COMMENT ON COLUMN job_trigger_info.glue_updatetime_ IS 'GLUE更新时间';
COMMENT ON COLUMN job_trigger_info.child_jobkey_ IS '子任务Key';

-- ----------------------------
-- Table structure for job_trigger_log
-- ----------------------------
CREATE TABLE job_trigger_log (
	id_ NUMBER(11) NOT NULL ,
	job_group_ NUMBER(11) NOT NULL ,
	job_id_ NUMBER(11) NOT NULL ,
	glue_type_ NVARCHAR2(50) NULL ,
	executor_address_ NVARCHAR2(255) NULL ,
	executor_handler_ NVARCHAR2(255) NULL ,
	executor_param_ NVARCHAR2(255) NULL ,
	trigger_time_ DATE NULL ,
	trigger_code_ NVARCHAR2(255) NULL ,
	trigger_msg_ NCLOB NULL ,
	handle_time_ DATE NULL ,
	handle_code_ NVARCHAR2(255) NULL ,
	handle_msg_ NCLOB NULL 
);
COMMENT ON COLUMN job_trigger_log.job_group_ IS '执行器主键ID';
COMMENT ON COLUMN job_trigger_log.job_id_ IS '任务，主键ID';
COMMENT ON COLUMN job_trigger_log.glue_type_ IS 'GLUE类型';
COMMENT ON COLUMN job_trigger_log.executor_address_ IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN job_trigger_log.executor_handler_ IS '执行器任务handler';
COMMENT ON COLUMN job_trigger_log.executor_param_ IS 'executor_param';
COMMENT ON COLUMN job_trigger_log.trigger_time_ IS '调度-时间';
COMMENT ON COLUMN job_trigger_log.trigger_code_ IS '调度-结果';
COMMENT ON COLUMN job_trigger_log.trigger_msg_ IS '调度-日志';
COMMENT ON COLUMN job_trigger_log.handle_time_ IS '执行-时间';
COMMENT ON COLUMN job_trigger_log.handle_code_ IS '执行-状态';
COMMENT ON COLUMN job_trigger_log.handle_msg_ IS '执行-日志';

-- ----------------------------
-- Table structure for job_trigger_logglue
-- ----------------------------
CREATE TABLE job_trigger_logglue (
	id_ NUMBER(11) NOT NULL ,
	job_id_ NUMBER(11) NOT NULL ,
	glue_type_ NVARCHAR2(50) NULL ,
	glue_source_ NCLOB NULL ,
	glue_remark_ NVARCHAR2(128) NOT NULL ,
	add_time_ DATE NULL ,
	update_time_ DATE NULL 
);
COMMENT ON COLUMN job_trigger_logglue.job_id_ IS '任务，主键ID';
COMMENT ON COLUMN job_trigger_logglue.glue_type_ IS 'GLUE类型';
COMMENT ON COLUMN job_trigger_logglue.glue_source_ IS 'GLUE源代码';
COMMENT ON COLUMN job_trigger_logglue.glue_remark_ IS 'GLUE备注';

-- ----------------------------
-- Table structure for job_trigger_registry
-- ----------------------------
CREATE TABLE job_trigger_registry (
	id_ NUMBER(11) NOT NULL ,
	registry_group_ NVARCHAR2(255) NOT NULL ,
	registry_key_ NVARCHAR2(255) NOT NULL ,
	registry_value_ NVARCHAR2(255) NOT NULL ,
	update_time_ DATE NOT NULL 
);

-- ----------------------------
-- Indexes structure for table job_trigger_group
-- ----------------------------

-- ----------------------------
-- Checks structure for table job_trigger_group
-- ----------------------------
ALTER TABLE job_trigger_group ADD CHECK (id_ IS NOT NULL);
ALTER TABLE job_trigger_group ADD CHECK (app_name_ IS NOT NULL);
ALTER TABLE job_trigger_group ADD CHECK (title_ IS NOT NULL);
ALTER TABLE job_trigger_group ADD CHECK (order_ IS NOT NULL);
ALTER TABLE job_trigger_group ADD CHECK (address_type_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table job_trigger_group
-- ----------------------------
ALTER TABLE job_trigger_group ADD PRIMARY KEY (id_);

-- ----------------------------
-- Indexes structure for table job_trigger_info
-- ----------------------------

-- ----------------------------
-- Checks structure for table job_trigger_info
-- ----------------------------
ALTER TABLE job_trigger_info ADD CHECK (id_ IS NOT NULL);
ALTER TABLE job_trigger_info ADD CHECK (job_group_ IS NOT NULL);
ALTER TABLE job_trigger_info ADD CHECK (job_cron_ IS NOT NULL);
ALTER TABLE job_trigger_info ADD CHECK (job_desc_ IS NOT NULL);
ALTER TABLE job_trigger_info ADD CHECK (glue_type_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table job_trigger_info
-- ----------------------------
ALTER TABLE job_trigger_info ADD PRIMARY KEY (id_);

-- ----------------------------
-- Indexes structure for table job_trigger_log
-- ----------------------------

-- ----------------------------
-- Checks structure for table job_trigger_log
-- ----------------------------
ALTER TABLE job_trigger_log ADD CHECK (id_ IS NOT NULL);
ALTER TABLE job_trigger_log ADD CHECK (job_group_ IS NOT NULL);
ALTER TABLE job_trigger_log ADD CHECK (job_id_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table job_trigger_log
-- ----------------------------
ALTER TABLE job_trigger_log ADD PRIMARY KEY (id_);

-- ----------------------------
-- Indexes structure for table job_trigger_logglue
-- ----------------------------

-- ----------------------------
-- Checks structure for table job_trigger_logglue
-- ----------------------------
ALTER TABLE job_trigger_logglue ADD CHECK (id_ IS NOT NULL);
ALTER TABLE job_trigger_logglue ADD CHECK (job_id_ IS NOT NULL);
ALTER TABLE job_trigger_logglue ADD CHECK (glue_remark_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table job_trigger_logglue
-- ----------------------------
ALTER TABLE job_trigger_logglue ADD PRIMARY KEY (id_);

-- ----------------------------
-- Indexes structure for table job_trigger_registry
-- ----------------------------

-- ----------------------------
-- Checks structure for table job_trigger_registry
-- ----------------------------
ALTER TABLE job_trigger_registry ADD CHECK (id_ IS NOT NULL);
ALTER TABLE job_trigger_registry ADD CHECK (registry_group_ IS NOT NULL);
ALTER TABLE job_trigger_registry ADD CHECK (registry_key_ IS NOT NULL);
ALTER TABLE job_trigger_registry ADD CHECK (registry_value_ IS NOT NULL);
ALTER TABLE job_trigger_registry ADD CHECK (update_time_ IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table job_trigger_registry
-- ----------------------------
ALTER TABLE job_trigger_registry ADD PRIMARY KEY (id_);


INSERT INTO JOB_TRIGGER_GROUP ( id_, app_name_, title_, order_, address_type_, address_list_) values ( 1, 'hbm-job-executor', 'HBM执行器', '1', '0', null);



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
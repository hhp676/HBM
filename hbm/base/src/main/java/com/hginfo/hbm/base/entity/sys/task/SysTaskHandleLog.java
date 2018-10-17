/*
 * Project Name:hbm-base.
 * File Name:SysTaskHandleLog.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.task;


import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 任务办理日志: sys_task_handle_log. <br />
 * entity 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_TASK_HANDLE_LOG")
@DynamicInsert
public class SysTaskHandleLog extends RelEntity {

    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表元数据。
     */
    static final TableMeta TABLE_META = new TableMeta();

    static {
        TABLE_META.setAlias("sthl");
        TABLE_META.addField("taskHandleLogId", "TASK_HANDLE_LOG_ID_", Long.class);
        TABLE_META.addField("taskId", "TASK_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("taskHandleTime", "TASK_HANDLE_TIME_", Date.class);
        TABLE_META.addField("taskHandleType", "TASK_HANDLE_TYPE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * ID_ : 主键。
     */
    private Long taskHandleLogId;
    /**
     * TASK_ID_ : 任务表主键。
     */
    private Long taskId;
    /**
     * USER_ID_ : 人员表主键。
     */
    private Long userId;
    /**
     * TASK_HANDLE_TIME_ : 任务处理时间。
     */
    private Date taskHandleTime;
    /**
     * TASK_HANDLE_TYPE_ : 任务处理类型(0新增,1办理,2删除)。
     */
    private String taskHandleType;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    
    
    @Id
    @Column(name = "TASK_HANDLE_LOG_ID_")
    public Long getTaskHandleLogId() {
        return taskHandleLogId;
    }
    
    public void setTaskHandleLogId(Long taskHandleLogId) {
        this.taskHandleLogId = taskHandleLogId;
    }

    @Column(name = "TASK_ID_")
    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "TASK_HANDLE_TIME_")
    public Date getTaskHandleTime() {
        return taskHandleTime;
    }

    public void setTaskHandleTime(Date taskHandleTime) {
        this.taskHandleTime = taskHandleTime;
    }

    @Column(name = "TASK_HANDLE_TYPE_")
    public String getTaskHandleType() {
        return taskHandleType;
    }

    public void setTaskHandleType(String taskHandleType) {
        this.taskHandleType = taskHandleType;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

    @Override
    @Transient
    public Long getId() {
        return getTaskHandleLogId();
    }

    @Override
    public void setId(Long id) {
        setTaskHandleLogId(id);
    }
}

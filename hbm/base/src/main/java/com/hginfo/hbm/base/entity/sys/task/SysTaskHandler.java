/*
 * Project Name:hbm-base.
 * File Name:SysTaskHandler.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.task;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 任务办理人表: sys_task_handler. <br />
 * entity 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_TASK_HANDLER")
@DynamicInsert
public class SysTaskHandler extends RelEntity {

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
        TABLE_META.setAlias("sth");
        TABLE_META.addField("taskHandlerId", "TASK_HANDLER_ID_", Long.class);
        TABLE_META.addField("taskId", "TASK_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * ID_ : 主键。
     */
    private Long taskHandlerId;
    /**
     * TASK_ID_ : 任务表主键。
     */
    private Long taskId;
    /**
     * USER_ID_ : 人员表主键。
     */
    private Long userId;
    /**
     * 
     */
    @HEntityId("userId")
    private SysUser sysUser;

    @Id
    @Column(name = "TASK_HANDLER_ID_")
    public Long getTaskHandlerId() {
        return taskHandlerId;
    }

    public void setTaskHandlerId(Long taskHandlerId) {
        this.taskHandlerId = taskHandlerId;
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
    
    @Transient
    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

    @Override
    @Transient
    public Long getId() {
        return getTaskHandlerId();
    }

    @Override
    public void setId(Long id) {
        setTaskHandlerId(id);
    }

}

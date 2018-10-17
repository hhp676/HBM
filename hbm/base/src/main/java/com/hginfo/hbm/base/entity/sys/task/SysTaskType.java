/*
 * Project Name:hbm-base.
 * File Name:SysTaskType.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.task;


import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 任务类型表: sys_task_type. <br />
 * entity 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_TASK_TYPE")
@DynamicInsert
public class SysTaskType extends BizEntity {

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
        TABLE_META.setAlias("stt");
        TABLE_META.addField("taskTypeId", "TASK_TYPE_ID_", Long.class);
        TABLE_META.addField("fid", "FID_", Long.class);
        TABLE_META.addField("taskTypeCode", "TASK_TYPE_CODE_", String.class);
        TABLE_META.addField("taskTypeName", "TASK_TYPE_NAME_", String.class);
        TABLE_META.addField("handleWinHeight", "HANDLE_WIN_HEIGHT_", Integer.class);
        TABLE_META.addField("handleWinWidth", "HANDLE_WIN_WIDTH_", Integer.class);
        TABLE_META.addField("taskHandleMode", "TASK_HANDLE_MODE_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * ID_ : 主键。
     */
    private Long taskTypeId;
    
    /**
     * FID_ : 父id。
     */
    private Long fid;
    /**
     * TASK_TYPE_CODE_ : 任务类型编码。
     */
    private String taskTypeCode;
    /**
     * TASK_TYPE_NAME_ : 任务类型名称。
     */
    private String taskTypeName;
    /**
     * HANDLE_WIN_HEIGHT_ : 任务办理窗口高度(办理方式不是弹窗时不需要)。
     */
    private Integer handleWinHeight;
    /**
     * HANDLE_WIN_WIDTH_ : 任务办理窗口宽度(办理方式不是弹窗时不需要)。
     */
    private Integer handleWinWidth;
    /**
     * TASK_HANDLE_MODE_ : 任务办理方式(0:winform,1:newwindow)。
     */
    private Integer taskHandleMode;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Id
    @Column(name = "TASK_TYPE_ID_")
    public Long getTaskTypeId() {
        return taskTypeId;
    }

    public void setTaskTypeId(Long taskTypeId) {
        this.taskTypeId = taskTypeId;
    }
    
    @Column(name = "FID_")
    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    @Column(name = "TASK_TYPE_CODE_")
    public String getTaskTypeCode() {
        return taskTypeCode;
    }

    public void setTaskTypeCode(String taskTypeCode) {
        this.taskTypeCode = taskTypeCode;
    }

    @Column(name = "TASK_TYPE_NAME_")
    public String getTaskTypeName() {
        return taskTypeName;
    }

    public void setTaskTypeName(String taskTypeName) {
        this.taskTypeName = taskTypeName;
    }
    
    @Column(name = "HANDLE_WIN_HEIGHT_")
    public Integer getHandleWinHeight() {
        return handleWinHeight;
    }

    public void setHandleWinHeight(Integer handleWinHeight) {
        this.handleWinHeight = handleWinHeight;
    }

    @Column(name = "HANDLE_WIN_WIDTH_")
    public Integer getHandleWinWidth() {
        return handleWinWidth;
    }

    public void setHandleWinWidth(Integer handleWinWidth) {
        this.handleWinWidth = handleWinWidth;
    }

    @Column(name = "TASK_HANDLE_MODE_")
    public Integer getTaskHandleMode() {
        return taskHandleMode;
    }

    public void setTaskHandleMode(Integer taskHandleMode) {
        this.taskHandleMode = taskHandleMode;
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
        return getTaskTypeId();
        
    }

    @Override
    public void setId(Long id) {
        setTaskTypeId(id);
    }

}

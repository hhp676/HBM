/*
 * Project Name:hbm-base.
 * File Name:SysTask.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.task;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.entity.sys.news.SysNews;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 任务表: sys_task. <br />
 * entity 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_TASK")
@DynamicInsert
public class SysTask extends BizEntity {

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
        TABLE_META.setAlias("st");
        TABLE_META.addField("taskId", "TASK_ID_", Long.class);
        TABLE_META.addField("businessId", "BUSINESS_ID_", Long.class);
        TABLE_META.addField("taskTypeId", "TASK_TYPE_ID_", Long.class);
        TABLE_META.addField("taskName", "TASK_NAME_", String.class);
        TABLE_META.addField("crossDomainAppUrl", "CROSSDOMAIN_APPURL_", String.class);
        TABLE_META.addField("taskHandleUrl", "TASK_HANDLE_URL_", String.class);
        TABLE_META.addField("taskViewUrl", "TASK_VIEW_URL_", String.class);
        TABLE_META.addField("taskCrtTime", "TASK_CRT_TIME_", Date.class);
        TABLE_META.addField("taskEndTime", "TASK_END_TIME_", Date.class);
        TABLE_META.addField("taskLaterTime", "TASK_LATER_TIME_", Date.class);
        TABLE_META.addField("taskStatus", "TASK_STATUS_", String.class);
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
    private Long taskId;
    /**
     * BUSINESS_ID_ : 业务数据主键。
     */
    private Long businessId;
    /**
     * TASK_TYPE_ID_ : 任务类型id。
     */
    private Long taskTypeId;
    /**
     * TASK_NAME_ : 任务名称。
     */
    private String taskName;
    /**
     * CROSSDOMAIN_APPURL_ : 跨域应用地址。
     */
    private String crossDomainAppUrl;
    /**
     * TASK_HANDLE_URL_ : 任务办理url。
     */
    private String taskHandleUrl;
    /**
     * TASK_VIEW_URL_ : 任务查看url。
     */
    private String taskViewUrl;
    /**
     * TASK_CRT_TIME_ : 任务添加时间。
     */
    private Date taskCrtTime;
    /**
     * TASK_END_TIME_ : 任务办理时限。
     */
    private Date taskEndTime;
    /**
     * TASK_LATER_TIME_ : 任务延时后时限。
     */
    private Date taskLaterTime;
    /**
     * TASK_STATUS_ : 任务状态(0待办,1已办)。
     */
    private String taskStatus;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * 任务类型编码。
     * @Transient
     */
    private String taskTypeCode;
    /**
     * 任务类型.
     * @Transient
     */
    @HEntityId("taskTypeId")
    private SysTaskType sysTaskType;
    /**
     * 业务辅助属性.
     * @Transient
     */
    private Bo bo = new Bo();
    

    @Id
    @Column(name = "TASK_ID_")
    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    @Column(name = "BUSINESS_ID_")
    public Long getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Long businessId) {
        this.businessId = businessId;
    }

    @Column(name = "TASK_TYPE_ID_")
    public Long getTaskTypeId() {
        return taskTypeId;
    }

    public void setTaskTypeId(Long taskTypeId) {
        this.taskTypeId = taskTypeId;
    }

    @Column(name = "TASK_NAME_")
    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }
    
    @Column(name = "CROSSDOMAIN_APPURL_")
    public String getCrossDomainAppUrl() {
        return crossDomainAppUrl;
    }

    public void setCrossDomainAppUrl(String crossDomainAppUrl) {
        this.crossDomainAppUrl = crossDomainAppUrl;
    }

    @Column(name = "TASK_VIEW_URL_")
    public String getTaskViewUrl() {
        return taskViewUrl;
    }

    public void setTaskViewUrl(String taskViewUrl) {
        this.taskViewUrl = taskViewUrl;
    }

    @Column(name = "TASK_HANDLE_URL_")
    public String getTaskHandleUrl() {
        return taskHandleUrl;
    }

    public void setTaskHandleUrl(String taskHandleUrl) {
        this.taskHandleUrl = taskHandleUrl;
    }

    @Column(name = "TASK_CRT_TIME_")
    public Date getTaskCrtTime() {
        return taskCrtTime;
    }

    public void setTaskCrtTime(Date taskCrtTime) {
        this.taskCrtTime = taskCrtTime;
    }

    @Column(name = "TASK_END_TIME_")
    public Date getTaskEndTime() {
        return taskEndTime;
    }

    public void setTaskEndTime(Date taskEndTime) {
        this.taskEndTime = taskEndTime;
    }

    @Column(name = "TASK_LATER_TIME_")
    public Date getTaskLaterTime() {
        return taskLaterTime;
    }

    public void setTaskLaterTime(Date taskLaterTime) {
        this.taskLaterTime = taskLaterTime;
    }

    @Column(name = "TASK_STATUS_")
    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Transient
    public String getTaskTypeCode() {
        return taskTypeCode;
    }

    public void setTaskTypeCode(String taskTypeCode) {
        this.taskTypeCode = taskTypeCode;
    }

    @Transient
    public SysTaskType getSysTaskType() {
        return sysTaskType;
    }

    public void setSysTaskType(SysTaskType sysTaskType) {
        this.sysTaskType = sysTaskType;
    }

    @Transient
    public Bo getBo() {
        return bo;
    }

    public void setBo(Bo bo) {
        this.bo = bo;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

    @Override
    @Transient
    public Long getId() {
        return getTaskId();
        
    }

    @Override
    public void setId(Long id) {
        setTaskId(id);
    }
    
    /**
     * getTaskStatusStr:(获取任务状态). <br/>
     * @author yinyanzhen
     * @return String String
     * @since V1.0.0
     */
    @Transient
    public String getTaskStatusStr() {
        if ("0".equals(this.taskStatus)) {
            return "待办";
        }
        if ("1".equals(this.taskStatus)) {
            return "已办";
        }
        return "";
    }
    
    /**
     * ClassName: Bo .<br/>
     *
     * @author yinyanzhen
     * @version SysTask
     * @since V1.0.0
     */
    public class Bo implements Serializable {
        /**
         */
        private static final long serialVersionUID = -1572417384011491629L;
        /**
         * 消息通知办理人触发节点.0新增,1办理,2销毁删除,3变更.
         */
        private List<Integer> newsDoNodes;
        /**
         * 办理人通知消息类型编码.
         */
        private List<String> newsTypeCodes;
        /**
         * 业务所需通知.
         */
        private List<SysNews.UserNew> userNews;
        
        /**
         * 办理人员列表.
         */
        private List<Long> sysTaskHandlerIds;
        
        /*****************查询参数********************/
        //当前办理人ID.
        private Long doHandlerId;
        //历史办理人ID.
        private Long historyHandlerId;
        //任务名称like.
        private String taskNameLike;
        //接收起始时间
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        private Date taskCrtStartTime;
        //接收终止时间
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        private Date taskCrtEndTime;
        //办理起始时间
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        private Date taskHandleStartTime;
        //办理终止时间
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        private Date taskHandleEndTime;


        public List<Integer> getNewsDoNodes() {
            return newsDoNodes;
        }

        public void setNewsDoNodes(List<Integer> newsDoNodes) {
            this.newsDoNodes = newsDoNodes;
        }

        public List<String> getNewsTypeCodes() {
            return newsTypeCodes;
        }

        public void setNewsTypeCodes(List<String> newsTypeCodes) {
            this.newsTypeCodes = newsTypeCodes;
        }

        public List<SysNews.UserNew> getUserNews() {
            return userNews;
        }

        public void setUserNews(List<SysNews.UserNew> userNews) {
            this.userNews = userNews;
        }

        public Long getDoHandlerId() {
            return doHandlerId;
        }

        public void setDoHandlerId(Long doHandlerId) {
            this.doHandlerId = doHandlerId;
        }

        public Long getHistoryHandlerId() {
            return historyHandlerId;
        }

        public void setHistoryHandlerId(Long historyHandlerId) {
            this.historyHandlerId = historyHandlerId;
        }

        public List<Long> getSysTaskHandlerIds() {
            return sysTaskHandlerIds;
        }

        public void setSysTaskHandlerIds(List<Long> sysTaskHandlerIds) {
            this.sysTaskHandlerIds = sysTaskHandlerIds;
        }

        public String getTaskNameLike() {
            return taskNameLike;
        }

        public void setTaskNameLike(String taskNameLike) {
            this.taskNameLike = taskNameLike;
        }

        public Date getTaskCrtStartTime() {
            return taskCrtStartTime;
        }

        public void setTaskCrtStartTime(Date taskCrtStartTime) {
            this.taskCrtStartTime = taskCrtStartTime;
        }

        public Date getTaskCrtEndTime() {
            return taskCrtEndTime;
        }

        public void setTaskCrtEndTime(Date taskCrtEndTime) {
            this.taskCrtEndTime = taskCrtEndTime;
        }

        public Date getTaskHandleStartTime() {
            return taskHandleStartTime;
        }

        public void setTaskHandleStartTime(Date taskHandleStartTime) {
            this.taskHandleStartTime = taskHandleStartTime;
        }

        public Date getTaskHandleEndTime() {
            return taskHandleEndTime;
        }

        public void setTaskHandleEndTime(Date taskHandleEndTime) {
            this.taskHandleEndTime = taskHandleEndTime;
        }
    }
}

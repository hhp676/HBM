/*
 * Project Name:hbm-base.
 * File Name:SysTaskNewsTemplete.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月27日 下午6:54:47
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
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.entity.sys.news.SysNewsTemplete;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 任务消息模版配置: sys_task_news_templete. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_TASK_NEWS_TEMPLETE")
@DynamicInsert
public class SysTaskNewsTemplete extends BizEntity {

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
        TABLE_META.setAlias("stnt");
        TABLE_META.addField("taskNewsTempleteId", "TASK_NEWS_TEMPLETE_ID_", Long.class);
        TABLE_META.addField("taskTypeId", "TASK_TYPE_ID_", Long.class);
        TABLE_META.addField("newsTypeId", "NEWS_TYPE_ID_", Long.class);
        TABLE_META.addField("newsDoNode", "NEWS_DO_NODE_", Integer.class);
        TABLE_META.addField("newsTempleteId", "NEWS_TEMPLETE_ID_", Long.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * TASK_NEWS_TEMPLETE_ID_ : 主键。
     */
    private Long taskNewsTempleteId;
    /**
     * TASK_TYPE_ID_ : 任务类型表主键。
     */
    private Long taskTypeId;
    /**
     * NEWS_TYPE_ID_ : 消息类型表主键。
     */
    private Long newsTypeId;
    /**
     * NEWS_DO_NODE_ : 消息触发节点(0新增,1办理,2销毁删除,3变更.)。
     */
    private Integer newsDoNode;
    /**
     * NEWS_TEMPLETE_ID_ : 消息模版表主键。
     */
    private Long newsTempleteId;
    /**
     * 消息模版表信息。
     * @Transient
     */
    @HEntityId("newsTempleteId")
    private SysNewsTemplete  sysNewsTemplete;

    @Override
    @Transient
    public Long getId() {
        return getTaskNewsTempleteId();
    }

    @Override
    public void setId(Long id) {
        setTaskNewsTempleteId(id);
    }

    @Id
    @Column(name = "TASK_NEWS_TEMPLETE_ID_")
    public Long getTaskNewsTempleteId() {
        return taskNewsTempleteId;
    }

    public void setTaskNewsTempleteId(Long taskNewsTempleteId) {
        this.taskNewsTempleteId = taskNewsTempleteId;
    }

    @Column(name = "TASK_TYPE_ID_")
    public Long getTaskTypeId() {
        return taskTypeId;
    }

    public void setTaskTypeId(Long taskTypeId) {
        this.taskTypeId = taskTypeId;
    }

    @Column(name = "NEWS_TYPE_ID_")
    public Long getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(Long newsTypeId) {
        this.newsTypeId = newsTypeId;
    }
    
    @Column(name = "NEWS_DO_NODE_")
    public Integer getNewsDoNode() {
        return newsDoNode;
    }

    public void setNewsDoNode(Integer newsDoNode) {
        this.newsDoNode = newsDoNode;
    }

    @Column(name = "NEWS_TEMPLETE_ID_")
    public Long getNewsTempleteId() {
        return newsTempleteId;
    }

    public void setNewsTempleteId(Long newsTempleteId) {
        this.newsTempleteId = newsTempleteId;
    }
    
    @Transient
    public SysNewsTemplete getSysNewsTemplete() {
        return sysNewsTemplete;
    }

    public void setSysNewsTemplete(SysNewsTemplete sysNewsTemplete) {
        this.sysNewsTemplete = sysNewsTemplete;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

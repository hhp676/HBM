/*
 * Project Name:hbm-base.
 * File Name:SysNewsOuterSendlog.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.news;


import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 外部消息发送日志: sys_news_outer_sendlog. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NEWS_OUTER_SENDLOG")
@DynamicInsert
public class SysNewsOuterSendlog extends BizEntity {

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
        TABLE_META.setAlias("snos");
        TABLE_META.addField("newsOuterSendlogId", "NEWS_OUTER_SENDLOG_ID_", Long.class);
        TABLE_META.addField("newsOuterId", "NEWS_OUTER_ID_", Long.class);
        TABLE_META.addField("sendTime", "SEND_TIME_", Date.class);
        TABLE_META.addField("isSuccess", "IS_SUCCESS_", Date.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NEWS_OUTER_SENDLOG_ID_ : 主键。
     */
    private Long newsOuterSendlogId;
    /**
     * NEWS_OUTER_ID_ : 消息明细ID。
     */
    private Long newsOuterId;
    /**
     * SEND_TIME_ : 发送时间。
     */
    private Date sendTime;
    /**
     * IS_SUCCESS_ : 发送时间。
     */
    private Date isSuccess;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getNewsOuterSendlogId();
    }

    @Override
    public void setId(Long id) {
        setNewsOuterSendlogId(id);
    }

    @Id
    @Column(name = "NEWS_OUTER_SENDLOG_ID_")
    public Long getNewsOuterSendlogId() {
        return newsOuterSendlogId;
    }

    public void setNewsOuterSendlogId(Long newsOuterSendlogId) {
        this.newsOuterSendlogId = newsOuterSendlogId;
    }

    @Column(name = "NEWS_OUTER_ID_")
    public Long getNewsOuterId() {
        return newsOuterId;
    }

    public void setNewsOuterId(Long newsOuterId) {
        this.newsOuterId = newsOuterId;
    }

    @Column(name = "SEND_TIME_")
    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    @Column(name = "IS_SUCCESS_")
    public Date getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(Date isSuccess) {
        this.isSuccess = isSuccess;
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

}

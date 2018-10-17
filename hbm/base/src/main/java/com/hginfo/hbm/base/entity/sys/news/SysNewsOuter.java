/*
 * Project Name:hbm-base.
 * File Name:SysNewsOuter.java
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
 * 外部消息详情: sys_news_outer. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NEWS_OUTER")
@DynamicInsert
public class SysNewsOuter extends BizEntity {

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
        TABLE_META.setAlias("sno");
        TABLE_META.addField("newsOuterId", "NEWS_OUTER_ID_", Long.class);
        TABLE_META.addField("newsId", "NEWS_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("userEmail", "USER_EMAIL_", String.class);
        TABLE_META.addField("userMobile", "USER_MOBILE_", String.class);
        TABLE_META.addField("timerLv", "TIMER_LV_", Integer.class);
        TABLE_META.addField("importantLv", "IMPORTANT_LV_", Integer.class);
        TABLE_META.addField("newsTitle", "NEWS_TITLE_", String.class);
        TABLE_META.addField("newsContent", "NEWS_CONTENT_", String.class);
        TABLE_META.addField("sendCount", "SEND_COUNT_", Integer.class);
        TABLE_META.addField("sendStatus", "SEND_STATUS_", Integer.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NEWS_OUTER_ID_ : 主键。
     */
    private Long newsOuterId;
    /**
     * NEWS_ID_ : 消息主键。
     */
    private Long newsId;
    /**
     * USER_ID_ : 人员主键。
     */
    private Long userId;
    /**
     * USER_EMAIL_ : 邮箱地址。
     */
    private String userEmail;
    /**
     * USER_MOBILE_ : 手机号。
     */
    private String userMobile;
    /**
     * TIMER_LV_ : 优先级(0低,1普通,2高,3紧急)。
     */
    private Integer timerLv;
    /**
     * IMPORTANT_LV_ : 重要性(0低,1一般,2重要,3致命)。
     */
    private Integer importantLv;
    /**
     * NEWS_TITLE_ : 消息标题。
     */
    private String newsTitle;
    /**
     * NEWS_CONTENT_ : 消息正文。
     */
    private String newsContent;
    /**
     * SEND_COUNT_ : 发送次数,最多重复发5次。
     */
    private Integer sendCount;
    /**
     * SEND_STATUS_ : 消息发送状态(0未成功,1成功,2失败_超出发送次数))。
     */
    private Integer sendStatus;

    @Override
    @Transient
    public Long getId() {
        return getNewsOuterId();
    }

    @Override
    public void setId(Long id) {
        setNewsOuterId(id);
    }

    @Id
    @Column(name = "NEWS_OUTER_ID_")
    public Long getNewsOuterId() {
        return newsOuterId;
    }

    public void setNewsOuterId(Long newsOuterId) {
        this.newsOuterId = newsOuterId;
    }

    @Column(name = "NEWS_ID_")
    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "USER_EMAIL_")
    public String getUserEmail() {
        return userEmail;
    }
    
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Column(name = "USER_MOBILE_")
    public String getUserMobile() {
        return userMobile;
    }
    
    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    @Column(name = "TIMER_LV_")
    public Integer getTimerLv() {
        return timerLv;
    }

    public void setTimerLv(Integer timerLv) {
        this.timerLv = timerLv;
    }

    @Column(name = "IMPORTANT_LV_")
    public Integer getImportantLv() {
        return importantLv;
    }

    public void setImportantLv(Integer importantLv) {
        this.importantLv = importantLv;
    }

    @Column(name = "NEWS_TITLE_")
    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    @Column(name = "NEWS_CONTENT_")
    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    @Column(name = "SEND_COUNT_")
    public Integer getSendCount() {
        return sendCount;
    }

    public void setSendCount(Integer sendCount) {
        this.sendCount = sendCount;
    }

    @Column(name = "SEND_STATUS_")
    public Integer getSendStatus() {
        return sendStatus;
    }

    public void setSendStatus(Integer sendStatus) {
        this.sendStatus = sendStatus;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

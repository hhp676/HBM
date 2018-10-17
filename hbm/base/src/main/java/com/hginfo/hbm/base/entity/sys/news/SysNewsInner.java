/*
 * Project Name:hbm-base.
 * File Name:SysNewsInner.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.news;


import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import java.io.Serializable;
import java.util.Date;

/**
 * 内部消息详情: sys_news_inner. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NEWS_INNER")
@DynamicInsert
public class SysNewsInner extends BizEntity {

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
        TABLE_META.setAlias("sni");
        TABLE_META.addField("newsInnerId", "NEWS_INNER_ID_", Long.class);
        TABLE_META.addField("newsId", "NEWS_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("timerLv", "TIMER_LV_", Integer.class);
        TABLE_META.addField("importantLv", "IMPORTANT_LV_", Integer.class);
        TABLE_META.addField("newsTitle", "NEWS_TITLE_", String.class);
        TABLE_META.addField("newsContent", "NEWS_CONTENT_", String.class);
        TABLE_META.addField("newsStatus", "NEWS_STATUS_", Integer.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NEWS_INNER_ID_ : 主键。
     */
    private Long newsInnerId;
    /**
     * NEWS_ID_ : 消息主键。
     */
    private Long newsId;
    /**
     * USER_ID_ : 人员主键。
     */
    private Long userId;
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
     * NEWS_STATUS_ : 消息状态(0待阅,1已阅)。
     */
    private Integer newsStatus;
    /**
     * 消息配置表.
     * @Transient
     */
    @HEntityId("newsId")
    private SysNews sysNews;
    /**
     * 消息配置表.
     * @Transient
     */
    private Bo bo = new Bo();
    
    /**
     * 消息状态转译.
     * @return String
     */
    @Transient
    public String getNewsStatusStr() {
        switch (this.newsStatus) {
            case 0: return "待阅";
            case 1: return "已阅";
            default: return "";
        }
    }
    
    /**
     * @author yinyanzhen
     */
    public class Bo implements Serializable {
        /**
         */
        private static final long serialVersionUID = -1572417384011491629L;
         //标题模糊查询.
        private String newsTitleLike;
        //查询开始时间.
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        private Date queryStartTime;
        //查询结束时间.
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        private Date queryEndTime;
        public String getNewsTitleLike() {
            return newsTitleLike;
        }
        public void setNewsTitleLike(String newsTitleLike) {
            this.newsTitleLike = newsTitleLike;
        }
        public Date getQueryStartTime() {
            return queryStartTime;
        }
        public void setQueryStartTime(Date queryStartTime) {
            this.queryStartTime = queryStartTime;
        }
        public Date getQueryEndTime() {
            return queryEndTime;
        }
        public void setQueryEndTime(Date queryEndTime) {
            this.queryEndTime = queryEndTime;
        }
    }    

    @Override
    @Transient
    public Long getId() {
        return getNewsInnerId();
    }

    @Override
    public void setId(Long id) {
        setNewsInnerId(id);
    }

    @Id
    @Column(name = "NEWS_INNER_ID_")
    public Long getNewsInnerId() {
        return newsInnerId;
    }

    public void setNewsInnerId(Long newsInnerId) {
        this.newsInnerId = newsInnerId;
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

    @Column(name = "NEWS_STATUS_")
    public Integer getNewsStatus() {
        return newsStatus;
    }

    public void setNewsStatus(Integer newsStatus) {
        this.newsStatus = newsStatus;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

    @Transient
    public SysNews getSysNews() {
        return sysNews;
    }

    public void setSysNews(SysNews sysNews) {
        this.sysNews = sysNews;
    }
    
    @Transient
    public Bo getBo() {
        return bo;
    }

    public void setBo(Bo bo) {
        this.bo = bo;
    }

}

/*
 * Project Name:hbm-base.
 * File Name:SysNews.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys.news;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 消息表: sys_news. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NEWS")
@DynamicInsert
public class SysNews extends BizEntity {

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
        TABLE_META.setAlias("sn");
        TABLE_META.addField("newsId", "NEWS_ID_", Long.class);
        TABLE_META.addField("newsTypeId", "NEWS_TYPE_ID_", Long.class);
        TABLE_META.addField("newsTempleteId", "NEWS_TEMPLETE_ID_", Long.class);
        TABLE_META.addField("newsFrom", "NEWS_FROM_", String.class);
        TABLE_META.addField("newsDoNode", "NEWS_DO_NODE_", Integer.class);
        TABLE_META.addField("bizId", "BIZ_ID_", Long.class);
        TABLE_META.addField("isInit", "IS_INIT_", Integer.class);
        TABLE_META.addField("newsStartTime", "NEWS_START_TIME_", Date.class);
        TABLE_META.addField("newsEndTime", "NEWS_END_TIME_", Integer.class);
        TABLE_META.addField("isToall", "IS_TOALL_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NEWS_ID_ : 主键。
     */
    private Long newsId;
    /**
     * NEWS_TYPE_ID_ : 消息类型id。
     */
    private Long newsTypeId;
    /**
     * NEWS_TEMPLETE_ID_ : 消息模版id。
     */
    private Long newsTempleteId;
    /**
     * NEWS_FROM_ : 消息来源。
     */
    private String newsFrom;
    /**
     * NEWS_DO_NODE_ : 消息触发节点。
     */
    private Integer newsDoNode;
    /**
     * BIZ_ID_ : 对应业务数据ID。
     */
    private Long bizId;
    /**
     * IS_INIT_ : 是否完成初始化(0否,1是),未初始化的为草稿消息。
     */
    private Integer isInit;
    /**
     * NEWS_START_TIME_ : 消息有效起始时间(为空时不设起始时间).
     */
    private Date newsStartTime;
    /**
     * NEWS_END_TIME_ : 消息有效终止时间(为空时为不设终止时间).
     */
    private Date newsEndTime;
    /**
     * IS_TOALL_ : 是否发送给所有用户0不是,1是。
     */
    private Integer isToall;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * 消息类别.
     * @Transient
     */
    @HEntityId("newsTypeId")
    private SysNewsType sysNewsType;
    /**
     * 消息模版.
     * @Transient
     */
    @HEntityId("newsTempleteId")
    private SysNewsTemplete sysNewsTemplete;
    /**
     * 业务辅助属性.
     * @Transient
     */
    private List<UserNew> userNews;
    
    @Override
    @Transient
    public Long getId() {
        return getNewsId();
    }

    @Override
    public void setId(Long id) {
        setNewsId(id);
    }

    @Id
    @Column(name = "NEWS_ID_")
    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    @Column(name = "NEWS_TYPE_ID_")
    public Long getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(Long newsTypeId) {
        this.newsTypeId = newsTypeId;
    }

    @Column(name = "NEWS_TEMPLETE_ID_")
    public Long getNewsTempleteId() {
        return newsTempleteId;
    }

    public void setNewsTempleteId(Long newsTempleteId) {
        this.newsTempleteId = newsTempleteId;
    }

    @Column(name = "NEWS_FROM_")
    public String getNewsFrom() {
        return newsFrom;
    }

    public void setNewsFrom(String newsFrom) {
        this.newsFrom = newsFrom;
    }

    @Column(name = "NEWS_DO_NODE_")
    public Integer getNewsDoNode() {
        return newsDoNode;
    }

    public void setNewsDoNode(Integer newsDoNode) {
        this.newsDoNode = newsDoNode;
    }

    @Column(name = "BIZ_ID_")
    public Long getBizId() {
        return bizId;
    }

    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }

    @Column(name = "IS_INIT_")
    public Integer getIsInit() {
        return isInit;
    }
    
    public void setIsInit(Integer isInit) {
        this.isInit = isInit;
    }

    @Column(name = "NEWS_START_TIME_")
    public Date getNewsStartTime() {
        return newsStartTime;
    }

    public void setNewsStartTime(Date newsStartTime) {
        this.newsStartTime = newsStartTime;
    }

    @Column(name = "NEWS_END_TIME_")
    public Date getNewsEndTime() {
        return newsEndTime;
    }

    public void setNewsEndTime(Date newsEndTime) {
        this.newsEndTime = newsEndTime;
    }

    @Column(name = "IS_TOALL_")
    public Integer getIsToall() {
        return isToall;
    }

    public void setIsToall(Integer isToall) {
        this.isToall = isToall;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Transient
    public SysNewsType getSysNewsType() {
        return sysNewsType;
    }

    public void setSysNewsType(SysNewsType sysNewsType) {
        this.sysNewsType = sysNewsType;
    }

    @Transient
    public SysNewsTemplete getSysNewsTemplete() {
        return sysNewsTemplete;
    }

    public void setSysNewsTemplete(SysNewsTemplete sysNewsTemplete) {
        this.sysNewsTemplete = sysNewsTemplete;
    }

    @Transient
    public List<UserNew> getUserNews() {
        return userNews;
    }

    public void setUserNews(List<UserNew> userNews) {
        this.userNews = userNews;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

    /**
     * 业务辅助类
     * ClassName: UserNew .<br/>
     *
     * @author yinyanzhen
     * @version SysNews
     * @since V1.0.0
     */
    public class UserNew implements Serializable {

        /**
         */
        private static final long serialVersionUID = -7470717055792896065L;
        /**
         * 用户id.
         */
        private Long userId;
        /**
         * 消息通知类型.
         */
        private String newsTypeCode;
        /**
         * 标题.
         */
        private String title;
        /**
         * 正文.
         */
        private String content;

        public Long getUserId() {
            return userId;
        }

        public void setUserId(Long userId) {
            this.userId = userId;
        }

        public String getNewsTypeCode() {
            return newsTypeCode;
        }

        public void setNewsTypeCode(String newsTypeCode) {
            this.newsTypeCode = newsTypeCode;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
        
        
       
    }
}

/*
 * Project Name:hbm-base.
 * File Name:SysNewsTemplete.java
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
 * 消息模版: sys_news_templete. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NEWS_TEMPLETE")
@DynamicInsert
public class SysNewsTemplete extends BizEntity {

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
        TABLE_META.setAlias("snt");
        TABLE_META.addField("newsTempleteId", "NEWS_TEMPLETE_ID_", Long.class);
        TABLE_META.addField("newsTypeId", "NEWS_TYPE_ID_", Long.class);
        TABLE_META.addField("templeteName", "TEMPLETE_NAME_", String.class);
        TABLE_META.addField("freemakerPath", "FREEMAKER_PATH_", String.class);
        TABLE_META.addField("timerLv", "TIMER_LV_", Integer.class);
        TABLE_META.addField("importantLv", "IMPORTANT_LV_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NEWS_TEMPLETE_ID_ : 主键。
     */
    private Long newsTempleteId;
    /**
     * NEWS_TYPE_ID_ : 消息类型表主键。
     */
    private Long newsTypeId;
    /**
     * TEMPLETE_NAME_ : 模版名称。
     */
    private String templeteName;
    /**
     * FREEMAKER_PATH_ : freemaker模版路径。
     */
    private String freemakerPath;
    /**
     * TIMER_LV_ : 优先级(0低,1普通,2高,3紧急)。
     */
    private Integer timerLv;
    /**
     * IMPORTANT_LV_ : 重要性(0低,1一般,2重要,3致命)。
     */
    private Integer importantLv;
    /**
     * DESCR_ : 描述(模版格式实例)。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getNewsTempleteId();
    }

    @Override
    public void setId(Long id) {
        setNewsTempleteId(id);
    }

    @Id
    @Column(name = "NEWS_TEMPLETE_ID_")
    public Long getNewsTempleteId() {
        return newsTempleteId;
    }

    public void setNewsTempleteId(Long newsTempleteId) {
        this.newsTempleteId = newsTempleteId;
    }

    @Column(name = "NEWS_TYPE_ID_")
    public Long getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(Long newsTypeId) {
        this.newsTypeId = newsTypeId;
    }

    @Column(name = "TEMPLETE_NAME_")
    public String getTempleteName() {
        return templeteName;
    }

    public void setTempleteName(String templeteName) {
        this.templeteName = templeteName;
    }

    @Column(name = "FREEMAKER_PATH_")
    public String getFreemakerPath() {
        return freemakerPath;
    }

    public void setFreemakerPath(String freemakerPath) {
        this.freemakerPath = freemakerPath;
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

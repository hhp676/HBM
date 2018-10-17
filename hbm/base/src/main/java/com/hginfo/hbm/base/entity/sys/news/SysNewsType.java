/*
 * Project Name:hbm-base.
 * File Name:SysNewsType.java
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
 * 消息类型表: sys_news_type. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NEWS_TYPE")
@DynamicInsert
public class SysNewsType extends BizEntity {

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
        TABLE_META.addField("newsTypeId", "NEWS_TYPE_ID_", Long.class);
        TABLE_META.addField("newsTypeCode", "NEWS_TYPE_CODE_", String.class);
        TABLE_META.addField("newsTypeName", "NEWS_TYPE_NAME_", String.class);
        TABLE_META.addField("isIn", "IS_IN_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NEWS_TYPE_ID_ : 主键。
     */
    private Long newsTypeId;
    /**
     * NEWS_TYPE_CODE_ : 消息类型编码。
     */
    private String newsTypeCode;
    /**
     * NEWS_TYPE_NAME_ : 消息类型名称。
     */
    private String newsTypeName;
    /**
     * IS_IN_ : 是否系统内部消息(0否,1是)。
     */
    private Integer isIn;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getNewsTypeId();
    }

    @Override
    public void setId(Long id) {
        setNewsTypeId(id);
    }

    @Id
    @Column(name = "NEWS_TYPE_ID_")
    public Long getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(Long newsTypeId) {
        this.newsTypeId = newsTypeId;
    }

    @Column(name = "NEWS_TYPE_CODE_")
    public String getNewsTypeCode() {
        return newsTypeCode;
    }

    public void setNewsTypeCode(String newsTypeCode) {
        this.newsTypeCode = newsTypeCode;
    }

    @Column(name = "NEWS_TYPE_NAME_")
    public String getNewsTypeName() {
        return newsTypeName;
    }

    public void setNewsTypeName(String newsTypeName) {
        this.newsTypeName = newsTypeName;
    }

    @Column(name = "IS_IN_")
    public Integer getIsIn() {
        return isIn;
    }

    public void setIsIn(Integer isIn) {
        this.isIn = isIn;
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

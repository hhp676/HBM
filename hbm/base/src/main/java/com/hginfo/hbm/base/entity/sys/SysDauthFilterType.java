/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterType.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HDict;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hvalidate.annotation.HValidFieldName;

/**
 * 数据权限过滤类型表: sys_dauth_filter_type. <br />
 * entity 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_FILTER_TYPE")
@DynamicInsert
public class SysDauthFilterType extends BizEntity {

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
        TABLE_META.setAlias("sdft");
        TABLE_META.addField("filterTypeId", "FILTER_TYPE_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("filterTypeCode", "FILTER_TYPE_CODE_", String.class);
        TABLE_META.addField("filterTypeName", "FILTER_TYPE_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("type", "TYPE_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * FILTER_TYPE_ID_ : 过滤类型编号。
     */
    private Long filterTypeId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * FILTER_TYPE_CODE_ : 过滤类型编码。
     */
    @NotNull
    @HValidFieldName("过滤类型编码")
    private String filterTypeCode;
    /**
     * FILTER_TYPE_NAME_ : 过滤类型名称（数值型表字段、字符型表字段、当前用户岗位、当前用户职务、无字段）。
     */
    @NotNull
    @HValidFieldName("过滤类型名称")
    private String filterTypeName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * TYPE_ : 类型（普通类型--数据库字段、系统变量）。
     */
    @NotNull
    @HDict(groupCode = "DAUTH_FILTER_TYPE_TYPE")
    @HValidFieldName("类型")
    private Integer type;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getFilterTypeId();
    }

    @Override
    public void setId(Long id) {
        setFilterTypeId(id);
    }

    @Id
    @Column(name = "FILTER_TYPE_ID_")
    public Long getFilterTypeId() {
        return filterTypeId;
    }

    public void setFilterTypeId(Long filterTypeId) {
        this.filterTypeId = filterTypeId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "FILTER_TYPE_CODE_")
    public String getFilterTypeCode() {
        return filterTypeCode;
    }

    public void setFilterTypeCode(String filterTypeCode) {
        this.filterTypeCode = filterTypeCode;
    }

    @Column(name = "FILTER_TYPE_NAME_")
    public String getFilterTypeName() {
        return filterTypeName;
    }

    public void setFilterTypeName(String filterTypeName) {
        this.filterTypeName = filterTypeName;
    }

    @Column(name = "ENG_NAME_")
    public String getEngName() {
        return engName;
    }

    public void setEngName(String engName) {
        this.engName = engName;
    }

    @Column(name = "I18N_CODE_")
    public String getI18nCode() {
        return i18nCode;
    }

    public void setI18nCode(String i18nCode) {
        this.i18nCode = i18nCode;
    }

    @Column(name = "TYPE_")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

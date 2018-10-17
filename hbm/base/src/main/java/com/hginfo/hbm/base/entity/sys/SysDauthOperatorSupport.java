/*
 * Project Name:hbm-base.
 * File Name:SysDauthOperatorSupport.java
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

import com.hginfo.hbm.annotation.HEntityId;
import org.hibernate.annotations.DynamicInsert;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HDict;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hvalidate.annotation.HValidFieldName;

/**
 * 数据权限运算符支持表: sys_dauth_operator_support. <br />
 * entity 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_OPERATOR_SUPPORT")
@DynamicInsert
public class SysDauthOperatorSupport extends BizEntity {

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
        TABLE_META.setAlias("sdos");
        TABLE_META.addField("supportId", "SUPPORT_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("filterTypeId", "FILTER_TYPE_ID_", Long.class);
        TABLE_META.addField("operatorId", "OPERATOR_ID_", Long.class);
        TABLE_META.addField("valueType", "VALUE_TYPE_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("dauthFilterType", SysDauthFilterType.TABLE_META);
        TABLE_META.addAssociation("dauthOperator", SysDauthOperator.TABLE_META);
    }
    

    /**
     * SUPPORT_ID_ : 关系编号。
     */
    private Long supportId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * FILTER_TYPE_ID_ : 过滤类型ID。
     */
    @NotNull
    @HValidFieldName("过滤类型")
    private Long filterTypeId;
    /**
     * OPERATOR_ID_ : 条件ID。
     */
    @NotNull
    @HValidFieldName("运算符")
    private Long operatorId;
    /**
     * VALUE_TYPE_ : 值类型（当前用户、职务、岗位、数据权限变量、自定义值、自定义SQL）。
     */
    @NotNull
    @HDict(groupCode = "DAUTH_FILTER_VALUE_TYPE")
    @HValidFieldName("值类型")
    private Integer valueType;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    
    /**
     * 过滤类型。
     */
    @HEntityId("filterTypeId")
    private SysDauthFilterType dauthFilterType;
    /**
     * 运算符。
     */
    @HEntityId("operatorId")
    private SysDauthOperator dauthOperator;
    

    @Override
    @Transient
    public Long getId() {
        return getSupportId();
    }

    @Override
    public void setId(Long id) {
        setSupportId(id);
    }

    @Id
    @Column(name = "SUPPORT_ID_")
    public Long getSupportId() {
        return supportId;
    }

    public void setSupportId(Long supportId) {
        this.supportId = supportId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "FILTER_TYPE_ID_")
    public Long getFilterTypeId() {
        return filterTypeId;
    }

    public void setFilterTypeId(Long filterTypeId) {
        this.filterTypeId = filterTypeId;
    }

    @Column(name = "OPERATOR_ID_")
    public Long getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }

    @Column(name = "VALUE_TYPE_")
    public Integer getValueType() {
        return valueType;
    }

    public void setValueType(Integer valueType) {
        this.valueType = valueType;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Transient
    public SysDauthFilterType getDauthFilterType() {
        return dauthFilterType;
    }

    public void setDauthFilterType(SysDauthFilterType dauthFilterType) {
        this.dauthFilterType = dauthFilterType;
    }

    @Transient
    public SysDauthOperator getDauthOperator() {
        return dauthOperator;
    }

    public void setDauthOperator(SysDauthOperator dauthOperator) {
        this.dauthOperator = dauthOperator;
    }
    
    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

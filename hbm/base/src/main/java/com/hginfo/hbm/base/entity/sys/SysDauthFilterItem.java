/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterItem.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月30日 上午9:41:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hvalidate.annotation.HValidFieldName;

import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import java.util.Date;

/**
 * 数据权限过滤器项: sys_dauth_filter_item. <br />
 * entity 层 <br />
 * Date: 2016年12月30日 上午9:41:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_FILTER_ITEM")
@DynamicInsert
public class SysDauthFilterItem extends BizEntity {

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
        TABLE_META.setAlias("sdfi");
        TABLE_META.addField("filterItemId", "FILTER_ITEM_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("entityId", "ENTITY_ID_", Long.class);
        TABLE_META.addField("filterTypeId", "FILTER_TYPE_ID_", Long.class);
        TABLE_META.addField("fieldId", "FIELD_ID_", Long.class);
        TABLE_META.addField("operatorId", "OPERATOR_ID_", Long.class);
        TABLE_META.addField("valueType", "VALUE_TYPE_", Integer.class);
        TABLE_META.addField("filterValue", "FILTER_VALUE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysDauthFilterType", SysDauthFilterType.TABLE_META);
        TABLE_META.addAssociation("sysDauthOperator", SysDauthOperator.TABLE_META);
        TABLE_META.addAssociation("sysMetadataField", SysMetadataField.TABLE_META);
    }

    /**
     * FILTER_ITEM_ID_ : 过滤器编号。
     */
    private Long filterItemId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * ENTITY_ID_ : 实体ID。
     */
    private Long entityId;
    /**
     * FILTER_TYPE_ID_ : 过滤类型ID。
     */
    @NotNull
    @HValidFieldName("过滤类型")
    private Long filterTypeId;
    /**
     * FIELD_ID_ : 字段ID。
     */
    private Long fieldId;
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
    @HValidFieldName("过滤值类型")
    private Integer valueType;
    /**
     * FILTER_VALUE_ : 值，如果类型是公共范围时，此字段与sys_dauth_variable关联。
     */
    @NotNull
    @HValidFieldName("过滤值")
    private String filterValue;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * filterTypeId : 数据权限过滤类型表实体。
     */
    @HEntityId("filterTypeId")
    private SysDauthFilterType sysDauthFilterType;
    /**
     * operatorId : 数据权限运算符表实体。
     */
    @HEntityId("operatorId")
    private SysDauthOperator sysDauthOperator;
    /**
     * fieldId : 元数据字段表实体。
     */
    @HEntityId("fieldId")
    private SysMetadataField sysMetadataField;
    
    
    /**
     * 过滤值的显示。
     */
    private String filterValueStr;
    

    @Override
    @Transient
    public Long getId() {
        return getFilterItemId();
    }

    @Override
    public void setId(Long id) {
        setFilterItemId(id);
    }

    @Id
    @Column(name = "FILTER_ITEM_ID_")
    public Long getFilterItemId() {
        return filterItemId;
    }

    public void setFilterItemId(Long filterItemId) {
        this.filterItemId = filterItemId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "ENTITY_ID_")
    public Long getEntityId() {
        return entityId;
    }

    public void setEntityId(Long entityId) {
        this.entityId = entityId;
    }

    @Column(name = "FILTER_TYPE_ID_")
    public Long getFilterTypeId() {
        return filterTypeId;
    }

    public void setFilterTypeId(Long filterTypeId) {
        this.filterTypeId = filterTypeId;
    }

    @Column(name = "FIELD_ID_")
    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
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

    @Column(name = "FILTER_VALUE_")
    public String getFilterValue() {
        return filterValue;
    }

    public void setFilterValue(String filterValue) {
        this.filterValue = filterValue;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysDauthFilterType getSysDauthFilterType() {
        return sysDauthFilterType;
    }

    public void setSysDauthFilterType(SysDauthFilterType sysDauthFilterType) {
        this.sysDauthFilterType = sysDauthFilterType;
    }

    @Transient
    public SysDauthOperator getSysDauthOperator() {
        return sysDauthOperator;
    }

    public void setSysDauthOperator(SysDauthOperator sysDauthOperator) {
        this.sysDauthOperator = sysDauthOperator;
    }

    @Transient
    public SysMetadataField getSysMetadataField() {
        return sysMetadataField;
    }

    public void setSysMetadataField(SysMetadataField sysMetadataField) {
        this.sysMetadataField = sysMetadataField;
    }
    
    @Transient
    public String getFilterValueStr() {
        return filterValueStr;
    }

    public void setFilterValueStr(String filterValueStr) {
        this.filterValueStr = filterValueStr;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

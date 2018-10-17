/*
 * Project Name:hbm-base.
 * File Name:SysMetadataField.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 元数据字段表: sys_metadata_field. <br />
 * entity 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_METADATA_FIELD")
@DynamicInsert
public class SysMetadataField extends BizEntity {

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
        TABLE_META.setAlias("smf");
        TABLE_META.addField("fieldId", "FIELD_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("entityId", "ENTITY_ID_", Long.class);
        TABLE_META.addField("filterTypeId", "FILTER_TYPE_ID_", Long.class);
        TABLE_META.addField("fieldCode", "FIELD_CODE_", String.class);
        TABLE_META.addField("fieldName", "FIELD_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("columnName", "COLUMN_NAME_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysDauthFilterType", SysDauthFilterType.TABLE_META);
        TABLE_META.addAssociation("sysMetadataEntity", SysMetadataEntity.TABLE_META);
    }

    /**
     * FIELD_ID_ : 字段编号。
     */
    private Long fieldId;
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
    private Long filterTypeId;
    /**
     * FIELD_CODE_ : 字段编码。
     */
    private String fieldCode;
    /**
     * FIELD_NAME_ : 字段名称。
     */
    private String fieldName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * COLUMN_NAME_ : 列名。
     */
    private String columnName;
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
     * entityId : 元数据实体表实体。
     */
    @HEntityId("entityId")
    private SysMetadataEntity sysMetadataEntity;

    @Override
    @Transient
    public Long getId() {
        return getFieldId();
    }

    @Override
    public void setId(Long id) {
        setFieldId(id);
    }

    @Id
    @Column(name = "FIELD_ID_")
    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
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

    @Column(name = "FIELD_CODE_")
    public String getFieldCode() {
        return fieldCode;
    }

    public void setFieldCode(String fieldCode) {
        this.fieldCode = fieldCode;
    }

    @Column(name = "FIELD_NAME_")
    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
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

    @Column(name = "COLUMN_NAME_")
    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
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
    public SysMetadataEntity getSysMetadataEntity() {
        return sysMetadataEntity;
    }

    public void setSysMetadataEntity(SysMetadataEntity sysMetadataEntity) {
        this.sysMetadataEntity = sysMetadataEntity;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

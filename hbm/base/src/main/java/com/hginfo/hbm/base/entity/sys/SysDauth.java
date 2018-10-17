/*
 * Project Name:hbm-base.
 * File Name:SysDauth.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年01月12日 下午6:28:35
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hvalidate.annotation.HValidFieldName;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 数据权限表: sys_dauth. <br />
 * entity 层 <br />
 * Date: 2017年01月12日 下午6:28:35 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH")
@DynamicInsert
public class SysDauth extends BizEntity {

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
        TABLE_META.setAlias("sd");
        TABLE_META.addField("dauthId", "DAUTH_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("entityId", "ENTITY_ID_", Long.class);
        TABLE_META.addField("dauthCode", "DAUTH_CODE_", String.class);
        TABLE_META.addField("dauthName", "DAUTH_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("tableAlias", "TABLE_ALIAS_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysMetadataEntity", SysMetadataEntity.TABLE_META);
    }

    /**
     * DAUTH_ID_ : 数据权限编号。
     */
    private Long dauthId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * ENTITY_ID_ : 实体ID。
     */
    private Long entityId;
    /**
     * DAUTH_CODE_ : 数据权限编码。
     */
    @NotEmpty
    @HValidFieldName("数据权限编码")
    private String dauthCode;
    /**
     * DAUTH_NAME_ : 数据权限名称。
     */
    private String dauthName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * TABLE_ALIAS_ : 表别名。
     */
    private String tableAlias;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * entityId : 元数据实体表实体。
     */
    @HEntityId("entityId")
    private SysMetadataEntity sysMetadataEntity;

    @Override
    @Transient
    public Long getId() {
        return getDauthId();
    }

    @Override
    public void setId(Long id) {
        setDauthId(id);
    }

    @Id
    @Column(name = "DAUTH_ID_")
    public Long getDauthId() {
        return dauthId;
    }

    public void setDauthId(Long dauthId) {
        this.dauthId = dauthId;
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

    @Column(name = "DAUTH_CODE_")
    public String getDauthCode() {
        return dauthCode;
    }

    public void setDauthCode(String dauthCode) {
        this.dauthCode = dauthCode;
    }

    @Column(name = "DAUTH_NAME_")
    public String getDauthName() {
        return dauthName;
    }

    public void setDauthName(String dauthName) {
        this.dauthName = dauthName;
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

    @Column(name = "TABLE_ALIAS_")
    public String getTableAlias() {
        return tableAlias;
    }

    public void setTableAlias(String tableAlias) {
        this.tableAlias = tableAlias;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
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

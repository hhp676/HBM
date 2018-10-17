/*
 * Project Name:hbm-base.
 * File Name:SysMetaConstraintDef.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年05月08日 下午3:55:58
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;


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
 * 约束定义表: sys_meta_constraint_def. <br />
 * entity 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_META_CONSTRAINT_DEF")
@DynamicInsert
public class SysMetaConstraintDef extends BizEntity {

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
        TABLE_META.setAlias("smcdf");
        TABLE_META.addField("defId", "DEF_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("entityId", "ENTITY_ID_", Long.class);
        TABLE_META.addField("defCode", "DEF_CODE_", String.class);
        TABLE_META.addField("defName", "DEF_NAME_", String.class);
        TABLE_META.addField("defType", "DEF_TYPE_", Integer.class);
        TABLE_META.addField("refId", "REF_ID_", Long.class);
        TABLE_META.addField("errorMsg", "ERROR_MSG_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);

        TABLE_META.addAssociation("metaEntity", SysMetadataEntity.TABLE_META);
    }

    /**
     * DEF_ID_ : 约束定义编号。
     */
    private Long defId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * ENTITY_ID_ : 实体编号。
     */
    private Long entityId;
    /**
     * DEF_CODE_ : 约束编码。
     */
    private String defCode;
    /**
     * DEF_NAME_ : 约束名称。
     */
    private String defName;
    /**
     * DEF_TYPE_ : 约束类型(1主键约束，2外键约束，3唯一约束)。
     */
    private Integer defType;
    /**
     * REF_ID_ : 关联约束。
     */
    private Long refId;
    /**
     * ERROR_MSG_ : 错误提示信息。
     */
    private String errorMsg;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @HEntityId("entityId")
    private SysMetadataEntity metaEntity;

    @Override
    @Transient
    public Long getId() {
        return getDefId();
    }

    @Override
    public void setId(Long id) {
        setDefId(id);
    }

    @Id
    @Column(name = "DEF_ID_")
    public Long getDefId() {
        return defId;
    }

    public void setDefId(Long defId) {
        this.defId = defId;
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

    @Column(name = "DEF_CODE_")
    public String getDefCode() {
        return defCode;
    }

    public void setDefCode(String defCode) {
        this.defCode = defCode;
    }

    @Column(name = "DEF_NAME_")
    public String getDefName() {
        return defName;
    }

    public void setDefName(String defName) {
        this.defName = defName;
    }

    @Column(name = "DEF_TYPE_")
    public Integer getDefType() {
        return defType;
    }

    public void setDefType(Integer defType) {
        this.defType = defType;
    }

    @Column(name = "REF_ID_")
    public Long getRefId() {
        return refId;
    }

    public void setRefId(Long refId) {
        this.refId = refId;
    }

    @Column(name = "ERROR_MSG_")
    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
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

    @Transient
    public SysMetadataEntity getMetaEntity() {
        return metaEntity;
    }

    public void setMetaEntity(SysMetadataEntity metaEntity) {
        this.metaEntity = metaEntity;
    }
}

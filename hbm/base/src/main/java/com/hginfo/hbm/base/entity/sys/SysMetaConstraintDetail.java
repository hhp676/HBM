/*
 * Project Name:hbm-base.
 * File Name:SysMetaConstraintDetail.java
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
 * 约束字段表: sys_meta_constraint_detail. <br />
 * entity 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_META_CONSTRAINT_DETAIL")
@DynamicInsert
public class SysMetaConstraintDetail extends BizEntity {

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
        TABLE_META.setAlias("smcdt");
        TABLE_META.addField("detailId", "DETAIL_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("defId", "DEF_ID_", Long.class);
        TABLE_META.addField("fieldId", "FIELD_ID_", Long.class);
        TABLE_META.addField("refDetailId", "REF_DETAIL_ID_", Long.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);

        TABLE_META.addAssociation("field", SysMetadataField.TABLE_META);

    }

    /**
     * DETAIL_ID_ : 明细编号。
     */
    private Long detailId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * DEF_ID_ : 定义编号。
     */
    private Long defId;
    /**
     * FIELD_ID_ : 字段编号。
     */
    private Long fieldId;
    /**
     * REF_DETAIL_ID_ : 关联明细编号。
     */
    private Long refDetailId;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    /**
     * 关联实体字段。
     */
    @HEntityId("fieldId")
    private SysMetadataField field;

    @Override
    @Transient
    public Long getId() {
        return getDetailId();
    }

    @Override
    public void setId(Long id) {
        setDetailId(id);
    }

    @Id
    @Column(name = "DETAIL_ID_")
    public Long getDetailId() {
        return detailId;
    }

    public void setDetailId(Long detailId) {
        this.detailId = detailId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "DEF_ID_")
    public Long getDefId() {
        return defId;
    }

    public void setDefId(Long defId) {
        this.defId = defId;
    }

    @Column(name = "FIELD_ID_")
    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
    }

    @Column(name = "REF_DETAIL_ID_")
    public Long getRefDetailId() {
        return refDetailId;
    }

    public void setRefDetailId(Long refDetailId) {
        this.refDetailId = refDetailId;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysMetadataField getField() {
        return field;
    }

    public void setField(SysMetadataField field) {
        this.field = field;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

/*
 * Project Name:hbm-base.
 * File Name:SysExtendField.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:36
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 扩展字段表: sys_extend_field. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_EXTEND_FIELD")
@DynamicInsert
public class SysExtendField extends BizEntity {

    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表元数据。
     */
    private static final TableMeta TABLE_META = new TableMeta();

    static {
        TABLE_META.setAlias("sef");
        TABLE_META.addField("extendId", "EXTEND_ID_", Long.class);
        TABLE_META.addField("extendDefId", "EXTEND_DEF_ID_", Long.class);
        TABLE_META.addField("bizId", "BIZ_ID_", Long.class);
        TABLE_META.addField("value", "VALUE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * EXTEND_ID_ : 扩展字段编号。
     */
    private Long extendId;
    /**
     * EXTEND_DEF_ID_ : 扩展字段定义编号。
     */
    private Long extendDefId;
    /**
     * BIZ_ID_ : 被扩展表编号。
     */
    private Long bizId;
    /**
     * VALUE_ : 。
     */
    private String value;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * extendDefId : 扩展字段定义表实体。
     */
    private SysExtendFieldDef sysExtendFieldDef;

    @Override
    @Transient
    public Long getId() {
        return getExtendId();
    }

    @Override
    public void setId(Long id) {
        setExtendId(id);
    }

    @Id
    @Column(name = "EXTEND_ID_")
    public Long getExtendId() {
        return extendId;
    }

    public void setExtendId(Long extendId) {
        this.extendId = extendId;
    }

    @Column(name = "EXTEND_DEF_ID_")
    public Long getExtendDefId() {
        return extendDefId;
    }

    public void setExtendDefId(Long extendDefId) {
        this.extendDefId = extendDefId;
    }

    @Column(name = "BIZ_ID_")
    public Long getBizId() {
        return bizId;
    }

    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }

    @Column(name = "VALUE_")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysExtendFieldDef getSysExtendFieldDef() {
        return sysExtendFieldDef;
    }

    public void setSysExtendFieldDef(SysExtendFieldDef sysExtendFieldDef) {
        this.sysExtendFieldDef = sysExtendFieldDef;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

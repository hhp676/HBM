/**
 * Project Name:hbm-base.
 * File Name:SysExtendFieldDef.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年11月30日 上午10:26:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
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
 * 扩展字段定义表: sys_extend_field_def. <br />
 * entity 层 <br />
 * Date: 2016年11月30日 上午10:26:48 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_EXTEND_FIELD_DEF")
@DynamicInsert
public class SysExtendFieldDef extends BizEntity {

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
        TABLE_META.setAlias("sefd");
        TABLE_META.addField("extendDefId", "EXTEND_DEF_ID_", Long.class);
        TABLE_META.addField("tableCode", "TABLE_CODE_", String.class);
        TABLE_META.addField("fieldCode", "FIELD_CODE_", String.class);
        TABLE_META.addField("fieldName", "FIELD_NAME_", String.class);
        TABLE_META.addField("filedType", "FILED_TYPE_", String.class);
        TABLE_META.addField("defaultValue", "DEFAULT_VALUE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * EXTEND_DEF_ID_ : 扩展字段编号.
     */
    private Long extendDefId;
    /**
     * TABLE_CODE_ : 扩展表编码.
     */
    private String tableCode;
    /**
     * FIELD_CODE_ : 扩展字段编码.
     */
    private String fieldCode;
    /**
     * FIELD_NAME_ : 扩展字段名.
     */
    private String fieldName;
    /**
     * FILED_TYPE_ : 扩展字段类型.
     */
    private String filedType;
    /**
     * DEFAULT_VALUE_ : 默认值.
     */
    private String defaultValue;
    /**
     * DESCR_ : 描述.
     */
    private String descr;


    @Override
    @Transient
    public Long getId() {
        return getExtendDefId();
    }

    @Override
    public void setId(Long id) {
        setExtendDefId(id);
    }

    @Id
    @Column(name = "EXTEND_DEF_ID_")
    public Long getExtendDefId() {
        return extendDefId;
    }

    public void setExtendDefId(Long extendDefId) {
        this.extendDefId = extendDefId;
    }

    @Column(name = "TABLE_CODE_")
    public String getTableCode() {
        return tableCode;
    }

    public void setTableCode(String tableCode) {
        this.tableCode = tableCode;
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

    @Column(name = "FILED_TYPE_")
    public String getFiledType() {
        return filedType;
    }

    public void setFiledType(String filedType) {
        this.filedType = filedType;
    }

    @Column(name = "DEFAULT_VALUE_")
    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
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

/*
 * Project Name:hbm-base.
 * File Name:SysDauthVariable.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年01月10日 上午10:58:32
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
 * 数据权限变量表: sys_dauth_variable. <br />
 * entity 层 <br />
 * Date: 2017年01月10日 上午10:58:32 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_VARIABLE")
@DynamicInsert
public class SysDauthVariable extends BizEntity {

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
        TABLE_META.setAlias("sdv");
        TABLE_META.addField("variableId", "VARIABLE_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("variableCode", "VARIABLE_CODE_", String.class);
        TABLE_META.addField("variableName", "VARIABLE_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("variableValue", "VARIABLE_VALUE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * VARIABLE_ID_ : 变量编号。
     */
    private Long variableId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * VARIABLE_CODE_ : 变量编码。
     */
    private String variableCode;
    /**
     * VARIABLE_NAME_ : 变量名称。
     */
    private String variableName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * VARIABLE_VALUE_ : 变量值。
     */
    private String variableValue;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getVariableId();
    }

    @Override
    public void setId(Long id) {
        setVariableId(id);
    }

    @Id
    @Column(name = "VARIABLE_ID_")
    public Long getVariableId() {
        return variableId;
    }

    public void setVariableId(Long variableId) {
        this.variableId = variableId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "VARIABLE_CODE_")
    public String getVariableCode() {
        return variableCode;
    }

    public void setVariableCode(String variableCode) {
        this.variableCode = variableCode;
    }

    @Column(name = "VARIABLE_NAME_")
    public String getVariableName() {
        return variableName;
    }

    public void setVariableName(String variableName) {
        this.variableName = variableName;
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

    @Column(name = "VARIABLE_VALUE_")
    public String getVariableValue() {
        return variableValue;
    }

    public void setVariableValue(String variableValue) {
        this.variableValue = variableValue;
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

/*
 * Project Name:hbm-base.
 * File Name:SysDauthOperator.java
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

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.validator.constraints.NotEmpty;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hvalidate.annotation.HValidFieldName;

/**
 * 数据权限运算符表: sys_dauth_operator. <br />
 * entity 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_OPERATOR")
@DynamicInsert
public class SysDauthOperator extends BizEntity {

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
        TABLE_META.setAlias("sdo");
        TABLE_META.addField("operatorId", "OPERATOR_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("operatorCode", "OPERATOR_CODE_", String.class);
        TABLE_META.addField("operatorName", "OPERATOR_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("operatorValue", "OPERATOR_VALUE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * OPERATOR_ID_ : 运算符编号。
     */
    private Long operatorId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * OPERATOR_CODE_ : 运算符编码。
     */
    @NotEmpty
    @HValidFieldName("运算符编码")
    private String operatorCode;
    /**
     * OPERATOR_NAME_ : 运算符名称。
     */
    @NotEmpty
    @HValidFieldName("运算符名称")
    private String operatorName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * OPERATOR_VALUE_ : 运算符值。
     */
    @NotEmpty
    @HValidFieldName("运算符值")
    private String operatorValue;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getOperatorId();
    }

    @Override
    public void setId(Long id) {
        setOperatorId(id);
    }

    @Id
    @Column(name = "OPERATOR_ID_")
    public Long getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "OPERATOR_CODE_")
    public String getOperatorCode() {
        return operatorCode;
    }

    public void setOperatorCode(String operatorCode) {
        this.operatorCode = operatorCode;
    }

    @Column(name = "OPERATOR_NAME_")
    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
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

    @Column(name = "OPERATOR_VALUE_")
    public String getOperatorValue() {
        return operatorValue;
    }

    public void setOperatorValue(String operatorValue) {
        this.operatorValue = operatorValue;
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

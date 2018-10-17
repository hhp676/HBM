/*
 * Project Name:hbm-base.
 * File Name:SysDauthUsage.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年02月08日 上午11:20:21
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
 * 数据权限应用表: sys_dauth_usage. <br />
 * entity 层 <br />
 * Date: 2017年02月08日 上午11:20:21 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_USAGE")
@DynamicInsert
public class SysDauthUsage extends BizEntity {

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
        TABLE_META.setAlias("sdu");
        TABLE_META.addField("usageId", "USAGE_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("dauthId", "DAUTH_ID_", Long.class);
        TABLE_META.addField("methodName", "METHOD_NAME_", String.class);
        TABLE_META.addField("methodShortName", "METHOD_SHORT_NAME_", String.class);
        TABLE_META.addField("methodZhName", "METHOD_ZH_NAME_", String.class);
        TABLE_META.addField("methodEngName", "METHOD_ENG_NAME_", String.class);
        TABLE_META.addField("methodI18nCode", "METHOD_I18N_CODE_", String.class);
        TABLE_META.addField("isValid", "IS_VALID_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysDauth", SysDauth.TABLE_META);
    }

    /**
     * USAGE_ID_ : 应用编号。
     */
    private Long usageId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * DAUTH_ID_ : 数据权限ID。
     */
    private Long dauthId;
    /**
     * METHOD_NAME_ : 方法名(格式为：com.hginfo.xx.method)。
     */
    private String methodName;
    /**
     * METHOD_SHORT_NAME_ : 方法名简写，无包名(格式为：xx.method)。
     */
    private String methodShortName;
    /**
     * METHOD_ZH_NAME_ : 中文名称。
     */
    private String methodZhName;
    /**
     * METHOD_ENG_NAME_ : 英文名称。
     */
    private String methodEngName;
    /**
     * METHOD_I18N_CODE_ : 国际化编码。
     */
    private String methodI18nCode;
    /**
     * IS_VALID_ : 方法是否在用（0:在用，1:不再用 与mapper/dao方法不再匹配时则不再用）。
     */
    private Integer isValid;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * dauthId : 数据权限表实体。
     */
    @HEntityId("dauthId")
    private SysDauth sysDauth;

    @Override
    @Transient
    public Long getId() {
        return getUsageId();
    }

    @Override
    public void setId(Long id) {
        setUsageId(id);
    }

    @Id
    @Column(name = "USAGE_ID_")
    public Long getUsageId() {
        return usageId;
    }

    public void setUsageId(Long usageId) {
        this.usageId = usageId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "DAUTH_ID_")
    public Long getDauthId() {
        return dauthId;
    }

    public void setDauthId(Long dauthId) {
        this.dauthId = dauthId;
    }

    @Column(name = "METHOD_NAME_")
    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    @Column(name = "METHOD_SHORT_NAME_")
    public String getMethodShortName() {
        return methodShortName;
    }

    public void setMethodShortName(String methodShortName) {
        this.methodShortName = methodShortName;
    }

    @Column(name = "METHOD_ZH_NAME_")
    public String getMethodZhName() {
        return methodZhName;
    }

    public void setMethodZhName(String methodZhName) {
        this.methodZhName = methodZhName;
    }

    @Column(name = "METHOD_ENG_NAME_")
    public String getMethodEngName() {
        return methodEngName;
    }

    public void setMethodEngName(String methodEngName) {
        this.methodEngName = methodEngName;
    }

    @Column(name = "METHOD_I18N_CODE_")
    public String getMethodI18nCode() {
        return methodI18nCode;
    }

    public void setMethodI18nCode(String methodI18nCode) {
        this.methodI18nCode = methodI18nCode;
    }

    @Column(name = "IS_VALID_")
    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysDauth getSysDauth() {
        return sysDauth;
    }

    public void setSysDauth(SysDauth sysDauth) {
        this.sysDauth = sysDauth;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

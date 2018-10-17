/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterGroup.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年01月13日 下午3:52:02
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
 * 数据权限过滤器组: sys_dauth_filter_group. <br />
 * entity 层 <br />
 * Date: 2017年01月13日 下午3:52:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_FILTER_GROUP")
@DynamicInsert
public class SysDauthFilterGroup extends BizEntity {

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
        TABLE_META.setAlias("sdfg");
        TABLE_META.addField("filterGroupId", "FILTER_GROUP_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("dauthId", "DAUTH_ID_", Long.class);
        TABLE_META.addField("groupCode", "GROUP_CODE_", String.class);
        TABLE_META.addField("groupName", "GROUP_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("configType", "CONFIG_TYPE_", Integer.class);
        TABLE_META.addField("bizId", "BIZ_ID_", Long.class);
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
     * FILTER_GROUP_ID_ : 过滤器组编号。
     */
    private Long filterGroupId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * DAUTH_ID_ : 数据权限ID。
     */
    private Long dauthId;
    /**
     * GROUP_CODE_ : 过滤器组编码。
     */
    private String groupCode;
    /**
     * GROUP_NAME_ : 过滤器组名称。
     */
    private String groupName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * CONFIG_TYPE_ : 配置类型（0:数据权限配置 1:岗位配置）。
     */
    private Integer configType;
    /**
     * BIZ_ID_ : 业务ID，通过数据权限配置时为null。
     */
    private Long bizId;
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
        return getFilterGroupId();
    }

    @Override
    public void setId(Long id) {
        setFilterGroupId(id);
    }

    @Id
    @Column(name = "FILTER_GROUP_ID_")
    public Long getFilterGroupId() {
        return filterGroupId;
    }

    public void setFilterGroupId(Long filterGroupId) {
        this.filterGroupId = filterGroupId;
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

    @Column(name = "GROUP_CODE_")
    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    @Column(name = "GROUP_NAME_")
    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
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

    @Column(name = "CONFIG_TYPE_")
    public Integer getConfigType() {
        return configType;
    }

    public void setConfigType(Integer configType) {
        this.configType = configType;
    }

    @Column(name = "BIZ_ID_")
    public Long getBizId() {
        return bizId;
    }

    public void setBizId(Long bizId) {
        this.bizId = bizId;
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

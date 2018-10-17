/*
 * Project Name:hbm-base.
 * File Name:SysOrganization.java
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
 * 组织架构表: sys_organization. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_ORGANIZATION")
@DynamicInsert
public class SysOrganization extends BizEntity {

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
        TABLE_META.setAlias("so");
        TABLE_META.addField("orgId", "ORG_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("orgName", "ORG_NAME_", String.class);
        TABLE_META.addField("orgFullname", "ORG_FULLNAME_", String.class);
        TABLE_META.addField("orgCode", "ORG_CODE_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("fid", "FID_", Long.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * ORG_ID_ : 部门编号。
     */
    private Long orgId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * ORG_NAME_ : 部门名称。
     */
    private String orgName;
    /**
     * ORG_FULLNAME_ : 部门全名。
     */
    private String orgFullname;
    /**
     * ORG_CODE_ : 部门编码(默认为编号)。
     */
    private String orgCode;
    /**
     * ENG_NAME_ : 部门英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * FID_ : 父部门。
     */
    private Long fid;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * fid : 组织架构表实体。
     */
    private SysOrganization parent;

    @Override
    @Transient
    public Long getId() {
        return getOrgId();
    }

    @Override
    public void setId(Long id) {
        setOrgId(id);
    }

    @Id
    @Column(name = "ORG_ID_")
    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "ORG_NAME_")
    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Column(name = "ORG_FULLNAME_")
    public String getOrgFullname() {
        return orgFullname;
    }

    public void setOrgFullname(String orgFullname) {
        this.orgFullname = orgFullname;
    }

    @Column(name = "ORG_CODE_")
    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
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

    @Column(name = "FID_")
    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysOrganization getParent() {
        return parent;
    }

    public void setParent(SysOrganization parent) {
        this.parent = parent;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

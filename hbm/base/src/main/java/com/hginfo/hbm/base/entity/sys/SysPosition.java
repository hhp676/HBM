/*
 * Project Name:hbm-base.
 * File Name:SysPosition.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:37
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
 * 岗位表: sys_position. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:37 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_POSITION")
@DynamicInsert
public class SysPosition extends BizEntity {

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
        TABLE_META.setAlias("sp");
        TABLE_META.addField("positionId", "POSITION_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("orgId", "ORG_ID_", Long.class);
        TABLE_META.addField("jobId", "JOB_ID_", Long.class);
        TABLE_META.addField("positionCode", "POSITION_CODE_", String.class);
        TABLE_META.addField("positionName", "POSITION_NAME_", String.class);
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
        TABLE_META.addAssociation("sysOrganization", SysOrganization.TABLE_META);
    }

    /**
     * POSITION_ID_ : 权限编号。
     */
    private Long positionId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * ORG_ID_ : 组织编号。
     */
    private Long orgId;
    /**
     * JOB_ID_ : 职务编号。
     */
    private Long jobId;
    /**
     * POSITION_CODE_ : 编码。
     */
    private String positionCode;
    /**
     * POSITION_NAME_ : 权限名称。
     */
    private String positionName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * FID_ : 父职务编号。
     */
    private Long fid;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * jobId : 职务表实体。
     */
    private SysJob sysJob;
    /**
     * orgId : 组织架构表实体。
     */
    private SysOrganization sysOrganization;
    /**
     * fid : 岗位表实体。
     */
    private SysPosition parent;

    @Override
    @Transient
    public Long getId() {
        return getPositionId();
    }

    @Override
    public void setId(Long id) {
        setPositionId(id);
    }

    @Id
    @Column(name = "POSITION_ID_")
    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "ORG_ID_")
    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    @Column(name = "JOB_ID_")
    public Long getJobId() {
        return jobId;
    }

    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    @Column(name = "POSITION_CODE_")
    public String getPositionCode() {
        return positionCode;
    }

    public void setPositionCode(String positionCode) {
        this.positionCode = positionCode;
    }

    @Column(name = "POSITION_NAME_")
    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
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
    public SysJob getSysJob() {
        return sysJob;
    }

    public void setSysJob(SysJob sysJob) {
        this.sysJob = sysJob;
    }

    @Transient
    public SysOrganization getSysOrganization() {
        return sysOrganization;
    }

    public void setSysOrganization(SysOrganization sysOrganization) {
        this.sysOrganization = sysOrganization;
    }

    @Transient
    public SysPosition getParent() {
        return parent;
    }

    public void setParent(SysPosition parent) {
        this.parent = parent;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

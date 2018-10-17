/**
 * Project Name:hbm-base.
 * File Name:SysJob.java
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
 * 职务表: sys_job. <br />
 * entity 层 <br />
 * Date: 2016年11月30日 上午10:26:48 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_JOB")
@DynamicInsert
public class SysJob extends BizEntity {

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
        TABLE_META.setAlias("sj");
        TABLE_META.addField("jobId", "JOB_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("jobCode", "JOB_CODE_", String.class);
        TABLE_META.addField("jobName", "JOB_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Integer.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Integer.class);
    }

    /**
     * JOB_ID_ : 职务编号.
     */
    private Long jobId;
    /**
     * TENANT_ID_ : 租户ID.
     */
    private Integer tenantId;
    /**
     * JOB_CODE_ : 职务编码.
     */
    private String jobCode;
    /**
     * JOB_NAME_ : 职务名称.
     */
    private String jobName;
    /**
     * ENG_NAME_ : 英文名称.
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码.
     */
    private String i18nCode;
    /**
     * DESCR_ : 描述.
     */
    private String descr;


    @Override
    @Transient
    public Long getId() {
        return getJobId();
    }

    @Override
    public void setId(Long id) {
        setJobId(id);
    }

    @Id
    @Column(name = "JOB_ID_")
    public Long getJobId() {
        return jobId;
    }

    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "JOB_CODE_")
    public String getJobCode() {
        return jobCode;
    }

    public void setJobCode(String jobCode) {
        this.jobCode = jobCode;
    }

    @Column(name = "JOB_NAME_")
    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
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

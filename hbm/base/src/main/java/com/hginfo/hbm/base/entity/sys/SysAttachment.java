/*
 * Project Name:hbm-base.
 * File Name:SysAttachment.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:36
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
 * 系统附件表: sys_attachment. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_ATTACHMENT")
@DynamicInsert
public class SysAttachment extends BizEntity {

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
        TABLE_META.setAlias("sa");
        TABLE_META.addField("attId", "ATT_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("attCode", "ATT_CODE_", String.class);
        TABLE_META.addField("fileId", "FILE_ID_", Long.class);
        TABLE_META.addField("bizCode", "BIZ_CODE_", String.class);
        TABLE_META.addField("bizId", "BIZ_ID_", Long.class);
        TABLE_META.addField("subBizId", "SUB_BIZ_ID_", Long.class);
        TABLE_META.addField("attName", "ATT_NAME_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysFile", SysFile.TABLE_META);
    }

    /**
     * ATT_ID_ : 附件编号。
     */
    private Long attId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * ATT_CODE_ : 附件编码。
     */
    private String attCode;
    /**
     * FILE_ID_ : 文件编号。
     */
    private Long fileId;
    /**
     * BIZ_CODE_ : 业务编码。
     */
    private String bizCode;
    /**
     * BIZ_ID_ : 业务编号。
     */
    private Long bizId;
    /**
     * SUB_BIZ_ID_ : 子业务编号。
     */
    private Long subBizId;
    /**
     * ATT_NAME_ : 附件名称。
     */
    private String attName;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * fileId : 系统文件表实体。
     */
    @HEntityId("fileId")
    private SysFile sysFile;

    @Override
    @Transient
    public Long getId() {
        return getAttId();
    }

    @Override
    public void setId(Long id) {
        setAttId(id);
    }

    @Id
    @Column(name = "ATT_ID_")
    public Long getAttId() {
        return attId;
    }

    public void setAttId(Long attId) {
        this.attId = attId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "ATT_CODE_")
    public String getAttCode() {
        return attCode;
    }

    public void setAttCode(String attCode) {
        this.attCode = attCode;
    }

    @Column(name = "FILE_ID_")
    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    @Column(name = "BIZ_CODE_")
    public String getBizCode() {
        return bizCode;
    }

    public void setBizCode(String bizCode) {
        this.bizCode = bizCode;
    }

    @Column(name = "BIZ_ID_")
    public Long getBizId() {
        return bizId;
    }

    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }

    @Column(name = "SUB_BIZ_ID_")
    public Long getSubBizId() {
        return subBizId;
    }

    public void setSubBizId(Long subBizId) {
        this.subBizId = subBizId;
    }

    @Column(name = "ATT_NAME_")
    public String getAttName() {
        return attName;
    }

    public void setAttName(String attName) {
        this.attName = attName;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysFile getSysFile() {
        return sysFile;
    }

    public void setSysFile(SysFile sysFile) {
        this.sysFile = sysFile;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

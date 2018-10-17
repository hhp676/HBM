/**
 * Project Name:hbm-base.
 * File Name:SysFile.java
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
 * 系统文件表: sys_file. <br />
 * entity 层 <br />
 * Date: 2016年11月30日 上午10:26:48 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_FILE")
@DynamicInsert
public class SysFile extends BizEntity {
    
    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long      serialVersionUID = 1L;
    
    /**
     * 数据库表元数据。
     */
    static final TableMeta TABLE_META       = new TableMeta();
    
    static {
        TABLE_META.setAlias("sf");
        TABLE_META.addField("fileId", "FILE_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("fileType", "FILE_TYPE_", String.class);
        TABLE_META.addField("realName", "REAL_NAME_", String.class);
        TABLE_META.addField("fileName", "FILE_NAME_", String.class);
        TABLE_META.addField("fileSize", "FILE_SIZE_", String.class);
        TABLE_META.addField("relativePath", "RELATIVE_PATH_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }
    
    /**
     * FILE_ID_ : .
     */
    private Long    fileId;
    /**
     * TENANT_ID_ : 租户ID.
     */
    private Integer tenantId;
    /**
     * FILE_TYPE_ : 文件类型（如：.png,.txt,.doc）.
     */
    private String  fileType;
    /**
     * REAL_NAME_ : 文件真实名称.
     */
    private String  realName;
    /**
     * FILE_NAME_ : 文件名称.
     */
    private String  fileName;
    /**
     * FILE_SIZE_ : 文件大小.
     */
    private String  fileSize;
    /**
     * RELATIVE_PATH_ : 相对路径.
     */
    private String  relativePath;
    /**
     * DESCR_ : 描述.
     */
    private String  descr;
    
    /************
     * 关联附件表
     */
    
    /**
     * ATT_CODE_ : 附件编码.
     */
    private String  attCode;
    /**
     * BIZ_CODE_ : 业务编码.
     */
    private String  bizCode;
    /**
     * BIZ_ID_ : 业务编号.
     */
    private Long    bizId;
    /**
     * SUB_BIZ_ID_ : 子业务编号.
     */
    private Long    subBizId;
    /**
     * ATT_NAME_ : 附件名称.
     */
    private String  attName;
    /**
     * ATT_ID_ : 附件编号.
     */
    private Long    attId;
    
    /**
     *success： 是否成功.
     */
    private boolean success;
    /**
     *message： 返回信息.
     */
    private String  message;
    
    @Override
    @Transient
    public Long getId() {
        return getFileId();
    }
    
    @Override
    public void setId(Long id) {
        setFileId(id);
    }
    
    @Id
    @Column(name = "FILE_ID_")
    public Long getFileId() {
        return fileId;
    }
    
    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }
    
    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }
    
    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
    
    @Column(name = "FILE_TYPE_")
    public String getFileType() {
        return fileType;
    }
    
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    
    @Column(name = "REAL_NAME_")
    public String getRealName() {
        return realName;
    }
    
    public void setRealName(String realName) {
        this.realName = realName;
    }
    
    @Column(name = "FILE_NAME_")
    public String getFileName() {
        return fileName;
    }
    
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    @Column(name = "FILE_SIZE_")
    public String getFileSize() {
        return fileSize;
    }
    
    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }
    
    @Column(name = "RELATIVE_PATH_")
    public String getRelativePath() {
        return relativePath;
    }
    
    public void setRelativePath(String relativePath) {
        this.relativePath = relativePath;
    }
    
    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }
    
    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Transient
    public String getBizCode() {
        return bizCode;
    }
    
    public void setBizCode(String bizCode) {
        this.bizCode = bizCode;
    }
    
    @Transient
    public Long getBizId() {
        return bizId;
    }
    
    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }
    
    @Transient
    public Long getSubBizId() {
        return subBizId;
    }
    
    public void setSubBizId(Long subBizId) {
        this.subBizId = subBizId;
    }
    
    @Transient
    public String getAttName() {
        return attName;
    }
    
    public void setAttName(String attName) {
        this.attName = attName;
    }
    
    @Transient
    public String getAttCode() {
        return attCode;
    }
    
    public void setAttCode(String attCode) {
        this.attCode = attCode;
    }
    
    @Transient
    public Long getAttId() {
        return attId;
    }
    
    public void setAttId(Long attId) {
        this.attId = attId;
    }
    
    @Transient
    public boolean getSuccess() {
        return success;
    }
    
    public void setSuccess(boolean success) {
        this.success = success;
    }
    
    @Transient
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }
    
}

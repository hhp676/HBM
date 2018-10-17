/*
 * Project Name:hbm-base.
 * File Name:SysStaffInfo.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:37
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import java.io.Serializable;
import java.util.Date;

/**
 * 员工信息表: sys_staff_info. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:37 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_STAFF_INFO")
@DynamicInsert
public class SysStaffInfo extends BizEntity {
    /**
     * 
     */
    private static final long serialVersionUID = -4973038412165594163L;
    /**
     * 数据库表元数据。
     */
    static final TableMeta    TABLE_META       = new TableMeta();
    
    static {
        TABLE_META.setAlias("ssi");
        TABLE_META.addField("staffId", "STAFF_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("staffCode", "STAFF_CODE_", String.class);
        TABLE_META.addField("staffStatus", "STAFF_STATUS_", Integer.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("entryTime", "ENTRY_TIME_", Date.class);
        TABLE_META.addField("quitTime", "QUIT_TIME_", Date.class);
        TABLE_META.addField("idCard", "ID_CARD_", String.class);
        TABLE_META.addField("bankCard", "BANK_CARD_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }
    
    /**
     * STAFF_ID_ : 员工编号。
     */
    private Long    staffId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * STAFF_CODE_ : 员工号。
     */
    private String  staffCode;
    /**
     * STAFF_STATUS_ : 员工状态(0离职，1在职)。
     */
    private Integer staffStatus;
    /**
     * USER_ID_ : 用户编号。
     */
    private Long    userId;
    /**
     * ENTRY_TIME_ : 入职时间。
     */
    private Date    entryTime;
    
    private String  entryTimeStr;
    /**
     * QUIT_TIME_ : 离职时间。
     */
    private Date    quitTime;
    
    private String  quitTimeStr;
    /**
     * ID_CARD_ : 身份证号。
     */
    private String  idCard;
    /**
     * BANK_CARD_ : 银行账号。
     */
    private String  bankCard;
    /**
     * DESCR_ : 描述。
     */
    private String  descr;
    
    /**
     * 扩展内部类.
     * @Transient
     */
    private Bo bo = new Bo();
    
    @Override
    @Transient
    public Long getId() {
        return getStaffId();
    }
    
    @Override
    public void setId(Long id) {
        setStaffId(id);
    }
    
    @Id
    @Column(name = "STAFF_ID_")
    public Long getStaffId() {
        return staffId;
    }
    
    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }
    
    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }
    
    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
    
    @Column(name = "STAFF_CODE_")
    public String getStaffCode() {
        return staffCode;
    }
    
    public void setStaffCode(String staffCode) {
        this.staffCode = staffCode;
    }
    
    @Column(name = "STAFF_STATUS_")
    public Integer getStaffStatus() {
        return staffStatus;
    }
    
    public void setStaffStatus(Integer staffStatus) {
        this.staffStatus = staffStatus;
    }
    
    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @Column(name = "ENTRY_TIME_")
    public Date getEntryTime() {
        return entryTime;
    }
    
    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }
    
    @Column(name = "QUIT_TIME_")
    public Date getQuitTime() {
        return quitTime;
    }
    
    public void setQuitTime(Date quitTime) {
        this.quitTime = quitTime;
    }
    
    @Column(name = "ID_CARD_")
    public String getIdCard() {
        return idCard;
    }
    
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }
    
    @Column(name = "BANK_CARD_")
    public String getBankCard() {
        return bankCard;
    }
    
    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }
    
    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }
    
    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Transient
    public String getEntryTimeStr() {
        return entryTimeStr;
    }
    
    public void setEntryTimeStr(String entryTimeStr) {
        this.entryTimeStr = entryTimeStr;
    }
    
    @Transient
    public String getQuitTimeStr() {
        return quitTimeStr;
    }
    
    public void setQuitTimeStr(String quitTimeStr) {
        this.quitTimeStr = quitTimeStr;
    }
    
    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }
    
    @Transient
    public Bo getBo() {
        return bo;
    }

    public void setBo(Bo bo) {
        this.bo = bo;
    }

    /**
     * ClassName: Bo. <br/>
     * @author yinyanzhen
     * @version SysStaffInfo
     * @since V1.0.0
     */
    public class Bo implements Serializable{
        /**
         */
        private static final long serialVersionUID = -1896271899182671926L;
        //入职开始时间
        @DateTimeFormat(pattern="yyyy-MM-dd")
        private Date entryStartTime;
        //入职终止时间
        @DateTimeFormat(pattern="yyyy-MM-dd")
        private Date entryEndTime;
        public Date getEntryStartTime() {
            return entryStartTime;
        }
        public void setEntryStartTime(Date entryStartTime) {
            this.entryStartTime = entryStartTime;
        }
        public Date getEntryEndTime() {
            return entryEndTime;
        }
        public void setEntryEndTime(Date entryEndTime) {
            this.entryEndTime = entryEndTime;
        }
    }
}

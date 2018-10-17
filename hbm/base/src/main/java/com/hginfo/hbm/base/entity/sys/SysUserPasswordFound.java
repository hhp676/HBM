/*
 * Project Name:hbm-base.
 * File Name:SysUserPasswordFound.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年02月27日 下午6:49:59
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
 * 密码找回表: sys_user_password_found. <br />
 * entity 层 <br />
 * Date: 2017年02月27日 下午6:49:59 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER_PASSWORD_FOUND")
@DynamicInsert
public class SysUserPasswordFound extends BizEntity {

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
        TABLE_META.setAlias("supf");
        TABLE_META.addField("foundId", "FOUND_ID_", Long.class);
        TABLE_META.addField("loginName", "LOGIN_NAME_", String.class);
        TABLE_META.addField("phone", "PHONE_", String.class);
        TABLE_META.addField("email", "EMAIL_", String.class);
        TABLE_META.addField("verificationCode", "VERIFICATION_CODE_", String.class);
        TABLE_META.addField("ip", "IP_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * FOUND_ID_ : 。
     */
    private Long foundId;
    /**
     * LOGIN_NAME_ : 登录名。
     */
    private String loginName;
    /**
     * PHONE_ : phone。
     */
    private String phone;
    /**
     * EMAIL_ : email。
     */
    private String email;
    /**
     * VERIFICATION_CODE_ : 验证码。
     */
    private String verificationCode;
    /**
     * IP_ : ip。
     */
    private String ip;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    
    /**
     * 查询使用。
     */
    private Date timeOut;

    @Override
    @Transient
    public Long getId() {
        return getFoundId();
    }

    @Override
    public void setId(Long id) {
        setFoundId(id);
    }

    @Id
    @Column(name = "FOUND_ID_")
    public Long getFoundId() {
        return foundId;
    }

    public void setFoundId(Long foundId) {
        this.foundId = foundId;
    }

    @Column(name = "LOGIN_NAME_")
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(name = "PHONE_")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "EMAIL_")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "VERIFICATION_CODE_")
    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    @Column(name = "IP_")
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Transient
    public Date getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(Date timeOut) {
        this.timeOut = timeOut;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

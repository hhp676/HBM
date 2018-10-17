/*
 * Project Name:hbm-base.
 * File Name:SysAccount.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月20日 下午2:13:52
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
 * 登录账号表: sys_account. <br />
 * entity 层 <br />
 * Date: 2016年12月20日 下午2:13:52 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_ACCOUNT")
@DynamicInsert
public class SysAccount extends BizEntity {

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
        TABLE_META.setAlias("sa");
        TABLE_META.addField("accountId", "ACCOUNT_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("loginName", "LOGIN_NAME_", String.class);
        TABLE_META.addField("loginPwd", "LOGIN_PWD_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isValid", "IS_VALID_", Integer.class);
        TABLE_META.addField("isLock", "IS_LOCK_", Integer.class);
        TABLE_META.addField("lastLoginIp", "LAST_LOGIN_IP_", String.class);
        TABLE_META.addField("lastLoginTime", "LAST_LOGIN_TIME_", Date.class);
        TABLE_META.addField("lastPwdChange", "LAST_PWD_CHANGE_", Date.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * ACCOUNT_ID_ :  登录账号编码。
     */
    private Long accountId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * LOGIN_NAME_ : 登录名。
     */
    private String loginName;
    /**
     * LOGIN_PWD_ : 密码。
     */
    private String loginPwd;
    /**
     * 明文密码.
     */
    private String            plainPwd;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * IS_VALID_ : 是否有效(1:有效;0:无效)。
     */
    private Integer isValid;
    /**
     * IS_LOCK_ : 是否被锁定(1:锁定;0:正常)。
     */
    private Integer isLock;
    /**
     * LAST_LOGIN_IP_ : 最后登录IP。
     */
    private String lastLoginIp;
    /**
     * LAST_LOGIN_TIME_ : 最后登录时间。
     */
    private Date lastLoginTime;
    /**
     * LAST_PWD_CHANGE_ : 上次密码修改时间。
     */
    private Date lastPwdChange;
    /**
     * userId : 用户表实体。
     */

    @Override
    @Transient
    public Long getId() {
        return getAccountId();
    }

    @Override
    public void setId(Long id) {
        setAccountId(id);
    }

    @Id
    @Column(name = "ACCOUNT_ID_")
    public Long getAccountId() {
        return accountId;
    }

    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "LOGIN_NAME_")
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(name = "LOGIN_PWD_")
    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    @Transient
    public String getPlainPwd() {
        return plainPwd;
    }

    public void setPlainPwd(String plainPwd) {
        this.plainPwd = plainPwd;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Column(name = "IS_VALID_")
    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    @Column(name = "IS_LOCK_")
    public Integer getIsLock() {
        return isLock;
    }

    public void setIsLock(Integer isLock) {
        this.isLock = isLock;
    }

    @Column(name = "LAST_LOGIN_IP_")
    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    @Column(name = "LAST_LOGIN_TIME_")
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    @Column(name = "LAST_PWD_CHANGE_")
    public Date getLastPwdChange() {
        return lastPwdChange;
    }

    public void setLastPwdChange(Date lastPwdChange) {
        this.lastPwdChange = lastPwdChange;
    }



    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

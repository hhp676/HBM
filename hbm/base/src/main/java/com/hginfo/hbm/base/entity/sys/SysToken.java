/*
 * Project Name:hbm-base.
 * File Name:SysToken.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:37
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
 * 系统密钥表: sys_token. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:37 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_TOKEN")
@DynamicInsert
public class SysToken extends BizEntity {

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
        TABLE_META.setAlias("st");
        TABLE_META.addField("tokenId", "TOKEN_ID_", Long.class);
        TABLE_META.addField("accountId", "ACCOUNT_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("tokenSign", "TOKEN_SIGN_", String.class);
        TABLE_META.addField("tokenType", "TOKEN_TYPE_", Integer.class);
        TABLE_META.addField("extension", "EXTENSION_", String.class);
        TABLE_META.addField("dueTime", "DUE_TIME_", Date.class);
        TABLE_META.addField("loginCount", "LOGIN_COUNT_", Integer.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * TOKEN_ID_ : 令牌ID。
     */
    private Long tokenId;
    /**
     * ACCOUNT_ID_ : 账户ID。
     */
    private Long accountId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * TOKEN_SIGN_ : 令牌签名。
     */
    private String tokenSign;
    /**
     * TOKEN_TYPE_ : 令牌类型。
     */
    private Integer tokenType;
    /**
     * EXTENSION_ : 扩展数据 JSON对象。
     */
    private String extension;
    /**
     * DUE_TIME_ : 过期时间。
     */
    private Date dueTime;
    /**
     * LOGIN_COUNT_ : 登录次数。
     */
    private Integer loginCount;
    /**
     * accountId : 登录账号表实体。
     */
    @HEntityId("accountId")
    private SysAccount sysAccount;

    @Override
    @Transient
    public Long getId() {
        return getTokenId();
    }

    @Override
    public void setId(Long id) {
        setTokenId(id);
    }

    @Id
    @Column(name = "TOKEN_ID_")
    public Long getTokenId() {
        return tokenId;
    }

    public void setTokenId(Long tokenId) {
        this.tokenId = tokenId;
    }

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

    @Column(name = "TOKEN_SIGN_")
    public String getTokenSign() {
        return tokenSign;
    }

    public void setTokenSign(String tokenSign) {
        this.tokenSign = tokenSign;
    }

    @Column(name = "TOKEN_TYPE_")
    public Integer getTokenType() {
        return tokenType;
    }

    public void setTokenType(Integer tokenType) {
        this.tokenType = tokenType;
    }

    @Column(name = "EXTENSION_")
    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    @Column(name = "DUE_TIME_")
    public Date getDueTime() {
        return dueTime;
    }

    public void setDueTime(Date dueTime) {
        this.dueTime = dueTime;
    }

    @Column(name = "LOGIN_COUNT_")
    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    @Transient
    public SysAccount getSysAccount() {
        return sysAccount;
    }

    public void setSysAccount(SysAccount sysAccount) {
        this.sysAccount = sysAccount;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

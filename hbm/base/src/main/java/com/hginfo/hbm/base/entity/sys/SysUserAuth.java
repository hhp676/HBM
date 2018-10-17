/*
 * Project Name:hbm-base.
 * File Name:SysUserAuth.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月28日 下午2:31:15
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 用户权限表: sys_user_auth. <br />
 * entity 层 <br />
 * Date: 2016年12月28日 下午2:31:15 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER_AUTH")
@DynamicInsert
public class SysUserAuth extends RelEntity {
    
    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long      serialVersionUID = 1L;
                                                    
    /**
     * 数据库表元数据。
     */
    private static final TableMeta TABLE_META       = new TableMeta();
                                                    
    static {
        TABLE_META.setAlias("sua");
        TABLE_META.addField("userAuthId", "USER_AUTH_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("authId", "AUTH_ID_", Long.class);
        TABLE_META.addField("authType", "AUTH_TYPE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }
    
    /**
     * USER_AUTH_ID_ : 主键ID。
     */
    private Long    userAuthId;
    /**
     * USER_ID_ : 用户ID。
     */
    private Long    userId;
    /**
     * AUTH_ID_ : 权限编号。
     */
    private Long    authId;
    /**
     * AUTH_TYPE_ : 授权类型（1:正授权;-1:负授权）。
     */
    private Integer authType;
    /**
     * authId : 系统权限表实体。
     */
    @HEntityId("authId")
    private SysAuth sysAuth;
    /**
     * userId : 用户表实体。
     */
    @HEntityId("userId")
    private SysUser sysUser;
                    
    /**
     * 用户数组。
     */
    private Long[]  userIds;
    /**
     * 权限数组。
     */
    private Long[]  authIds;
                    
    @Override
    @Transient
    public Long getId() {
        return getUserAuthId();
    }
    
    @Override
    public void setId(Long id) {
        setUserAuthId(id);
    }
    
    @Id
    @Column(name = "USER_AUTH_ID_")
    public Long getUserAuthId() {
        return userAuthId;
    }
    
    public void setUserAuthId(Long userAuthId) {
        this.userAuthId = userAuthId;
    }
    
    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @Column(name = "AUTH_ID_")
    public Long getAuthId() {
        return authId;
    }
    
    public void setAuthId(Long authId) {
        this.authId = authId;
    }
    
    @Column(name = "AUTH_TYPE_")
    public Integer getAuthType() {
        return authType;
    }
    
    public void setAuthType(Integer authType) {
        this.authType = authType;
    }
    
    @Transient
    public SysAuth getSysAuth() {
        return sysAuth;
    }
    
    public void setSysAuth(SysAuth sysAuth) {
        this.sysAuth = sysAuth;
    }
    
    @Transient
    public SysUser getSysUser() {
        return sysUser;
    }
    
    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }
    
    @Transient
    public Long[] getUserIds() {
        return userIds;
    }
    
    public void setUserIds(Long[] userIds) {
        this.userIds = userIds;
    }
    
    @Transient
    public Long[] getAuthIds() {
        return authIds;
    }

    public void setAuthIds(Long[] authIds) {
        this.authIds = authIds;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }
    
}

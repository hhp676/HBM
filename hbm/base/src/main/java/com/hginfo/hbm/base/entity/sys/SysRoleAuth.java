/*
 * Project Name:hbm-base.
 * File Name:SysRoleAuth.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月28日 下午5:29:49
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
 * 角色权限表: sys_role_auth. <br />
 * entity 层 <br />
 * Date: 2016年12月28日 下午5:29:49 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_ROLE_AUTH")
@DynamicInsert
public class SysRoleAuth extends RelEntity {

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
        TABLE_META.setAlias("sra");
        TABLE_META.addField("roleAuthId", "ROLE_AUTH_ID_", Long.class);
        TABLE_META.addField("roleId", "ROLE_ID_", Long.class);
        TABLE_META.addField("authId", "AUTH_ID_", Long.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * ROLE_AUTH_ID_ : 主键ID。
     */
    private Long roleAuthId;
    /**
     * ROLE_ID_ : 角色编号。
     */
    private Long roleId;
    /**
     * AUTH_ID_ : 权限编号。
     */
    private Long authId;
    /**
     * authId : 系统权限表实体。
     */
    @HEntityId("authId")
    private SysAuth sysAuth;
    /**
     * roleId : 系统角色表实体。
     */
    @HEntityId("roleId")
    private SysRole sysRole;
    
    /**
     * 权限数组。
     */
    private Long[] authIds;
    
    /**
     * 角色数组。
     */
    private Long[] roleIds;

    @Override
    @Transient
    public Long getId() {
        return getRoleAuthId();
    }

    @Override
    public void setId(Long id) {
        setRoleAuthId(id);
    }

    @Id
    @Column(name = "ROLE_AUTH_ID_")
    public Long getRoleAuthId() {
        return roleAuthId;
    }

    public void setRoleAuthId(Long roleAuthId) {
        this.roleAuthId = roleAuthId;
    }

    @Column(name = "ROLE_ID_")
    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    @Column(name = "AUTH_ID_")
    public Long getAuthId() {
        return authId;
    }

    public void setAuthId(Long authId) {
        this.authId = authId;
    }

    @Transient
    public SysAuth getSysAuth() {
        return sysAuth;
    }

    public void setSysAuth(SysAuth sysAuth) {
        this.sysAuth = sysAuth;
    }

    @Transient
    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
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
    
    @Transient
    public Long[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds) {
        this.roleIds = roleIds;
    }

}

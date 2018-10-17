/*
 * Project Name:hbm-base.
 * File Name:SysUserRole.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月28日 下午2:20:17
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
 *  用户角色表: sys_user_role. <br />
 * entity 层 <br />
 * Date: 2016年12月28日 下午2:20:17 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER_ROLE")
@DynamicInsert
public class SysUserRole extends RelEntity {

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
        TABLE_META.setAlias("sur");
        TABLE_META.addField("userRoleId", "USER_ROLE_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("roleId", "ROLE_ID_", Long.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysUser", SysUser.TABLE_META);
    }

    /**
     * USER_ROLE_ID_ : 关联表主键。
     */
    private Long userRoleId;
    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * ROLE_ID_ : 角色ID。
     */
    private Long roleId;
    /**
     * roleId : 系统角色表实体。
     */
    @HEntityId("roleId")
    private SysRole sysRole;
    /**
     * userId : 用户表实体。
     */
    @HEntityId("userId")
    private SysUser sysUser;

    @Override
    @Transient
    public Long getId() {
        return getUserRoleId();
    }

    @Override
    public void setId(Long id) {
        setUserRoleId(id);
    }

    @Id
    @Column(name = "USER_ROLE_ID_")
    public Long getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(Long userRoleId) {
        this.userRoleId = userRoleId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "ROLE_ID_")
    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    @Transient
    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
    }

    @Transient
    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

/**
 * Project Name:hbm-base.
 * File Name:SysRole.java
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
 * 系统角色表: sys_role. <br />
 * entity 层 <br />
 * Date: 2016年11月30日 上午10:26:48 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_ROLE")
@DynamicInsert
public class SysRole extends BizEntity {

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
        TABLE_META.setAlias("sr");
        TABLE_META.addField("roleId", "ROLE_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("roleName", "ROLE_NAME_", String.class);
        TABLE_META.addField("roleCode", "ROLE_CODE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * ROLE_ID_ : 角色编号.
     */
    private Long roleId;
    /**
     * TENANT_ID_ : 租户ID.
     */
    private Integer tenantId;
    /**
     * ROLE_NAME_ : 角色名称.
     */
    private String roleName;
    /**
     * ROLE_CODE_ : 角色编码(默认值为编号).
     */
    private String roleCode;
    /**
     * DESCR_ : 描述.
     */
    private String descr;


    @Override
    @Transient
    public Long getId() {
        return getRoleId();
    }

    @Override
    public void setId(Long id) {
        setRoleId(id);
    }

    @Id
    @Column(name = "ROLE_ID_")
    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "ROLE_NAME_")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Column(name = "ROLE_CODE_")
    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
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

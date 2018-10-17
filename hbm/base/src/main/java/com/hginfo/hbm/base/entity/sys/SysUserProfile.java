/*
 * Project Name:hbm-base.
 * File Name:SysUserProfile.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:37
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

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
 * 用户设置表: sys_user_profile. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:37 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER_PROFILE")
@DynamicInsert
public class SysUserProfile extends BizEntity {

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
        TABLE_META.setAlias("sup");
        TABLE_META.addField("userProfileId", "USER_PROFILE_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("profileKey", "PROFILE_KEY_", String.class);
        TABLE_META.addField("profileValue", "PROFILE_VALUE_", String.class);
        //TABLE_META.addField("defaultValue", "DEFAULT_VALUE_", String.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Integer.class);
        TABLE_META.addField("profileType", "PROFILE_TYPE_", String.class);
        TABLE_META.addField("version", "VERSION_", Integer.class);
        TABLE_META.addField("isCurrent", "IS_CURRENT_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
    }

    /**
     * USER_PROFILE_ID_ : 配置编号。
     */
    private Long userProfileId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * USER_ID_ : 用户编号。
     */
    private Long userId;
    /**
     * PROFILE_KEY_ : 设置KEY。
     */
    private String profileKey;
    /**
     * PROFILE_VALUE_ : 设置值。
     */
    private String profileValue;
    /**
     * DEFAULT_VALUE_ : 默认值。
     */
    private String defaultValue;
    /**
     * SORT_NO_ : 排序号。
     */
    private Integer sortNo;
    /**
     * PROFILE_TYPE_ : 设置类型。
     */
    private String profileType;
    /**
     * VERSION_ : 版本号。
     */
    private Integer version;
    /**
     * IS_CURRENT_ : 是否为当前版本。
     */
    private Integer isCurrent;
    /**
     * DESCR_ : 设置描述。
     */
    private String descr;
    /**
     * userId : 用户表实体。
     */
    @HEntityId("userId")
    private SysUser sysUser;

    @Override
    @Transient
    public Long getId() {
        return getUserProfileId();
    }

    @Override
    public void setId(Long id) {
        setUserProfileId(id);
    }

    @Id
    @Column(name = "USER_PROFILE_ID_")
    public Long getUserProfileId() {
        return userProfileId;
    }

    public void setUserProfileId(Long userProfileId) {
        this.userProfileId = userProfileId;
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

    @Column(name = "PROFILE_KEY_")
    public String getProfileKey() {
        return profileKey;
    }

    public void setProfileKey(String profileKey) {
        this.profileKey = profileKey;
    }

    @Column(name = "PROFILE_VALUE_")
    public String getProfileValue() {
        return profileValue;
    }

    public void setProfileValue(String profileValue) {
        this.profileValue = profileValue;
    }

    @Transient
    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    @Column(name = "SORT_NO_")
    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    @Column(name = "PROFILE_TYPE_")
    public String getProfileType() {
        return profileType;
    }

    public void setProfileType(String profileType) {
        this.profileType = profileType;
    }

    @Column(name = "VERSION_")
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    @Column(name = "IS_CURRENT_")
    public Integer getIsCurrent() {
        return isCurrent;
    }

    public void setIsCurrent(Integer isCurrent) {
        this.isCurrent = isCurrent;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
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

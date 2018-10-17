/*
 * Project Name:hbm-base.
 * File Name:SysUser.java
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
 * 用户表: sys_user. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:37 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER")
@DynamicInsert
public class SysUser extends BizEntity {
    
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
        TABLE_META.setAlias("su");
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("userName", "USER_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("gender", "GENDER_", Integer.class);
        TABLE_META.addField("birthday", "BIRTHDAY_", String.class);
        TABLE_META.addField("mobile", "MOBILE_", String.class);
        TABLE_META.addField("email", "EMAIL_", String.class);
        TABLE_META.addField("address", "ADDRESS_", String.class);
        TABLE_META.addField("telephone", "TELEPHONE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("isVisible", "IS_VISIBLE_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        TABLE_META.addField("headPhoto", "HEAD_PHOTO_", Long.class);
        TABLE_META.addAssociation("staffInfo", SysStaffInfo.TABLE_META);
        TABLE_META.addAssociation("userAccount", SysAccount.TABLE_META);
        TABLE_META.addAssociation("userPosition", SysPosition.TABLE_META);
    }
    
    /**
     * USER_ID_ : 用户ID。
     */
    private Long         userId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer      tenantId;
    /**
     * USER_NAME_ : 用户名。
     */
    private String       userName;
    /**
     * ENG_NAME_ : 英文名。
     */
    private String       engName;
    /**
     * GENDER_ : 性别(1:男;0:女)。
     */
    private Integer      gender;
    /**
     * BIRTHDAY_ : 生日。
     */
    private String       birthday;
    /**
     * MOBILE_ : 手机。
     */
    private String       mobile;
    /**
     * EMAIL_ : 邮箱。
     */
    private String       email;
    /**
     * ADDRESS_ : 地址。
     */
    private String       address;
    /**
     * TELEPHONE_ : 联系电话。
     */
    private String       telephone;
    /**
     * DESCR_ : 描述。
     */
    private String       descr;
    /**
     * IS_VISIBLE_ : 是否可见。
     */
    private Integer      isVisible;
    /**
     * HEAD_PHOTO_ : 头像：对应系统文件ID。
     */
    private Long         headPhoto;
    /**
     * headPhoto : 系统文件表实体。
     */
    @HEntityId("headPhoto")
    private SysFile      headPhotoSysFile;
    
    /**
     * 
     */
    @HEntityId("userId")
    private SysStaffInfo staffInfo;
    
    /**
     * 
     */
    @HEntityId("userId")
    private SysAccount   userAccount;
    
    @HEntityId("positionId")
    private SysPosition  userPosition;
    
    private Long         positionId;
    
    private String       userNameForQuery;
    
    private String       emailForQuery;
    
    private Long[]       authIds;
    
    private Long[]       nAuthIds;
    
    private Long[]       roleIds;
    
    private Long[]       positionIds;
    
    private Long[]       groupIds;
    
    @Override
    @Transient
    public Long getId() {
        return getUserId();
    }
    
    @Transient
    public String getUserNameForQuery() {
        return userNameForQuery;
    }
    
    public void setUserNameForQuery(String userNameForQuery) {
        this.userNameForQuery = userNameForQuery;
    }
    
    @Override
    public void setId(Long id) {
        setUserId(id);
    }
    
    @Id
    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }
    
    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
    
    @Column(name = "USER_NAME_")
    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    @Column(name = "ENG_NAME_")
    public String getEngName() {
        return engName;
    }
    
    public void setEngName(String engName) {
        this.engName = engName;
    }
    
    @Column(name = "GENDER_")
    public Integer getGender() {
        return gender;
    }
    
    public void setGender(Integer gender) {
        this.gender = gender;
    }
    
    @Column(name = "BIRTHDAY_")
    public String getBirthday() {
        return birthday;
    }
    
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    
    @Column(name = "MOBILE_")
    public String getMobile() {
        return mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    @Column(name = "EMAIL_")
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Column(name = "ADDRESS_")
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    @Column(name = "TELEPHONE_")
    public String getTelephone() {
        return telephone;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }
    
    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    @Column(name = "IS_VISIBLE_")
    public Integer getIsVisible() {
        return isVisible;
    }
    
    public void setIsVisible(Integer isVisible) {
        this.isVisible = isVisible;
    }
    
    @Column(name = "HEAD_PHOTO_")
    public Long getHeadPhoto() {
        return headPhoto;
    }
    
    public void setHeadPhoto(Long headPhoto) {
        this.headPhoto = headPhoto;
    }
    
    @Transient
    public SysStaffInfo getStaffInfo() {
        return staffInfo;
    }
    
    public void setStaffInfo(SysStaffInfo staffInfo) {
        this.staffInfo = staffInfo;
    }
    
    @Transient
    public SysAccount getUserAccount() {
        return userAccount;
    }
    
    public void setUserAccount(SysAccount userAccount) {
        this.userAccount = userAccount;
    }
    
    @Transient
    public String getEmailForQuery() {
        return emailForQuery;
    }
    
    public void setEmailForQuery(String emailForQuery) {
        this.emailForQuery = emailForQuery;
    }
    
    @Transient
    public SysFile getHeadPhotoSysFile() {
        return headPhotoSysFile;
    }
    
    public void setHeadPhotoSysFile(SysFile headPhotoSysFile) {
        this.headPhotoSysFile = headPhotoSysFile;
    }
    
    @Transient
    public SysPosition getUserPosition() {
        return userPosition;
    }
    
    public void setUserPosition(SysPosition userPosition) {
        this.userPosition = userPosition;
    }
    
    @Transient
    public Long getPositionId() {
        return positionId;
    }
    
    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }
    
    @Transient
    public Long[] getAuthIds() {
        return authIds;
    }
    
    public void setAuthIds(Long[] authIds) {
        this.authIds = authIds;
    }
    
    @Transient
    public Long[] getnAuthIds() {
        return nAuthIds;
    }
    
    public void setnAuthIds(Long[] nAuthIds) {
        this.nAuthIds = nAuthIds;
    }
    
    @Transient
    public Long[] getRoleIds() {
        return roleIds;
    }
    
    public void setRoleIds(Long[] roleIds) {
        this.roleIds = roleIds;
    }
    
    @Transient
    public Long[] getPositionIds() {
        return positionIds;
    }
    
    public void setPositionIds(Long[] positionIds) {
        this.positionIds = positionIds;
    }
    
    @Transient
    public Long[] getGroupIds() {
        return groupIds;
    }
    
    public void setGroupIds(Long[] groupIds) {
        this.groupIds = groupIds;
    }
    
    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }
    
}

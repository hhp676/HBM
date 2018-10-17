/*
 * Project Name:hbm-base.
 * File Name:SysGroupUser.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月28日 下午2:41:31
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 小组用户表: sys_group_user. <br />
 * entity 层 <br />
 * Date: 2016年12月28日 下午2:41:31 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_GROUP_USER")
@DynamicInsert
public class SysGroupUser extends RelEntity {

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
        TABLE_META.setAlias("sgu");
        TABLE_META.addField("groupUserId", "GROUP_USER_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("groupId", "GROUP_ID_", Long.class);
        TABLE_META.addField("isLeader", "IS_LEADER_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysUser", SysUser.TABLE_META);
    }

    /**
     * GROUP_USER_ID_ : 主键ID。
     */
    private Long groupUserId;
    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * GROUP_ID_ : 角色ID。
     */
    private Long groupId;
    /**
     * 角色ID数组。
     */
    private Long[] groupIds;
    /**
     * IS_LEADER_ : 是否为小组长。
     */
    private Integer isLeader;
    /**
     * groupId : 小组表实体。
     */
    @HEntityId("groupId")
    private SysGroup sysGroup;
    /**
     * userId : 用户表实体。
     */
    @HEntityId("userId")
    private SysUser sysUser;

    @Override
    @Transient
    public Long getId() {
        return getGroupUserId();
    }

    @Override
    public void setId(Long id) {
        setGroupUserId(id);
    }

    @Id
    @Column(name = "GROUP_USER_ID_")
    public Long getGroupUserId() {
        return groupUserId;
    }

    public void setGroupUserId(Long groupUserId) {
        this.groupUserId = groupUserId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "GROUP_ID_")
    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    @Transient
    public Long[] getGroupIds() {
        return groupIds;
    }

    public void setGroupIds(Long[] groupIds) {
        this.groupIds = groupIds;
    }

    @Column(name = "IS_LEADER_")
    public Integer getIsLeader() {
        return isLeader;
    }

    public void setIsLeader(Integer isLeader) {
        this.isLeader = isLeader;
    }

    @Transient
    public SysGroup getSysGroup() {
        return sysGroup;
    }

    public void setSysGroup(SysGroup sysGroup) {
        this.sysGroup = sysGroup;
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

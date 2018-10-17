/*
 * Project Name:hbm-base.
 * File Name:TestGroupUser.java
 * Package Name:com.hginfo.hbm.base.entity.test
 * Date:2017年02月14日 下午5:07:22
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.test;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.MultiKeyBaseEntity;
import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 小组用户表: test_group_user. <br />
 * entity 层 <br />
 * Date: 2017年02月14日 下午5:07:22 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "TEST_GROUP_USER")
@IdClass(TestGroupUserPK.class)
@DynamicInsert
public class TestGroupUser extends MultiKeyBaseEntity {

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
        TABLE_META.setAlias("tgu");
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("groupId", "GROUP_ID_", Long.class);
        TABLE_META.addField("isLeader", "IS_LEADER_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * GROUP_ID_ : 角色ID。
     */
    private Long groupId;
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

    @Id
    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Id
    @Column(name = "GROUP_ID_")
    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
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

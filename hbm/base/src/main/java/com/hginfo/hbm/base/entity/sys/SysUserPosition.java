/*
 * Project Name:hbm-base.
 * File Name:SysUserPosition.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月28日 下午2:51:03
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
 * 用户岗位表: sys_user_position. <br />
 * entity 层 <br />
 * Date: 2016年12月28日 下午2:51:03 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER_POSITION")
@DynamicInsert
public class SysUserPosition extends RelEntity {

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
        TABLE_META.addField("userPositionId", "USER_POSITION_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("positionId", "POSITION_ID_", Long.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("isMajor", "IS_MAJOR_", Integer.class);
        
        TABLE_META.addAssociation("sysUser", SysUser.TABLE_META);
        TABLE_META.addAssociation("sysPosition", SysPosition.TABLE_META);
    }

    /**
     * USER_POSITION_ID_ : 主键ID。
     */
    private Long userPositionId;
    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * POSITION_ID_ : 角色ID。
     */
    private Long positionId;
    /**
     * 角色ID。
     */
    private Long[] positionIds;
    /**
     * IS_MAJOR_ : 是否主岗0否，1是，每个userId，应该只有一个主岗。
     */
    private Integer isMajor;
    /**
     * positionId : 岗位表实体。
     */
    @HEntityId("positionId")
    private SysPosition sysPosition;
    /**
     * userId : 用户表实体。
     */
    @HEntityId("userId")
    private SysUser sysUser;

    @Override
    @Transient
    public Long getId() {
        return getUserPositionId();
    }

    @Override
    public void setId(Long id) {
        setUserPositionId(id);
    }

    @Id
    @Column(name = "USER_POSITION_ID_")
    public Long getUserPositionId() {
        return userPositionId;
    }

    public void setUserPositionId(Long userPositionId) {
        this.userPositionId = userPositionId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "POSITION_ID_")
    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    @Transient
    public Long[] getPositionIds() {
        return positionIds;
    }

    public void setPositionIds(Long[] positionIds) {
        this.positionIds = positionIds;
    }

    @Column(name = "IS_MAJOR_")
    public Integer getIsMajor() {
        return isMajor;
    }

    public void setIsMajor(Integer isMajor) {
        this.isMajor = isMajor;
    }

    @Transient
    public SysPosition getSysPosition() {
        return sysPosition;
    }

    public void setSysPosition(SysPosition sysPosition) {
        this.sysPosition = sysPosition;
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

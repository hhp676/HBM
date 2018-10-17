/*
 * Project Name:hbm-base.
 * File Name:SysAuthJoin.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年03月09日 下午3:26:46
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
 * 系统权限关联表: sys_auth_join. <br />
 * entity 层 <br />
 * Date: 2017年03月09日 下午3:26:46 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_AUTH_JOIN")
@DynamicInsert
public class SysAuthJoin extends RelEntity {

    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表元数据。
     */
    static final TableMeta TABLE_META = new TableMeta();

    static {
        TABLE_META.setAlias("saj");
        TABLE_META.addField("authJoinId", "AUTH_JOIN_ID_", Long.class);
        TABLE_META.addField("mainAuthId", "MAIN_AUTH_ID_", Long.class);
        TABLE_META.addField("attachAuthId", "ATTACH_AUTH_ID_", Long.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("mainSysAuth", SysAuth.TABLE_META);
        TABLE_META.addAssociation("attachSysAuth", SysAuth.TABLE_META);
    }

    /**
     * AUTH_JOIN_ID_ : 主键ID。
     */
    private Long authJoinId;
    /**
     * MAIN_AUTH_ID_ : 主权限ID。
     */
    private Long mainAuthId;
    /**
     * ATTACH_AUTH_ID_ : 附属权限ID。
     */
    private Long attachAuthId;
    /**
     * attachAuthId : 系统权限表实体。
     */
    @HEntityId("attachAuthId")
    private SysAuth attachSysAuth;
    /**
     * mainAuthId : 系统权限表实体。
     */
    @HEntityId("mainAuthId")
    private SysAuth mainSysAuth;

    @Override
    @Transient
    public Long getId() {
        return getAuthJoinId();
    }

    @Override
    public void setId(Long id) {
        setAuthJoinId(id);
    }

    @Id
    @Column(name = "AUTH_JOIN_ID_")
    public Long getAuthJoinId() {
        return authJoinId;
    }

    public void setAuthJoinId(Long authJoinId) {
        this.authJoinId = authJoinId;
    }

    @Column(name = "MAIN_AUTH_ID_")
    public Long getMainAuthId() {
        return mainAuthId;
    }

    public void setMainAuthId(Long mainAuthId) {
        this.mainAuthId = mainAuthId;
    }

    @Column(name = "ATTACH_AUTH_ID_")
    public Long getAttachAuthId() {
        return attachAuthId;
    }

    public void setAttachAuthId(Long attachAuthId) {
        this.attachAuthId = attachAuthId;
    }

    @Transient
    public SysAuth getAttachSysAuth() {
        return attachSysAuth;
    }

    public void setAttachSysAuth(SysAuth attachSysAuth) {
        this.attachSysAuth = attachSysAuth;
    }

    @Transient
    public SysAuth getMainSysAuth() {
        return mainSysAuth;
    }

    public void setMainSysAuth(SysAuth mainSysAuth) {
        this.mainSysAuth = mainSysAuth;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

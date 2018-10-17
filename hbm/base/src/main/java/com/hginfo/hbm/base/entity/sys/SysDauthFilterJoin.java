/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterJoin.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年01月14日 下午4:34:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
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
 * 数据权限过滤器关联: sys_dauth_filter_join. <br />
 * entity 层 <br />
 * Date: 2017年01月14日 下午4:34:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Entity(name = "SYS_DAUTH_FILTER_JOIN")
@DynamicInsert
public class SysDauthFilterJoin extends BizEntity {

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
        TABLE_META.setAlias("sdfj");
        TABLE_META.addField("joinId", "JOIN_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("filterGroupId", "FILTER_GROUP_ID_", Long.class);
        TABLE_META.addField("filterItemId", "FILTER_ITEM_ID_", Long.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        
        TABLE_META.addAssociation("sysDauthFilterGroup", SysDauthFilterGroup.TABLE_META);
        TABLE_META.addAssociation("sysDauthFilterItem", SysDauthFilterItem.TABLE_META);
    }

    /**
     * JOIN_ID_ : 过滤器组编号。
     */
    private Long joinId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * FILTER_GROUP_ID_ : 过滤器组ID。
     */
    private Long filterGroupId;
    /**
     * FILTER_ITEM_ID_ : 过滤器项ID。
     */
    private Long filterItemId;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * filterGroupId : 数据权限过滤器组实体。
     */
    @HEntityId("filterGroupId")
    private SysDauthFilterGroup sysDauthFilterGroup;
    /**
     * filterItemId : 数据权限过滤器项实体。
     */
    @HEntityId("filterItemId")
    private SysDauthFilterItem sysDauthFilterItem;

    @Override
    @Transient
    public Long getId() {
        return getJoinId();
    }

    @Override
    public void setId(Long id) {
        setJoinId(id);
    }

    @Id
    @Column(name = "JOIN_ID_")
    public Long getJoinId() {
        return joinId;
    }

    public void setJoinId(Long joinId) {
        this.joinId = joinId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "FILTER_GROUP_ID_")
    public Long getFilterGroupId() {
        return filterGroupId;
    }

    public void setFilterGroupId(Long filterGroupId) {
        this.filterGroupId = filterGroupId;
    }

    @Column(name = "FILTER_ITEM_ID_")
    public Long getFilterItemId() {
        return filterItemId;
    }

    public void setFilterItemId(Long filterItemId) {
        this.filterItemId = filterItemId;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysDauthFilterGroup getSysDauthFilterGroup() {
        return sysDauthFilterGroup;
    }

    public void setSysDauthFilterGroup(SysDauthFilterGroup sysDauthFilterGroup) {
        this.sysDauthFilterGroup = sysDauthFilterGroup;
    }

    @Transient
    public SysDauthFilterItem getSysDauthFilterItem() {
        return sysDauthFilterItem;
    }

    public void setSysDauthFilterItem(SysDauthFilterItem sysDauthFilterItem) {
        this.sysDauthFilterItem = sysDauthFilterItem;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

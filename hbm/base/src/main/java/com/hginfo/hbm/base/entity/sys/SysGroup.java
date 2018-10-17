/*
 * Project Name:hbm-base.
 * File Name:SysGroup.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:36
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
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
 * 小组表: sys_group. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_GROUP")
@DynamicInsert
public class SysGroup extends BizEntity {

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
        TABLE_META.setAlias("sg");
        TABLE_META.addField("groupId", "GROUP_ID_", Long.class);
        TABLE_META.addField("orgId", "ORG_ID_", Long.class);
        TABLE_META.addField("groupCode", "GROUP_CODE_", String.class);
        TABLE_META.addField("groupName", "GROUP_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Integer.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Integer.class);
    }

    /**
     * GROUP_ID_ : 职务编号。
     */
    private Long groupId;
    /**
     * ORG_ID_ : 部门编号。
     */
    private Long orgId;
    /**
     * GROUP_CODE_ : 职务编码。
     */
    private String groupCode;
    /**
     * GROUP_NAME_ : 职务名称。
     */
    private String groupName;
    /**
     * ENG_NAME_ : 部门英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * orgId : 组织架构表实体。
     */
    private SysOrganization sysOrganization;

    @Override
    @Transient
    public Long getId() {
        return getGroupId();
    }

    @Override
    public void setId(Long id) {
        setGroupId(id);
    }

    @Id
    @Column(name = "GROUP_ID_")
    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    @Column(name = "ORG_ID_")
    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    @Column(name = "GROUP_CODE_")
    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    @Column(name = "GROUP_NAME_")
    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Column(name = "ENG_NAME_")
    public String getEngName() {
        return engName;
    }

    public void setEngName(String engName) {
        this.engName = engName;
    }

    @Column(name = "I18N_CODE_")
    public String getI18nCode() {
        return i18nCode;
    }

    public void setI18nCode(String i18nCode) {
        this.i18nCode = i18nCode;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysOrganization getSysOrganization() {
        return sysOrganization;
    }

    public void setSysOrganization(SysOrganization sysOrganization) {
        this.sysOrganization = sysOrganization;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

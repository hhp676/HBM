/**
 * Project Name:hbm-base.
 * File Name:SysDictGroup.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年11月30日 上午10:26:47
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
 * 系统字典组表: sys_dict_group. <br />
 * entity 层 <br />
 * Date: 2016年11月30日 上午10:26:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_DICT_GROUP")
@DynamicInsert
public class SysDictGroup extends BizEntity {
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
        TABLE_META.setAlias("sdg");
        TABLE_META.addField("dictGroupId", "DICT_GROUP_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("dictGroupCode", "DICT_GROUP_CODE_", String.class);
        TABLE_META.addField("groupType", "GROUP_TYPE_", String.class);
        TABLE_META.addField("groupName", "GROUP_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * DICT_GROUP_ID_ : 字典组编号.
     */
    private Long dictGroupId;
    /**
     * TENANT_ID_ : 租户ID.
     */
    private Integer tenantId;
    /**
     * DICT_GROUP_CODE_ : 字典编码.
     */
    private String dictGroupCode;
    /**
     * GROUP_TYPE_ : 字典组类型.
     */
    private String groupType;
    /**
     * GROUP_NAME_ : 字典组中文名称.
     */
    private String groupName;
    /**
     * ENG_NAME_ : 英文名称.
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码.
     */
    private String i18nCode;
    /**
     * DESCR_ : 描述.
     */
    private String descr;


    @Override
    @Transient
    public Long getId() {
        return getDictGroupId();
    }

    @Override
    public void setId(Long id) {
        setDictGroupId(id);
    }

    @Id
    @Column(name = "DICT_GROUP_ID_")
    public Long getDictGroupId() {
        return dictGroupId;
    }

    public void setDictGroupId(Long dictGroupId) {
        this.dictGroupId = dictGroupId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "DICT_GROUP_CODE_")
    public String getDictGroupCode() {
        return dictGroupCode;
    }

    public void setDictGroupCode(String dictGroupCode) {
        this.dictGroupCode = dictGroupCode;
    }

    @Column(name = "GROUP_TYPE_")
    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
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

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

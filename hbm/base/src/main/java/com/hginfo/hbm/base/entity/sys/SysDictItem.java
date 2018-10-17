/*
 * Project Name:hbm-base.
 * File Name:SysDictItem.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月23日 下午4:56:36
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
 * 系统字典项表: sys_dict_item. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_DICT_ITEM")
@DynamicInsert
public class SysDictItem extends BizEntity {

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
        TABLE_META.setAlias("sdi");
        TABLE_META.addField("dictItemId", "DICT_ITEM_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("dictGroupId", "DICT_GROUP_ID_", Long.class);
        TABLE_META.addField("itemValue", "ITEM_VALUE_", String.class);
        TABLE_META.addField("itemName", "ITEM_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("isVisible", "IS_VISIBLE_", Integer.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Integer.class);
        TABLE_META.addField("priorityNo", "PRIORITY_NO_", Long.class);
        TABLE_META.addField("subGroupCode", "SUB_GROUP_CODE_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * DICT_ITEM_ID_ : 字典编号。
     */
    private Long dictItemId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * DICT_GROUP_ID_ : 字典组编号。
     */
    private Long dictGroupId;
    /**
     * ITEM_VALUE_ : 字典项值。
     */
    private String itemValue;
    /**
     * ITEM_NAME_ : 字典中文名称。
     */
    private String itemName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * IS_VISIBLE_ : 是否可见。
     */
    private Integer isVisible;
    /**
     * SORT_NO_ : 排序号。
     */
    private Integer sortNo;
    /**
     * PRIORITY_NO_ : 权重号。
     */
    private Long priorityNo;
    /**
     * SUB_GROUP_CODE_ : 字典项类型，字典组下项的再分组。
     */
    private String subGroupCode;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * dictGroupId : 系统字典组表实体。
     */
    @HEntityId("dictGroupId")
    private SysDictGroup sysDictGroup;

    @Override
    @Transient
    public Long getId() {
        return getDictItemId();
    }

    @Override
    public void setId(Long id) {
        setDictItemId(id);
    }

    @Id
    @Column(name = "DICT_ITEM_ID_")
    public Long getDictItemId() {
        return dictItemId;
    }

    public void setDictItemId(Long dictItemId) {
        this.dictItemId = dictItemId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "DICT_GROUP_ID_")
    public Long getDictGroupId() {
        return dictGroupId;
    }

    public void setDictGroupId(Long dictGroupId) {
        this.dictGroupId = dictGroupId;
    }

    @Column(name = "ITEM_VALUE_")
    public String getItemValue() {
        return itemValue;
    }

    public void setItemValue(String itemValue) {
        this.itemValue = itemValue;
    }

    @Column(name = "ITEM_NAME_")
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
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

    @Column(name = "IS_VISIBLE_")
    public Integer getIsVisible() {
        return isVisible;
    }

    public void setIsVisible(Integer isVisible) {
        this.isVisible = isVisible;
    }

    @Column(name = "SORT_NO_")
    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    @Column(name = "PRIORITY_NO_")
    public Long getPriorityNo() {
        return priorityNo;
    }

    public void setPriorityNo(Long priorityNo) {
        this.priorityNo = priorityNo;
    }

    @Column(name = "SUB_GROUP_CODE_")
    public String getSubGroupCode() {
        return subGroupCode;
    }

    public void setSubGroupCode(String subGroupCode) {
        this.subGroupCode = subGroupCode;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Transient
    public SysDictGroup getSysDictGroup() {
        return sysDictGroup;
    }

    public void setSysDictGroup(SysDictGroup sysDictGroup) {
        this.sysDictGroup = sysDictGroup;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

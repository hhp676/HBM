/*
 * Project Name:hbm-base.
 * File Name:SysOperation.java
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
 * 系统操作类型表: sys_operation. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_OPERATION")
@DynamicInsert
public class SysOperation extends BizEntity {

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
        TABLE_META.setAlias("so");
        TABLE_META.addField("operationId", "OPERATION_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("operationCode", "OPERATION_CODE_", String.class);
        TABLE_META.addField("operationName", "OPERATION_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("style", "STYLE_", String.class);
        TABLE_META.addField("uri", "URI_", String.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Integer.class);
        TABLE_META.addField("isVisible", "IS_VISIBLE_", Integer.class);
        TABLE_META.addField("tip", "TIP_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        TABLE_META.addField("iconId", "ICON_ID_", Long.class);
    }

    /**
     * OPERATION_ID_ : 操作编号。
     */
    private Long operationId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * OPERATION_CODE_ : 编码。
     */
    private String operationCode;
    /**
     * OPERATION_NAME_ : 权限名称。
     */
    private String operationName;
    /**
     * ENG_NAME_ : 部门英文名称。
     */
    private String engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String i18nCode;
    /**
     * STYLE_ : CSS。
     */
    private String style;
    /**
     * URI_ : 默认uri。
     */
    private String uri;
    /**
     * SORT_NO_ : 排序。
     */
    private Integer sortNo;
    /**
     * IS_VISIBLE_ : 是否可见。
     */
    private Integer isVisible;
    /**
     * TIP_ : 提示信息。
     */
    private String tip;
    /**
     * DESCR_ : 描述。
     */
    private String descr;
    /**
     * ICON_ID_ : ICON编号。
     */
    private Long iconId;
    /**
     * iconId : 系统图标表实体。
     */
    @HEntityId("iconId")
    private SysIcon sysIcon;

    @Override
    @Transient
    public Long getId() {
        return getOperationId();
    }

    @Override
    public void setId(Long id) {
        setOperationId(id);
    }

    @Id
    @Column(name = "OPERATION_ID_")
    public Long getOperationId() {
        return operationId;
    }

    public void setOperationId(Long operationId) {
        this.operationId = operationId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "OPERATION_CODE_")
    public String getOperationCode() {
        return operationCode;
    }

    public void setOperationCode(String operationCode) {
        this.operationCode = operationCode;
    }

    @Column(name = "OPERATION_NAME_")
    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
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

    @Column(name = "STYLE_")
    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    @Column(name = "URI_")
    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    @Column(name = "SORT_NO_")
    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    @Column(name = "IS_VISIBLE_")
    public Integer getIsVisible() {
        return isVisible;
    }

    public void setIsVisible(Integer isVisible) {
        this.isVisible = isVisible;
    }

    @Column(name = "TIP_")
    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    @Column(name = "DESCR_")
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    @Column(name = "ICON_ID_")
    public Long getIconId() {
        return iconId;
    }

    public void setIconId(Long iconId) {
        this.iconId = iconId;
    }

    @Transient
    public SysIcon getSysIcon() {
        return sysIcon;
    }

    public void setSysIcon(SysIcon sysIcon) {
        this.sysIcon = sysIcon;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

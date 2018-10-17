/*
 * Project Name:hbm-base.
 * File Name:SysModel.java
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
 * 系统模块表: sys_model. <br />
 * entity 层 <br />
 * Date: 2016年12月23日 下午4:56:36 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_MODEL")
@DynamicInsert
public class SysModel extends BizEntity {
    
    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long      serialVersionUID = 1L;
    
    /**
     * 数据库表元数据。
     */
    private static final TableMeta TABLE_META       = new TableMeta();
    
    static {
        TABLE_META.setAlias("sm");
        TABLE_META.addField("modelId", "MODEL_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("modelCode", "MODEL_CODE_", String.class);
        TABLE_META.addField("modelName", "MODEL_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("fid", "FID_", Long.class);
        TABLE_META.addField("style", "STYLE_", String.class);
        TABLE_META.addField("bsStyle", "BS_STYLE_", String.class);
        TABLE_META.addField("uri", "URI_", String.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Integer.class);
        TABLE_META.addField("isVisible", "IS_VISIBLE_", Integer.class);
        TABLE_META.addField("tip", "TIP_", String.class);
        TABLE_META.addField("modelType", "MODEL_TYPE_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        TABLE_META.addField("iconId", "ICON_ID_", Long.class);
        TABLE_META.addField("isTopMenu", "IS_TOP_MENU_", Integer.class);
        TABLE_META.addField("isSubMenu", "IS_SUB_MENU_", Integer.class);
        TABLE_META.addField("isBsTopMenu", "IS_BS_TOP_MENU_", Integer.class);
        TABLE_META.addField("isBsSubMenu", "IS_BS_SUB_MENU_", Integer.class);
    }
    
    /**
     * MODEL_ID_ : 模型编号。
     */
    private Long     modelId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer  tenantId;
    /**
     * MODEL_CODE_ : 编码。
     */
    private String   modelCode;
    /**
     * MODEL_NAME_ : 模型名称。
     */
    private String   modelName;
    /**
     * ENG_NAME_ : 英文名称。
     */
    private String   engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String   i18nCode;
    /**
     * FID_ : 父职务编号。
     */
    private Long     fid;
    /**
     * STYLE_ : CSS。
     */
    private String   style;
    /**
     * STYLE_ : BS CSS。
     */
    private String   bsStyle;
    /**
     * URI_ : 默认uri。
     */
    private String   uri;
    /**
     * SORT_NO_ : 排序。
     */
    private Integer  sortNo;
    /**
     * IS_VISIBLE_ : 是否可见。
     */
    private Integer  isVisible;
    /**
     * TIP_ : 提示信息。
     */
    private String   tip;
    /**
     * MODEL_TYPE_ : 模块类型（区分上方模块，左侧模型等）。
     */
    private Integer  modelType;
    /**
     * DESCR_ : 描述。
     */
    private String   descr;
    /**
     * ICON_ID_ : ICON编号。
     */
    private Long     iconId;
    /**
     * IS_TOP_MENU_ : 是否是顶部导航菜单（不仅仅是顶级菜单）。
     */
    private Integer  isTopMenu;
    /**
     * IS_SUB_MENU_ : 是否是左侧菜单。
     */
    private Integer  isSubMenu;
    /**
     * IS_BS_TOP_MENU_ : 是否是Bootstrap顶部导航菜单。
     */
    private Integer  isBsTopMenu;
    /**
     * IS_BS_SUB_MENU_ : 是否是Bootstrap左侧菜单。
     */
    private Integer  isBsSubMenu;
    /**
     * iconId : 系统图标表实体。
     */
    @HEntityId("iconId")
    private SysIcon  sysIcon;
    /**
     * fid : 系统模块表实体。
     */
    @HEntityId("fid")
    private SysModel parent;
    
    /**
     * 
     */
    private String fids;
    
    /**
     * authCode查询Like字段.
     */
    private String modelCodeLike;

    /**
     * url查询Like字段.
     */
    private String uriLike;

    @Transient
    public String getModelCodeLike() {
        return modelCodeLike;
    }
    
    public void setModelCodeLike(String modelCodeLike) {
        this.modelCodeLike = modelCodeLike;
    }
    
    @Transient
    public String getFids() {
        return fids;
    }

    public void setFids(String fids) {
        this.fids = fids;
    }

    @Override
    @Transient
    public Long getId() {
        return getModelId();
    }
    
    @Override
    public void setId(Long id) {
        setModelId(id);
    }
    
    @Id
    @Column(name = "MODEL_ID_")
    public Long getModelId() {
        return modelId;
    }
    
    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }
    
    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }
    
    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
    
    @Column(name = "MODEL_CODE_")
    public String getModelCode() {
        return modelCode;
    }
    
    public void setModelCode(String modelCode) {
        this.modelCode = modelCode;
    }
    
    @Column(name = "MODEL_NAME_")
    public String getModelName() {
        return modelName;
    }
    
    public void setModelName(String modelName) {
        this.modelName = modelName;
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
    
    @Column(name = "FID_")
    public Long getFid() {
        return fid;
    }
    
    public void setFid(Long fid) {
        this.fid = fid;
    }
    
    @Column(name = "STYLE_")
    public String getStyle() {
        return style;
    }
    
    public void setStyle(String style) {
        this.style = style;
    }
    
    @Column(name = "BS_STYLE_")
    public String getBsStyle() {
        return bsStyle;
    }

    public void setBsStyle(String bsStyle) {
        this.bsStyle = bsStyle;
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
    
    @Column(name = "MODEL_TYPE_")
    public Integer getModelType() {
        return modelType;
    }
    
    public void setModelType(Integer modelType) {
        this.modelType = modelType;
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
    
    @Column(name = "IS_TOP_MENU_")
    public Integer getIsTopMenu() {
        return isTopMenu;
    }
    
    public void setIsTopMenu(Integer isTopMenu) {
        this.isTopMenu = isTopMenu;
    }
    
    @Column(name = "IS_SUB_MENU_")
    public Integer getIsSubMenu() {
        return isSubMenu;
    }
    
    public void setIsSubMenu(Integer isSubMenu) {
        this.isSubMenu = isSubMenu;
    }
    
    @Column(name = "IS_BS_TOP_MENU_")
    public Integer getIsBsTopMenu() {
        return isBsTopMenu;
    }
    
    public void setIsBsTopMenu(Integer isBsTopMenu) {
        this.isBsTopMenu = isBsTopMenu;
    }
    
    @Column(name = "IS_BS_SUB_MENU_")
    public Integer getIsBsSubMenu() {
        return isBsSubMenu;
    }
    
    public void setIsBsSubMenu(Integer isBsSubMenu) {
        this.isBsSubMenu = isBsSubMenu;
    }
    
    @Transient
    public SysIcon getSysIcon() {
        return sysIcon;
    }
    
    public void setSysIcon(SysIcon sysIcon) {
        this.sysIcon = sysIcon;
    }
    
    @Transient
    public SysModel getParent() {
        return parent;
    }
    
    public void setParent(SysModel parent) {
        this.parent = parent;
    }

    @Transient
    public String getUriLike() {
        return uriLike;
    }

    public void setUriLike(String uriLike) {
        this.uriLike = uriLike;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }
    
}

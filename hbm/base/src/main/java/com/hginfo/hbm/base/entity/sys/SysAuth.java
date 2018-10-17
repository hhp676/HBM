/*
 * Project Name:hbm-base.
 * File Name:SysAuth.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月20日 下午2:20:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.hginfo.hbm.annotation.HEntityId;
import org.hibernate.annotations.DynamicInsert;
import com.alibaba.fastjson.annotation.JSONField;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 系统权限表: sys_auth. <br />
 * entity 层 <br />
 * Date: 2016年12月20日 下午2:20:44 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_AUTH")
@DynamicInsert
public class SysAuth extends BizEntity {
    
    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long      serialVersionUID = 1L;
                                                    
    /**
     * 数据库表元数据。
     */
    static final TableMeta TABLE_META       = new TableMeta();
                                                    
    static {
        TABLE_META.setAlias("sa");
        TABLE_META.addField("authId", "AUTH_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("authCode", "AUTH_CODE_", String.class);
        TABLE_META.addField("authName", "AUTH_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("i18nCode", "I18N_CODE_", String.class);
        TABLE_META.addField("modelId", "MODEL_ID_", Long.class);
        TABLE_META.addField("authCategory", "AUTH_CATEGORY_", Integer.class);
        TABLE_META.addField("operationId", "OPERATION_ID_", Long.class);
        TABLE_META.addField("isInheritable", "IS_INHERITABLE_", Integer.class);
        TABLE_META.addField("style", "STYLE_", String.class);
        TABLE_META.addField("bsStyle", "BS_STYLE_", String.class);
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
        TABLE_META.addField("isPublic", "IS_PUBLIC", Integer.class);
    }
    
    /**
     * AUTH_ID_ : 权限编号。
     */
    private Long         authId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer      tenantId;
    /**
     * AUTH_CODE_ : 编码。
     */
    private String       authCode;
    /**
     * AUTH_NAME_ : 权限名称。
     */
    private String       authName;
    /**
     * ENG_NAME_ : 部门英文名称。
     */
    private String       engName;
    /**
     * I18N_CODE_ : 国际化编码。
     */
    private String       i18nCode;
    /**
     * MODEL_ID_ : 模型编号。
     */
    private Long         modelId;
    
    /**
     * AUTH_CATEGORY_ : 权限类型 1：主权限  2：附属权限。
     */
    private Integer         authCategory;
    /**
     * OPERATION_ID_ : 操作编号。
     */
    private Long         operationId;
    /**
     * IS_INHERITABLE_ : 是否可继承，判断用户是否可控制下属的对应权限。
     */
    private Integer      isInheritable;
    /**
     * STYLE_ : CSS。
     */
    private String       style;
    /**
     * STYLE_ : BS CSS。
     */
    private String   bsStyle;
    /**
     * URI_ : 默认uri。
     */
    private String       uri;
    /**
     * SORT_NO_ : 排序。
     */
    private Integer      sortNo;
    /**
     * IS_VISIBLE_ : 是否可见。
     */
    private Integer      isVisible;
    /**
     * TIP_ : 提示信息。
     */
    private String       tip;
    /**
     * DESCR_ : 描述。
     */
    private String       descr;
    /**
     * ICON_ID_ : ICON编号。
     */
    private Long         iconId;
    /**
     * IS_PUBLIC : 是否公共权限,如果是公共权限URL功能校验不拦截校验。（0：公共权限，1：非公共权限）。
     */
    private Integer      isPublic;
    /**
     * iconId : 系统图标表实体。
     */
    @HEntityId("iconId")
    private SysIcon      sysIcon;
    /**
     * modelId : 系统模块表实体。
     */
    @HEntityId("modelId")
    private SysModel     sysModel;
    /**
     * operationId : 系统操作类型表实体。
     */
    @HEntityId("operationId")
    private SysOperation sysOperation;

    /**
     * sysRole : 系统角色表实体。
     */
    @HEntityId("roleId")
    private SysRole sysRole;
    /**
     * roleId : 角色ID。
     */
    private Long roleId;
    
    /**
     * 权限类型(正负授权)。
     */
    private Integer      authType;
    
    /**
     * 权限类型(页面展示：模块；权限)。
     */
    private Integer      authShowType;
                         
    /**
     * 模块与权限关系层级父节点ID.
     */
    private Long         fid;
                         
    /**
     * 权限树上级节点ID.
     */
    @JSONField(name = "_parentId")
    private Long         _parentId;    // 父节点id
    
    /**
     * 节点是否展开.
     */
    private String state;
                         
    /**
     * 图标样式：前台列表展示用.
     */
    private String       iconCls;      // 图标样式
           
    /**
     * IS_TOP_MENU_ : 是否是顶部导航菜单（不仅仅是顶级菜单）。
     */
    private Integer  isTopMenu;
    /**
     * IS_SUB_MENU_ : 是否是左侧菜单。
     */
    private Integer  isSubMenu;
    
    /**
     * IS_BS_TOP_MENU_ : 是否是bootstrap顶部导航菜单（不仅仅是顶级菜单）。
     */
    private Integer  isBsTopMenu;
    /**
     * IS_BS_SUB_MENU_ : 是否是bootstrap左侧菜单。
     */
    private Integer  isBsSubMenu;
    
    /**
     * 是否访问操作。
     */
    private Integer isViewOperation;
    
    /**
     * 用户权限来源.
     */
    private String userAuthFrom;
    
    /**
     * url查询Like字段.
     */
    private String uriLike;
    
    /**
     * authCode查询Like字段.
     */
    private String authCodeLike;
    
    
    @Transient
    public Integer getIsViewOperation() {
        return isViewOperation;
    }

    public void setIsViewOperation(Integer isViewOperation) {
        this.isViewOperation = isViewOperation;
    }

    @Transient
    public String getUriLike() {
        return uriLike;
    }

    public void setUriLike(String uriLike) {
        this.uriLike = uriLike;
    }

    @Transient
    public String getAuthCodeLike() {
        return authCodeLike;
    }
    
    public void setAuthCodeLike(String authCodeLike) {
        this.authCodeLike = authCodeLike;
    }

    @Transient
    public String getUserAuthFrom() {
        return userAuthFrom;
    }

    public void setUserAuthFrom(String userAuthFrom) {
        this.userAuthFrom = userAuthFrom;
    }

    @Transient
    public Integer getIsTopMenu() {
        return isTopMenu;
    }

    public void setIsTopMenu(Integer isTopMenu) {
        this.isTopMenu = isTopMenu;
    }
    
    @Transient
    public Integer getIsSubMenu() {
        return isSubMenu;
    }

    public void setIsSubMenu(Integer isSubMenu) {
        this.isSubMenu = isSubMenu;
    }
    
    @Transient
    public Integer getIsBsTopMenu() {
        return isBsTopMenu;
    }

    public void setIsBsTopMenu(Integer isBsTopMenu) {
        this.isBsTopMenu = isBsTopMenu;
    }
    
    @Transient
    public Integer getIsBsSubMenu() {
        return isBsSubMenu;
    }

    public void setIsBsSubMenu(Integer isBsSubMenu) {
        this.isBsSubMenu = isBsSubMenu;
    }

    @Transient
    public String getIconCls() {
        return iconCls;
    }
    
    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }
    
    @Override
    @Transient
    public Long getId() {
        return getAuthId();
    }
    
    @Override
    public void setId(Long id) {
        setAuthId(id);
    }
    
    @Id
    @Column(name = "AUTH_ID_")
    public Long getAuthId() {
        return authId;
    }
    
    public void setAuthId(Long authId) {
        this.authId = authId;
    }
    
    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }
    
    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
    
    @Column(name = "AUTH_CODE_")
    public String getAuthCode() {
        return authCode;
    }
    
    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }
    
    @Column(name = "AUTH_NAME_")
    public String getAuthName() {
        return authName;
    }
    
    public void setAuthName(String authName) {
        this.authName = authName;
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
    
    @Column(name = "MODEL_ID_")
    public Long getModelId() {
        return modelId;
    }
    
    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }
    
    @Column(name = "AUTH_CATEGORY_")
    public Integer getAuthCategory() {
        return authCategory;
    }

    public void setAuthCategory(Integer authCategory) {
        this.authCategory = authCategory;
    }

    @Column(name = "OPERATION_ID_")
    public Long getOperationId() {
        return operationId;
    }
    
    public void setOperationId(Long operationId) {
        this.operationId = operationId;
    }
    
    @Column(name = "IS_INHERITABLE_")
    public Integer getIsInheritable() {
        return isInheritable;
    }
    
    public void setIsInheritable(Integer isInheritable) {
        this.isInheritable = isInheritable;
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
    
    @Column(name = "IS_PUBLIC")
    public Integer getIsPublic() {
        return isPublic;
    }
    
    public void setIsPublic(Integer isPublic) {
        this.isPublic = isPublic;
    }
    
    @Transient
    public SysIcon getSysIcon() {
        return sysIcon;
    }
    
    public void setSysIcon(SysIcon sysIcon) {
        this.sysIcon = sysIcon;
    }
    
    @Transient
    public SysModel getSysModel() {
        return sysModel;
    }
    
    public void setSysModel(SysModel sysModel) {
        this.sysModel = sysModel;
    }
    
    @Transient
    public SysOperation getSysOperation() {
        return sysOperation;
    }
    
    public void setSysOperation(SysOperation sysOperation) {
        this.sysOperation = sysOperation;
    }
    
    @Transient
    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
    }
    
    @Transient
    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    @Transient
    public Integer getAuthType() {
        return authType;
    }

    public void setAuthType(Integer authType) {
        this.authType = authType;
    }

    @Transient
    public Integer getAuthShowType() {
        return authShowType;
    }
    
    public void setAuthShowType(Integer authShowType) {
        this.authShowType = authShowType;
    }
    
    @Transient
    public Long getFid() {
        return null == authShowType ? fid
            : (2 == authShowType ? modelId
                : fid);
    }
    
    public void setFid(Long fid) {
        this.fid = fid;
    }
    
    @Transient
    public Long get_parentId() {
        return null == authShowType ? fid
            : (2 == authShowType ? modelId
                : fid);
    }
    
    public void set_parentId(Long _parentId) {
        this._parentId = _parentId;
    }
    
    @Transient
    public String getState() {
        //顶级节点闭合
//        if (this.get_parentId() == null) {
//            return "closed";
//        }
        //子节点全部打开
        return "open";
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }
    
}

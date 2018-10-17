/**
 * Project Name:hbm-base
 * File Name:SysMenu.java
 * Package Name:com.hginfo.hbm.base.vo
 * Date:2016年12月2日下午6:51:56
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.base.vo;

import java.io.Serializable;
import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysModel;

/**
 * SysMenu。
 * ClassName:SysMenu <br/>
 * Date: 2016年12月2日 下午6:51:56 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class SysMenu implements Serializable {
    
    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * MODEL_ID_ : 模型编号.
     */
    private Long              modelId;
    
    /**
     * MODEL_NAME_ : 模型名称.
     */
    private String            modelName;
    
    /**
     * ENG_NAME_ : 英文名称.
     */
    private String            engName;
    /**
     * I18N_CODE_ : 国际化编码.
     */
    private String            i18nCode;
    
    /**
     * FID_ : 父职务编号.
     */
    private Long              fid;
    
    /**
     * ICON_ : 图标.
     */
    private String            icon;
    
    /**
     * bootstrap css.
     */
    private String            bsStyle;
    
    /**
     * IS_TOP_MENU_ : 是否是顶部菜单.
     */
    private Integer           isTopMenu;
    
    /**
     * IS_SUB_MENU_ : 是否【左侧】子菜单.
     */
    private Integer           isSubMenu;
    
    /**
     * URI_ : 默认uri.
     */
    private String            uri;
    
    /**
     * SORT_NO_ : 排序.
     */
    private Integer           sortNo;
    
    /**
     * TIP_ : 提示信息.
     */
    private String            tip;
    /**
     * MODEL_TYPE : 模块类型（区分上方模块，左侧模型等）.
     */
    private Integer           modelType;
    /**
     * DESCR_ : 描述.
     */
    private String            descr;
    
    /**
     * 子菜单列表。
     */
    private List<SysMenu>     subMenuList;
    
    /**
     * 解决序列化报错问题.
     */
    public SysMenu() {
    }
    
    /**
     * Creates a new instance of SysMenu.
     * @param sysModel sysModel
     */
    public SysMenu(SysModel sysModel) {
        this.setModelId(sysModel.getModelId());
        this.setModelName(sysModel.getModelName());
        this.setDescr(sysModel.getDescr());
        this.setEngName(sysModel.getEngName());
        this.setFid(sysModel.getFid());
        this.setI18nCode(sysModel.getI18nCode());
        this.setIcon(sysModel.getStyle());
        this.setBsStyle(sysModel.getBsStyle());
        this.setModelType(sysModel.getModelType());
        this.setTip(sysModel.getTip());
        this.setUri(sysModel.getUri());
        this.setSortNo(sysModel.getSortNo());
        this.setIsTopMenu(sysModel.getIsTopMenu());
        this.setIsSubMenu(sysModel.getIsSubMenu());
    }
    
    public Long getModelId() {
        return modelId;
    }
    
    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }
    
    public String getModelName() {
        return modelName;
    }
    
    public void setModelName(String modelName) {
        this.modelName = modelName;
    }
    
    public String getEngName() {
        return engName;
    }
    
    public void setEngName(String engName) {
        this.engName = engName;
    }
    
    public String getI18nCode() {
        return i18nCode;
    }
    
    public void setI18nCode(String i18nCode) {
        this.i18nCode = i18nCode;
    }
    
    public Long getFid() {
        return fid;
    }
    
    public void setFid(Long fid) {
        this.fid = fid;
    }
    
    public String getIcon() {
        return icon;
    }
    
    public void setIcon(String icon) {
        this.icon = icon;
    }
    
    public String getBsStyle() {
        return bsStyle;
    }
    
    public void setBsStyle(String bsStyle) {
        this.bsStyle = bsStyle;
    }
    
    public Integer getIsTopMenu() {
        return isTopMenu;
    }
    
    public void setIsTopMenu(Integer isTopMenu) {
        this.isTopMenu = isTopMenu;
    }
    
    public Integer getIsSubMenu() {
        return isSubMenu;
    }
    
    public void setIsSubMenu(Integer isSubMenu) {
        this.isSubMenu = isSubMenu;
    }
    
    public String getUri() {
        return uri;
    }
    
    public void setUri(String uri) {
        this.uri = uri;
    }
    
    public Integer getSortNo() {
        return sortNo;
    }
    
    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }
    
    public String getTip() {
        return tip;
    }
    
    public void setTip(String tip) {
        this.tip = tip;
    }
    
    public Integer getModelType() {
        return modelType;
    }
    
    public void setModelType(Integer modelType) {
        this.modelType = modelType;
    }
    
    public String getDescr() {
        return descr;
    }
    
    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    public List<SysMenu> getSubMenuList() {
        return subMenuList;
    }
    
    public void setSubMenuList(List<SysMenu> subMenuList) {
        this.subMenuList = subMenuList;
    }
    
}

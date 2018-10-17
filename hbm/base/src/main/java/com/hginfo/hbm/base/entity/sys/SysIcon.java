/*
 * Project Name:hbm-base.
 * File Name:SysIcon.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月07日 下午3:17:04
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
 * 系统图标表: sys_icon. <br />
 * entity 层 <br />
 * Date: 2016年12月07日 下午3:17:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_ICON")
@DynamicInsert
public class SysIcon extends BizEntity {

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
        TABLE_META.setAlias("si");
        TABLE_META.addField("iconId", "ICON_ID_", Long.class);
        TABLE_META.addField("iconType", "ICON_TYPE_", String.class);
        TABLE_META.addField("skinCode", "SKIN_CODE_", String.class);
        TABLE_META.addField("iconCss", "ICON_CSS_", String.class);
        TABLE_META.addField("imagePath", "IMAGE_PATH_", String.class);
        TABLE_META.addField("imagePath2", "IMAGE_PATH_2_", String.class);
        TABLE_META.addField("imagePath3", "IMAGE_PATH_3_", String.class);
        TABLE_META.addField("tip", "TIP_", String.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Integer.class);
        TABLE_META.addField("isVisible", "IS_VISIBLE", Integer.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * ICON_ID_ : ICON编号。
     */
    private Long iconId;
    /**
     * ICON_TYPE_ : 类型，可用于区分不同的前端。
     */
    private String iconType;
    /**
     * SKIN_CODE_ : 皮肤编码。
     */
    private String skinCode;
    /**
     * ICON_CSS_ : css名称。
     */
    private String iconCss;
    /**
     * IMAGE_PATH_ : 图片路径。
     */
    private String imagePath;
    /**
     * IMAGE_PATH_2_ : 图片路径。
     */
    private String imagePath2;
    /**
     * IMAGE_PATH_3_ : 图片路径。
     */
    private String imagePath3;
    /**
     * TIP_ : 提示信息。
     */
    private String tip;
    /**
     * SORT_NO_ : 排序。
     */
    private Integer sortNo;
    /**
     * IS_VISIBLE : 是否可见。
     */
    private Integer isVisible;
    /**
     * DESCR_ : 描述。
     */
    private String descr;

    @Override
    @Transient
    public Long getId() {
        return getIconId();
    }

    @Override
    public void setId(Long id) {
        setIconId(id);
    }

    @Id
    @Column(name = "ICON_ID_")
    public Long getIconId() {
        return iconId;
    }

    public void setIconId(Long iconId) {
        this.iconId = iconId;
    }

    @Column(name = "ICON_TYPE_")
    public String getIconType() {
        return iconType;
    }

    public void setIconType(String iconType) {
        this.iconType = iconType;
    }

    @Column(name = "SKIN_CODE_")
    public String getSkinCode() {
        return skinCode;
    }

    public void setSkinCode(String skinCode) {
        this.skinCode = skinCode;
    }

    @Column(name = "ICON_CSS_")
    public String getIconCss() {
        return iconCss;
    }

    public void setIconCss(String iconCss) {
        this.iconCss = iconCss;
    }

    @Column(name = "IMAGE_PATH_")
    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Column(name = "IMAGE_PATH_2_")
    public String getImagePath2() {
        return imagePath2;
    }

    public void setImagePath2(String imagePath2) {
        this.imagePath2 = imagePath2;
    }

    @Column(name = "IMAGE_PATH_3_")
    public String getImagePath3() {
        return imagePath3;
    }

    public void setImagePath3(String imagePath3) {
        this.imagePath3 = imagePath3;
    }

    @Column(name = "TIP_")
    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    @Column(name = "SORT_NO_")
    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    @Column(name = "IS_VISIBLE")
    public Integer getIsVisible() {
        return isVisible;
    }

    public void setIsVisible(Integer isVisible) {
        this.isVisible = isVisible;
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

/**
 * Project Name:hbm-base.
 * File Name:SysConfig.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年11月29日 下午2:19:00
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
 * 系统设置表: sys_config. <br />
 * entity 层 <br />
 * Date: 2016年11月29日 下午2:19:00 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_CONFIG")
@DynamicInsert
public class SysConfig extends BizEntity {

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
        TABLE_META.setAlias("sc");
        TABLE_META.addField("configId", "CONFIG_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("configKey", "CONFIG_KEY_", String.class);
        TABLE_META.addField("configValue", "CONFIG_VALUE_", String.class);
        TABLE_META.addField("configDesc", "CONFIG_DESC_", String.class);
        TABLE_META.addField("configType", "CONFIG_TYPE_", String.class);
        TABLE_META.addField("defaultValue", "DEFAULT_VALUE_", String.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Integer.class);
        TABLE_META.addField("version", "VERSION_", Integer.class);
        TABLE_META.addField("isCurrent", "IS_CURRENT_", Integer.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * CONFIG_ID_ : 设置编号.
     */
    private Long configId;
    /**
     * TENANT_ID_ : 租户ID.
     */
    private Integer tenantId;
    /**
     * CONFIG_KEY_ : 设置KEY.
     */
    private String configKey;
    /**
     * CONFIG_VALUE_ : 设置值.
     */
    private String configValue;
    /**
     * CONFIG_DESC_ : 设置描述.
     */
    private String configDesc;
    /**
     * CONFIG_TYPE_ : 设置类型.
     */
    private String configType;
    /**
     * DEFAULT_VALUE_ : 默认值.
     */
    private String defaultValue;
    /**
     * SORT_NO_ : 排序号.
     */
    private Integer sortNo;
    /**
     * VERSION_ : 版本号.
     */
    private Integer version;
    /**
     * IS_CURRENT_ : 是否为当前版本.
     */
    private Integer isCurrent;
    /**
     * DESCR_ : 描述.
     */
    private String descr;


    @Override
    @Transient
    public Long getId() {
        return getConfigId();
    }

    @Override
    public void setId(Long id) {
        setConfigId(id);
    }

    @Id
    @Column(name = "CONFIG_ID_")
    public Long getConfigId() {
        return configId;
    }

    public void setConfigId(Long configId) {
        this.configId = configId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "CONFIG_KEY_")
    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    @Column(name = "CONFIG_VALUE_")
    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    @Column(name = "CONFIG_DESC_")
    public String getConfigDesc() {
        return configDesc;
    }

    public void setConfigDesc(String configDesc) {
        this.configDesc = configDesc;
    }

    @Column(name = "CONFIG_TYPE_")
    public String getConfigType() {
        return configType;
    }

    public void setConfigType(String configType) {
        this.configType = configType;
    }

    @Column(name = "DEFAULT_VALUE_")
    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    @Column(name = "SORT_NO_")
    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    @Column(name = "VERSION_")
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    @Column(name = "IS_CURRENT_")
    public Integer getIsCurrent() {
        return isCurrent;
    }

    public void setIsCurrent(Integer isCurrent) {
        this.isCurrent = isCurrent;
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

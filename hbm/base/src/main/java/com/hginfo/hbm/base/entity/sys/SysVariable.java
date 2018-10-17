/*
 * Project Name:hbm-base.
 * File Name:SysVariable.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年08月18日 上午10:09:41
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;


import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 系统变量：K-V类型。: sys_variable. <br />
 * entity 层 <br />
 * Date: 2017年08月18日 上午10:09:41 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_VARIABLE")
@DynamicInsert
public class SysVariable extends RelEntity {

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
        TABLE_META.setAlias("sv");
        TABLE_META.addField("varId", "VAR_ID_", Long.class);
        TABLE_META.addField("varKey", "VAR_KEY_", String.class);
        TABLE_META.addField("varValue", "VAR_VALUE_", String.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
    }

    /**
     * VAR_ID_ : 主键ID。
     */
    private Long varId;
    /**
     * VAR_KEY_ : KEY。
     */
    private String varKey;
    /**
     * VAR_VALUE_ : VALUE。
     */
    private String varValue;

    @Override
    @Transient
    public Long getId() {
        return getVarId();
    }

    @Override
    public void setId(Long id) {
        setVarId(id);
    }

    @Id
    @Column(name = "VAR_ID_")
    public Long getVarId() {
        return varId;
    }

    public void setVarId(Long varId) {
        this.varId = varId;
    }

    @Column(name = "VAR_KEY_")
    public String getVarKey() {
        return varKey;
    }

    public void setVarKey(String varKey) {
        this.varKey = varKey;
    }

    @Column(name = "VAR_VALUE_")
    public String getVarValue() {
        return varValue;
    }

    public void setVarValue(String varValue) {
        this.varValue = varValue;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

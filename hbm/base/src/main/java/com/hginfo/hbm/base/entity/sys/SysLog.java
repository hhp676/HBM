/*
 * Project Name:hbm-base.
 * File Name:SysLog.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 系统日志表: sys_log. <br />
 * entity 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_LOG")
@DynamicInsert
public class SysLog extends RelEntity {

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
        TABLE_META.setAlias("sl");
        TABLE_META.addField("logId", "LOG_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("logType", "LOG_TYPE_", Integer.class);
        TABLE_META.addField("logLevel", "LOG_LEVEL_", Integer.class);
        TABLE_META.addField("key1", "KEY1_", String.class);
        TABLE_META.addField("key2", "KEY2_", String.class);
        TABLE_META.addField("key3", "KEY3_", String.class);
        TABLE_META.addField("key4", "KEY4_", String.class);
        TABLE_META.addField("key5", "KEY5_", String.class);
        TABLE_META.addField("content", "CONTENT_", String.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * LOG_ID_ : 日志ID。
     */
    private Long logId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * LOG_TYPE_ : 类型(0:系统操作日志,1:接口类调用日志,2;定时任务调用日志,3异常信息日志)。
     */
    private Integer logType;
    /**
     * LOG_LEVEL_ : 日志级别（0:DEBUG,1:INFO,2:WARN,3:ERROR,4:FATAL）。
     */
    private Integer logLevel;
    /**
     * KEY1_ : 关键词。
     */
    private String key1;
    /**
     * KEY2_ : 关键词。
     */
    private String key2;
    /**
     * KEY3_ : 关键词。
     */
    private String key3;
    /**
     * KEY4_ : 关键词。
     */
    private String key4;
    /**
     * KEY5_ : 关键词。
     */
    private String key5;
    /**
     * CONTENT_ : 日志内容。
     */
    private String content;

    /**
     * 日志搜索关键词。
     */
    private String keyword;

    @Override
    @Transient
    public Long getId() {
        return getLogId();
    }

    @Override
    public void setId(Long id) {
        setLogId(id);
    }

    @Id
    @Column(name = "LOG_ID_")
    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "LOG_TYPE_")
    public Integer getLogType() {
        return logType;
    }

    public void setLogType(Integer logType) {
        this.logType = logType;
    }

    @Column(name = "LOG_LEVEL_")
    public Integer getLogLevel() {
        return logLevel;
    }

    public void setLogLevel(Integer logLevel) {
        this.logLevel = logLevel;
    }

    @Column(name = "KEY1_")
    public String getKey1() {
        return key1;
    }

    public void setKey1(String key1) {
        this.key1 = key1;
    }

    @Column(name = "KEY2_")
    public String getKey2() {
        return key2;
    }

    public void setKey2(String key2) {
        this.key2 = key2;
    }

    @Column(name = "KEY3_")
    public String getKey3() {
        return key3;
    }

    public void setKey3(String key3) {
        this.key3 = key3;
    }

    @Column(name = "KEY4_")
    public String getKey4() {
        return key4;
    }

    public void setKey4(String key4) {
        this.key4 = key4;
    }

    @Column(name = "KEY5_")
    public String getKey5() {
        return key5;
    }

    public void setKey5(String key5) {
        this.key5 = key5;
    }

    @Column(name = "CONTENT_")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Transient
    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

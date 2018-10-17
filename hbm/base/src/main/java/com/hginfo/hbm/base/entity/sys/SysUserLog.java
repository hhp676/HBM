/*
 * Project Name:hbm-base.
 * File Name:SysUserLog.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.annotation.IgnoreSqlFilter;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 用户操作日志表: sys_user_log. <br />
 * entity 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SYS_USER_LOG")
@DynamicInsert
public class SysUserLog extends RelEntity {

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
        TABLE_META.setAlias("sul");
        TABLE_META.addField("userLogId", "USER_LOG_ID_", Long.class);
        TABLE_META.addField("userId", "USER_ID_", Long.class);
        TABLE_META.addField("operCode", "OPER_CODE_", String.class);
        TABLE_META.addField("operName", "OPER_NAME_", String.class);
        TABLE_META.addField("engName", "ENG_NAME_", String.class);
        TABLE_META.addField("reqUri", "REQ_URI_", String.class);
        TABLE_META.addField("operIp", "OPER_IP_", String.class);
        TABLE_META.addField("key1", "KEY1_", String.class);
        TABLE_META.addField("key2", "KEY2_", String.class);
        TABLE_META.addField("key3", "KEY3_", String.class);
        TABLE_META.addField("content", "CONTENT_", String.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("operRes", "OPER_RES_", String.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
    }

    /**
     * USER_LOG_ID_ : 日志ID。
     */
    private Long userLogId;
    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * OPER_CODE_ : 操作编码（如：USER_ADD）。
     */
    private String operCode;
    /**
     * OPER_NAME_ : 中文操作名称（如：新增用户）。
     */
    private String operName;
    /**
     * ENG_NAME_ : 英文操作名称（如：addUser）。
     */
    private String engName;
    /**
     * REQ_URI_ : 请求URI。
     */
    private String reqUri;
    /**
     * OPER_IP_ : 调用方IP。
     */
    private String operIp;
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
     * CONTENT_ : 日志内容。
     */
    private String content;
    /**
     * OPER_RES_ : 操作结果(1：成功  0：失败)。
     */
    private String operRes;
    /**
     * userId : 用户表实体。
     */
    @HEntityId("userId")
    private SysUser sysUser;
    
    /**
     * 
     */
    private String userName;
    /**
     * 日志搜索关键词。
     */
    private String keyword;

    @Override
    @Transient
    public Long getId() {
        return getUserLogId();
    }

    @Override
    public void setId(Long id) {
        setUserLogId(id);
    }

    @Id
    @Column(name = "USER_LOG_ID_")
    public Long getUserLogId() {
        return userLogId;
    }

    public void setUserLogId(Long userLogId) {
        this.userLogId = userLogId;
    }

    @Column(name = "USER_ID_")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Column(name = "OPER_CODE_")
    public String getOperCode() {
        return operCode;
    }

    public void setOperCode(String operCode) {
        this.operCode = operCode;
    }

    @Column(name = "OPER_NAME_")
    public String getOperName() {
        return operName;
    }

    public void setOperName(String operName) {
        this.operName = operName;
    }

    @Column(name = "ENG_NAME_")
    public String getEngName() {
        return engName;
    }

    public void setEngName(String engName) {
        this.engName = engName;
    }

    @Column(name = "REQ_URI_")
    public String getReqUri() {
        return reqUri;
    }

    public void setReqUri(String reqUri) {
        this.reqUri = reqUri;
    }

    @Column(name = "OPER_IP_")
    public String getOperIp() {
        return operIp;
    }

    public void setOperIp(String operIp) {
        this.operIp = operIp;
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

    @Column(name = "CONTENT_")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "OPER_RES_")
    public String getOperRes() {
        return operRes;
    }

    public void setOperRes(String operRes) {
        this.operRes = operRes;
    }

    @Transient
    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Transient
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

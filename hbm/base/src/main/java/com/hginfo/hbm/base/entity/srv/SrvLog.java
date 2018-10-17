/*
 * Project Name:hbm-base.
 * File Name:SrvLog.java
 * Package Name:com.hginfo.hbm.base.entity.srv
 * Date:2017年06月08日 上午10:01:22
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.srv;


import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.SingleKeyBaseEntity;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * 接口日志表: srv_log. <br />
 * entity 层 <br />
 * Date: 2017年06月08日 上午10:01:22 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SRV_LOG")
@DynamicInsert
public class SrvLog extends SingleKeyBaseEntity {

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
        TABLE_META.setAlias("sl");
        TABLE_META.addField("logId", "LOG_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("ifId", "IF_ID_", Long.class);
        TABLE_META.addField("reqType", "REQ_TYPE_", String.class);
        TABLE_META.addField("reqUri", "REQ_URI_", String.class);
        TABLE_META.addField("reqUserid", "REQ_USERID_", Long.class);
        TABLE_META.addField("beginTime", "BEGIN_TIME_", Date.class);
        TABLE_META.addField("endTime", "END_TIME_", Date.class);
        TABLE_META.addField("processTime", "PROCESS_TIME_", Integer.class);
        TABLE_META.addField("consumerIp", "CONSUMER_IP_", String.class);
        TABLE_META.addField("providerIp", "PROVIDER_IP_", String.class);
        TABLE_META.addField("ip", "IP_", String.class);
        TABLE_META.addField("result", "RESULT_", Integer.class);
    }

    /**
     * LOG_ID_ : 主键。
     */
    private Long logId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * IF_ID_ : 接口主键。
     */
    private Long ifId;
    /**
     * REQ_URI_ : 请求地址。
     */
    private String reqType;
    /**
     * REQ_URI_ : 请求地址。
     */
    private String reqUri;
    /**
     * REQ_USERID_ : 请求用户。
     */
    private Long reqUserid;
    /**
     * BEGIN_TIME_ : 请求开始时间。
     */
    private Date beginTime;
    /**
     * END_TIME_ : 请求结束时间。
     */
    private Date endTime;
    /**
     * PROCESS_TIME_ : 处理时间（毫秒）。
     */
    private Integer processTime;
    /**
     * IP_ : 消费者机器IP。
     */
    private String consumerIp;
    /**
     * IP_ : 提供者机器IP。
     */
    private String providerIp;
    /**
     * IP_ : 客户端请求IP。
     */
    private String ip;
    /**
     * RESULT_ : 结果(1:成功;0:失败)。
     */
    private Integer result;

    @HEntityId("reqUserid")
    private SysUser sysUser;

    /**
     * bo : 查询业务对象。
     */
    private SrvLog.Bo bo = new SrvLog.Bo();

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

    @Column(name = "IF_ID_")
    public Long getIfId() {
        return ifId;
    }

    public void setIfId(Long ifId) {
        this.ifId = ifId;
    }

    @Column(name = "REQ_TYPE_")
    public String getReqType() {
        return reqType;
    }

    public void setReqType(String reqType) {
        this.reqType = reqType;
    }

    @Column(name = "REQ_URI_")
    public String getReqUri() {
        return reqUri;
    }

    public void setReqUri(String reqUri) {
        this.reqUri = reqUri;
    }

    @Column(name = "REQ_USERID_")
    public Long getReqUserid() {
        return reqUserid;
    }

    public void setReqUserid(Long reqUserid) {
        this.reqUserid = reqUserid;
    }

    @Column(name = "BEGIN_TIME_")
    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    @Column(name = "END_TIME_")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Column(name = "PROCESS_TIME_")
    public Integer getProcessTime() {
        return processTime;
    }

    public void setProcessTime(Integer processTime) {
        this.processTime = processTime;
    }

    @Column(name = "CONSUMER_IP_")
    public String getConsumerIp() {
        return consumerIp;
    }

    public void setConsumerIp(String consumerIp) {
        this.consumerIp = consumerIp;
    }

    @Column(name = "PROVIDER_IP_")
    public String getProviderIp() {
        return providerIp;
    }

    public void setProviderIp(String providerIp) {
        this.providerIp = providerIp;
    }

    @Column(name = "IP_")
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Column(name = "RESULT_")
    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    @Transient
    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

    @Transient
    public SrvLog.Bo getBo() {
        return bo;
    }

    public void setBo(SrvLog.Bo bo) {
        this.bo = bo;
    }

    public class Bo implements Serializable {

        /**
         * 查询用户。
         */
        private String reqUsername;

        /**
         * 查询时间。
         */
        private String filterTime;

        /**
         * 客户端用户。
         */
        private String ip;

        /**
         * 处理时间字符串。
         */
        private String processTime;

        /**
         * 起始处理时间。
         */
        private Integer processTimeBegin;

        /**
         * 结束处理时间。
         */
        private Integer processTimeEnd;

        /**
         * 最近天数。
         */
        private Integer recentDays;

        public String getReqUsername() {
            return reqUsername;
        }

        public void setReqUsername(String reqUsername) {
            this.reqUsername = reqUsername;
        }

        public String getFilterTime() {
            return filterTime;
        }

        public void setFilterTime(String filterTime) {
            this.filterTime = filterTime;
        }

        public String getIp() {
            return ip;
        }

        public void setIp(String ip) {
            this.ip = ip;
        }

        public String getProcessTime() {
            return processTime;
        }

        public void setProcessTime(String processTime) {
            this.processTime = processTime;
        }

        public Integer getProcessTimeBegin() {
            return processTimeBegin;
        }

        public void setProcessTimeBegin(Integer processTimeBegin) {
            this.processTimeBegin = processTimeBegin;
        }

        public Integer getProcessTimeEnd() {
            return processTimeEnd;
        }

        public void setProcessTimeEnd(Integer processTimeEnd) {
            this.processTimeEnd = processTimeEnd;
        }

        public Integer getRecentDays() {
            return recentDays;
        }

        public void setRecentDays(Integer recentDays) {
            this.recentDays = recentDays;
        }
    }

}

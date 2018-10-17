/*
 * Project Name:hbm-base.
 * File Name:SrvInterface.java
 * Package Name:com.hginfo.hbm.base.entity.srv
 * Date:2017年06月13日 下午2:12:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.srv;


import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * 接口表: srv_interface. <br />
 * entity 层 <br />
 * Date: 2017年06月13日 下午2:12:59 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Entity(name = "SRV_INTERFACE")
@DynamicInsert
public class SrvInterface extends BizEntity {

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
        TABLE_META.setAlias("si");
        TABLE_META.addField("ifId", "IF_ID_", Long.class);
        TABLE_META.addField("tenantId", "TENANT_ID_", Integer.class);
        TABLE_META.addField("reqUri", "REQ_URI_", String.class);
        TABLE_META.addField("reqMethod", "REQ_METHOD", String.class);
        TABLE_META.addField("enabled", "ENABLED_", Integer.class);
        TABLE_META.addField("ifSwitch", "IF_SWITCH_", Integer.class);
        TABLE_META.addField("className", "CLASS_NAME_", String.class);
        TABLE_META.addField("methodName", "METHOD_NAME_", String.class);
        TABLE_META.addField("parameters", "PARAMETERS_", String.class);
        TABLE_META.addField("descr", "DESCR_", String.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * IF_ID_ : 主键。
     */
    private Long ifId;
    /**
     * TENANT_ID_ : 租户ID。
     */
    private Integer tenantId;
    /**
     * REQ_URI_ : 请求地址。
     */
    private String reqUri;
    /**
     * REQ_METHOD : 请求方法类型。
     */
    private String reqMethod;
    /**
     * ENABLED_ : 是否可用(1:是;0:否)。
     */
    private Integer enabled;
    /**
     * IF_SWITCH_ : 开关(1:开;0:关)。
     */
    private Integer ifSwitch;
    /**
     * CLASS_NAME_ : 类名。
     */
    private String className;
    /**
     * METHOD_NAME_ : 方法名。
     */
    private String methodName;
    /**
     * PARAMETERS_ : 参数类型。
     */
    private String parameters;
    /**
     * DESCR_ : 接口描述。
     */
    private String descr;

    /**
     * bo : 查询业务对象。
     */
    private Bo bo = new Bo();

    @Override
    @Transient
    public Long getId() {
        return getIfId();
    }

    @Override
    public void setId(Long id) {
        setIfId(id);
    }

    @Id
    @Column(name = "IF_ID_")
    public Long getIfId() {
        return ifId;
    }

    public void setIfId(Long ifId) {
        this.ifId = ifId;
    }

    @Column(name = "TENANT_ID_")
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "REQ_URI_")
    public String getReqUri() {
        return reqUri;
    }

    public void setReqUri(String reqUri) {
        this.reqUri = reqUri;
    }

    @Column(name = "REQ_METHOD")
    public String getReqMethod() {
        return reqMethod;
    }

    public void setReqMethod(String reqMethod) {
        this.reqMethod = reqMethod;
    }

    @Column(name = "ENABLED_")
    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

    @Column(name = "IF_SWITCH_")
    public Integer getIfSwitch() {
        return ifSwitch;
    }

    public void setIfSwitch(Integer ifSwitch) {
        this.ifSwitch = ifSwitch;
    }

    @Column(name = "CLASS_NAME_")
    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Column(name = "METHOD_NAME_")
    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    @Column(name = "PARAMETERS_")
    public String getParameters() {
        return parameters;
    }

    public void setParameters(String parameters) {
        this.parameters = parameters;
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

    @Transient
    public Bo getBo() {
        return bo;
    }

    public void setBo(Bo bo) {
        this.bo = bo;
    }

    public class Bo implements Serializable {
        /**
         * REQ_URI_ : 请求地址。
         */
        private String reqUri;
        /**
         * CLASS_NAME_ : 类名。
         */
        private String className;
        /**
         * METHOD_NAME_ : 方法名。
         */
        private String methodName;

        public String getReqUri() {
            return reqUri;
        }

        public void setReqUri(String reqUri) {
            this.reqUri = reqUri;
        }

        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }

        public String getMethodName() {
            return methodName;
        }

        public void setMethodName(String methodName) {
            this.methodName = methodName;
        }
    }

}

/**
 * Project Name:hbm-fe-bootstrap
 * File Name:OperationResult.java
 * Package Name:com.hginfo.hbm.fe.bs.op
 * Date:2016年12月30日上午11:12:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.op;

/**
 * OperationResult.
 * ClassName:OperationResult <br/>
 * Date: 2016年12月30日 上午11:12:39 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class OperationResult {
    
    /**
    *
    */
    private String  data     = "";
    
    /**
    *
    */
    private boolean success  = true;
    
    /**
    *
    */
    private String  errorMsg = "";
    
    public String getData() {
        return data;
    }
    
    public void setData(String data) {
        this.data = data;
    }
    
    public boolean isSuccess() {
        return success;
    }
    
    public void setSuccess(boolean success) {
        this.success = success;
    }
    
    public String getErrorMsg() {
        return errorMsg;
    }
    
    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    /**
    * DEFAULT.
    */
    public static final OperationResult DEFAULT_SUCCESS = new OperationResult();
    
}

package com.hginfo.hbm.fe.mc.op;

/**
 * 封装返回结果。
 * Created by qiujingde on 2016/12/13.
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

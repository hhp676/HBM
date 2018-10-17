package com.hginfo.hbm.fe.core.rest;

import java.util.HashMap;
import java.util.Map;

/**
 * 封装返回结果。
 * @author licheng
 * @version 
 * @since V1.0.0
 */
public class RestResult {
    
    /**
     * 返回状态码。
     */
    private int     code;
    
    /**
     * 返回数据主体。
     */
    private Object  data;
    
    /**
     * 成功标识。
     */
    private boolean success = true;
    
    /**
     * 错误信息详情。
     */
    private String  message = "";
    
    public Object getData() {
        return data;
    }
    
    public void setData(Object data) {
        this.data = data;
    }
    
    public boolean isSuccess() {
        return success;
    }
    
    public void setSuccess(boolean success) {
        this.success = success;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    public int getCode() {
        return code;
    }
    
    public void setCode(int code) {
        this.code = code;
    }
    
    /**
     * 
     */
    public static final Map<Integer, String> CODE_MESSAGE_MAPPING = new HashMap<>();
    static {
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_200, "");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_400, "Bad request");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_401, "Unauthorized");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_403, "Forbidden");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_404, "Not Found");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_405, "Method not allowed");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_500, "Internal Server Error");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_CONNECT_EXCEPTION, "ConnectException");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_SOCKET_TIMEOUT, "SocketTimeoutException");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_IO_EXCEPTION, "IOException");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_PROTOCOL_EXCEPTION, "ProtocolException");
        CODE_MESSAGE_MAPPING.put(RestConstants.CODE_HTTP_UNKNOW_EXCEPTION, "Others");
    }
    
    /**
     * 获取成功数据格式对象。
     * @author licheng
     * @param reData data
     * @return RestResult
     * @since V1.0.0
     */
    public static RestResult success(Object reData) {
        RestResult result = new RestResult();
        result.setCode(RestConstants.CODE_HTTP_200);
        result.setMessage(CODE_MESSAGE_MAPPING.get(result.getCode()));
        result.setData(reData);
        return result;
    }
    
    /**
     * 获取失败返回数据。
     * @author licheng
     * @param code code
     * @return RestResult
     * @since V1.0.0
     */
    public static RestResult error(Integer code) {
        return error(code, null);
    }
    
    /**
     * 获取失败返回数据。
     * @author licheng
     * @param code code
     * @param reData 错误详情数据
     * @return RestResult
     * @since V1.0.0
     */
    public static RestResult error(Integer code, Object reData) {
        RestResult result = new RestResult();
        result.setCode(code);
        result.setSuccess(false);
        if (CODE_MESSAGE_MAPPING.containsKey(code)) {
            result.setMessage(CODE_MESSAGE_MAPPING.get(result.getCode()));
        }
        result.setData(reData);
        return result;
    }
    
}

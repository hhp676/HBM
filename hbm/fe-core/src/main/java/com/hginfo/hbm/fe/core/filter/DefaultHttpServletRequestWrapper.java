/**
 * Project Name:hbm-fe-core
 * File Name:DefaultHttpServletRequestWrapper.java
 * Package Name:com.hginfo.hbm.fe.core.filter
 * Date:2017年1月22日下午5:20:29
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.filter;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.hginfo.hutils.Constants;
import com.hginfo.hutils.EncodeUtil;

/**
 * ClassName:DefaultHttpServletRequestWrapper.
 * Date: 2017年1月22日 下午5:20:29 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class DefaultHttpServletRequestWrapper extends HttpServletRequestWrapper {
    
    /**
     * 
     */
    private boolean isGet = false;
    
    /**
     * Creates a new instance of XssHttpServletRequestWrapper.
     * @param request HttpServletRequest
     */
    public DefaultHttpServletRequestWrapper(HttpServletRequest request) {
        super(request);
        this.isGet = request.getMethod().equalsIgnoreCase("get");
    }
    
    @Override
    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if (values == null) {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for (int i = 0; i < count; i++) {
            encodedValues[i] = convert(values[i]);
        }
        return encodedValues;
    }
    
    @Override
    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return convert(value);
    }
    
    @Override
    public String getHeader(String name) {
        String value = super.getHeader(name);
        if (value == null) {
            return null;
        }
        return convert(value);
    }
    
    @Override
    public Map<String, String[]> getParameterMap() {
        //参数Map
        Map<String, String[]> paramMap = super.getParameterMap();
        //用于返回的新Map
        Map<String, String[]> returnMap = new HashMap<String, String[]>();
        for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
            returnMap.put(entry.getKey(), convert(entry.getValue()));
        }
        return returnMap;
    }
    
    /**
     * 取值转换：安全过滤和GET参数解码。
     * @author licheng
     * @param value 参数值
     * @return html编码转换后的值
     * @since V1.0.0
     */
    private String convert(String value) {
        if (this.isGet) {
            try {
                value = URLDecoder.decode(value, Constants.ENCODING_UTF8);
            } catch (UnsupportedEncodingException e) {
            }
        }
        return EncodeUtil.escapeHtml4(value);
    }
    
    /**
     * 取值转换。
     * @author licheng
     * @param values 参数值
     * @return 转换后的值
     * @since V1.0.0
     */
    private String[] convert(String[] values) {
        if (values == null) {
            return values;
        }
        for (int i = 0; i < values.length; i++) {
            values[i] = convert(values[i]);
        }
        return values;
    }
    
}

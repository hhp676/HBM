/**
 * Project Name:hbm-fe-core
 * File Name:LoginMode.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2016年11月26日上午11:17:01
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import javax.servlet.ServletRequest;

import org.apache.shiro.web.util.WebUtils;

/**
 * 登录请求的类型。
 * ClassName:LoginMode <br/>
 * Date: 2016年11月26日 上午11:17:01 <br/>
 * @author licheng
 * @since V1.0.0
 */
public enum LoginMode {
    
    /**
     * 
     */
    GENERAL("general"),
    
    /**
     * 
     */
    TOKEN("token"),
    
    /**
     * 
     */
    REST("rest"),
    
    /**
     * 
     */
    SSO("sso"),
    
    /**
     * 
     */
    CAS("cas");
    
    /**
     * 登录方式。
     */
    private String        loginMode;
    
    /**
     * 默认登录方式。
     */
    private static String defaultLoginMode = "general";
    
    public static void setDefaultLoginMode(String defaultLoginMode) {
        LoginMode.defaultLoginMode = defaultLoginMode;
    }
    
    /**
     * Creates a new instance of LoginMode.
     * @param loginMode loginMode
     */
    LoginMode(String loginMode) {
        this.loginMode = loginMode;
    }
    
    /**
     * 
     */
    private static final String DEFAULT_LOGINTYPE_PARAM = "loginMode";
    
    /**
     * 获取请求的登录方式。
     * @author licheng
     * @param request request
     * @return LoginMode
     * @since V1.0.0
     */
    public static LoginMode getRequestLoginMode(ServletRequest request) {
        String loginModeReq = WebUtils.getCleanParam(request, DEFAULT_LOGINTYPE_PARAM);
        loginModeReq = loginModeReq != null ? loginModeReq.toLowerCase()
            : defaultLoginMode;
        LoginMode[] values = LoginMode.values();
        for (LoginMode mode : values) {
            if (mode.loginMode.equals(loginModeReq)) {
                return mode;
            }
        }
        return LoginMode.GENERAL;
    }
}

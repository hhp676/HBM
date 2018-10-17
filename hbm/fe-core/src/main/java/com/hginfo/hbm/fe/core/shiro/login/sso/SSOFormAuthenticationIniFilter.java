/**
 * Project Name:hbm-fe-core
 * File Name:SSOFormAuthenticationIniFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro.login.sso
 * Date:2016年11月24日下午12:59:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro.login.sso;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;

import com.hginfo.hbm.fe.core.shiro.BaseFormAuthenticationIniFilter;
import com.hginfo.hbm.fe.core.shiro.LoginMode;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * SSO表单授权过滤器。
 * ClassName:SSOFormAuthenticationIniFilter <br/>
 * Date: 2016年11月24日 下午12:59:02 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class SSOFormAuthenticationIniFilter extends BaseFormAuthenticationIniFilter {
    
    /**
     */
    private Log                 log         = LogFactory.getLog(getClass());
    
    /**
     * 登录失败跳转的URL。
     */
    private static final String FAILURE_URL = "/401";
    
    /**
     * 创建SSO令牌。
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        this.setLoginMode(LoginMode.SSO);
        return new SSOUserToken(request);
    }
    
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response,
        Object mappedValue) {
        return false;
    }
    
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
        throws Exception {
        return executeLogin(request, response);
    }
    
    @Override
    protected void onAccountLoginSuccess(AuthenticationToken authcToken, Subject subject,
        ServletRequest request, ServletResponse response) throws Exception {
        issueSuccessRedirect(request, response);
    }
    
    @Override
    protected boolean onAccountLoginFailure(AuthenticationToken token, AuthenticationException e,
        String messageText, ServletRequest request, ServletResponse response) {
        
        //跳转到未授权页面
        try {
            WebUtils.issueRedirect(request, response, FAILURE_URL);
        } catch (IOException exception) {
            log.error("SSO login fail,redirect exception.");
        }
        
        //中止交给SHIRO继续处理
        return false;
    }
    
}

/**
 * Project Name:hbm-fe-core
 * File Name:CasFormAuthenticationIniFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro.login.sso.cas
 * Date:2016年11月29日下午5:31:06
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro.login.sso.cas;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationToken;

import com.hginfo.hbm.fe.core.shiro.LoginMode;
import com.hginfo.hbm.fe.core.shiro.login.sso.SSOFormAuthenticationIniFilter;

/**
 * CAS表单授权过滤器。
 * ClassName:CasFormAuthenticationIniFilter <br/>
 * Date: 2016年11月29日 下午5:31:06 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class CasFormAuthenticationIniFilter extends SSOFormAuthenticationIniFilter {
    
    /**
     * 创建CAS令牌。
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        this.setLoginMode(LoginMode.CAS);
        String ticket = request.getParameter("ticket");
        return new CasToken(ticket);
    }
    
}

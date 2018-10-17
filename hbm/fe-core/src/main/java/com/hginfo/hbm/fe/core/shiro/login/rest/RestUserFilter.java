/**
 * Project Name:hbm-fe-core
 * File Name:APPUserFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro.login.app
 * Date:2016年11月24日下午2:51:06
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro.login.rest;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Hex;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.UserFilter;

import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.fe.core.utils.RestResponseUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.encrypt.MD5Util;

/**
 * APP用户访问过滤器。
 * 增加签名效验机制。
 * ClassName:RestUserFilter <br/>
 * Date: 2016年11月24日 下午2:51:06 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class RestUserFilter extends UserFilter {
    
    /**
     * 
     */
    public static final Log LOG = LogFactory.getLog(RestUserFilter.class);
    
    /**
     * 
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response,
        Object mappedValue) {
        if (isLoginRequest(request, response)) {
            return true;
        } else {
            Subject subject = getSubject(request, response);
            //return validSign((HttpServletRequest) request, subject);
            return validDefault((HttpServletRequest) request, subject);
        }
    }
    
    /**
     * 未授权输出。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
        throws Exception {
        
        HttpServletResponse rep = (HttpServletResponse) response;
        rep.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        
        RestResponseUtil.render((HttpServletRequest) request, (HttpServletResponse) response,
            RestResult.error(RestConstants.CODE_HTTP_401));
        return false;
    }
    
    /**
     * shiro默认验证方法，验证session是否存在。
     * @author licheng
     * @param request request
     * @param subject subject
     * @return 是否已授权
     * @since V1.0.0
     */
    private boolean validDefault(HttpServletRequest request, Subject subject) {
        if (subject.getPrincipal() == null) {
            return false;
        }
        return true;
    }
    
    /**
     * 例子：APP签名效验 sign=md5(token+timestamp)。
     * @author licheng
     * @param request request
     * @param subject subject
     * @return 是否已授权
     * @since V1.0.0
     */
    @SuppressWarnings("unused")
    private boolean validSignExample(HttpServletRequest request, Subject subject) {
        if (subject.getPrincipal() == null) {
            return false;
        }
        String token = String.valueOf(subject.getSession().getAttribute("token"));
        String sign = request.getHeader("sign");
        String timestamp = request.getHeader("timestamp");
        String md5 = Hex.encodeHexString(MD5Util.md5(token + timestamp));
        if (sign != null && sign.toLowerCase().equals(md5)) {
            return true;
        }
        LOG.error("sign valid error:" + token + "," + timestamp + ".");
        return false;
    }
    
}

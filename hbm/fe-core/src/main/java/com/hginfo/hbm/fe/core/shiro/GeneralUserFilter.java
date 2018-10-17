/**
 * Project Name:hbm-fe-core
 * File Name:GeneralUserFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2016年11月24日下午2:54:09
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.authc.UserFilter;

import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;

/**
 * 通用用户访问过滤器。
 * ClassName:GeneralUserFilter <br/>
 * Date: 2016年11月24日 下午2:54:09 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class GeneralUserFilter extends UserFilter {
    
    /**
     * 未授权：AJAX输出401,非AJAX跳转到登录页。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
        throws Exception {
        if (RequestUtil.isAjax((HttpServletRequest) request)) {
            
            HttpServletResponse rep = (HttpServletResponse) response;
            // 在响应头设置session状态
            rep.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            
            Map<String, Object> map = new HashMap<>();
            map.put("code", "401");
            map.put("message", "Denied");
            ResponseUtil.renderJson((HttpServletResponse) response, map);
        } else {
            saveRequestAndRedirectToLogin(request, response);
        }
        return false;
    }
    
}

/**
 * Project Name:hbm-fe-core
 * File Name:CsrfInterceptor.java
 * Package Name:com.hginfo.hbm.fe.core.interceptor
 * Date:2017年2月16日下午6:50:25
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.core.utils.HProfileUtil;
import com.hginfo.hutils.CollectionsUtil;
import com.hginfo.hutils.StringUtil;

/**
 * CSRF请求拦截器
 * ClassName:CsrfInterceptor.
 * Date: 2017年2月16日 下午6:50:25 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class CsrfInterceptor extends HandlerInterceptorAdapter {
    
    /**
     * 忽略UIR列表[uri,请求类型(如果是空则匹配所有)]。
     */
    private static final Map<String, String[]> IGNORE_URIS = new HashMap<>();
    static {
        IGNORE_URIS.put("/login", new String[] {"get" });
        IGNORE_URIS.put("/ssoLogin", new String[] {"get", "post" });
        IGNORE_URIS.put("/", new String[] {"get" });
    }
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
        Object handler) throws Exception {
        if (handler instanceof HandlerMethod
            && "1".equals(HProfileUtil.getSysProperty(Constants.SYS_CONFIG_DEFENSE_CSRF))) {
            String webUri = request.getScheme() + "://" + request.getServerName();
            String referer = StringUtil.defaultString(request.getHeader("Referer"));
            String uriKey = request.getServletPath();
            if (IGNORE_URIS.containsKey(uriKey) && CollectionsUtil.contains(IGNORE_URIS.get(uriKey),
                request.getMethod().toLowerCase())) {
                return true;
            }
            if (StringUtil.isEmpty(referer) && !"null".equals(request.getHeader("Origin"))) {
                return true;
            }
            if (!referer.startsWith(webUri)) {
                response.getWriter().println("Terminate because of csrf!" + webUri);
                return false;
            }
        }
        return true;
    }
    
}

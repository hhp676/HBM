/**
 * Project Name:platform
 * File Name:ControlInterceptor.java
 * Package Name:com.hginfo.hbm.srv.interceptor;
 * Date:2017年5月15日下午6:50:25
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 */

package com.hginfo.hbm.srv.interceptor;

import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.fe.core.utils.RestResponseUtil;
import com.hginfo.hbm.srv.toolkit.InterfaceUtil;
import com.hginfo.hbm.srv.toolkit.PackageUtil;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 访问控制拦截器
 * ClassName:ControlInterceptor.
 * Date: 2017年5月15日 下午6:50:25 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class ControlInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            if (PackageUtil.isBelongRest(handlerMethod)){
                if (!InterfaceUtil.isAccess(handlerMethod.getMethod())){
                    RestResponseUtil.render(request,response, RestResult.error(RestConstants.CODE_HTTP_405));
                    return false;
                }
            }
        }
        return super.preHandle(request,response,handler);
    }

}

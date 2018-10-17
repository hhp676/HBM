/**
 * Project Name:hbm-fe-core
 * File Name:RequestInterceptor.java
 * Package Name:com.hginfo.hbm.fe.core.interceptor
 * Date:2017年3月22日上午10:50:04
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 */

package com.hginfo.hbm.fe.core.interceptor;

import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.fe.core.utils.LogCleanUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * http请求拦截器。
 * 实现：记录当前请求RequestURI和ContextPath。
 * ClassName:RequestInterceptor <br/>
 * Date: 2017年3月22日 上午10:50:04 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class RequestInterceptor extends HandlerInterceptorAdapter {

    /**
     */
    private static Log log = LogFactory.getLog(RequestInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            request.setAttribute(Constants.INITIAL_REQUEST_URI, request.getRequestURI());

            //token校验是否为重复提交start
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            RepeatSubmitToken annotation = method.getAnnotation(RepeatSubmitToken.class);
            if (annotation != null && annotation.removeToken()) {
                if (RepeatSubmitUtil.isRepeatSubmit(request)) {
                    return false;
                }
                RepeatSubmitUtil.removeRepeatToken(request);
            }
            //token校验是否为重复提交end
        }
        return super.preHandle(request, response, handler);

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) throws Exception {
        if (handler instanceof HandlerMethod) {
            CurrentUserUtils.clear();
            log.info("清除当前用户ID");
            LogCleanUtil.cleanSysLog();
        }
        super.afterCompletion(request, response, handler, ex);

    }
}

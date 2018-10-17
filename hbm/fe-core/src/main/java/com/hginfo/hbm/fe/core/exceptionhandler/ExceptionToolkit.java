/**
 * Project Name:hbm-fe-core
 * File Name:ExceptionToolkit.java
 * Package Name:com.hginfo.hbm.fe.core.exceptionhandler
 * Date:2017年4月7日上午11:54:21
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.exceptionhandler;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.NamedThreadLocal;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.rpc.RpcException;
import com.hginfo.hbm.base.entity.sys.SysLog;
import com.hginfo.hbm.base.service.sys.SysLogService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.core.utils.FrontEndUtil;
import com.hginfo.hbm.fe.core.utils.RestResponseUtil;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.BaseException;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hvalidate.exception.ValidateException;

/**
 * 异常处理类。
 * ClassName:ExceptionToolkit <br/>
 * Date: 2017年4月7日 上午11:54:21 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
public final class ExceptionToolkit {
    
    /**
     * 
     */
    private static SysLogService sysLogService;

    /**
     * 线程绑定变量（该数据只有当前请求的线程可见）
     */
    public static NamedThreadLocal<Boolean> isExceptionThreadLocal =
            new NamedThreadLocal<Boolean>("isException");
    
    /**
     * 异常处理方法。
     * @author licheng
     * @param request request
     * @param response response
     * @param handler handler
     * @param ex Exception
     * @return ModelAndView
     * @since V1.0.0
     */
    public static ModelAndView resolveException(HttpServletRequest request,
        HttpServletResponse response, Object handler, Exception ex) {

        isExceptionThreadLocal.set(Boolean.TRUE);
        ModelAndView errorView = new ModelAndView();
        
        saveSysLog(request, response, handler, ex);
        
        Map<String, Object> map = new HashMap<>();
        map.put("errorMsg", ex.getMessage());
        
        if (RequestUtil.isAjax(request)
            || FrontEndUtil.getCurFrontEndType().equals(FrontEndType.srv)) {
            map.put("success", false);
            if (ex instanceof ValidateException) {
                map.put("data", ex.getMessage());
                map.put("errorMsgList", ((ValidateException) ex).getErrorMsgList());
                map.put("errorMsgMap", ((ValidateException) ex).getErrorMsgMap());
            } else if (ex instanceof UndeclaredThrowableException && ex.getCause() != null
                && ex.getCause() instanceof ValidateException) {
                ValidateException ve = (ValidateException) ex.getCause();
                
                map.put("data", ve.getMessage());
                map.put("errorMsgList", ve.getErrorMsgList());
                map.put("errorMsgMap", ve.getErrorMsgMap());
            } else if (ex instanceof BaseException) {
                map.put("data", ex.getMessage());
            } else if (ex instanceof RpcException) {
                map.put("data", I18nUtil.getMessage(Constants.ERROR_MSG_CODE_DUBBO));
            } else if (ex instanceof BaseRuntimeException) {
                map.put("data", ex.getMessage());
            } else {
                //如果是非系统自定义异常，则把status设置为500，统一走ajax的error方法；通过$.ajaxSetup实现
                map.put("data", I18nUtil.getMessage(Constants.ERROR_MSG_CODE_DEFAULT));
            }
            //不设置返回view，直接返回json数据，防止再次请求error页面
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            if (FrontEndUtil.getCurFrontEndType().equals(FrontEndType.srv)) {
                RestResponseUtil.render(request, response,
                    RestResult.error(RestConstants.CODE_HTTP_500, map));
            } else {
                ResponseUtil.renderJson(response, map, "encoding:UTF-8");
            }
        } else {
            //可根据不同错误转向不同页面、处理不同 eg:if (ex instanceof BizException)
            map.put("ex", ex);
            errorView.setViewName(Constants.ERROR_PAGE_500);
            errorView.addAllObjects(map);
        }
        return errorView;
    }
    
    /**
     * 获取异常的详情信息。
     * @author licheng
     * @param ex ex
     * @return message
     * @since V1.0.0
     */
    private static String getDetailMessage(Exception ex) {
        String message = "";
        if (ex instanceof ValidateException || (ex instanceof UndeclaredThrowableException
            && ex.getCause() != null && ex.getCause() instanceof ValidateException)) {
            message = ex.getMessage();
        } else if (ex instanceof UndeclaredThrowableException && ex.getCause() != null
            && ex.getCause() instanceof ValidateException) {
            ValidateException ve = (ValidateException) ex.getCause();
            message = ve.getMessage();
        } else if (ex instanceof BaseException || ex instanceof BaseRuntimeException) {
            message = ex.getMessage();
        } else {
            message = ex.getMessage();
        }
        return message;
    }
    
    /**
     * 保存系统日志。
     * @author licheng
     * @param request request
     * @param response response
     * @param handler handle
     * @param ex ex
     * @since V1.0.0
     */
    private static void saveSysLog(HttpServletRequest request, HttpServletResponse response,
        Object handler, Exception ex) {
        sysLogService = sysLogService == null ? SpringContextUtil.getBean(SysLogService.class)
            : sysLogService;
        
        SysLog entity = new SysLog();
        entity.setTenantId(Constants.DEFAULT_TENANT_ID);
        entity.setLogType(DictConstants.SYSLOG_TYPE_EXCEPTION);
        entity.setKey1(StringUtil.left(request.getRequestURI(), Constants.MYSQL_TEXT_MAX_LENGTH));
        entity.setKey2(IpAddressUtil.getClientIpv4(request));
        String handlerStr = StringUtil.isEmpty(handler.toString()) ? handler.toString()
            : handler.toString().substring(0, Constants.SYS_LOG_KEY_MAXLENGTH);
        entity.setKey4(StringUtil.left(handlerStr, Constants.MYSQL_TEXT_MAX_LENGTH));
        entity.setKey5(StringUtil.left(getDetailMessage(ex), Constants.MYSQL_TEXT_MAX_LENGTH));
        StringWriter sw = new StringWriter();
        ex.printStackTrace(new PrintWriter(sw));
        entity.setContent(StringUtil.left(sw.toString(), Constants.MYSQL_TEXT_MAX_LENGTH));
        sysLogService.add(entity);
        
    }
    
    /**
     * Creates a new instance of ExceptionToolkit.
     */
    private ExceptionToolkit() {
        
    }
}

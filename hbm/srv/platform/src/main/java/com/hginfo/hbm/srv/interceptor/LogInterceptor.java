package com.hginfo.hbm.srv.interceptor;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.fe.core.exceptionhandler.ExceptionToolkit;
import com.hginfo.hbm.fe.core.log.RestLogger;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.srv.toolkit.InterfaceUtil;
import com.hginfo.hbm.srv.toolkit.PackageUtil;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.SpringContextUtil;
import org.springframework.core.NamedThreadLocal;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * 日志拦截器
 * Created by licheng on 2017-6-16.
 */
public class LogInterceptor extends HandlerInterceptorAdapter {

    /**
     * 线程绑定变量（该数据只有当前请求的线程可见）
     */
    private NamedThreadLocal<Long> beginTimeThreadLocal =
            new NamedThreadLocal<Long>("beginTime");

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            long beginTime = System.currentTimeMillis();
            beginTimeThreadLocal.set(beginTime);
            ExceptionToolkit.isExceptionThreadLocal.set(false);
        }
        return super.preHandle(request, response, handler);
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            if (!PackageUtil.isBelongRest(handlerMethod)) {
                return;
            }

            SrvInterface query = InterfaceUtil.getInterfaceByMethod(handlerMethod.getMethod());
            Long ifId = InterfaceUtil.getsrvInterfaceService().getId(query);

            long endTime = System.currentTimeMillis();
            long beginTime = beginTimeThreadLocal.get();
            int processTime = (int) (endTime - beginTime);

            SrvLog srvLog = new SrvLog();
            srvLog.setIfId(ifId);
            srvLog.setReqType(request.getMethod());
            srvLog.setReqUri(request.getRequestURI());
            srvLog.setBeginTime(new Date(beginTime));
            srvLog.setEndTime(new Date(endTime));
            srvLog.setProcessTime(processTime);
            srvLog.setReqUserid(SessionUtils.getUserId());
            srvLog.setConsumerIp(IpAddressUtil.getLocalIp());
            srvLog.setIp(IpAddressUtil.getClientIpv4(request));
            Boolean isException = ExceptionToolkit.isExceptionThreadLocal.get();
            srvLog.setResult(isException == null || isException.equals(Boolean.FALSE) ? DictConstants.SYSUSERLOG_RESULT_SUCCESS : DictConstants.SYSUSERLOG_RESULT_FAIL);

            RestLogger logger = SpringContextUtil.getBean("srvLogger");
            logger.log(srvLog, request, handlerMethod, ex);

            super.afterCompletion(request, response, handler, ex);
        }
    }
}

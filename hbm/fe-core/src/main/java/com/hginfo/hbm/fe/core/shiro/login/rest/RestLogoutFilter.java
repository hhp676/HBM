/**
 * Project Name:hbm-fe-core
 * File Name:HgLogoutFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2017年5月3日上午11:17:34
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 */

package com.hginfo.hbm.fe.core.shiro.login.rest;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.base.service.srv.SrvLogService;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.fe.core.log.RestLogger;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.utils.RestResponseUtil;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.SpringContextUtil;
import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 框架登出过滤器。
 * ClassName:HgLogoutFilter <br/>
 * Date: 2017年5月3日 上午11:17:34 <br/>
 *
 * @author licheng
 * @see
 * @since V1.0.0
 */
public class RestLogoutFilter extends LogoutFilter {

    /**
     */
    private Log log = LogFactory.getLog(getClass());

    /**
     *
     */
    private SysUserLogService sysUserLogService;

    /**
     *
     */
    private SrvLogService srvLogService;

    /**
     *
     */
    private SrvInterfaceService srvInterfaceService;

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        long beginTime = System.currentTimeMillis();
        Subject subject = getSubject(request, response);
        Long userId = SessionUtils.getUserId();
        int isSuccess = DictConstants.SYSUSERLOG_RESULT_SUCCESS;
        try {
            subject.logout();
        } catch (SessionException ise) {
            isSuccess = DictConstants.SYSUSERLOG_RESULT_FAIL;
            log.debug(
                    "Encountered session exception during logout.  This can generally safely be ignored."
                            + ise.getMessage());
        }

        this.saveLogoutLog(userId, (HttpServletRequest) request, isSuccess);
        this.saveRestLogoutLog(userId, (HttpServletRequest) request, beginTime, isSuccess);
        RestResponseUtil.render((HttpServletRequest) request, (HttpServletResponse) response,
                RestResult.success("logout success!"));
        return false;
    }

    /**
     * 保存日志。
     *
     * @param userId    用户ID
     * @param request   请求
     * @param isSuccess 是否成功
     * @author licheng
     * @since V1.0.0
     */
    private void saveLogoutLog(Long userId, HttpServletRequest request, int isSuccess) {
        if (userId == Constants.ANONYMOUS_ID) {
            return;
        }
        SysUserLog userLog = new SysUserLog();
        userLog.setUserId(userId);
        userLog.setOperCode("onLogout");
        userLog.setOperName("用户登出");
        userLog.setEngName("onLogout");
        userLog.setReqUri(request.getRequestURI());
        userLog.setOperIp(IpAddressUtil.getClientIpv4(request));
        userLog.setOperRes(String.valueOf(isSuccess));
        userLog.setContent("");
        sysUserLogService.add(userLog);
    }

    /**
     * 保存日志。
     *
     * @param userId    用户ID
     * @param request   请求
     * @param beginTime 开始时间
     * @param isSuccess 是否成功
     * @author licheng
     * @since V1.0.0
     */
    private void saveRestLogoutLog(Long userId, HttpServletRequest request, long beginTime, int isSuccess) {

        SrvInterface query = new SrvInterface();
        query.setReqUri(request.getRequestURI().substring(request.getContextPath().length()));
        Long ifId = -1L;
        List<SrvInterface> result = srvInterfaceService.getList(query);
        if (!result.isEmpty()) {
            ifId = result.get(Constants.ZERO).getId();
        }

        long endTime = System.currentTimeMillis();
        int processTime = (int) (endTime - beginTime);

        SrvLog srvLog = new SrvLog();
        srvLog.setIfId(ifId);
        srvLog.setReqType(request.getMethod());
        srvLog.setReqUri(request.getRequestURI());
        srvLog.setBeginTime(new Date(beginTime));
        srvLog.setEndTime(new Date(endTime));
        srvLog.setProcessTime(processTime);
        srvLog.setReqUserid(userId);
        srvLog.setConsumerIp(IpAddressUtil.getLocalIp());
        srvLog.setIp(IpAddressUtil.getClientIpv4(request));
        srvLog.setResult(isSuccess);
        RestLogger logger = SpringContextUtil.getBean("srvLogger");
        logger.log(srvLog, request, null, null);
    }

    @HReference
    public void setSysUserLogService(SysUserLogService sysUserLogService) {
        this.sysUserLogService = sysUserLogService;
    }

    @HReference
    public void setSrvLogService(SrvLogService srvLogService) {
        this.srvLogService = srvLogService;
    }

    @HReference
    public void setSrvInterfaceService(SrvInterfaceService srvInterfaceService) {
        this.srvInterfaceService = srvInterfaceService;
    }


}

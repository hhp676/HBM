/**
 * Project Name:hbm-fe-core
 * File Name:HgLogoutFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2017年5月3日上午11:17:34
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;

import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.RequestUtil;

/**
 * 框架登出过滤器。
 * ClassName:HgLogoutFilter <br/>
 * Date: 2017年5月3日 上午11:17:34 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
public class HgLogoutFilter extends LogoutFilter {
    
    /**
     */
    private Log               log = LogFactory.getLog(getClass());
    
    /**
     * 
     */
    private SysUserLogService sysUserLogService;
    
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        Subject subject = getSubject(request, response);
        String redirectUrl = getRedirectUrl(request, response, subject);
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
        if (!RequestUtil.isAjax((HttpServletRequest) request)) {
            issueRedirect(request, response, redirectUrl);
        }
        return false;
    }
    
    /**
     * 保存日志。
     * @author licheng
     * @param userId 用户ID
     * @param request 请求
     * @param isSuccess 是否成功
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
    
    @HReference
    public void setSysUserLogService(SysUserLogService sysUserLogService) {
        this.sysUserLogService = sysUserLogService;
    }
    
}

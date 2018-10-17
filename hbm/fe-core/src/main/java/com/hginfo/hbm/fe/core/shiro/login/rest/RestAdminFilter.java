package com.hginfo.hbm.fe.core.shiro.login.rest;

import com.hginfo.hbm.fe.core.rest.RestConstants;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Created by licheng on 2017-6-6.
 */
public class RestAdminFilter extends UserFilter {

    /**
     * 未授权：跳转到管理登录页。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
            throws Exception {
        saveRequest(request);
        String loginUrl = RestConstants.ADMIN_PATH + getLoginUrl();
        WebUtils.issueRedirect(request, response, loginUrl);
        return false;
    }
}

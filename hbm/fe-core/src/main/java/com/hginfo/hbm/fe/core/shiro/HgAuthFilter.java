package com.hginfo.hbm.fe.core.shiro;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.core.utils.FrontEndUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.WebUtils;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hbm.core.utils.SysAuthUtil;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;

/**
 * 功能权限过滤器 对url进行功能权限判断.
 * ClassName: HgAuthFilter <br/>
 * 注意：shiro的过滤器优先级高于当前用户拦截器，所以此处如果掉用service避免service方法内部获取当前用户ID。
 */
public abstract class HgAuthFilter extends UserFilter {

    /**
     */
    private Log log = LogFactory.getLog(getClass());


    /**
     *
     */
    private SysAccountService sysAccountService;

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response,
                                      Object mappedValue) {

        //首先验证是否认证通过
        if (!SecurityUtils.getSubject().isAuthenticated()) {
            log.debug("hgauth Authenticate fail! ");
            return false;
        }

        long userId = SessionUtils.getUserId();
        //2017-02-06 默认超级管理员放过 开发使用 add
        if (sysAccountService.isSuperAdmin(userId)) {
            return super.isAccessAllowed(request, response, mappedValue);
        }

        HttpServletRequest httpRequest = WebUtils.toHttp(request);
        String servletPath = httpRequest.getServletPath();
        log.debug("servletPath : " + servletPath);
        //如果非权限url，则直接通过
        if (!isAuthUrl(servletPath)) {
            return super.isAccessAllowed(request, response, mappedValue);
        }

        // 从session中获得当前用户的所有权限
        // 遍历权限集合，将url进行正则表达式格式化然后中进行匹配
        boolean isPermited = false;
        @SuppressWarnings("unchecked")
        List<SysAuth> curUserAuthList = (List<SysAuth>) SessionUtils.getSession()
                .getAttribute(userId + SysAuthConstants.SYS_AUTH_LIST);
        log.debug("curUserAuthList size : " + (null == curUserAuthList ? 0
                : curUserAuthList.size()));
        // 由于是循环，如果有问题，不能直接返回false，要continue
        for (SysAuth sysAuth : curUserAuthList) {
            if (checkUri(sysAuth.getUri(), servletPath)) {
                isPermited = true;
                break;
            }
        }
        if (isPermited) {
            return super.isAccessAllowed(request, response, mappedValue);
        } else {
            return false;
        }
    }

    /**
     * 校验请求URL是否匹配权限URL。
     *
     * @param authuris    权限URL
     * @param servletPath 请求URL
     * @return true:匹配  false:不匹配
     */
    protected boolean checkUri(String authuris, String servletPath) {
        if (StringUtils.isNotBlank(authuris)) {
            String[] authUriArray = authuris.split(SysAuthConstants.AUTH_URI_SEPARATOR);
            for (String authuri : authUriArray) {
                if (StringUtils.isNotBlank(authuri)) {
                    authuri = authuri.trim();
                    // 有通本符，要进行正则表达式格式化
                    if (authuri.contains(SysAuthConstants.DIGIT_WILDCARD)
                            || authuri.contains(SysAuthConstants.STRING_WILDCARD)) {
                        if (SysAuthUtil.checkRegex(authuri, servletPath)) {
                            log.debug("success authuri : " + authuri);
                            return true;
                        }
                    } else {
                        // 请求地址以权限里的URI开头，且去掉权限URL，如果不再有字符认为是完全匹配
                        if (servletPath.startsWith(authuri)
                                && servletPath.substring(authuri.length()).length() == 0) {
                            log.debug("success authuri : " + authuri);
                            return true;
                        }
                    }
                }
            }

        }
        return false;
    }


    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
            throws IOException {
        if (RequestUtil.isAjax((HttpServletRequest) request)) {
            HttpServletResponse rep = (HttpServletResponse) response;
            // 在响应头设置session状态
            rep.setStatus(HttpServletResponse.SC_FORBIDDEN);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put(SysAuthConstants.CODE, HttpServletResponse.SC_FORBIDDEN);
            map.put(SysAuthConstants.MESSAGE, SysAuthConstants.URL_AUTHC_FAILURE);
            ResponseUtil.renderJson((HttpServletResponse) response, map, new String[]{});
        } else {
            saveRequest(request);
            String loginUrl = ((FrontEndType.srv == FrontEndUtil.getCurFrontEndType()) ? RestConstants.ADMIN_PATH : "") + getLoginUrl();
            WebUtils.issueRedirect(request, response, loginUrl);
        }
        return false;
    }

    /**
     * 是否需要权限校验的URL。
     *
     * @param url 访问的url
     * @return true:需权限校验  false:无需权限校验
     */
    protected abstract boolean isAuthUrl(String url);

    public SysAccountService getSysAccountService() {
        return sysAccountService;
    }

    @HReference
    public void setSysAccountService(SysAccountService sysAccountService) {
        this.sysAccountService = sysAccountService;
    }
}

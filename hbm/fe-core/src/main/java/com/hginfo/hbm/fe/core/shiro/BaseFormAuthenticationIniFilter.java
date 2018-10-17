package com.hginfo.hbm.fe.core.shiro;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hbm.fe.core.exceptionhandler.ExceptionToolkit;
import com.hginfo.hbm.fe.core.log.RestLogger;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.utils.HProfileUtil;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.CollectionsUtil;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.SpringContextUtil;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.core.NamedThreadLocal;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * 表单授权过滤器基类。
 * ClassName: BaseFormAuthenticationIniFilter <br/>
 * date: 2016年11月24日 上午10:01:31 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public abstract class BaseFormAuthenticationIniFilter extends FormAuthenticationFilter {

    /**
     *
     */
    private SysUserService sysUserService;

    /**
     *
     */
    private SysAccountService sysAccountService;

    /**
     *
     */
    private SysUserLogService sysUserLogService;

    /**
     *
     */
    public static final String I18N_BASEPATH = "sys.account.shiro.";

    /**
     * 登录失败后的request的属性，放置失败提示信息。
     */
    public static final String LOGIN_FAILURE_MESSAGE_ATTR = "loginFailureMessageText";

    /**
     *
     */
    private LoginMode loginMode = LoginMode.GENERAL;

    /**
     */
    private Log log = LogFactory.getLog(getClass());

    /**
     * 线程绑定变量（该数据只有当前请求的线程可见）
     */
    private NamedThreadLocal<Long> loginBeginTimeThreadLocal = new NamedThreadLocal<Long>("loginBeginTime");

    /**
     *
     */
    private SrvInterfaceService srvInterfaceService;

    /**
     * 登录成功回调方法。
     *
     * @param authcToken token
     * @param subject    subject
     * @param request    request
     * @param response   response
     * @throws Exception
     * @author licheng
     * @since V1.0.0
     */
    protected abstract void onAccountLoginSuccess(AuthenticationToken authcToken, Subject subject,
                                                  ServletRequest request, ServletResponse response) throws Exception;

    /**
     * 登录失败回调方法。
     *
     * @param token       token
     * @param e           e
     * @param messageText 友好错误提示信息
     * @param request     request
     * @param response    response
     * @return 是否要继续跳转到登录页面，AJAX情况下要直接输出结果就要返回false.
     * @author licheng
     * @since V1.0.0
     */
    protected abstract boolean onAccountLoginFailure(AuthenticationToken token,
                                                     AuthenticationException e, String messageText, ServletRequest request,
                                                     ServletResponse response);

    /*
     * 登录成功后的通用业务处理。
     */
    @Override
    public boolean onLoginSuccess(AuthenticationToken authcToken, Subject subject,
                                  ServletRequest request, ServletResponse response) throws Exception {

        log.info("======================loginSuccess======================");
        //load sysUser to current Principal.
        ShiroAccount shiroAccount = (ShiroAccount) subject.getPrincipal();
        shiroAccount.setSysUser(sysUserService.get(shiroAccount.getUserId()));
        // 更新session中的principals信息，解决使用redis缓存时，session中的shiroAccount无法获取sysUser的问题。
        SessionUtils.updatePrincipals();
        SysAccount updateAccount = new SysAccount();
        updateAccount.setAccountId(shiroAccount.getAccountId());
        updateAccount.setLastLoginTime(new Date());
        updateAccount.setLastLoginIp(IpAddressUtil.getClientIpv4((HttpServletRequest) request));
        sysAccountService.updateLogin(updateAccount);

        this.saveUserLog(shiroAccount.getUserId(), (HttpServletRequest) request,
                DictConstants.SYSUSERLOG_RESULT_SUCCESS, "");
        this.saveRestUserLog(shiroAccount.getUserId(), (HttpServletRequest) request,
                DictConstants.SYSUSERLOG_RESULT_SUCCESS);

        // yuqing modify shiro认证通过之后， 将当前用户的权限信息放到里  
        List<SysAuth> sysAuthList = sysUserService
                .getAllSysAuth(SysAuthConstants.AUTH_USER_AUTH_ALL, shiroAccount.getUserId());
        SessionUtils.getSession()
                .setAttribute(shiroAccount.getUserId() + SysAuthConstants.SYS_AUTH_LIST, sysAuthList);

        //单用户支持，强制将已在线的当前用户踢掉。
        Integer userSingleOnline = Integer
                .parseInt(HProfileUtil.getProperty(Constants.SYS_CONFIG_USER_SINGLE_ONLINE));
        if (userSingleOnline == Constants.ONE) {
            Collection<Session> sessions = SessionUtils.getSessionDAO().getActiveSessions();
            for (Session session : sessions) {
                Object loginName = session
                        .getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                if (session != null && loginName != null
                        && loginName.toString().equals(shiroAccount.getLoginName())
                        && !session.getId().equals(SessionUtils.getSession().getId())) {
                    session.setTimeout(0);
                    log.info("userSingleOnline : kick user:" + SessionUtils.getLoginName());
                    //break;
                }
            }
        }

        onAccountLoginSuccess(authcToken, subject, request, response);
        return false;
    }

    /*
     * 登录失败后的通用业务处理。
     */
    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e,
                                     ServletRequest request, ServletResponse response) {
        log.info("======================loginFailure======================");
        this.saveUserLog(null, (HttpServletRequest) request, DictConstants.SYSUSERLOG_RESULT_FAIL,
                token.getPrincipal().toString());
        this.saveRestUserLog(Constants.ANONYMOUS_ID, (HttpServletRequest) request,
                DictConstants.SYSUSERLOG_RESULT_FAIL);

        String message = e.getClass().getSimpleName();
        String[] localCodes = new String[]{"IncorrectCredentialsException",
                "UnknownAccountException", "LockedAccountException", "CaptchaException"};
        localCodes = new String[]{"CaptchaException"};
        if (!CollectionsUtil.contains(localCodes, message)) {
            message = "UnknowException";
        }
        String messageText = I18nUtil.getMessage(I18N_BASEPATH + message);
        request.setAttribute(LOGIN_FAILURE_MESSAGE_ATTR, messageText);

        return onAccountLoginFailure(token, e, messageText, request, response);
    }

    /**
     * 登录提交则强制返回false从而触发重新登录.
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response,
                                      Object mappedValue) {
        log.info("=============访问校验=============");
        if (isLoginRequest(request, response) && isLoginSubmission(request, response)) {
            return false;
        }
        return super.isAccessAllowed(request, response, mappedValue);
    }

    /**
     * 所有请求都会经过的方法。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
            throws Exception {
        log.info("======================访问拒绝-后续处理======================");
        if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
                if (log.isTraceEnabled()) {
                    log.trace("Login submission detected.  Attempting to execute login.");
                }
                return executeLogin(request, response);
            } else {
                if (log.isTraceEnabled()) {
                    log.trace("Login page view.");
                }
                //allow them to see the login page ;)
                return true;
            }
        } else {
            if (log.isTraceEnabled()) {
                log.trace(
                        "Attempting to access a path which requires authentication.  Forwarding to the "
                                + "Authentication url [" + getLoginUrl() + "]");
            }

            saveRequestAndRedirectToLogin(request, response);
            return false;
        }
    }

    /**
     * 重写执行登录方法。
     * 解决jsessionid重置的问题，排除掉Session_Fixation漏洞
     *
     * @param request
     * @param response
     * @return true/false
     * @throws Exception
     */
    @Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response)
            throws Exception {
        loginBeginTimeThreadLocal.set(System.currentTimeMillis());
        AuthenticationToken token = createToken(request, response);
        if (token == null) {
            String msg = "createToken method implementation returned null. A valid non-null AuthenticationToken "
                    + "must be created in order to execute a login attempt.";
            throw new IllegalStateException(msg);
        }
        try {
            final Subject subject = getSubject(request, response);
            // 获取session数据
            Session session = subject.getSession();
            final LinkedHashMap<Object, Object> attributes = new LinkedHashMap<>();
            final Collection<Object> keys = session.getAttributeKeys();
            for (Object key : keys) {
                final Object value = session.getAttribute(key);
                if (value != null) {
                    attributes.put(key, value);
                }
            }
            session.stop();
            // 登录成功后复制session数据
            session = subject.getSession(true);
            for (Map.Entry<Object, Object> entry : attributes.entrySet()) {
                session.setAttribute(entry.getKey(), entry.getValue());
            }
            subject.login(token);
            return onLoginSuccess(token, subject, request, response);
        } catch (AuthenticationException e) {
            return onLoginFailure(token, e, request, response);
        }
    }

    /**
     * 增加异常处理逻辑，AJAX请求使用通过异常处理。
     */
    @Override
    protected void cleanup(ServletRequest request, ServletResponse response, Exception existing)
            throws ServletException, IOException {
        if (existing instanceof UnauthenticatedException || (existing instanceof ServletException
                && existing.getCause() instanceof UnauthenticatedException)) {
            try {
                onAccessDenied(request, response);
                existing = null;
            } catch (Exception e) {
                existing = e;
            }
        }
        if (existing != null) {
            try {
                log.error("Catch Exception: ", existing);
                ExceptionToolkit.resolveException((HttpServletRequest) request,
                        (HttpServletResponse) response, "", existing);
                if (RequestUtil.isAjax((HttpServletRequest) request)) {
                    existing = null;
                }
            } catch (Exception e) {
                existing = e;
            }
        }
        super.cleanup(request, response, existing);

    }

    /**
     * 保存日志。
     *
     * @param userId
     * @param request
     * @param isSuccess
     * @param content
     */
    private void saveUserLog(Long userId, HttpServletRequest request, int isSuccess,
                             String content) {
        SysUserLog userLog = new SysUserLog();
        String operName = "用户登录" + (isSuccess == DictConstants.SYSUSERLOG_RESULT_SUCCESS ? "成功"
                : "失败");
        String operCode = "onLogin"
                + (isSuccess == DictConstants.SYSUSERLOG_RESULT_SUCCESS ? "Success"
                : "Failure");
        userLog.setUserId(userId);
        userLog.setOperCode(operCode);
        userLog.setOperName(operName);
        userLog.setEngName(operCode);
        userLog.setReqUri(request.getRequestURI());
        userLog.setOperIp(IpAddressUtil.getClientIpv4(request));
        userLog.setOperRes(String.valueOf(isSuccess));
        userLog.setContent(content);
        sysUserLogService.add(userLog);
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
    private void saveRestUserLog(Long userId, HttpServletRequest request, int isSuccess) {

        RestLogger logger = null;
        try {
            logger = SpringContextUtil.getBean("srvLogger");
        } catch (Exception e) {
        }
        if (logger == null) {
            return;
        }

        SrvInterface query = new SrvInterface();
        query.setReqUri(request.getRequestURI().substring(request.getContextPath().length()));
        Long ifId = -1L;
        List<SrvInterface> result = srvInterfaceService.getList(query);
        if (!result.isEmpty()) {
            ifId = result.get(Constants.ZERO).getId();
        }

        long beginTime = loginBeginTimeThreadLocal.get();
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
        logger.log(srvLog, request, null, null);
    }

    public LoginMode getLoginMode() {
        return loginMode;
    }

    public void setLoginMode(LoginMode loginMode) {
        this.loginMode = loginMode;
    }

    @HReference
    public void setSysUserService(SysUserService sysUserService) {
        this.sysUserService = sysUserService;
    }

    @HReference
    public void setSysAccountService(SysAccountService sysAccountService) {
        this.sysAccountService = sysAccountService;
    }

    @HReference
    public void setSysUserLogService(SysUserLogService sysUserLogService) {
        this.sysUserLogService = sysUserLogService;
    }

    @HReference
    public void setSrvInterfaceService(SrvInterfaceService srvInterfaceService) {
        this.srvInterfaceService = srvInterfaceService;
    }

}

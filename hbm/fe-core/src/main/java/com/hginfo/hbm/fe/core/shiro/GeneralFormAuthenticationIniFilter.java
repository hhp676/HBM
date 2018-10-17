package com.hginfo.hbm.fe.core.shiro;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;

import com.hginfo.hbm.fe.core.shiro.login.rest.RestUserToken;
import com.hginfo.hbm.fe.core.shiro.login.token.TokenSignUserToken;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.encrypt.RSAUtil;

/**
 * 普通表单授权过滤器。
 * 适用于登录通过用户名、密码和验证码和TOKEN登录方式。
 * ClassName: GeneralFormAuthenticationIniFilter <br/>
 * date: 2016年11月24日 上午11:34:40 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class GeneralFormAuthenticationIniFilter extends BaseFormAuthenticationIniFilter {
    
    /**
     */
    private Log                log                     = LogFactory.getLog(getClass());
    
    /**
     * 
     */
    public static final String DEFAULT_CAPTCHA_PARAM   = "captcha";
    
    /**
     * 
     */
    public static final String DEFAULT_TOKENID_PARAM   = "tokenId";
    
    /**
     * 
     */
    public static final String DEFAULT_TOKENSIGN_PARAM = "tokenSign";
    
    /**
     * 根据请求类型创建登录令牌。
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        LoginMode loginMode = LoginMode.getRequestLoginMode(request);
        switch (loginMode) {
            case TOKEN:
                return createTokenSignToken(request, response);
            case REST:
                return createRestToken(request, response);
            default:
                break;
        }
        return createGeneralToken(request, response);
    }
    
    /**
     * 创建普通登录令牌。
     * @author licheng
     * @param request request
     * @param response response
     * @return 认证令牌
     * @since V1.0.0
     */
    protected AuthenticationToken createGeneralToken(ServletRequest request,
        ServletResponse response) {
        String username = String.valueOf(getUsername(request));
        String password = String.valueOf(getPassword(request));
        password = String.valueOf(RSAUtil.decryptStringByJs(password));
        String captcha = WebUtils.getCleanParam(request, DEFAULT_CAPTCHA_PARAM);
        boolean rememberMe = isRememberMe(request);
        String host = String.valueOf(getHost(request));
        return new GeneralUserToken(username, password.toCharArray(), rememberMe, host, captcha);
    }
    
    /**
     * 创建TOKEN登录令牌。
     * @author licheng
     * @param request request
     * @param response response
     * @return 认证令牌
     * @since V1.0.0
     */
    protected AuthenticationToken createTokenSignToken(ServletRequest request,
        ServletResponse response) {
        String username = String.valueOf(getUsername(request));
        Long tokenId = 0L;
        try {
            tokenId = Long.valueOf(WebUtils.getCleanParam(request, DEFAULT_TOKENID_PARAM));
        } catch (Exception ex) {
        }
        String tokenSign = String.valueOf(WebUtils.getCleanParam(request, DEFAULT_TOKENSIGN_PARAM));
        String host = String.valueOf(getHost(request));
        return new TokenSignUserToken(username, isRememberMe(request), host, tokenId, tokenSign);
    }
    
    /**
     * 创建APP登录令牌。
     * @author licheng
     * @param request request
     * @param response response
     * @return 认证令牌
     * @since V1.0.0
     */
    protected AuthenticationToken createRestToken(ServletRequest request, ServletResponse response) {
        String username = String.valueOf(getUsername(request));
        String password = RSAUtil.decryptString(String.valueOf(getPassword(request)));
        String host = String.valueOf(getHost(request));
        return new RestUserToken(username, password, isRememberMe(request), host);
    }
    
    @Override
    public void onAccountLoginSuccess(AuthenticationToken authcToken, Subject subject,
        ServletRequest request, ServletResponse response) throws Exception {

        log.info("======================loginSuccess===================================");
        
        if (!RequestUtil.isAjax((HttpServletRequest) request)) {
            issueSuccessRedirect(request, response);
        } else {
            Map<String, Object> outMap = new HashMap();
            outMap.put("success", "true");
            outMap.put("message", "login success");
            ResponseUtil.renderJson((HttpServletResponse) response, outMap, new String[] {});
        }
    }
    
    @Override
    public boolean onAccountLoginFailure(AuthenticationToken token, AuthenticationException e,
        String messageText, ServletRequest request, ServletResponse response) {
        log.info("======================loginFailure===================================");
        
        //不是ajax请求
        if (!RequestUtil.isAjax((HttpServletRequest) request)) {
            setFailureAttribute(request, e);
            return true;
        }
        Map<String, Object> outMap = new HashMap();
        outMap.put("success", "false");
        outMap.put("message", messageText);
        ResponseUtil.renderJson((HttpServletResponse) response, outMap, new String[] {});
        return false;
    }
    
    /**
     * 覆盖父类方法。
     * 登录成功后的回调方法 重定向到成功页面
     * @param request 
     * @param response 
     * @throws Exception 
     */
    @Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response)
        throws Exception {
        WebUtils.issueRedirect(request, response, getSuccessUrl(), null, true);
    }
    
}

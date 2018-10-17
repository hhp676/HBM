/**
 * Project Name:hbm-fe-core
 * File Name:RestFormAuthenticationIniFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro.login.rest
 * Date:2017年5月24日下午4:41:30
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 */

package com.hginfo.hbm.fe.core.shiro.login.rest;

import java.math.BigInteger;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hginfo.hbm.fe.core.shiro.GeneralUserToken;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;

import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.fe.core.shiro.BaseFormAuthenticationIniFilter;
import com.hginfo.hbm.fe.core.shiro.LoginMode;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.utils.RestResponseUtil;
import com.hginfo.hutils.IdentitiesUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.encrypt.RSAUtil;

import static com.hginfo.hbm.fe.core.shiro.GeneralFormAuthenticationIniFilter.DEFAULT_CAPTCHA_PARAM;

/**
 * RestFormAuthenticationIniFilter.
 * ClassName:RestFormAuthenticationIniFilter <br/>
 * Date: 2017年5月24日 下午4:41:30 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class RestFormAuthenticationIniFilter extends BaseFormAuthenticationIniFilter {

    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        LoginMode loginMode = LoginMode.getRequestLoginMode(request);
        switch (loginMode) {
            case GENERAL:
                return createGenralToken(request, response);
            default:
                break;
        }
        return createRestToken(request, response);
    }

    /**
     * 创建普通登录令牌。
     *
     * @param request  request
     * @param response response
     * @return 认证令牌
     * @author licheng
     * @since V1.0.0
     */
    protected AuthenticationToken createGenralToken(ServletRequest request,
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
     * 创建REST登录令牌。
     *
     * @param request  request
     * @param response response
     * @return 认证令牌
     * @author licheng
     * @since V1.0.0
     */
    protected AuthenticationToken createRestToken(ServletRequest request, ServletResponse response) {
        String username = String.valueOf(getUsername(request));
        String password = RSAUtil.decryptString(String.valueOf(getPassword(request)));
        String host = String.valueOf(getHost(request));
        return new RestUserToken(username, password, isRememberMe(request), host);
    }

    @Override
    protected void onAccountLoginSuccess(AuthenticationToken authcToken, Subject subject,
                                         ServletRequest request, ServletResponse response) throws Exception {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        String token = IdentitiesUtil.uuid();
        dataMap.put("accountId", SessionUtils.getAccountId());
        dataMap.put("userId", SessionUtils.getUserId());
        dataMap.put("sessionId", SessionUtils.getSession().getId());
        dataMap.put("token", encryptByClientPublicKey(request, token));
        RestResult restResult = RestResult.success(dataMap);
        RestResponseUtil.render((HttpServletRequest) request, (HttpServletResponse) response,
                restResult);
    }

    @Override
    protected boolean onAccountLoginFailure(AuthenticationToken token, AuthenticationException e,
                                            String messageText, ServletRequest request, ServletResponse response) {
        RestResponseUtil.render((HttpServletRequest) request, (HttpServletResponse) response,
                RestResult.error(RestConstants.CODE_HTTP_401,messageText));
        return false;
    }

    /**
     * 根据提交的请求公钥加密字符串。
     *
     * @param request request
     * @param str     需要加密的源字符串
     * @return 加密后的结果
     * @author licheng
     * @since V1.0.0
     */
    private String encryptByClientPublicKey(ServletRequest request, String str) {
        String modulus = WebUtils.getCleanParam(request, "publicKeyModulus");
        String exponent = WebUtils.getCleanParam(request, "publicKeyExponent");
        if (StringUtil.isEmpty(modulus) || StringUtil.isEmpty(exponent)) {
            return str;
        }
        PublicKey publicKey = RSAUtil.generateRSAPublicKey(new BigInteger(modulus).toByteArray(),
                new BigInteger(exponent).toByteArray());
        return RSAUtil.encryptString(publicKey, str);
    }

}

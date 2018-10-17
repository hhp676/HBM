package com.hginfo.hbm.fe.core.shiro.login.rest;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 通过APP登录的令牌对象。
 * ClassName: RestUserToken <br/>
 * date: 2016年11月24日 上午11:50:37 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class RestUserToken extends UsernamePasswordToken {
    
    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;

    /**
     * Creates a new instance of APPUserToken.
     * @param username username 
     * @param password password
     */
    public RestUserToken(final String username, final String password) {
        super(username, password);
    }
    
    /**
     * Creates a new instance of APPUserToken.
     * @param username username
     * @param password password
     * @param rememberMe rememberMe
     * @param host host
     */
    public RestUserToken(final String username, final String password, boolean rememberMe, String host) {
        super(username, password, rememberMe, host);
    }
    
}

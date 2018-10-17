package com.hginfo.hbm.fe.core.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 普通用户令牌对象。
 * ClassName: GeneralUserToken <br/>
 * date: 2016年11月24日 上午11:37:18 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class GeneralUserToken extends UsernamePasswordToken {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 验证码。
     */
    private String            captcha;
    
    public String getCaptcha() {
        return captcha;
    }
    
    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
    
    /**
     * Creates a new instance of UserToken.
     */
    public GeneralUserToken() {
        super();
    }
    
    /**
     * Creates a new instance of UserToken.
     * @param username username
     * @param password password
     * @param rememberMe rememberMe
     * @param host host
     * @param captcha captcha
     */
    public GeneralUserToken(String username, char[] password, boolean rememberMe, String host,
        String captcha) {
        super(username, password, rememberMe, host);
        this.captcha = captcha;
    }
    
}

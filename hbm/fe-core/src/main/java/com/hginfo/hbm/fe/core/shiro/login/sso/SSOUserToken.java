package com.hginfo.hbm.fe.core.shiro.login.sso;

import javax.servlet.ServletRequest;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 通过单点登录的令牌对象。
 * ClassName: SSOUserToken <br/>
 * date: 2016年11月24日 上午11:50:37 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class SSOUserToken extends UsernamePasswordToken {
    
    /**
     * serialVersionUID:.
     * @since V1.0.0
     */
    
    private static final long serialVersionUID = 2877488119178671980L;
    
    /**
     * the user identifier.
     */
    private ServletRequest    request          = null;
    
    /**
     * Creates a new instance of SSOUserToken.
     * @param request request
     */
    public SSOUserToken(ServletRequest request) {
        this.request = request;
    }
    
    public Object getCredentials() {
        return "";
    }
    
    public ServletRequest getRequest() {
        return request;
    }
    
}

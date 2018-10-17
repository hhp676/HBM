package com.hginfo.hbm.fe.core.shiro;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 验证码异常类。
 * ClassName: CaptchaException <br/>
 * date: 2016年11月17日 下午4:32:11 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class CaptchaException extends AuthenticationException {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 
     * Creates a new instance of CaptchaException.
     *
     */
    public CaptchaException() {
        super();
    }
    
    /**
     * 
     * Creates a new instance of CaptchaException.
     *
     * @param message message
     * @param cause cause
     */
    public CaptchaException(String message, Throwable cause) {
        super(message, cause);
    }
    
    /**
     * 
     * Creates a new instance of CaptchaException.
     *
     * @param message message
     */
    public CaptchaException(String message) {
        super(message);
    }
    
    /**
     * 
     * Creates a new instance of CaptchaException.
     *
     * @param cause cause
     */
    public CaptchaException(Throwable cause) {
        super(cause);
    }
}

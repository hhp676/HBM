package com.hginfo.hbm.fe.core.shiro.login.token;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 通过TOKEN令牌登录的令牌对象。
 * ClassName: TokenSignUserToken <br/>
 * date: 2016年11月24日 上午11:39:42 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class TokenSignUserToken extends UsernamePasswordToken {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 
     */
    private Long           tokenId;
    
    /**
     * 
     */
    private String            tokenSign;
    
    public String getTokenSign() {
        return tokenSign;
    }
    
    public void setTokenSign(String tokenSign) {
        this.tokenSign = tokenSign;
    }
    
    public Long getTokenId() {
        return tokenId;
    }
    
    public void setTokenId(Long tokenId) {
        this.tokenId = tokenId;
    }
    
    /**
     * Creates a new instance of TokenSignUserToken.
     */
    public TokenSignUserToken() {
        super();
    }
    
    /**
     * Creates a new instance of TokenSignUserToken.
     * @param username username
     * @param rememberMe rememberMe
     * @param host host
     * @param tokenId tokenId
     * @param tokenSign tokenSign
     */
    public TokenSignUserToken(String username, boolean rememberMe, String host, Long tokenId,
        String tokenSign) {
        super(username, "", rememberMe, host);
        this.tokenId = tokenId;
        this.tokenSign = tokenSign;
    }
    
}

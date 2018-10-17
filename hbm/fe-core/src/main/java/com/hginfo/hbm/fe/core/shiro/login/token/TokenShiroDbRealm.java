package com.hginfo.hbm.fe.core.shiro.login.token;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.entity.sys.SysToken;
import com.hginfo.hbm.base.service.sys.SysTokenService;
import com.hginfo.hbm.fe.core.shiro.BaseShiroDbRealm;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * token令牌realm。
 * ClassName: TokenShiroDbRealm <br/>
 * date: 2016年11月24日 上午11:50:00 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class TokenShiroDbRealm extends BaseShiroDbRealm {
    
    /**
     * 
     */
    private static final Log LOG = LogFactory.getLog(TokenShiroDbRealm.class);
    
    /**
     * 
     */
    @HReference
    private SysTokenService  sysTokenService;
    
    /**
     * 认证回调函数, 登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
        throws AuthenticationException {
        
        if (!(authcToken instanceof TokenSignUserToken)) {
            return null;
        }
        TokenSignUserToken token = (TokenSignUserToken) authcToken;
        
        String loginName = token.getUsername();
        String tokenSign = token.getTokenSign();
        SysAccount sysAccount = getSysAccount(loginName);
        SysToken queryToken = new SysToken();
        queryToken.setAccountId(sysAccount.getAccountId());
        queryToken.setTokenSign(tokenSign);
        if (!sysTokenService.isValidToken(queryToken)) {
            LOG.info(String.format("--------token is error or expire %s----", loginName));
            throw new UnknownAccountException("token is error or expire！");
        }
        return new SimpleAuthenticationInfo(new ShiroAccount(sysAccount.getAccountId(),
            sysAccount.getLoginName(), sysAccount.getUserId()), token.getCredentials(), getName());
    }
    
    /**
     * 设定Password效验规则为是否相等的简单匹配.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        setCredentialsMatcher(new SimpleCredentialsMatcher());
    }

    
}

package com.hginfo.hbm.fe.core.shiro.login.sso;

import javax.annotation.PostConstruct;
import javax.servlet.ServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.web.util.WebUtils;

import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.fe.core.shiro.BaseShiroDbRealm;

/**
 * 单点登录realm。
 * ClassName: SSOShiroDbRealm <br/>
 * date: 2016年11月24日 上午11:49:08 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class SSOShiroDbRealm extends BaseShiroDbRealm {
    
    /**
     * 通用单点登录令牌效验。
     * 在此实现接收数据效验，效验失败抛出异常，否则即允许登录；
     * 单点登录在此不再验证本系统账户的禁用或锁定状态，如果需要请参考BaseShiroDbRealm中的getSysAccount方法；
     */
    @SuppressWarnings("unused")
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
        throws AuthenticationException {
        
        if (!(authcToken instanceof SSOUserToken)) {
            return null;
        }
        SSOUserToken token = (SSOUserToken) authcToken;
        
        ServletRequest request = token.getRequest();
        String loginName = WebUtils.getCleanParam(request, "loginName");
        //String openid = WebUtils.getCleanParam(request, "openid");
        
        /**
         * 验证签名是否有效，使用请务必修改此方法。
         * ...
         */
        if (true) {
            throw new UnknownAccountException("No account found for user [" + loginName + "]");
        }
        
        //本地系统不存在此用户抛出异常
        SysAccount sysAccount = getSysAccountService().findUserByLoginName(loginName);
        if (null == sysAccount) {
            throw new UnknownAccountException("No account found for user [" + loginName + "]");
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

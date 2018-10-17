package com.hginfo.hbm.fe.core.shiro.login.rest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.util.ByteSource;

import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.fe.core.shiro.BaseShiroDbRealm;

/**
 * APP登录realm。
 * ClassName: RestShiroDbRealm <br/>
 * date: 2016年11月24日 上午11:49:08 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class RestShiroDbRealm extends BaseShiroDbRealm {
    
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
        throws AuthenticationException {
        if (!(authcToken instanceof RestUserToken)) {
            return null;
        }
        RestUserToken token = (RestUserToken) authcToken;
        
        SysAccount sysAccount = getSysAccount(token.getUsername());
        byte[] salt = new String(sysAccount.getLoginName()).getBytes();
        return new SimpleAuthenticationInfo(
            new ShiroAccount(sysAccount.getAccountId(), sysAccount.getLoginName(),
                sysAccount.getUserId()),
            sysAccount.getLoginPwd(), ByteSource.Util.bytes(salt), getName());
        
    }
    
}

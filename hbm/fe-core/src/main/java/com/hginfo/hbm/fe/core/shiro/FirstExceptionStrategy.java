/**
 * Project Name:hbm-fe-core
 * File Name:FirstExceptionStrategy.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2016年11月26日下午5:42:45
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.FirstSuccessfulStrategy;
import org.apache.shiro.realm.Realm;

/**
 * reaml效验异常策略。
 * 针对token与reaml一对一情况下
 * ClassName:FirstExceptionStrategy <br/>
 * Date: 2016年11月26日 下午5:42:45 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class FirstExceptionStrategy extends FirstSuccessfulStrategy {
    
    @Override
    public AuthenticationInfo afterAttempt(Realm realm, AuthenticationToken token,
        AuthenticationInfo singleRealmInfo, AuthenticationInfo aggregateInfo, Throwable t)
        throws AuthenticationException {
        if ((t != null) && (t instanceof AuthenticationException)) {
            throw (AuthenticationException) t;
        }
        return super.afterAttempt(realm, token, singleRealmInfo, aggregateInfo, t);
    }
    
}

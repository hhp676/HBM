/**
 * Project Name:hbm-fe-core
 * File Name:BaseShiroDbRealm.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2016年11月17日下午4:47:07
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.alibaba.fastjson.JSONObject;
import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 基础reaml.
 * ClassName:BaseShiroDbRealm <br/>
 * Date: 2016年11月17日 下午4:47:07 <br/>
 * @author licheng
 * @since V1.0.0
 */
public abstract class BaseShiroDbRealm extends AuthorizingRealm {
    
    /**
     * logger.
     */
    private static final Log  LOG = LogFactory.getLog(BaseShiroDbRealm.class);
    
    /**
     * 
     */
    private SysAccountService sysAccountService;
    
    /**
     * 
     */
    private SysUserService    sysUserService;
    
    /**
     * 
     */
    private SysAuthService    sysAuthService;
    
    /**
     * 通过登录用户名获取登录用户。
     * @author licheng
     * @param loginName 登录名
     * @return 账户
     * @since V1.0.0
     */
    protected SysAccount getSysAccount(String loginName) {
        if (loginName == null) {
            throw new AccountException("Null usernames are not allowed by this realm.");
        }
        SysAccount account = sysAccountService.findUserByLoginName(loginName);
        if (null == account) {
            throw new UnknownAccountException("No account found for user [" + loginName + "]");
        }
        if (account.getIsValid() != Constants.ONE) {
            throw new DisabledAccountException("Account are not allowed by this realm.");
        }
        if (account.getIsLock() != Constants.ZERO) {
            throw new DisabledAccountException("Account are locked by this realm.");
        }
        return account;
    }
    
    /**
     * 同步账户数据，不存在则新增。
     * 增加的用户建议随机生成一个大于12为字符的密码
     * @param sysAccount sysAccount
     * @author licheng
     * @since V1.0.0
     */
    protected void syncAccount(SysAccount sysAccount) {
        
        //
        
    }
    
    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        
        ShiroAccount shiroAccount = (ShiroAccount) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        List<SysRole> roles = sysUserService.getAllSysRole(shiroAccount.getUserId());
        List<SysAuth> auths = null;
        //2017-03-17 超级管理员有所有权限
        if (sysAccountService.isSuperAdmin(shiroAccount.getUserId())) {
            auths = sysAuthService.getAllAuthList();
        } else {
            auths = sysUserService.getAllSysAuth(SysAuthConstants.AUTH_USER_AUTH_ALL, shiroAccount.getUserId());
        }
        LOG.debug("用户角色:" + JSONObject.toJSONString(roles));
        //LOG.debug("用户权限:" + JSONObject.toJSONString(auths));
        for (SysRole role : roles) {
            info.addRole(role.getRoleCode());
        }
        for (SysAuth auth : auths) {
            info.addStringPermission(auth.getAuthCode());
        }
        return info;
    }
    
    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(
            SysAccountService.HASH_ALGORITHM);
        matcher.setHashIterations(SysAccountService.HASH_INTERATIONS);
        setCredentialsMatcher(matcher);
    }
    
    /**
     * 更新用户授权信息缓存.
     * @author licheng
     * @param principals principals
     * @since V1.0.0
     */
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }
    
    /**
     * 清除所有用户授权信息缓存.
     */
    public void clearAllCachedAuthorizationInfo() {
        Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
        if (cache != null) {
            for (Object key : cache.keys()) {
                cache.remove(key);
            }
        }
    }
    
    public SysAccountService getSysAccountService() {
        return sysAccountService;
    }
    
    @HReference
    public void setSysAccountService(SysAccountService sysAccountService) {
        this.sysAccountService = sysAccountService;
    }
    
    public SysUserService getSysUserService() {
        return sysUserService;
    }
    
    @HReference
    public void setSysUserService(SysUserService sysUserService) {
        this.sysUserService = sysUserService;
    }

    public SysAuthService getSysAuthService() {
        return sysAuthService;
    }

    @HReference
    public void setSysAuthService(SysAuthService sysAuthService) {
        this.sysAuthService = sysAuthService;
    }
    
    
    
}

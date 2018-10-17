/**
 * Project Name:hbm-base
 * File Name:ShiroAccount.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2016年11月22日上午11:19:38
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.base.entity.sys;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息。
 * ClassName:ShiroAccount <br/>
 * Date: 2016年11月22日 上午11:19:38 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class ShiroAccount extends SysAccount {
    
    /**
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * 用户实体对象。
     */
    private SysUser           sysUser;
    
    /**
     * Creates a new instance of ShiroAccount.
     * @param accountId 账户ID
     * @param loginName 账户名
     * @param userId 用户名
     */
    public ShiroAccount(Long accountId, String loginName, Long userId) {
        this.setAccountId(accountId);
        this.setLoginName(loginName);
        this.setUserId(userId);
    }
    
    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    @Override
    public String toString() {
        return getLoginName();
    }
    
    /**
     * 重载hashCode,只计算loginName.
     */
    @Override
    public int hashCode() {
        return getLoginName().hashCode();
    }
    
    /**
     * 重载equals,只计算loginName.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        ShiroAccount other = (ShiroAccount) obj;
        if (getLoginName() == null) {
            if (other.getLoginName() != null) {
                return false;
            }
        } else if (!getLoginName().equals(other.getLoginName())) {
            return false;
        }
        return true;
    }
    
    public SysUser getSysUser() {
        return this.sysUser;
    }
    
    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }
    
}

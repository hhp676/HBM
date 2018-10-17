/**
 * Project Name:hbm-base
 * File Name:SysAccountService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年11月18日下午5:07:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysAccount;

/**
 * 账户接口定义。
 * ClassName:SysAccountService <br/>
 * Date: 2016年11月18日 下午5:07:04 <br/>
 * @author licheng
 * @since V1.0.0
 */
public interface SysAccountService {
    
    /**
     * 
     */
    String HASH_ALGORITHM   = "SHA-1";
    
    /**
     * 
     */
    int    HASH_INTERATIONS = 1024;
    
    /**
     * 获取列表。
     * @author licheng
     * @param entity 实体
     * @param loadProps 需要级联加载的实体属性
     * @return 列表
     * @since V1.0.0
     */
    List<SysAccount> getList(SysAccount entity, String... loadProps);
    
    /**
     * 按登录名查询用户。
     * @author licheng
     * @param loginName loginName
     * @return 实体
     * @since V1.0.0
     */
    SysAccount findUserByLoginName(String loginName);
    
    /**
     * 判断是否超级管理员.
     * @author licheng
     * @param userId 用户ID
     * @return 是否
     * @since V1.0.0
     */
    boolean isSuperAdmin(Long userId);
    
    /**
     * 密码加密。
     * @author licheng
     * @param plainPwd 明文密码
     * @param salt 盐
     * @return 加密后的密码
     * @since V1.0.0
     */
    String encryptPassword(String plainPwd, String salt);
    
    
    /**
     * 通过用户Id获取账户信息。
     * @param userId userId
     * @return SysAccount
     */
    SysAccount getByUserId(Long userId);
    
    
    /**
     * 更新用户登录信息。
     * @author licheng
     * @param sysAccount sysAccount
     * @since V1.0.0
     */
    void updateLogin(SysAccount sysAccount);
    
}

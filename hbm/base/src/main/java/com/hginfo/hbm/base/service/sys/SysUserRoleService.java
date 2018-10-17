/*
 * Project Name:hbm-base.
 * File Name:SysUserRoleService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年11月29日 下午3:26:55
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
 *  用户角色表: sys_user_role. <br />
 * service interface 层 <br />
 * Date: 2016年11月29日 下午3:26:55 <br />
 *
 * @author licheng
 * @author yuyanlin
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysUserRoleService {
    
    /**
    *
    * @param pageInfo page info
    * @param filter filter
    * @param loadProps 需要级联加载的实体属性
    * @return page result
    */
    Page<SysUserRole> getPageList(BasePage<SysUserRole> pageInfo, SysUserRole filter, String... loadProps);
    
    /**
    *
    * @param pageInfo page info
    * @param filter filter
    * @param loadProps 需要级联加载的实体属性
    * @return page result
    */
    Page<SysUserRole> getPageListByRole(BasePage<SysUserRole> pageInfo, SysUserRole filter, String... loadProps);

    /**
     * 批量添加角色用户关联，如果已经存在则不添加。
     * @param userRoles userRoles
     * @since V3.0.0-beta1
     */
    void add(List<SysUserRole> userRoles);

    /**
     * 批量删除用户角色关联。
     * @param userRoles userRoles
     * @since V3.0.0-beta1
     */
    void delete(List<SysUserRole> userRoles);
    
    /**
     * 更新用户角色. added by yuyanlin
     * @param userId   userId
     * @param roleIds  roleId
     */
    void doRefresh(Long userId, Long[] roleIds);
    
    /**
     * 获取角色id字符串，逗号分隔.
     * @param userId userId
     * @return 角色id字符串
     */
    String getRoleIdStrByUserId(Long userId);
    
}

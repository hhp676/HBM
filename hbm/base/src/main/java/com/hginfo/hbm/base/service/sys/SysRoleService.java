/**
* Project Name:hbm-base.
* File Name:SysRoleService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
* 系统角色表: sys_role. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysRoleService {
    
    /**
     * get.
     * @author licheng
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return SysRole
     * @since V1.0.0
     */
    SysRole get(Long id, final String... loadProps);
    
    /**
     * getList.
     * @author licheng
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return List<SysRole>
     * @since V1.0.0
     */
    List<SysRole> getList(SysRole filter, final String... loadProps);
    
    /**
     * getPageList.
     * @author licheng
     * @param basePage basePage
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return Page<SysRole>
     * @since V1.0.0
     */
    Page<SysRole> getPageList(BasePage<SysRole> basePage, SysRole filter, final String... loadProps);
    
    /**
     * add.
     * @author licheng
     * @param e SysRole
     * @since V1.0.0
     */
    void add(SysRole e);
    
    /**
     * update.
     * @author licheng
     * @param e SysRole
     * @since V1.0.0
     */
    void update(SysRole e);
    
    /**
     * delete.
     * @author licheng
     * @param e SysRole
     * @since V1.0.0
     */
    void delete(SysRole e);
    
    /**
     * delete.
     * @author licheng
     * @param id id
     * @since V1.0.0
     */
    void delete(long id);
    
    /**
     * 获取权限对应角色列表。
     * @author licheng
     * @param authId authId
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysRole> getRolesByAuth(Long authId);
    
    /**
     * 
     * 根据权限ID获得角色列表. <br/>   
     *
     * @author yuqing
     * @param basePage  
     * @param filter  
     * @return Page<SysRole> 
     * @since V1.0.0
     */
    Page<SysRole> getPageListByAuthId(BasePage<SysRole> basePage, SysRoleAuth filter);
    
    /**
     * 获取权限对应角色列表。
     * @author licheng
     * @param userId userId
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysRole> getRolesByUser(Long userId);
    
    /**
     * 
     * 根据用户ID获得角色列表. <br/>   
     *
     * @author licheng
     * @param basePage  
     * @param filter  
     * @return Page<SysRole> 
     * @since V1.0.0
     */
    Page<SysRole> getPageListByUserId(BasePage<SysRole> basePage, SysUserRole filter);
    
}

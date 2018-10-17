/**
* Project Name:hbm-base.
* File Name:SysRoleAuthService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.Map;

/**
* 角色权限表: sys_role_auth. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysRoleAuthService {
    
    /**
     * 刷新角色权限配置,+新增的，-移除的。
     * @author licheng
     * @param roleId roleId
     * @param authIds authIds
     * @since V1.0.0
     */
    void doRefresh(Long roleId, Long[] authIds);
    
    /**
     * 删除某个角色的权限记录。
     * @author licheng
     * @param roleId roleId
     * @since V1.0.0
     */
    void deleteByRole(Long roleId);
    
    /**
     * 
     * 权限授予用户.<br/>
     *
     * @author yuqing
     * @param authId 
     * @param roleIds 
     * @return Map Map
     * @since V1.0.0
     */
    Map<String, Integer> addBatch(Long authId, Long[] roleIds);
    
    /**
     * 
     * 批量删除授予用户. <br/>
     *
     * @author yuqing
     * @param authId 
     * @param roleIds 
     * @since V1.0.0
     */
    void deleteBatch(Long authId, Long[] roleIds);
    
}

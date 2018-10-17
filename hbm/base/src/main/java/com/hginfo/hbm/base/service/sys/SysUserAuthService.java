/**
* Project Name:hbm-base.
* File Name:SysUserAuthService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

/**
* 用户权限表: sys_user_auth. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysUserAuthService {
    
    /**
     * 
     * 权限授予用户. <br/>
     *
     * @author yuqing
     * @param authId  
     * @param userIds 
     * @param  authType authType
     * @since V1.0.0
     */
    void addBatch(Long authId, Long[] userIds, Integer authType);
    
    /**
     * 
     * 批量删除授予用户. <br/>
     *
     * @author yuqing
     * @param authId 
     * @param userIds 
     * @param authType 
     * @since V1.0.0
     */
    void deleteBatch(Long authId, Long[] userIds, Integer authType);
    
    /**
     * 更新所有权限。
     * @param userId userId
     * @param authIds authIds
     * @param authType authType
     * @since V1.0.0
     */
    void doRefresh(Long userId, Long[] authIds, Integer authType);
    
}

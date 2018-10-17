/**
* Project Name:hbm-base.
* File Name:SysUserLogService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
* 用户操作日志表: sys_user_log. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysUserLogService {
    
    /**
     * 根据id获取用户日志。
     * @param userLogId userLogId
     * @param loadProps 需要级联加载的实体属性
     * @return SysUserLog
     */
    SysUserLog get(Long userLogId, final String... loadProps);
    
    /**
     * 获取分页用户日志。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysUserLog> getPageList(BasePage<SysUserLog> pageInfo, SysUserLog filter, final String... loadProps);
    
    /**
     * 用户日志保存。
     * @param e 日志
     */
    void add(SysUserLog e);
    
}

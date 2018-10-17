/**
* Project Name:hbm-base.
* File Name:SysLogService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
* 系统日志表: sys_log. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysLogService {
    
    /**
     * getPageList.
     * @param pageInfo pageInfo
     * @param filter filter
     * @return page
     * @since V1.0.0
     */
    Page<SysLog> getPageList(BasePage<SysLog> pageInfo, SysLog filter);
    
    /**
     * 添加日志。
     * @author licheng
     * @param e entity
     * @since V1.0.0
     */
    void add(SysLog e);

    /**
     * 清理过期日志。
     */
    void doClean();
    
}

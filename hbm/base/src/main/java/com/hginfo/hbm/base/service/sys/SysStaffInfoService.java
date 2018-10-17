/**
* Project Name:hbm-base.
* File Name:SysStaffInfoService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysStaffInfo;

/**
* 员工信息表: sys_staff_info. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysStaffInfoService {
	
	/**
	 * 通过用户Id获取员工信息
	 * @param userId
	 * @return 员工信息
	 */
	SysStaffInfo getByUserId(Long userId);
	
	/**
     * 修改员工信息.
     * @param sysStaffInfo sysStaffInfo
     * @return SysStaffInfo
     */
	SysStaffInfo editSysStaffInfo(SysStaffInfo sysStaffInfo);
}

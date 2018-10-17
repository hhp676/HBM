/**
* Project Name:hbm-base.
* File Name:SysFileService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:54
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.Map;


/**.
* 系统监控
* service interface 层 <br />
*
* @since V1.0.0
*/
public interface SysInfoService {
    
    /**.
     * 获取JVM信息
     * @return 返回map信息
     */
    Map<String, Map<String, Object>> getJvmInfo();
    
    /**.
     * 获取server信息
     * @return 返回map信息
     */
    Map<String, Object> getServerInfo();
    
    /**.
     * 获取system系统信息
     * @return 返回map信息
     */
    Map<String, Object> getSystemInfo();
    
}

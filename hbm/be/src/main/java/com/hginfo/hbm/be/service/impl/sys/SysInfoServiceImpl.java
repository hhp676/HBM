
/**
* Project Name:hbm-be.
* File Name:SysFileServiceImpl.java
* Package Name:com.hginfo.hbm.be.service.impl.sys
* Date:2016年11月29日 下午3:43:44
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hmonitor.system.JvmStat;
import com.hginfo.hmonitor.system.ServerStat;
import com.hginfo.hmonitor.system.SystemStat;

import java.util.Map;

import com.hginfo.hbm.base.service.sys.SysInfoService;

/**.
* 系统监控表
* service impl 层 <br />
* @since V1.0.0
*/
@HService
public class SysInfoServiceImpl implements SysInfoService {
    /**.
     * getJvmInfo
     * 获取JVM信息
     * @return Map<String,String> 返回类型
     */
    public Map<String, Map<String, Object>> getJvmInfo() {
        return JvmStat.getJvmInfoMap();
    }
    
    /**.
     * 获取server信息
     */
    @Override
    public Map<String, Object> getServerInfo() {
        
        return ServerStat.getServerInfoMap();
    }
    
    /***.
     * 获取system信息
     */
    @Override
    public Map<String, Object> getSystemInfo() {
        return SystemStat.getSystemInfoMap();
    }
}

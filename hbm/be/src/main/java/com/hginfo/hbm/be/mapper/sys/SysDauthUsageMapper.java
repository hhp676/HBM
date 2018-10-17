/*
 * Project Name:hbm-be.
 * File Name:SysDauthUsageMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2017年01月19日 上午11:51:19
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthUsage;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 数据权限应用表: sys_dauth_usage。 <br />
 * mapper 层 <br />
 * Date: 2017年01月19日 上午11:51:19 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthUsageMapper extends BaseSqlMapper {
    
    /**
     * 根据methodName获取。
     * @param methodName 方法名。
     * @return 数据
     */
    SysDauthUsage getDauthUsage(String methodName);
    
    /**
     * 根据mothodName获取dauthCode,当方法未配置权限时为null。
     * @param methodName 方法名
     * @return dauthCode 
     */
    String getDauthCodeByMethodName(String methodName);
    
    /**
     * 把所有数据设置为不再用。
     */
    void setAllInvalid();

}

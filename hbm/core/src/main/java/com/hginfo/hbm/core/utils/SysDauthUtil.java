/**
 * Project Name:hbm-core
 * File Name:SysDauthUtil.java
 * Package Name:com.hginfo.hbm.core.utils
 * Date:2017年2月21日上午10:11:24
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.utils;

import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.base.service.sys.SysDauthUsageService;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hutils.SpringContextUtil;

/**
 * 数据权限相关util。
 * Date: 2017年2月21日 上午10:11:24 <br/>
 * @author shichengqun
 */
public class SysDauthUtil {
    /**
     * 
     */
    private static SysDauthUsageService sysDauthUsageService;
    /**
     * 
     */
    private static SysConfigService sysConfigService;
    
    /**
     * 
     */
    private static SysAccountService sysAccountService;
    /**
     * 
     */
    private static Boolean dauthFlag;
    /**
     * 数据权限是否生效。
     * @return true：生效  false：不启用
     */
    public static boolean isDauthFlagValid() {
        if (dauthFlag == null) {
            dauthFlag = false;
            if (sysConfigService == null) {
                sysConfigService = SpringContextUtil.getBean(SysConfigService.class);
            }
            //如果未设置，则默认：未启用
            String flag = sysConfigService.getProperty(SysDauthConstants.DAUTH_FLAG_KEY);
            if (SysDauthConstants.DAUTH_FLAG_VALID.equals(flag)) {
                dauthFlag = true;
            }
        }
        return dauthFlag;
    }
    
    /**
     * 获取sysDauthUsageService。
     * @return sysDauthUsageService
     */
    public static SysDauthUsageService getSysDauthUsageService() {
        if (sysDauthUsageService == null) {
            sysDauthUsageService = SpringContextUtil.getBean(SysDauthUsageService.class);
        }
        return sysDauthUsageService;
    }
    
    /**
     * 获取sysAccountService。
     * @return sysAccountServiceWrapper
     */
    public static SysAccountService getSysAccountService() {
        if (sysAccountService == null) {
            sysAccountService = SpringContextUtil.getBean(SysAccountService.class);
        }
        return sysAccountService;
    }
    
    /**
     * 
     * Creates a new instance of SysDauthUtil.
     *
     */
    private SysDauthUtil() {
        
    }
}


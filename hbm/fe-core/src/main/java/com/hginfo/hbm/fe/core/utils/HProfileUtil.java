/**
 * Project Name:hbm-fe-core
 * File Name:HProfileUtil.java
 * Package Name:com.hginfo.hbm.fe.core.utils
 * Date:2016年12月22日下午6:14:55
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.utils;

import java.util.Date;

import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.base.service.sys.SysUserProfileService;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 获取用户和系统配置信息。
 * ClassName:HProfileUtil.
 * Date: 2016年12月22日 下午6:14:55 <br/>
 * @author licheng
 * @since V1.0.0
 */
public abstract class HProfileUtil {
    
    /***
     * 
     */
    private static SysConfigService sysConfigService;
    /***
     * 
     */
    private static SysUserProfileService sysUserProfileService;
    
    /**
     * 获取用户或系统配置。
     * @author licheng
     * @param key key
     * @return value
     * @since V1.0.0
     */
    public static String getProperty(String key) {
        String value = getUserProperty(key);
        if (StringUtil.isBlank(value)) {
            value = getSysProperty(key);
        }
        return value;
    }
    
    /**
     * 获取系统配置属性值。
     * @author licheng
     * @param key key
     * @return value
     * @since V1.0.0
     */
    public static String getSysProperty(String key) {
        if (sysConfigService == null) {
            sysConfigService = SpringContextUtil.getBean(SysConfigService.class);
        }
        return sysConfigService.getProperty(key);
    }
    
    /**
     * 获取用户配置属性值。
     * @author licheng
     * @param key key
     * @return value
     * @since V1.0.0
     */
    public static String getUserProperty(String key) {
        if (sysUserProfileService == null) {
            sysUserProfileService = SpringContextUtil.getBean(SysUserProfileService.class);
        }
        return sysUserProfileService.getProperty(key);
    }
    
    /**
     * js时间戳。
     * @author yinyanzhen
     * @return value
     * @since V1.0.0
     */
    public static String getJsTimer() {
        if (sysConfigService == null) {
            sysConfigService = SpringContextUtil.getBean(SysConfigService.class);
        }
        //获取是否使用前台缓存标记
        String isUsingCache = sysConfigService.getProperty("isUsingCache");
        String sysTimerVerson = null;
        //不使用缓存时,每次js时间戳,每次取用最新值
        if ("0".equals(isUsingCache)) {
            sysTimerVerson = String.valueOf((new Date()).getTime());
        } else {
            //使用缓存时,js时间戳取用系统启动时间
            sysTimerVerson = sysConfigService.getProperty("sysTimerVerson");
        }
        return sysTimerVerson;
    }
    
    
}

/**
 * Project Name:hbm-fe-core
 * File Name:HProfileUtil.java
 * Package Name:com.hginfo.hbm.fe.core.utils
 * Date:2016年12月22日下午6:14:55
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.utils;


import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hutils.SpringContextUtil;

/**
 * 显示图标工具类。
 * ClassName:IconCssUtil.
 * Date: 2017年1月12日 16:29:55 <br/>
 * @author zhangdianbo
 * @since V1.0.0
 */
public class IconCssUtil {
    
    /***
     * 
     */
    private static SysAuthService sysAuthService;

    /**
     * 获取配置的css名称。
     * @author zhangdianbo
     * @param authCode authCode
     * @return value
     * @since V1.0.0
     */
    public static String getIconCss(String authCode) {
        if (sysAuthService == null) {
            sysAuthService =  SpringContextUtil.getBean(SysAuthService.class);
        }
        return sysAuthService.getIconCss(authCode);
    }
    
}

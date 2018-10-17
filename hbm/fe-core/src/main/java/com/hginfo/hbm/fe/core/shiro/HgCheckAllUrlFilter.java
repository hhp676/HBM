/**
 * Project Name:hbm-fe-core
 * File Name:HgCheckAllUrlFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2017年3月15日下午2:43:54
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;
/**
 * 校验所有URL的filter。
 * Date: 2017年3月15日 下午2:43:54 <br/>
 * @author shichengqun
 */
public class HgCheckAllUrlFilter extends HgAuthFilter {

    /**
     * 校验所有URL时，则所有URL都需权限校验。
     * @param url
     * @return boolean
     * @see com.hginfo.hbm.fe.core.shiro.HgAuthFilter#isAuthUrl(java.lang.String)
     */
    @Override
    protected boolean isAuthUrl(String url) {
        return true;
    }
}


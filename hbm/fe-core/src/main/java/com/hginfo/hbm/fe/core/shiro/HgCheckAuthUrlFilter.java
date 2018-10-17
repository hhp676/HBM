/**
 * Project Name:hbm-fe-core
 * File Name:HgCheckAuthUriFilter.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2017年3月15日下午2:46:44
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * 只校验在功能权限中配置的URL。
 * Date: 2017年3月15日 下午2:46:44 <br/>
 * @author shichengqun
 */
public class HgCheckAuthUrlFilter extends HgAuthFilter {
    
    /**
     * 
     */
    private SysAuthService sysAuthService;

    /**
     * 只有在功能权限中配置的URL需要校验。
     * @param url
     * @return boolean
     * @see com.hginfo.hbm.fe.core.shiro.HgAuthFilter#isAuthUrl(java.lang.String)
     */
    @Override
    protected boolean isAuthUrl(String url) {
        List<SysAuth> authList = sysAuthService.getAllAuthList();
        if (authList != null && authList.size() > 0) {
            for (SysAuth auth : authList) {
                if (checkUri(auth.getUri(), url)) {
                    return true;
                }
            }
        }
        return false;
    }

    public SysAuthService getSysAuthService() {
        return sysAuthService;
    }

    @HReference
    public void setSysAuthService(SysAuthService sysAuthService) {
        this.sysAuthService = sysAuthService;
    }
    
    
    
}


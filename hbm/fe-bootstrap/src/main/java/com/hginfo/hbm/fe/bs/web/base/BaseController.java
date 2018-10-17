/**
 * Project Name:hbm-fe-bootstrap
 * File Name:BaseController.java
 * Package Name:com.hginfo.hbm.fe.bs.web.base
 * Date:2017年1月3日下午7:36:13
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.bs.web.base;

import org.springframework.stereotype.Controller;

import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * 基类。
 * ClassName:BaseController <br/>
 * Date: 2017年1月3日 下午7:36:13 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
public class BaseController {
    
    /**
     * SysUserService.
     */
	private SysUserService sysUserService;
    
    /**
     * sysAuthService.
     */
    private SysAuthService sysAuthService;
    
    public SysUserService getSysUserService() {
        return sysUserService;
    }
    
    @HReference
    public void setSysUserService(SysUserService sysUserService) {
        this.sysUserService = sysUserService;
    }
    
    public SysAuthService getSysAuthService() {
        return sysAuthService;
    }
    
    @HReference
    public void setSysAuthService(SysAuthService sysAuthService) {
        this.sysAuthService = sysAuthService;
    }
    
}

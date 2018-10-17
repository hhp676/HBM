/*
 * Project Name:hbm-fe-easyui
 * File Name:IndexController.java
 * Package Name:com.hginfo.hbm.fe.eu.web
 * Date:2016年12月2日上午10:09:45
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.srv.rest;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.base.service.sys.SysUserPasswordFoundService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.srv.MySwaggerConfig;
import com.hginfo.hdubbo.annotation.HReference;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * AdminIndexController.
 * ClassName:AdminIndexController <br/>
 * Date: 2016年12月2日 上午10:09:45 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
@RestController
@RequestMapping("/")
@Api(value = "主要", produces = MySwaggerConfig.MEDIA_TYPE_JSON_OR_XML)
public class IndexController {
    /**
     *
     */
    @HReference
    private SysUserService              sysUserService;
    /**
     * 
     */
    @HReference
    private SysUserPasswordFoundService sysUserPasswordFoundService;
    
    /**
     * 
     */
    @HReference
    private SysModelService             sysModelService;

    /**
     *
     */
    @HReference
    private SysDictService              sysDictService;
    
    /**
     * 登录账户，由shiro处理，此处为了API展示。
     * @since V1.0.0
     */
    @ApiOperation(value = "账户登录", httpMethod = "POST", response = Map.class, notes = "密码是公钥加密后的密码")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "username", dataType = "String", required = true, value = "用户名"),
            @ApiImplicitParam(paramType = "query", name = "password", dataType = "String", required = true, value = "密码"),
            @ApiImplicitParam(paramType = "query", name = "publicKeyModulus", dataType = "String", required = true, value = "客户端公钥Modulus"), 
            @ApiImplicitParam(paramType = "query", name = "publicKeyExponent", dataType = "String", required = true, value = "客户端公钥Exponent") 
    })
    @RequestMapping(value = "/login")
    public void login() {

    }
    
    /**
     * 登出账户，由shiro处理，此处为了API展示。
     * @since V1.0.0
     */
    @ApiOperation(value = "账户退出", httpMethod = "GET", response = Map.class, notes = "logout")
    @RequestMapping(value = "/logout")
    public void logout() {

    }
    
}

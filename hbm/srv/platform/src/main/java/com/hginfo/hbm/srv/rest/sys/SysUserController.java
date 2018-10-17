/**
 * Project Name:hbm-srv-spring
 * File Name:SysUserController.java
 * Package Name:com.hginfo.hbm.srv.rest.sys
 * Date:2017年5月24日下午4:02:51
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.rest.sys;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.srv.MySwaggerConfig;
import com.hginfo.hdubbo.annotation.HReference;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 用户接口。
 * ClassName:SysUserController <br/>
 * Date: 2017年5月24日 下午4:02:51 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
@RestController
@RequestMapping("/sys/user")
@Api(produces = MySwaggerConfig.MEDIA_TYPE_JSON_OR_XML)
public class SysUserController {
    
    /**
     * 
     */
    @HReference
    private SysUserService sysUserService;
    
    /**
     * 获取某个用户的用户基本信息。
     * @author licheng
     * @param userId 用户ID
     * @return RestResult
     * @since V1.0.0
     */
    @ApiOperation(value = "获取用户信息", httpMethod = "GET")
    @RequestMapping("info/{userId}")
    public RestResult getUserInfo(@PathVariable Long userId) {
        return RestResult.success(sysUserService.get(userId));
    }
}

/**
 * Project Name:hbm-srv-spring
 * File Name:PersonalController.java
 * Package Name:com.hginfo.hbm.srv.rest.sys
 * Date:2017年5月24日下午4:10:19
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.rest.sys;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hginfo.hbm.base.service.sys.SysPersonalService;
import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.srv.MySwaggerConfig;
import com.hginfo.hdubbo.annotation.HReference;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 个人信息接口。
 * ClassName:PersonalController <br/>
 * Date: 2017年5月24日 下午4:10:19 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
@RestController
@RequestMapping("/sys/personal")
@Api(produces = MySwaggerConfig.MEDIA_TYPE_JSON_OR_XML)
public class SysPersonalController {
    
    /**
     * 
     */
    @HReference
    private SysPersonalService sysPersonalService;
    
    /**
     * 获取当前用户个人基本信息。
     * @author licheng
     * @return RestResult
     * @since V1.0.0
     */
    @ApiOperation(value = "获取用户信息", httpMethod = "GET")
    @RequestMapping("info")
    public RestResult info() {
        return RestResult.success(sysPersonalService.getLoginUserInfo());
    }
}

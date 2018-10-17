/**
 * Project Name:hbm-srv-spring
 * File Name:PublicController.java
 * Package Name:com.hginfo.hbm.srv.rest
 * Date:2017年5月23日下午7:46:03
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 */

package com.hginfo.hbm.srv.rest;

import com.hginfo.hbm.fe.core.web.CaptchaHelper;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hginfo.hbm.srv.MySwaggerConfig;

import io.swagger.annotations.Api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 公共接口。
 * ClassName:PublicController <br/>
 * Date: 2017年5月23日 下午7:46:03 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
@RestController
@RequestMapping("/public")
@Api(value = "公共", produces = MySwaggerConfig.MEDIA_TYPE_JSON_OR_XML)
public class PublicController {

    /**
     * 验证码生成辅助类。
     */
    @Autowired
    private CaptchaHelper captchaHelper;

    /**
     * 显示验证码图片。
     *
     * @param request  request
     * @param response response
     * @author licheng
     * @since V1.0.0
     */
    @ApiOperation(value = "获取验证码", httpMethod = "GET", notes = "get the kaptcha image")
    @RequestMapping(value = "/captchaImage")
    public void getKaptchaImage(HttpServletRequest request, HttpServletResponse response) {
        captchaHelper.getKaptchaImage(request, response);
    }
}


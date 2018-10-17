/**
 * Project Name:hbm-srv-spring
 * File Name:SecurityController.java
 * Package Name:com.hginfo.hbm.srv.rest
 * Date:2017年5月23日下午7:48:20
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.rest;

import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyExponent;
import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyModulus;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hginfo.hbm.fe.core.rest.RestResult;
import com.hginfo.hbm.srv.MySwaggerConfig;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 安全接口。
 * ClassName:SecurityController <br/>
 * Date: 2017年5月23日 下午7:48:20 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
@RestController
@RequestMapping("/security")
@Api(value = "安全", produces = MySwaggerConfig.MEDIA_TYPE_JSON_OR_XML)
public class SecurityController {
    
    /**
     * 获取公钥。
     * @return publicKey
     * @since V1.0.0
     */
    @ApiOperation(value = "获取公钥（16进制表示）", httpMethod = "GET", notes = "get the public key")
    @RequestMapping(value = "/getPublicKey")
    public RestResult getPublicKey() {
        Map<String, String> map = new HashMap<>();
        map.put("modulus", getDefaultPublicKeyModulus());
        map.put("exponent", getDefaultPublicKeyExponent());
        return RestResult.success(map);
    }
}

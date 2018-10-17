/**
 * Project Name:hbm-srv-spring
 * File Name:SecurityServiceImpl.java
 * Package Name:com.hginfo.hbm.srv.rest.service.impl
 * Date:2017年5月27日上午10:11:43
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.ws.service.impl;

import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyExponent;
import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyModulus;

import java.util.HashMap;
import java.util.Map;

import com.hginfo.hbm.srv.ws.service.SecurityService;

/**
 * ClassName:SecurityServiceImpl <br/>
 * Date: 2017年5月27日 上午10:11:43 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
public class SecurityServiceImpl implements SecurityService {
    
    @Override
    public Map<String, String> getPublicKey() {
        Map<String, String> map = new HashMap<>();
        map.put("modulus", getDefaultPublicKeyModulus());
        map.put("exponent", getDefaultPublicKeyExponent());
        return map;
    }
    
}

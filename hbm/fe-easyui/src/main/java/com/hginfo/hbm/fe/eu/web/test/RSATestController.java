/**
 * Project Name:hbm-fe-easyui
 * File Name:RSATestController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.test
 * Date:2016年10月31日上午10:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.eu.web.test;

import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Hex;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hutils.encrypt.RSAUtil;

/**
 * .
 * ClassName:RSATestController <br/>
 * Date: 2016年10月31日 上午10:32:39 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping(value = "/test/rsa")
public class RSATestController {
    
    
    @RequestMapping(value = "/show")
    public String show(HttpServletRequest request, HttpServletResponse response, Model model) {
        RSAPublicKey publicKey = RSAUtil.getDefaultPublicKey();
        model.addAttribute("modulus", new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
        model.addAttribute("exponent",
            new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
        return "test/rsa";
    }
    
    @RequestMapping(value = "/submit")
    @ResponseBody
    public Map submit(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        String encryptedPassword = request.getParameter("password");
        map.put("password", RSAUtil.decryptStringByJs(encryptedPassword));
        return map;
    }
}

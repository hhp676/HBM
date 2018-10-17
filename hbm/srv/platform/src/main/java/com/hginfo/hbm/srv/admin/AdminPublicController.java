package com.hginfo.hbm.srv.admin;

import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.rest.RestResult;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyExponent;
import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyModulus;

/**
 * Created by licheng on 2017-6-19.
 */
@Controller
@RequestMapping(RestConstants.ADMIN_PATH + "/public")
public class AdminPublicController {

    /**
     * 获取公钥。
     * @return publicKey
     * @since V1.0.0
     */
    @RequestMapping(value = "/security/getPublicKey")
    @ResponseBody
    public Map getPublicKey() {
        Map<String, String> map = new HashMap<>();
        map.put("modulus", getDefaultPublicKeyModulus());
        map.put("exponent", getDefaultPublicKeyExponent());
        return map;
    }

}

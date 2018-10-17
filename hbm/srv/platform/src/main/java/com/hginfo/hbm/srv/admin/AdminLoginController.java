package com.hginfo.hbm.srv.admin;

import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.web.CaptchaHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyExponent;
import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyModulus;

/**
 * Created by licheng on 2017-6-5.
 */
@Controller
@RequestMapping(RestConstants.ADMIN_PATH)
public class AdminLoginController {


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletResponse response, Model model) {
        model.addAttribute("modulus", getDefaultPublicKeyModulus());
        model.addAttribute("exponent", getDefaultPublicKeyExponent());
        return "admin/login";
    }


}

/*
 * Project Name:hbm-fe-bootstrap
 * File Name:IndexController.java
 * Package Name:com.hginfo.hbm.fe.bs.web
 * Date:2016年12月30日上午11:02:31
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.bs.web;

import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyExponent;
import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyModulus;

import java.security.interfaces.RSAPublicKey;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Hex;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.service.sys.SysUserPasswordFoundService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.web.base.BaseController;
import com.hginfo.hbm.fe.core.interceptor.RepeatSubmitUtil;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.utils.HProfileUtil;
import com.hginfo.hbm.fe.core.web.CaptchaHelper;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.SmsUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.encrypt.RSAUtil;

/**
 * IndexController.
 * ClassName:IndexController <br/>
 * Date: 2016年12月30日 上午11:02:31 <br/>
 * @author licheng
 * @since V3.0.0-beta1
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController {
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
     * 验证码生成辅助类。
     */
    private CaptchaHelper               captchaHelper;
    /**
    *
    */
    @HReference
    private SysDictService              sysDictService;
    
    /**
     * login.
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/login")
    public String login(HttpServletResponse response,Model model) {
        //让IE浏览器使用最高文档模式(避免使用杂项模式) yinyanzhen
        response.setHeader("X-UA-Compatible", "IE=Edge");
        RSAPublicKey publicKey = RSAUtil.getDefaultPublicKey();
        model.addAttribute("modulus",
            new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
        model.addAttribute("exponent",
            new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
        return "login";
    }
    
    /**
     * 显示验证码图片。
     * @author licheng
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping(value = "/captchaImage")
    public void getKaptchaImage(HttpServletRequest request, HttpServletResponse response) {
        captchaHelper.getKaptchaImage(request, response);
    }
    
    /**
     * 获取公钥。
     * @return publicKey
     * @since V1.0.0
     */
    @RequestMapping(value = "/getPublicKey")
    @ResponseBody
    public Map<String, String> login() {
        Map<String, String> map = new HashMap<>();
        map.put("modulus", getDefaultPublicKeyModulus());
        map.put("exponent", getDefaultPublicKeyExponent());
        return map;
    }
    
    
    /**
     * index.
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/")
    public String index(HttpServletResponse response, Model model) {
        //让IE浏览器使用最高文档模式(避免使用杂项模式) yinyanzhen
        response.setHeader("X-UA-Compatible", "IE=Edge");
        String themeColor = HProfileUtil.getUserProperty("themeColor");
        List<SysDictItem> bsColorList = sysDictService.getItemList("bsColorList");
        for (SysDictItem item : bsColorList) {
            if (item.getItemValue().equals(themeColor)) {
                model.addAttribute("themeColor", item.getItemName());
            }
        }
        model.addAttribute("bsColorList", bsColorList);
        return "index";
    }
    
    /**
     * initSubmitToken:(获取令牌). <br/>
     * @author yinyanzhen
     * @param request request
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/initSubmitToken")
    @ResponseBody
    public OperationResult initSubmitToken(HttpServletRequest request) {
        String serverToken = RepeatSubmitUtil.putRepeatToken(request);
        
        OperationResult result = new OperationResult();
        result.setSuccess(true);
        result.setData(serverToken);
        return result;
    }
    
    /**
     * 忘记 密码。
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/anonPages/findpassword/show")
    public String findPasswordShow() {
        return "findpassword_show";
    }
    
    /**
     * 申请找回密码邮件或者短信。
     * @param request request
     * @param reqUser reqUser
     * @return OperationResult
     */
    @RequestMapping(value = "/anonPages/findpassword/getvcode")
    @ResponseBody
    public OperationResult findPasswordGetVcode(final SysUser reqUser,
        final HttpServletRequest request) {
        
        if (StringUtil.isEmpty(reqUser.getUserAccount().getLoginName())
            || StringUtil.isEmpty(reqUser.getEmail())) {
            throw new RuntimeException(I18nUtil.getMessage("sys.account.findPwd.nullException"));
        }
        //validate captcha
        String captcha = request.getParameter("captcha");
        String exitCode = (String) SecurityUtils.getSubject().getSession()
            .getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if (null == captcha || !captcha.equalsIgnoreCase(exitCode)) {
            throw new RuntimeException(
                I18nUtil.getMessage("sys.account.findPwd.wrongCaptchaException"));
        }
        
        SysUser sysUser = sysUserService
            .getUserByLoginName(reqUser.getUserAccount().getLoginName());
        if (sysUser == null || !reqUser.getEmail().equals(sysUser.getEmail())) {
            throw new RuntimeException(
                I18nUtil.getMessage("sys.account.findPwd.mismatchException"));
        }
        
        //request time can't > FIND_PASSWORD_TIME_MAXCOUNT
        SysUserPasswordFound found = new SysUserPasswordFound();
        found.setLoginName(reqUser.getUserAccount().getLoginName());
        Date timeOut = DateTimeUtil.addSeconds(new Date(), -Constants.FIND_PASSWORD_RETRY_TIME);
        found.setTimeOut(timeOut);
        List<SysUserPasswordFound> founds = sysUserPasswordFoundService.getList(found);
        if (founds.size() >= Constants.FIND_PASSWORD_TIME_MAXCOUNT) {
            throw new RuntimeException(I18nUtil.getMessage("sys.account.findPwd.limitException"));
        }
        
        String vfCode = SmsUtil.randomAlphanumeric();
        
        String actionUrl = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + String.format("%s/login?loginName=%s&verificationCode=%s",
                request.getContextPath(), reqUser.getUserAccount().getLoginName(), vfCode);
        String ip = IpAddressUtil.getClientIpv4(request);
        
        sysUserService.sendVfcode(sysUser, reqUser.getUserAccount().getLoginName(), vfCode,
            actionUrl, ip);
        
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 忘记密码-修改密码.
     * @param sysUserPasswordFound found
     * @param request request
     * @return OperationResult
     */
    @RequestMapping(value = "/anonPages/findpassword/update")
    @ResponseBody
    public OperationResult findPasswordUpdate(final SysUserPasswordFound sysUserPasswordFound,
        final HttpServletRequest request) {
        if (StringUtil.isEmpty(sysUserPasswordFound.getLoginName())
            || StringUtil.isEmpty(sysUserPasswordFound.getVerificationCode())) {
            throw new RuntimeException("请输入邮件中的验证码");
        }
        Date timeOut = DateTimeUtil.addSeconds(new Date(), -Constants.FIND_PASSWORD_RETRY_TIME);
        sysUserPasswordFound.setTimeOut(timeOut);
        List<SysUserPasswordFound> founds = sysUserPasswordFoundService
            .getList(sysUserPasswordFound);
        if (founds.isEmpty()) {
            throw new RuntimeException("验证错误或已超期");
        }
        SysUser sysUser = sysUserService.getUserByLoginName(sysUserPasswordFound.getLoginName());
        String newPwd = request.getParameter("newPwd");
        sysUserService.updateUserPwd(sysUser.getUserId(), newPwd);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * index.
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/test")
    public String test() {
        return "test";
    }
    
    @Autowired
    public void setCaptchaHelper(CaptchaHelper captchaHelper) {
        this.captchaHelper = captchaHelper;
    }
}

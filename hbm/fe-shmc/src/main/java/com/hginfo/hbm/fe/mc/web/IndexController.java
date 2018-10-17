/*
 * Project Name:hbm-fe-easyui
 * File Name:IndexController.java
 * Package Name:com.hginfo.hbm.fe.eu.web
 * Date:2016年12月2日上午10:09:45
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.mc.web;

import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyExponent;
import static com.hginfo.hutils.encrypt.RSAUtil.getDefaultPublicKeyModulus;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.base.service.sys.SysUserPasswordFoundService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.base.vo.SysMenu;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hbm.fe.core.interceptor.RepeatSubmitUtil;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.web.CaptchaHelper;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.SmsUtil;
import com.hginfo.hutils.StringUtil;

/**
 * IndexController.
 * ClassName:IndexController <br/>
 * Date: 2016年12月2日 上午10:09:45 <br/>
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Controller
@RequestMapping("/")
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
    
    @HReference
    private SysModelService             sysModelService;
    
    /**
    *
    */
    @HReference
    private SysDictService              sysDictService;
    
    /**
     * 验证码生成辅助类。
     */
    private CaptchaHelper               captchaHelper;
    
    /**
     * login.
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/login")
    public String login(HttpServletResponse response, Model model) {
        model.addAttribute("modulus", getDefaultPublicKeyModulus());
        model.addAttribute("exponent", getDefaultPublicKeyExponent());
        
        //让IE浏览器使用最高文档模式(避免使用杂项模式) yinyanzhen
        response.setHeader("X-UA-Compatible", "IE=Edge");
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
        model.addAttribute("topMenuList", sysUserService.getTopMenuList(FrontEndType.bootstrap));
        model.addAttribute("subMenuList", sysUserService
            .getSubMenuTree(DictConstants.DEFAULT_LEFT_MODEL_FID, FrontEndType.bootstrap));
        model.addAttribute("deaultLeftModel", sysModelService.getSysModelById(DictConstants.DEFAULT_LEFT_MODEL_FID));
        model.addAttribute("curUser", sysUserService.get(SessionUtils.getUserId()));
        
        //让IE浏览器使用最高文档模式(避免使用杂项模式) yinyanzhen
        response.setHeader("X-UA-Compatible", "IE=Edge");
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
     * 生成首页菜单。
     * @param list list
     * @return string
     * @since V1.0.0
     */
    private String makeIndexMenuHtml(List<SysMenu> list) {
        StringBuilder menuHtml = new StringBuilder();
        
        list.stream()
            .filter(menu -> menu.getSubMenuList() != null && menu.getSubMenuList().size() > 0)
            .forEach(menu -> {
                menuHtml.append("<div id='mm").append(menu.getModelId())
                    .append("' style='width: 100px;'>");
                
                menu.getSubMenuList()
                    .forEach(subMenu -> getRecursionStr(menuHtml, subMenu, menu.getModelName()));
                
                menuHtml.append("</div>");
            });
        
        return menuHtml.toString();
    }
    
    /**
     * 递归获取子菜单。
     * @param str str
     * @param menu menu
     * @param mainMenuName mainMenuName
     */
    private void getRecursionStr(StringBuilder str, SysMenu menu, String mainMenuName) {
        if (menu.getSubMenuList() != null && menu.getSubMenuList().size() > 0) {
            str.append("<div iconCls='").append(menu.getIcon()).append("'>");
            str.append("    <span>").append(menu.getModelName()).append("</span>");
            str.append("        <div>");
            
            for (SysMenu subMenu : menu.getSubMenuList()) {
                getRecursionStr(str, subMenu, mainMenuName);
            }
            
            str.append("        </div>");
            str.append("</div>");
        } else {
            str.append("<div iconCls='").append(menu.getIcon())
                .append("'   tag='leafMenu'  mainMenu='").append(mainMenuName).append("' ")
                .append(" modelId=").append(menu.getModelId()).append(">")
                .append(menu.getModelName()).append("</div>");
        }
    }
    
    @Autowired
    public void setCaptchaHelper(CaptchaHelper captchaHelper) {
        this.captchaHelper = captchaHelper;
    }
}

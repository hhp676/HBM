/**
 * Project Name:hbm-fe-easyui
 * File Name:CommonController.java
 * Package Name:com.hginfo.hbm.fe.eu.web
 * Date:2017年3月8日上午10:24:03
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.spring.CustomMultipartResolver;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.SmsUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 全局公共组件Controller层：需要赋权。
 * ClassName:CommonController <br/>
 * Date: 2017年3月8日 上午10:24:03 <br/>
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common")
public class CommonController {
    
    /**
     * 
     */
    @HReference
    private SysUserService sysUserService;
    
    
    /**
     * 用户详情，除用户管理模块外使用。
     * @param userId 
     * @param model 
     * @return 用户详情页
     */
    @RequestMapping(value = "/sysUser/detail/{userId}")
    public String showSysUserViewOnly(@PathVariable Long userId, Model model) {
        SysUser user = sysUserService.getUserById(userId);
        if (user != null && StringUtil.isNotEmpty(user.getMobile())) {
            user.setMobile(SmsUtil.hidePhone4Number(user.getMobile()));
        }
        if(user != null && user.getIsDelete() != 0){
          model.addAttribute("msg", "该信息已删除，不可再操作");
          return "error/error_detail";
      }else{
          
          model.addAttribute("user", user);
          return "sys/user/common/sysUserInfo_detail";
      }
    }
    
    /**
     * getFileUploadProgress:(根据token值,获取上传进度). <br/>
     *
     * @author yinyanzhen
     * @param submitToken submitToken
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/getFileUploadProgress")
    @ResponseBody
    public OperationResult getFileUploadProgress(String submitToken) {
        OperationResult result = OperationResult.DEFAULT_SUCCESS;
        try {
            result.setData(SessionUtils.getSession().getAttribute(submitToken).toString());
        } catch (Exception e) {
            result.setData("100");
        }
        return result;
    }
    
}


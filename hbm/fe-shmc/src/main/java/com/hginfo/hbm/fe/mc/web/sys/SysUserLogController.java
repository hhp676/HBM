/**
 * Project Name:hbm-fe-easyui
 * File Name:SysUserLogController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年1月16日下午2:47:22
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.mc.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.StringUtil;

/**
 * 用户日志.
 * ClassName:SysUserLogController <br/>
 * Date: 2017年1月16日 下午2:47:22 <br/>
 * @author suiguangshuai
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysUserLog")
public class SysUserLogController {
    
    /**
     * Service.
     */
    @HReference
    private SysUserLogService sysUserLogService;
    
    /**
     * view.
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/view")
    public String showSysLog() {
        return "sys/log/sysUserLog_view";
    }
    
    /**
     * 分页数据。
     * @param pageInfo 分页信息
     * @param formFilter 表单过滤条件
     * @return 字典组分页数据
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysUserLog> list(BasePage<SysUserLog> pageInfo, SysUserLog formFilter) {
        return new Page<>(sysUserLogService.getPageList(pageInfo, formFilter, "sysUser"));
    }
    

}


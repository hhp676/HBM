/*
 * Project Name:hbm-base.
 * File Name:SysUserPasswordFoundController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年02月27日 下午6:49:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.mc.web.sys;

import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysUserPasswordFoundService;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;

import static com.hginfo.hbm.fe.mc.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 数据字典Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月2日 上午10:03:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/SysUserPasswordFound")
public class SysUserPasswordFoundController {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(SysUserPasswordFoundController.class);

    /**
     * Service。
     */
    private SysUserPasswordFoundService service;

    /**
     * 列表页面。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/SysUserPasswordFound/SysUserPasswordFound_view";
    }

    /**
    * 新增。
    * @param entity entity
    * @return 操作结果
    */
    @RequestMapping(value = "/add")
    @ResponseBody
    public OperationResult add(@HValidated SysUserPasswordFound entity) {
        service.add(entity);
        return DEFAULT_SUCCESS_RESULT;
    }

    
    @HReference
    public void setService(SysUserPasswordFoundService service) {
        this.service = service;
    }

}

/*
 * Project Name:hbm-fe-easyui.
 * File Name:SysIconController.java
 * Package Name:com.hginfo.hbm.fe.eu.web
 * Date:2016年12月20日 上午10:03:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.bs.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 图标管理Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月20日 上午10:03:54 <br />
 *
 * @author zhangdianbo
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysIcon")
public class SysIconController {

    
    /**
     * 图标管理管理菜单。
     * @return sys_icon viewId
     */
    @RequestMapping(value = "/view")
    public String showSysIcon() {
        return "sys/icon/sysIcon_view";
    }
    
    /**
     * 通用的选择图标页面。
     * @param model 数据传递
     * @return sys_icon viewId
     */
    @RequestMapping(value = "/chooseIconView")
    public String chooseIconView(final Model model) {
        return "sys/icon/sysIconChoose_view";
    }
    


}

/*
 * Project Name:hbm-base.
 * File Name:SysTaskHandleLogController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys.task;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.task.SysTaskHandleLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.task.SysTaskHandleLogService;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 办理历史: SysTaskHandleLogController. <br/>
 * @author yinyanzhen
 */
@Controller
@RequestMapping("/sys/sysTaskHandleLog")
public class SysTaskHandleLogController {
    /**
     */
    private static final Log LOG = LogFactory.getLog(SysTaskHandleLogController.class);
    /**
     */
    @HReference
    private SysTaskHandleLogService service;

    /**
     * 列表页面。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/sysTaskHandleLog/sysTaskHandleLog_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @param filter filter
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysTaskHandleLog> list(BasePage<SysTaskHandleLog> pageInfo, SysTaskHandleLog filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(service.getPageList(pageInfo, filter));
    }
}

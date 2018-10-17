/*
 * Project Name:hbm-base.
 * File Name:SysTaskTypeController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys.task;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.task.SysTaskType;
import com.hginfo.hbm.base.service.sys.task.SysTaskTypeService;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 任务类型: SysTaskTypeController. <br/>
 * @author yinyanzhen
 */
@Controller
@RequestMapping("/sys/sysTaskType")
public class SysTaskTypeController {
    /**
     */
    private static final Log LOG = LogFactory.getLog(SysTaskTypeController.class);
    /**
     */
    @HReference
    private SysTaskTypeService service;
    
    /**
     * getSysTaskTypeList:(获取任务类型分类). <br/>
     * @author yinyanzhen
     * @param  sysTaskType sysTaskType
     * @return List<SysTaskType> List<SysTaskType>
     * @since V1.0.0
     */
    @RequestMapping("/getSysTaskTypeList")
    @ResponseBody
    public List<SysTaskType> getSysTaskTypeList(SysTaskType sysTaskType) {
        sysTaskType.setIsDelete(0);
        return service.getList(sysTaskType);
    }
}

/*
 * Project Name:hbm-base.
 * File Name:SysNewsTypeController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys.news;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.news.SysNewsType;
import com.hginfo.hbm.base.service.sys.news.SysNewsTypeService;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 消息类型Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月2日 上午10:03:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysNewsType")
public class SysNewsTypeController {
    /**
     */
    private static final Log LOG = LogFactory.getLog(SysNewsTypeController.class);
    /**
     */
    @HReference
    private SysNewsTypeService service;

    /**
     * getsysNewsTypeList:(获取消息类型分类). <br/>
     * @author yinyanzhen
     * @param  sysNewskType sysNewskType
     * @return List<SysTaskType> List<SysTaskType>
     * @since V1.0.0
     */
    @RequestMapping("/getSysNewsTypeList")
    @ResponseBody
    public List<SysNewsType> getSysTaskTypeList(SysNewsType sysNewskType) {
        sysNewskType.setIsDelete(0);
        return service.getList(sysNewskType);
    } 
}

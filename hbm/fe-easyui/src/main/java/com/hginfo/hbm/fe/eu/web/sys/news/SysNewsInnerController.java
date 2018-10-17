/*
 * Project Name:hbm-base.
 * File Name:SysNewsController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys.news;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.news.SysNews;
import com.hginfo.hbm.base.entity.sys.news.SysNewsInner;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.news.SysNewsInnerService;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 系统内部消息Controller。 <br />
 * controller 层 <br />
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysNewsInner")
public class SysNewsInnerController {
    /**
     */
    private static final Log LOG = LogFactory.getLog(SysNewsInnerController.class);
    /**
     */
    @HReference
    private SysNewsInnerService service;

    /**
     * 列表页面。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/sysNews/sysNewsInner_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @param filter 查询条件
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysNewsInner> list(BasePage<SysNewsInner> pageInfo, SysNewsInner filter) {
        filter.setUserId(SessionUtils.getUserId());
        filter.setIsDelete(0);
        if (filter.getSysNews() == null) {
            filter.setSysNews(new SysNews()); 
        }
        filter.getSysNews().setIsDelete(0);
        return new Page<>(service.getPageList(pageInfo, filter, "sysNews"));
    }
    
    /**
     * detailSysNewsInner:(消息详情页面). <br/>
     * @author yinyanzhen
     * @param id id
     * @param request request
     * @return String 页面路径
     * @since V1.0.0
     */
    @RequestMapping("/detailSysNewsInner")
    public String detailSysNewsInner(Long id, HttpServletRequest request) {
        SysNewsInner sysNewsInner = service.get(id, "sysNews");
        request.setAttribute("sysNewsInner", sysNewsInner);
        //更新状态为已阅
        sysNewsInner.setNewsStatus(1);
        service.update(sysNewsInner);
        return "sys/sysNews/sysNewsInner_detail";
    }
    
    /**
     * deleteSysNewsInner:(删除系统内部消息). <br/>
     * @author yinyanzhen
     * @param id id
     * @return OperationResult OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/deleteSysNewsInner")
    @ResponseBody
    public OperationResult deleteSysNewsInner(Long id) {
        
        service.delete(id);
        return OperationResult.DEFAULT_SUCCESS;
    }

}

/*
 * Project Name:hbm-base.
 * File Name:SrvInterfaceController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.srv
 * Date:2017年06月08日 上午10:07:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.srv.admin;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.srv.admin.op.OperationResult;
import com.hginfo.hbm.srv.admin.page.Page;
import com.hginfo.hbm.srv.rest.IndexController;
import com.hginfo.hbm.srv.toolkit.PackageUtil;
import com.hginfo.hbm.srv.toolkit.UrlMappingUtil;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * 数据字典Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月2日 上午10:03:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Controller
@RequestMapping(RestConstants.ADMIN_PATH + "/SrvInterface")
public class AdminInterfaceController {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(AdminInterfaceController.class);

    /**
     * Service。
     */
    private SrvInterfaceService srvInterfaceService;

    @Autowired
    public RequestMappingHandlerMapping requestMappingHandlerMapping;


    /**
     * 列表页面。
     *
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "admin/SrvInterface/SrvInterface_view";
    }

    /**
     * 分页数据。
     *
     * @param pageInfo 分页信息
     * @return 字典组分页数据
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SrvInterface> list(BasePage<SrvInterface> pageInfo,SrvInterface formFilter) {
        SrvInterface filter = new SrvInterface();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(srvInterfaceService.getPageList(pageInfo, formFilter));
    }

    /**
     * 重新生成接口数据。
     *
     * @return 操作结果
     */
    @RequestMapping(value = "/generateData")
    @ResponseBody
    public OperationResult generateData(HttpServletRequest request) {

        Map<RequestMappingInfo, HandlerMethod> handlerMethods = requestMappingHandlerMapping.getHandlerMethods();
        List<SrvInterface> interfaces = UrlMappingUtil.getSrvInterface(requestMappingHandlerMapping.getHandlerMethods(), PackageUtil.getRestPackageName());
        srvInterfaceService.updateData(interfaces, false);
        return OperationResult.DEFAULT_SUCCESS;
    }

    /**
     * 修改。
     *
     * @param entity entity
     * @return 操作结果
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public OperationResult update(@HValidated SrvInterface entity) {
        srvInterfaceService.update(entity);
        return OperationResult.DEFAULT_SUCCESS;
    }


    @HReference
    public void setService(SrvInterfaceService service) {
        this.srvInterfaceService = service;
    }

}

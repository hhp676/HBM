/*
 * Project Name:hbm-base.
 * File Name:SrvLogController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.srv
 * Date:2017年06月08日 上午10:07:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.srv.admin;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.base.service.srv.SrvLogService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.srv.admin.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping(RestConstants.ADMIN_PATH + "/SrvLog")
public class AdminLogController {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(AdminLogController.class);

    /**
     * Service。
     */
    @HReference
    private SrvLogService service;

    /**
     * Service。
     */
    @HReference
    private SrvInterfaceService srvInterfaceService;

    /**
     * Service。
     */
    @HReference
    private SysUserService sysUserService;

    /**
     * 列表页面。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view(Model model) {
        SrvInterface query = new SrvInterface();
        query.setEnabled(Constants.ONE);
        model.addAttribute("interfaceList",srvInterfaceService.getList(query));
        model.addAttribute("maxProcessTime",service.getMaxProcessTime());
        return "admin/SrvLog/SrvLog_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SrvLog> list(BasePage<SrvLog> pageInfo,SrvLog formFilter) {
        //设置查询用户
        if (!StringUtil.isEmpty(formFilter.getBo().getReqUsername())){
            SysUser sysUser = sysUserService.getUserByUserName(formFilter.getBo().getReqUsername());
            if (sysUser!=null){
                formFilter.setReqUserid(sysUser.getId());
            }
        }
        //处理接口请求时间
        if (!StringUtil.isEmpty(formFilter.getBo().getFilterTime())){
            String[] filterTimeArr = formFilter.getBo().getFilterTime().split(" - ");
            formFilter.setStartTimeStr(filterTimeArr[0]);
            formFilter.setEndTimeStr(filterTimeArr[1]);
        }
        //处理接口响应时间
        if (!StringUtil.isEmpty(formFilter.getBo().getProcessTime())){
            String[] processTimeArr = formFilter.getBo().getProcessTime().split(",");
            formFilter.getBo().setProcessTimeBegin(Integer.parseInt(processTimeArr[0]));
            formFilter.getBo().setProcessTimeEnd(Integer.parseInt(processTimeArr[1]));
        }
        return new Page<>(service.getPageList(pageInfo, formFilter,"sysUser"));
    }

    @HReference
    public void setService(SrvLogService service) {
        this.service = service;
    }

}

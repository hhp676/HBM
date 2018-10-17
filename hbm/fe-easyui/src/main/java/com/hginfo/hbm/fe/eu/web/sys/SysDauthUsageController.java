/**
 * Project Name:hbm-fe-easyui
 * File Name:SysDauthUsageController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年01月19日上午11:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys;
import static com.hginfo.hbm.fe.eu.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDauthUsage;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDauthUsageService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 数据权限应用Controller。 <br />
 * controller 层 <br />
 * Date: 2017年01月19日上午11:25:54 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/dauthUsage")
public class SysDauthUsageController {
    
    /**
     * 
     */
    @HReference
    private SysDauthUsageService sysDauthUsageService;
    
    
    /**
     * about.
     * @param usage usage
     * @param model model
     * @return page
     * @throws Exception 
     */
    @RequestMapping(value = "/aboutOne")
    public String aboutOne(SysDauthUsage usage, Model model) throws Exception {
        model.addAttribute("biz", sysDauthUsageService.get(usage.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 数据权限应用管理菜单。
     * @return 数据权限应用管理页面
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/dauth/dauthUsage_view";
    }
    
    /**
     * 数据权限应用分页数据。
     * @param pageInfo 分页信息
     * @return 数据权限应用分页数据。
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysDauthUsage> list(BasePage<SysDauthUsage> pageInfo) {
        SysDauthUsage filter = new SysDauthUsage();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthUsageService.getPageList(pageInfo, filter));
    }
    
    /**
     * 新增数据权限应用。
     * @param dauthUsage dauthUsage
     * @return 操作结果
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @UserLog(code = "addDauthUsage", name = "新增数据权限应用", engName = "addDauthUsage")
    public OperationResult add(@HValidated SysDauthUsage dauthUsage) {
        sysDauthUsageService.add(dauthUsage);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改数据权限应用。
     * @param dauthUsage dauthUsage
     * @return 操作结果
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateDauthUsage", name = "修改数据权限应用", engName = "updateDauthUsage")
    public OperationResult update(@HValidated SysDauthUsage dauthUsage) {
        sysDauthUsageService.update(dauthUsage);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个数据权限应用。
     * @param usageId usageId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteUsageDauth")
    @ResponseBody
    @UserLog(code = "clearDauthUsageConfig", name = "清除数据权限配置", engName = "clearDauthUsageConfig")
    public OperationResult delete(long usageId) {
        sysDauthUsageService.deleteUsageDauth(usageId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
}

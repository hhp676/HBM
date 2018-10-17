/**
 * Project Name:hbm-fe-easyui
 * File Name:SysDauthVariableController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年01月10日上午9:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.mc.web.sys;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDauthVariable;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDauthVariableService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 数据权限变量Controller。 <br />
 * controller 层 <br />
 * Date: 2016年01月10日上午9:25:54 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/dauthVariable")
public class SysDauthVariableController {
    
    /**
     *
     */
    private static final OperationResult DEFAULT_SUCCESS_RESULT = new OperationResult();

    /**
     * 数据权限变量Service。
     */
    @HReference
    private SysDauthVariableService sysDauthVariableService;
    
    
    /**
     * about.
     * @param variable variable
     * @param model model
     * @return page
     * @throws Exception 
     */
    @RequestMapping(value = "/aboutOne")
    public String aboutOne(SysDauthVariable variable, Model model) throws Exception {
        model.addAttribute("biz", sysDauthVariableService.get(variable.getId()));
        return "/sys/biz_about";
    }

    /**
     * 数据权限变量管理菜单。
     * @return 数据权限变量管理页面
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/dauth/dauthVariable_view";
    }
    
    /**
     * 数据权限变量分页数据。
     * @param pageInfo 分页信息
     * @return 数据权限变量分页数据。
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysDauthVariable> list(BasePage<SysDauthVariable> pageInfo) {
        SysDauthVariable filter = new SysDauthVariable();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthVariableService.getPageList(pageInfo, filter));
    }
    
    /**
     * 数据权限变量选择页面。
     * @return 数据权限变量选择页面
     */
    @RequestMapping(value = "/chooseVariableView")
    public String chooseVariableView() {
        return "sys/dauth/dauthVariableChoose_view";
    }
    
    /**
     * 数据权限变量选择页面数据。
     * @param pageInfo 分页信息
     * @return 数据权限变量选择页面分页数据。
     */
    @RequestMapping(value = "/chooseVariableList")
    @ResponseBody
    public Page<SysDauthVariable> chooseVariableList(BasePage<SysDauthVariable> pageInfo) {
        SysDauthVariable filter = new SysDauthVariable();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthVariableService.getPageList(pageInfo, filter));
    }
    
    /**
     * 新增数据权限变量。
     * @param variable variable
     * @return 操作结果
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @UserLog(code = "addDauthVariable", name = "新增数据权限变量", engName = "addDauthVariable")
    public OperationResult add(@HValidated SysDauthVariable variable) {
        sysDauthVariableService.add(variable);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改数据权限变量。
     * @param variable variable
     * @return 操作结果
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateDauthVariable", name = "修改数据权限变量", engName = "updateDauthVariable")
    public OperationResult update(@HValidated SysDauthVariable variable) {
        sysDauthVariableService.update(variable);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个数据权限变量。
     * @param variableId variableId
     * @return 操作结果
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteDauthVariable", name = "删除数据权限变量", engName = "deleteDauthVariable")
    public OperationResult delete(long variableId) {
        sysDauthVariableService.delete(variableId);
        return DEFAULT_SUCCESS_RESULT;
    }

}

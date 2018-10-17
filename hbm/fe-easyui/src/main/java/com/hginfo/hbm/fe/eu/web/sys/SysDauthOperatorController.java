/**
 * Project Name:hbm-fe-easyui
 * File Name:SysDauthOperatorController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月19日上午9:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDauthOperator;
import com.hginfo.hbm.base.entity.sys.SysDauthOperatorSupport;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDauthOperatorService;
import com.hginfo.hbm.base.service.sys.SysDauthOperatorSupportService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 运算符、运算符支持Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月19日上午9:25:54 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/dauthOperator")
public class SysDauthOperatorController {

    /**
    *
    */
    private static final OperationResult DEFAULT_SUCCESS_RESULT = new OperationResult();
    /**
     * 运算符Service。
     */
    @HReference
    private SysDauthOperatorService operatorService;
    
    /**
     * 运算符支持Service。
     */
    @HReference
    private SysDauthOperatorSupportService operatorSupportService;

    
    /**
     * 运算符支持。
     * @param support 
     * @param model 
     * @return 页面
     */
    @RequestMapping(value = "/aboutOperatorSupport")
    public String aboutOperatorSupport(SysDauthOperatorSupport support, Model model) {
        model.addAttribute("biz", operatorSupportService.get(support.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 运算符。
     * @param operator 
     * @param model 
     * @return 页面
     */
    @RequestMapping(value = "/aboutOperator")
    public String aboutOperator(SysDauthOperator operator, Model model) {
        model.addAttribute("biz", operatorService.get(operator.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 运算符支持管理菜单。
     * @return 运算符支持管理页面
     */
    @RequestMapping(value = "/supportView")
    public String showOperatorSupport() {
        return "sys/dauth/dauthOperatorSupport_view";
    }
    
    /**
     * 运算符支持分页数据。
     * @param pageInfo 分页信息
     * @return 运算符支持分页数据。
     */
    @RequestMapping(value = "/supportList")
    @ResponseBody
    public Page<SysDauthOperatorSupport> supportList(BasePage<SysDauthOperatorSupport> pageInfo) {
        SysDauthOperatorSupport filter = new SysDauthOperatorSupport();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(operatorSupportService.getPageList(pageInfo, filter));
    }
    
    /**
     * 新增运算符支持。
     * @param support support
     * @return 操作结果
     */
    @RequestMapping(value = "/addSupport")
    @ResponseBody
    @UserLog(code = "addSupport", name = "新增运算符支持", engName = "addSupport")
    public OperationResult addSupport(@HValidated SysDauthOperatorSupport support) {
        operatorSupportService.add(support);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改运算符支持。
     * @param support support
     * @return 操作结果
     */
    @RequestMapping(value = "/updateSupport")
    @ResponseBody
    @UserLog(code = "updateSupport", name = "修改运算符支持", engName = "updateSupport")
    public OperationResult updateSupport(@HValidated SysDauthOperatorSupport support) {
        operatorSupportService.update(support);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个运算符支持。
     * @param supportId supportId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteSupport")
    @ResponseBody
    @UserLog(code = "deleteSupport", name = "删除运算符支持", engName = "deleteSupport")
    public OperationResult deleteSupport(long supportId) {
        operatorSupportService.delete(supportId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 运算符管理。
     * @return 运算符管理页面
     */
    @RequestMapping(value = "/operatorView")
    public String showOperator() {
        return "sys/dauth/dauthOperator_view";
    }
    
    /**
     * 运算符分页数据。
     * @param pageInfo 分页信息
     * @return 运算符分页数据。
     */
    @RequestMapping(value = "/operatorList")
    @ResponseBody
    public Page<SysDauthOperator> operatorList(BasePage<SysDauthOperator> pageInfo) {
        SysDauthOperator filter = new SysDauthOperator();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(operatorService.getPageList(pageInfo, filter));
    }
    
    /**
     * 运算符列表数据。
     * @param filter 过滤条件
     * @return 运算符分页数据。
     */
    @RequestMapping(value = "/getOperatorList")
    @ResponseBody
    public List<SysDauthOperator> getOperatorList(SysDauthOperator filter) {
        return operatorService.getList(filter);
    }
    
    /**
     * 新增运算符。
     * @param operator operator
     * @return 操作结果
     */
    @RequestMapping(value = "/addOperator")
    @ResponseBody
    @UserLog(code = "addOperator", name = "新增运算符", engName = "addOperator")
    public OperationResult addOperator(@HValidated SysDauthOperator operator) {
        operatorService.add(operator);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改运算符。
     * @param operator operator
     * @return 操作结果
     */
    @RequestMapping(value = "/updateOperator")
    @ResponseBody
    @UserLog(code = "updateOperator", name = "修改运算符", engName = "updateOperator")
    public OperationResult updateOperator(@HValidated SysDauthOperator operator) {
        operatorService.update(operator);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个运算符支持。
     * @param operatorId operatorId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteOperator")
    @ResponseBody
    @UserLog(code = "deleteOperator", name = "删除运算符", engName = "deleteOperator")
    public OperationResult deleteOperator(long operatorId) {
        operatorService.delete(operatorId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 获取支持的运算符列表数据。
     * @param filterTypeId 过滤类型
     * @return 运算符分页数据。
     */
    @RequestMapping(value = "/getSupportOperators/{filterTypeId}")
    @ResponseBody
    public List<SysDauthOperator> getSupportOperators(@PathVariable long filterTypeId) {
        return operatorService.getDauthOperators(filterTypeId);
    }
    
    /**
     * 获取支持的运算符列表数据。
     * @param filterTypeId 过滤类型
     * @param operatorId 运算符id
     * @return 运算符分页数据。
     */
    @RequestMapping(value = "/getSupportValueTypes/{filterTypeId}/{operatorId}")
    @ResponseBody
    public List<SysDictItem> getSupportValueTypes(@PathVariable long filterTypeId, @PathVariable long operatorId) {
        return operatorSupportService.getDauthValueTypes(filterTypeId, operatorId);
    }

}

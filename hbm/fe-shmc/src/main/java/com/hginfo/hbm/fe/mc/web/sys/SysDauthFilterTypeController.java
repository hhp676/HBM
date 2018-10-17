/**
 * Project Name:hbm-fe-easyui
 * File Name:SysDauthFilterTypeController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月19日上午9:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.mc.web.sys;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterType;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDauthFilterTypeService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 过滤类型Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月19日上午9:25:54 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/dauthFilterType")
public class SysDauthFilterTypeController {
    
    /**
    *
    */
    private static final OperationResult DEFAULT_SUCCESS_RESULT = new OperationResult();

    /**
     * 过滤类型Service。
     */
    @HReference
    private SysDauthFilterTypeService filterTypeService;
    
    
    /**
     * about.
     * @param filterType filterType
     * @param model model
     * @return page
     */
    @RequestMapping(value = "/aboutOne")
    public String aboutOne(SysDauthFilterType filterType, Model model) {
        model.addAttribute("biz", filterTypeService.get(filterType.getId()));
        return "/sys/biz_about";
    }
    

    /**
     * 过滤类型管理菜单。
     * @return 过滤类型管理页面
     */
    @RequestMapping(value = "/filterTypeView")
    public String showFilterType() {
        return "sys/dauth/dauthFilterType_view";
    }
    
    /**
     * 过滤类型分页数据。
     * @param pageInfo 分页信息
     * @return 过滤类型分页数据。
     */
    @RequestMapping(value = "/filterTypeList")
    @ResponseBody
    public Page<SysDauthFilterType> filterTypeList(BasePage<SysDauthFilterType> pageInfo) {
        SysDauthFilterType filter = new SysDauthFilterType();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(filterTypeService.getPageList(pageInfo, filter));
    }
    
    /**
     * 过滤类型数据。
     * @param filter 过滤条件
     * @return 过滤类型分页数据。
     */
    @RequestMapping(value = "/getFilterTypeList")
    @ResponseBody
    public List<SysDauthFilterType> getFilterTypeList(SysDauthFilterType filter) {
        return filterTypeService.getList(filter);
    }
    
    /**
     * 新增过滤类型。
     * @param filterType filterType
     * @return 操作结果
     */
    @RequestMapping(value = "/addFilterType")
    @ResponseBody
    @UserLog(code = "addFilterType", name = "新增过滤类型", engName = "addFilterType")
    public OperationResult addFilterType(@HValidated SysDauthFilterType filterType) {
        filterTypeService.add(filterType);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改过滤类型。
     * @param filterType filterType
     * @return 操作结果
     */
    @RequestMapping(value = "/updateFilterType")
    @ResponseBody
    @UserLog(code = "updateFilterType", name = "修改过滤类型", engName = "updateFilterType")
    public OperationResult updateFilterType(@HValidated SysDauthFilterType filterType) {
        filterTypeService.update(filterType);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个过滤类型。
     * @param filterTypeId filterTypeId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteFilterType")
    @ResponseBody
    @UserLog(code = "deleteFilterType", name = "删除过滤类型", engName = "deleteFilterType")
    public OperationResult deleteFilterType(long filterTypeId) {
        filterTypeService.delete(filterTypeId);
        return DEFAULT_SUCCESS_RESULT;
    }

}

/**
 * Project Name:hbm-fe-easyui
 * File Name:SysDauthFilterController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月30日上午9:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.bs.web.sys;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterGroup;
import com.hginfo.hbm.base.entity.sys.SysDauthFilterItem;
import com.hginfo.hbm.base.entity.sys.SysDauthFilterJoin;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDauthFilterGroupService;
import com.hginfo.hbm.base.service.sys.SysDauthFilterItemService;
import com.hginfo.hbm.base.service.sys.SysDauthFilterJoinService;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 过滤器Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月30日上午9:25:54 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/dauthFilter")
public class SysDauthFilterController {
    
    /**
     * 
     */
    @HReference
    private SysDauthFilterItemService  sysDauthFilterItemService;
    
    /**
     * 
     */
    @HReference
    private SysDauthFilterGroupService sysDauthFilterGroupService;
    
    /**
     * 
     */
    @HReference
    private SysDauthFilterJoinService  sysDauthFilterJoinService;
    
    /**
     * about.
     * @param item item
     * @param model model
     * @return page
     * @throws Exception 
     */
    @RequestMapping(value = "/aboutFilterItem")
    public String aboutFilterItem(SysDauthFilterItem item, Model model) throws Exception {
        model.addAttribute("biz", sysDauthFilterItemService.get(item.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * about.
     * @param group group
     * @param model model
     * @return page
     * @throws Exception 
     */
    @RequestMapping(value = "/aboutFilterGroup")
    public String aboutFilterGroup(SysDauthFilterGroup group, Model model) throws Exception {
        model.addAttribute("biz", sysDauthFilterGroupService.get(group.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * about.
     * @param join join
     * @param model model
     * @return page
     * @throws Exception 
     */
    @RequestMapping(value = "/aboutFilterJoin")
    public String aboutFilterJoin(SysDauthFilterJoin join, Model model) throws Exception {
        model.addAttribute("biz", sysDauthFilterJoinService.get(join.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 过滤器项配置。
     * @return 过滤器项配置
     */
    @RequestMapping(value = "/filterItemView")
    public String filterItemView() {
        return "sys/dauth/dauthFilterItem_view";
    }
    
    /**
     * 过滤器项分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 过滤器项分页数据。
     */
    @RequestMapping(value = "/filterItemList")
    @ResponseBody
    public Page<SysDauthFilterItem> filterItemList(BasePage<SysDauthFilterItem> pageInfo,
        SysDauthFilterItem filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthFilterItemService.getPageList(pageInfo, filter));
    }
    
    /**
     * 过滤器项选择页面。
     * @param entityId 
     * @param request 
     * @return 过滤器项配置
     */
    @RequestMapping(value = "/chooseFilterItemView/{entityId}")
    public String chooseFilterItemView(@PathVariable long entityId, HttpServletRequest request) {
        request.setAttribute("entityId", entityId);
        return "sys/dauth/dauthFilterItemChoose_view";
    }
    
    /**
     * 过滤器项选择页面分页数据。
     * @param entityId 实体Id
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 过滤器项分页数据。
     */
    @RequestMapping(value = "/chooseFilterItemList/{entityId}")
    @ResponseBody
    public Page<SysDauthFilterItem> chooseFilterItemList(@PathVariable long entityId,
        BasePage<SysDauthFilterItem> pageInfo, SysDauthFilterItem filter) {
        filter.setEntityId(entityId);
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthFilterItemService.getPageList(pageInfo, filter));
    }
    
    /**
     * 新增过滤器项。
     * @param filterItem filterItem
     * @return 操作结果
     */
    @RequestMapping(value = "/addFilterItem")
    @ResponseBody
    @UserLog(code = "addFilterItem", name = "新增滤器项", engName = "addFilterItem")
    public OperationResult addFilterItem(@HValidated SysDauthFilterItem filterItem) {
        sysDauthFilterItemService.add(filterItem);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改过滤器项。
     * @param filterItem filterItem
     * @return 操作结果
     */
    @RequestMapping(value = "/updateFilterItem")
    @ResponseBody
    @UserLog(code = "updateFilterItem", name = "修改滤器项", engName = "updateFilterItem")
    public OperationResult updateFilterItem(@HValidated SysDauthFilterItem filterItem) {
        sysDauthFilterItemService.updateIncludeField(filterItem);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除一个过滤器项。
     * @param filterItemId filterItemId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteFilterItem")
    @ResponseBody
    @UserLog(code = "deleteFilterItem", name = "删除滤器项", engName = "deleteFilterItem")
    public OperationResult deleteFilterItem(long filterItemId) {
        sysDauthFilterItemService.delete(filterItemId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 过滤器组配置。
     * @return 过滤器组配置
     */
    @RequestMapping(value = "/filterGroupView")
    public String filterGroupView() {
        return "sys/dauth/dauthFilterGroup_view";
    }
    
    /**
     * 过滤器组分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 过滤器组分页数据。
     */
    @RequestMapping(value = "/filterGroupList")
    @ResponseBody
    public Page<SysDauthFilterGroup> filterGroupList(BasePage<SysDauthFilterGroup> pageInfo,
        SysDauthFilterGroup filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthFilterGroupService.getPageList(pageInfo, filter));
    }
    
    /**
     * 数据权限详情过滤器组分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 数据权限详情过滤器组分页数据。
     */
    @RequestMapping(value = "/dauthDetailGroupList")
    @ResponseBody
    public Page<SysDauthFilterGroup> dauthDetailGroupList(BasePage<SysDauthFilterGroup> pageInfo,
        SysDauthFilterGroup filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthFilterGroupService.getPageList(pageInfo, filter));
    }
    
    /**
     * 新增过滤器组。
     * @param filterGroup filterGroup
     * @return 操作结果
     */
    @RequestMapping(value = "/addFilterGroup")
    @ResponseBody
    @UserLog(code = "addFilterGroup", name = "新增过滤器组", engName = "addFilterGroup")
    public OperationResult addFilterGroup(@HValidated SysDauthFilterGroup filterGroup) {
        sysDauthFilterGroupService.add(filterGroup);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改过滤器组。
     * @param filterGroup filterGroup
     * @return 操作结果
     */
    @RequestMapping(value = "/updateFilterGroup")
    @ResponseBody
    @UserLog(code = "updateFilterGroup", name = "修改过滤器组", engName = "updateFilterGroup")
    public OperationResult updateFilterGroup(@HValidated SysDauthFilterGroup filterGroup) {
        sysDauthFilterGroupService.update(filterGroup);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除一个过滤器组。
     * @param filterGroupId filterGroupId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteFilterGroup")
    @ResponseBody
    @UserLog(code = "deleteFilterGroup", name = "删除过滤器组", engName = "deleteFilterGroup")
    public OperationResult deleteFilterGroup(long filterGroupId) {
        sysDauthFilterGroupService.delete(filterGroupId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 过滤器关联配置。
     * @param entityId 实体Id
     * @param filterGroupId 过滤器组Id
     * @param request 请求
     * @return 过滤器关联配置
     */
    @RequestMapping(value = "/filterJoinView/{entityId}/{filterGroupId}")
    public String filterJoinView(@PathVariable long entityId, @PathVariable long filterGroupId,
        HttpServletRequest request) {
        request.setAttribute("filterGroupId", filterGroupId);
        request.setAttribute("entityId", entityId);
        
        return "sys/dauth/dauthFilterJoin_view";
    }
    
    /**
     * 过滤器项关联的过滤器组页面。
     * @return 过滤器项关联的过滤器组页面
     */
    @RequestMapping(value = "/filterJoinItemGroupView")
    public String filterItemGroupView() {
        return "sys/dauth/dauthFilterJoinItemGroup_view";
    }
    
    /**
     * 过滤器关联分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 过滤器关联分页数据。
     */
    @RequestMapping(value = "/filterJoinList")
    @ResponseBody
    public Page<SysDauthFilterJoin> filterJoinList(BasePage<SysDauthFilterJoin> pageInfo,
        SysDauthFilterJoin filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthFilterJoinService.getPageList(pageInfo, filter));
    }

    /**
     * 弹窗过滤器项配置页面过滤器关联分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 过滤器关联分页数据。
     */
    @RequestMapping(value = "/winFilterJoinList")
    @ResponseBody
    public Page<SysDauthFilterJoin> winFilterJoinList(BasePage<SysDauthFilterJoin> pageInfo, SysDauthFilterJoin filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthFilterJoinService.getWinPageList(pageInfo, filter));
    }
    
    /**
     * 数据权限详情过滤器关联分页数据。
     * @param filter 查询条件
     * @return 数据权限详情过滤器关联分页数据。
     */
    @RequestMapping(value = "/dauthDetailFilterJoinList")
    @ResponseBody
    public Page<SysDauthFilterJoin> dauthDetailFilterJoinList(SysDauthFilterJoin filter) {
        List<SysDauthFilterJoin> list = sysDauthFilterJoinService.getList(filter);
        Page<SysDauthFilterJoin> page = new Page<>();
        page.setRows(list);
        page.setTotal(list == null ? 0
            : list.size());
        return page;
    }
    
    /**
     * 新增过滤器关联。
     * @param filterJoin filterJoin
     * @return 操作结果
     */
    @RequestMapping(value = "/addFilterJoin")
    @ResponseBody
    @UserLog(code = "addFilterJoin", name = "新增过滤器关联", engName = "addFilterJoin")
    public OperationResult addFilterJoin(@HValidated SysDauthFilterJoin filterJoin) {
        sysDauthFilterJoinService.add(filterJoin);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改过滤器关联。
     * @param filterJoin filterJoin
     * @return 操作结果
     */
    @RequestMapping(value = "/updateFilterJoin")
    @ResponseBody
    @UserLog(code = "updateFilterJoin", name = "修改过滤器关联", engName = "updateFilterJoin")
    public OperationResult updateFilterJoin(@HValidated SysDauthFilterJoin filterJoin) {
        sysDauthFilterJoinService.update(filterJoin);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除一个过滤器关联。
     * @param joinId joinId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteFilterJoin")
    @ResponseBody
    @UserLog(code = "deleteFilterJoin", name = "删除过滤器关联", engName = "deleteFilterJoin")
    public OperationResult deleteFilterJoin(long joinId) {
        sysDauthFilterJoinService.delete(joinId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
}

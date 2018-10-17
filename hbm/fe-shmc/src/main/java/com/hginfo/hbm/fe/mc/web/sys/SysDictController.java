/*
 * Project Name:hbm-fe-easyui.
 * File Name:SysDictController.java
 * Package Name:com.hginfo.hbm.fe.eu.web
 * Date:2016年12月2日 上午10:03:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.mc.web.sys;

import com.hginfo.hbm.base.entity.sys.SysDictGroup;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.hginfo.hbm.fe.mc.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import java.util.List;

/**
 * 数据字典Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月2日 上午10:03:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysDict")
public class SysDictController {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(SysDictController.class);

    /**
     * 数据字典Service。
     */
    private SysDictService dictService;

    /**
     * 数据字典管理菜单。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String showSysDict() {
        return "sys/dict/sysDict_view";
    }

    /**
     * 数据字典组分页数据。
     * @param pageInfo 分页信息
     * @return 字典组分页数据
     */
    @RequestMapping(value = "/groupList")
    @ResponseBody
    public Page<SysDictGroup> groupList(BasePage<SysDictGroup> pageInfo) {
        SysDictGroup filter = new SysDictGroup();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(dictService.getGroupList(pageInfo, filter));
    }
    
    /**
     * 数据字典管理菜单。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/item/view")
    public String showSysDictItem() {
        return "sys/dict/sysDictItem_view";
    }
    

    /**
     * 获取字典项列表。
     * @param groupId      字典组id
     * @return 字典项列表
     */
    @RequestMapping(value = "/{groupId}/itemList")
    @ResponseBody
    public List<SysDictItem> itemList(@PathVariable long groupId) {
        SysDictGroup group = dictService.getGroupById(groupId);
        return dictService.getItemList(group.getDictGroupCode());
    }

    /**
     * 获取字典项列表。
     * @param groupCode      字典组code
     * @param subGroupCode   子分组code
     * @return 字典项列表
     */
    @RequestMapping(value = "/itemList/{groupCode}/{subGroupCode}")
    @ResponseBody
    public List<SysDictItem> itemList(@PathVariable String groupCode, @PathVariable String subGroupCode) {
        return dictService.getItemList(groupCode, subGroupCode);
    }

    /**
     * 新增字典组。
     * @param group group
     * @return 操作结果
     */
    @RequestMapping(value = "/addGroup")
    @ResponseBody
    @UserLog(code = "addDictGroup", name = "新增字典组", engName = "addDictGroup")
    public OperationResult addGroup(@HValidated SysDictGroup group) {
        dictService.createGroup(group);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 修改字典组。
     * @param group group
     * @return 操作结果
     */
    @RequestMapping(value = "/updGroup")
    @ResponseBody
    @UserLog(code = "updateDictGroup", name = "修改字典组", engName = "updateDictGroup")
    public OperationResult updateGroup(@HValidated SysDictGroup group) {
        dictService.editGroup(group);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个字典组。
     * @param groupId groupId
     * @return 操作结果
     */
    @RequestMapping(value = "/delGroup")
    @ResponseBody
    @UserLog(code = "deleteDictGroup", name = "删除字典组", engName = "deleteDictGroup")
    public OperationResult deleteGroup(long groupId) {
        dictService.deleteGroup(groupId);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 新增字典项。
     * @param item item
     * @return 操作结果
     */
    @RequestMapping(value = "/addItem")
    @ResponseBody
    @UserLog(code = "addDictItem", name = "新增字典项", engName = "addDictItem")
    public OperationResult addItem(@HValidated SysDictItem item) {
        dictService.createItem(item);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改字典项。
     * @param item item
     * @return 操作结果
     */
    @RequestMapping(value = "/updItem")
    @ResponseBody
    @UserLog(code = "updateDictItem", name = "修改字典项", engName = "updateDictItem")
    public OperationResult updateItem(@HValidated SysDictItem item) {
        LOG.debug(item.toString());
        dictService.editItem(item);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个字典项。
     * @param itemId itemId
     * @return 操作结果
     */
    @RequestMapping(value = "/delItem")
    @ResponseBody
    @UserLog(code = "deleteDictItem", name = "删除字典项", engName = "deleteDictItem")
    public OperationResult deleteItem(long itemId) {
        dictService.deleteItem(itemId);
        return DEFAULT_SUCCESS_RESULT;
    }

    @HReference
    public void setDictService(SysDictService dictService) {
        this.dictService = dictService;
    }

}

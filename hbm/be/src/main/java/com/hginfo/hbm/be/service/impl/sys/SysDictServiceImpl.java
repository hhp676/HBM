/*
 * Project Name:hbm-base.
 * File Name:SysDitServiceImpl.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月1日 下午6:50:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysDictGroup;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hvalidate.annotation.HValidated;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 数据字典Service。 <br />
 * service impl 层 <br />
 * Date: 2016年11月29日 下午3:26:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysDictServiceImpl implements SysDictService {

    /**
     * 数据字典组Service。
     */
    private SysDictGroupServiceImpl groupService;

    /**
     * 数据字典项Service。
     */
    private SysDictItemServiceImpl itemService;

    @Override
    public SysDictGroup getGroupById(long groupId) {
        return groupService.get(groupId);
    }

    @Override
    public Page<SysDictGroup> getGroupList(BasePage<SysDictGroup> pageInfo, SysDictGroup filter) {
        SysDictGroup realFilter = filter == null ? new SysDictGroup() : filter;
        realFilter.setIsDelete(0);
        return groupService.getPageList(pageInfo, realFilter);
    }

    @Override
    public SysDictGroup createGroup(@HValidated SysDictGroup group) {

        groupService.add(group);
        return group;
    }

    @Override
    public SysDictGroup editGroup(@HValidated SysDictGroup group) {
        // TODO check group code
        groupService.update(group);
        return group;
    }

    @Override
    public SysDictGroup deleteGroup(long groupId) {
        SysDictGroup group = groupService.get(groupId);
        List<SysDictItem> items = getItemList(group.getDictGroupCode());
        items.stream().mapToLong(SysDictItem::getDictItemId).forEach(this::deleteItem);
        groupService.delete(groupId);
        return group;
    }

    @Override
    public SysDictItem getItemById(long itemId) {
        return itemService.get(itemId);
    }

    // TODO 在此增加缓存处理
    @Override
    public List<SysDictItem> getItemList(String groupCode) {
        return getItemList(groupCode, null);
    }
    
    @Override
    public List<SysDictItem> getItemList(long groupId) {
        SysDictItem filter = new SysDictItem();
        filter.setIsDelete(0);
        filter.setDictGroupId(groupId);
        return itemService.getList(filter);
    }

    @Override
    public List<SysDictItem> getItemList(String groupCode, String subGroupCode) {
        SysDictGroup group = getGroupByCode(groupCode);

        SysDictItem filter = new SysDictItem();
        filter.setIsDelete(0);
        filter.setDictGroupId(group.getDictGroupId());
        filter.setSubGroupCode(subGroupCode);
        return itemService.getList(filter);
    }

    @Override
    public List<SysDictItem> getItemList(String groupCode, long priority) {
        return getItemList(groupCode, null, priority);
    }

    @Override
    public List<SysDictItem> getItemList(String groupCode, String subGroupCode, long priority) {
        List<SysDictItem> items = getItemList(groupCode, subGroupCode);
        return items.stream().filter(item -> {
            long itemPriority = item.getPriorityNo() == null ? 0 : item.getPriorityNo();
            return (itemPriority & priority) > 0;
        }).collect(Collectors.toList());
    }

    @Override
    public SysDictItem createItem(@HValidated SysDictItem item) {
        itemService.add(item);
        return item;
    }

    @Override
    public SysDictItem editItem(@HValidated SysDictItem item) {
        itemService.update(item);
        return item;
    }

    @Override
    public SysDictItem deleteItem(long itemId) {
        itemService.delete(itemId);
        return itemService.get(itemId);
    }

    /**
     * 根据code获取字典组。
     * @param groupCode 字典组code
     * @return 字典组实体
     */
    private SysDictGroup getGroupByCode(String groupCode) {
        SysDictGroup filter = new SysDictGroup();
        filter.setIsDelete(0);
        filter.setDictGroupCode(groupCode);

        return groupService.getOne(filter);
    }

    @Autowired
    public void setGroupService(SysDictGroupServiceImpl groupService) {
        this.groupService = groupService;
    }

    @Autowired
    public void setItemService(SysDictItemServiceImpl itemService) {
        this.itemService = itemService;
    }
}

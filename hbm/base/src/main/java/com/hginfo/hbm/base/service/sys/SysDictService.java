/*
 * Project Name:hbm-base.
 * File Name:SysDictService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月1日 下午6:50:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysDictGroup;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
 * 数据字典Service。 <br />
 * service interface 层 <br />
 * Date: 2016年11月29日 下午3:26:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysDictService {

    /**
     * 根据id获取字典组。
     * @param groupId id
     * @return 字典组
     */
    SysDictGroup getGroupById(long groupId);

    /**
     * 获取分页字典组数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDictGroup> getGroupList(BasePage<SysDictGroup> pageInfo, SysDictGroup filter);

    /**
     * 新增数据字典组。
     * @param group 新增的字典组
     * @return 保存后的字典组
     */
    SysDictGroup createGroup(SysDictGroup group);

    /**
     * 修改数据字典组。
     * @param group 要修改的字典组
     * @return 修改保存后的字典组
     */
    SysDictGroup editGroup(SysDictGroup group);

    /**
     * 删除数据字典组。
     * @param groupId 字典组ID
     * @return 被删除的字典组
     */
    SysDictGroup deleteGroup(long groupId);

    /**
     * 根据id获取字典项。
     * @param itemId id
     * @return 字典项
     */
    SysDictItem getItemById(long itemId);

    /**
     * 获取数据字典项。
     * @param groupCode 字典组code
     * @return 对应字典项列表
     */
    List<SysDictItem> getItemList(String groupCode);
    
    /**
     * 获取数据字典项。
     * @param groupId 字典组id
     * @return 对应字典项列表
     */
    List<SysDictItem> getItemList(long groupId);

    /**
     * 获取数据字典列表。
     * @param groupCode 字典组code
     * @param subGroupCode 子分组code
     * @return 对应字典项列表
     */
    List<SysDictItem> getItemList(String groupCode, String subGroupCode);

    /**
     * 获取数据字典项。
     * @param groupCode 字典组code
     * @param priority  权重：权重的过滤条件可以实现灵活分组。
     * @return 对应字典项列表
     */
    List<SysDictItem> getItemList(String groupCode, long priority);

    /**
     * 获取数据字典列表。
     * @param groupCode 字典组code
     * @param subGroupCode 子分组code
     * @param priority  权重：
     * @return 对应字典项列表
     */
    List<SysDictItem> getItemList(String groupCode, String subGroupCode, long priority);

    /**
     * 新增数据字典项。
     * @param item 要增加的数据字典项
     * @return 保存后的数据字典项
     */
    SysDictItem createItem(SysDictItem item);

    /**
     * 修改数据字典项。
     * @param item 要修改的数据字典项
     * @return 保存后的数据字典项
     */
    SysDictItem editItem(SysDictItem item);

    /**
     * 删除数据字典项。
     * @param itemId 字典项ID
     * @return 被删除的数据字典项
     */
    SysDictItem deleteItem(long itemId);
}

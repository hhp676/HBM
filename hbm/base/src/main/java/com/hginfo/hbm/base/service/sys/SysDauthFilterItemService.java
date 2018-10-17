/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterItemService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月30日 上午9:41:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterItem;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限过滤器项: sys_dauth_filter_item. <br />
 * service interface 层 <br />
 * Date: 2016年12月30日 上午9:41:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthFilterItemService {
    
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauthFilterItem get(Long id, String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysDauthFilterItem> getPageList(BasePage<SysDauthFilterItem> pageInfo,
        SysDauthFilterItem filter, String... loadProps);
    /**
     * 根据条件查询。
     * @param filter 查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 列表
     */
    List<SysDauthFilterItem> getList(SysDauthFilterItem filter, String... loadProps);
    
    /**
     * 新增。
     * @param sysDauthFilterItem 过滤器项
     */
    void add(SysDauthFilterItem sysDauthFilterItem);
    
    /**
     * 修改，包括field即使为null。
     * @param sysDauthFilterItem 过滤器项
     */
    void updateIncludeField(SysDauthFilterItem sysDauthFilterItem);
    /**
     * 删除。
     * @param filterItemId 过滤器项Id
     */
    void delete(long filterItemId);
}

/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterTypeService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterType;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限过滤类型表: sys_dauth_filter_type. <br />
 * service interface 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthFilterTypeService {
    
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauthFilterType get(Long id, final String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysDauthFilterType> getPageList(BasePage<SysDauthFilterType> pageInfo,
        SysDauthFilterType filter, final String... loadProps);
    
    /**
     * 根据条件查询。
     * @param filter 查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 列表
     */
    List<SysDauthFilterType> getList(SysDauthFilterType filter, final String... loadProps);
    
    /**
     * 新增。
     * @param sysDauthFilterType 过滤类型
     */
    void add(SysDauthFilterType sysDauthFilterType);
    
    /**
     * 修改。
     * @param sysDauthFilterType 过滤类型
     */
    void update(SysDauthFilterType sysDauthFilterType);
    /**
     * 删除。
     * @param filterTypeId 过滤类型Id
     */
    void delete(long filterTypeId);
}

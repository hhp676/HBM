/*
 * Project Name:hbm-base.
 * File Name:SysDauthUsageService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年01月19日 上午11:51:19
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthUsage;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限应用表: sys_dauth_usage. <br />
 * service interface 层 <br />
 * Date: 2017年01月19日 上午11:51:19 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthUsageService {
    
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauthUsage get(Long id, final String... loadProps);

    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauthUsage> getPageList(BasePage<SysDauthUsage> pageInfo,
        SysDauthUsage filter);
    
    /**
     * 新增。
     * @param sysDauthUsage 数据权限应用
     */
    void add(SysDauthUsage sysDauthUsage);
    
    /**
     * 修改。
     * @param sysDauthUsage 数据权限应用
     */
    void update(SysDauthUsage sysDauthUsage);
    
    /**
     * 删除数据权限字段。
     * @param usageId 数据权限应用Id
     */
    void deleteUsageDauth(long usageId);
}

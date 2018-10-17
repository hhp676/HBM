/*
 * Project Name:hbm-base.
 * File Name:SysDauthService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年01月12日 下午6:28:35
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysDauth;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限表: sys_dauth. <br />
 * service interface 层 <br />
 * Date: 2017年01月12日 下午6:28:35 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthService {

    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauth get(Long id, final String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauth> getPageList(BasePage<SysDauth> pageInfo,
        SysDauth filter);
    
    /**
     * 解析数据权限。
     * @param dauthId dauthId
     * @param userId userId
     * @return sql
     */
    String parseDauth(long dauthId, long userId);
    
    /**
     * 新增。
     * @param sysDauth 数据权限
     */
    void add(SysDauth sysDauth);
    
    /**
     * 修改。
     * @param sysDauth 数据权限
     */
    void update(SysDauth sysDauth);
    
    /**
     * 删除。
     * @param dauthId 数据权限Id
     */
    void delete(long dauthId);
}

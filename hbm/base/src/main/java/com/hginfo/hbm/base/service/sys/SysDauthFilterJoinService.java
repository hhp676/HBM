/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterJoinService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年01月14日 下午4:34:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterJoin;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限过滤器关联: sys_dauth_filter_join. <br />
 * service interface 层 <br />
 * Date: 2017年01月14日 下午4:34:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthFilterJoinService {
    
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauthFilterJoin get(Long id, final String... loadProps);

    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauthFilterJoin> getPageList(BasePage<SysDauthFilterJoin> pageInfo,
        SysDauthFilterJoin filter);
    
    /**
     * 过滤器项配置页面获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauthFilterJoin> getWinPageList(BasePage<SysDauthFilterJoin> pageInfo,
        SysDauthFilterJoin filter);
    
    
    /**
     * 获取数据。
     * @param filter   查询条件
     * @return 分页数据
     */
    List<SysDauthFilterJoin> getList(SysDauthFilterJoin filter);
    
    /**
     * 新增。
     * @param sysDauthFilterJoin 过滤器关联
     */
    void add(SysDauthFilterJoin sysDauthFilterJoin);
    
    /**
     * 修改。
     * @param sysDauthFilterJoin 过滤器关联
     */
    void update(SysDauthFilterJoin sysDauthFilterJoin);
    /**
     * 删除。
     * @param joinId 过滤器关联Id
     */
    void delete(long joinId);
}

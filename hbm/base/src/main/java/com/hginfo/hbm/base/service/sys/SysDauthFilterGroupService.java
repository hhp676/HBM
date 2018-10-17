/*
 * Project Name:hbm-base.
 * File Name:SysDauthFilterGroupService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年01月13日 下午3:52:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterGroup;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限过滤器组: sys_dauth_filter_group. <br />
 * service interface 层 <br />
 * Date: 2017年01月13日 下午3:52:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthFilterGroupService {
    
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauthFilterGroup get(Long id, String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauthFilterGroup> getPageList(BasePage<SysDauthFilterGroup> pageInfo,
        SysDauthFilterGroup filter);
    
    /**
     * 新增。
     * @param sysDauthFilterGroup 过滤器组
     */
    void add(SysDauthFilterGroup sysDauthFilterGroup);
    
    /**
     * 修改。
     * @param sysDauthFilterGroup 过滤器组
     */
    void update(SysDauthFilterGroup sysDauthFilterGroup);
    /**
     * 删除。
     * @param filterGroupId 过滤器组Id
     */
    void delete(long filterGroupId);
}

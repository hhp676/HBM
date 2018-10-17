/*
 * Project Name:hbm-base.
 * File Name:SysDauthVariableService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年01月10日 上午10:58:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthVariable;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限变量表: sys_dauth_variable. <br />
 * service interface 层 <br />
 * Date: 2017年01月10日 上午10:58:32 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthVariableService {
    
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysDauthVariable get(Long id, final String... loadProps);
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauthVariable> getPageList(BasePage<SysDauthVariable> pageInfo,
        SysDauthVariable filter);
    
    /**
     * 新增。
     * @param sysDauthVariable 数据权限变量
     */
    void add(SysDauthVariable sysDauthVariable);
    
    /**
     * 修改。
     * @param sysDauthVariable 数据权限变量
     */
    void update(SysDauthVariable sysDauthVariable);
    /**
     * 删除。
     * @param variableId 数据权限变量Id
     */
    void delete(long variableId);
}

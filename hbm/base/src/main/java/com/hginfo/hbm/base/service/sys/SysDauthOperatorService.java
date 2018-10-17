/*
 * Project Name:hbm-base.
 * File Name:SysDauthOperatorService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthOperator;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限运算符表: sys_dauth_operator. <br />
 * service interface 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthOperatorService {
    
    
    /**
     * 通过主键获取实体对象。
     * @param id 主键
     * @param loadProps 需要级联加载的实体属性
     * @return 对象
     */
    SysDauthOperator get(Long id, final String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysDauthOperator> getPageList(BasePage<SysDauthOperator> pageInfo,
        SysDauthOperator filter, final String... loadProps);
    
    /**
     * 根据过滤类型获取支持的运算符。
     * @param filterTypeId 
     * @return 运算符。
     */
    List<SysDauthOperator> getDauthOperators(long filterTypeId);
    
    /**
     * 查询所有。
     * @param filter 查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 列表
     */
    List<SysDauthOperator> getList(SysDauthOperator filter, final String... loadProps);
    
    /**
     * 新增。
     * @param sysDauthOperator 运算符
     */
    void add(SysDauthOperator sysDauthOperator);
    
    /**
     * 修改。
     * @param sysDauthOperator 运算符
     */
    void update(SysDauthOperator sysDauthOperator);
    /**
     * 删除。
     * @param operatorId 运算符Id
     */
    void delete(long operatorId);
}

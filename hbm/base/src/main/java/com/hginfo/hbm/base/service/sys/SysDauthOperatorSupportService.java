/*
 * Project Name:hbm-base.
 * File Name:SysDauthOperatorSupportService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthOperatorSupport;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 数据权限运算符支持表: sys_dauth_operator_support. <br />
 * service interface 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthOperatorSupportService {
    
    
    
    /**
     * 通过主键获取实体对象。
     * @param id 主键
     * @param loadProps 需要级联加载的实体属性
     * @return 对象
     */
    SysDauthOperatorSupport get(Long id, final String... loadProps);
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysDauthOperatorSupport> getPageList(BasePage<SysDauthOperatorSupport> pageInfo,
        SysDauthOperatorSupport filter);
    
    /**
     * 获取支持的值类型。
     * @param filterTypeId 
     * @param operatorId 
     * @return 值类型
     */
    List<SysDictItem> getDauthValueTypes(long filterTypeId, long operatorId);
    
    /**
     * 新增。
     * @param sysDauthOperatorSupport 运算符支持
     */
    void add(SysDauthOperatorSupport sysDauthOperatorSupport);
    
    /**
     * 修改。
     * @param sysDauthOperatorSupport 运算符支持
     */
    void update(SysDauthOperatorSupport sysDauthOperatorSupport);
    /**
     * 删除。
     * @param supportId 运算符支持Id
     */
    void delete(long supportId);
}

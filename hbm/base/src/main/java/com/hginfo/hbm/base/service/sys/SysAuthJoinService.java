/*
 * Project Name:hbm-base.
 * File Name:SysAuthJoinService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年03月09日 下午3:26:46
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysAuthJoin;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 系统权限关联表: sys_auth_join. <br />
 * service interface 层 <br />
 * Date: 2017年03月09日 下午3:26:46 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysAuthJoinService {

    /**
     * 查询主权限关联的附属权限列表或附属权限关联的主权限列表。
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysAuthJoin> getMainAuthPageList(BasePage<SysAuthJoin> pageInfo,
                                         SysAuthJoin filter, String... loadProps);

    /**
     * 查询列表.
     * @param filter 条件
     * @param loadProps 
     * @return 结果
     */
    List<SysAuthJoin> getList(SysAuthJoin filter, final String... loadProps);
    
    /**
     * 保存附属权限关联主权限列表. <br/>
     * @param attachAuthId 附属权限Id
     * @param mainAuthIds 主权限Id数组
     */
    void saveAttachAuthJoinList(Long attachAuthId, Long[] mainAuthIds);
    
    /**
     * 
     * 保存主权限关联附属权限列表. <br/>
     * @param mainAuthId 主权限Id
     * @param attachAuthIds 附属权限Id数组
     */
    void saveMainAuthJoinList(Long mainAuthId, Long[] attachAuthIds);
    
    /**
     * 批量删除。
     * @param ids ids
     */
    void deleteBatch(Long[] ids);
}

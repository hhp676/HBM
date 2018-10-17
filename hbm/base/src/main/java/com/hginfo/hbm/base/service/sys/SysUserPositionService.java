/**
* Project Name:hbm-base.
* File Name:SysUserPositionService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
* 用户岗位表: sys_user_position. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysUserPositionService {
    
    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysUserPosition> getPageList(BasePage<SysUserPosition> pageInfo,
                                      SysUserPosition filter, String... loadProps);

    /**
     *
     * @param filter filter
     * @param loadProps 列表数据的后续处理
     * @return list
     * @since V1.0.0
     */
    List<SysUserPosition> getList(SysUserPosition filter, String... loadProps);
    
    /**
     * deleteByIDs:(ids批量删除关联关系). <br/>
     * @author yinyanzhen
     * @param userPositionIds userPositionIds
     * @since V1.0.0
     */
    void deleteByIDs(Long[] userPositionIds);
    
    /**
     *
     * @param userPos user position
     */
    void delete(SysUserPosition userPos);
    
    /**
     *
     * @param userPos user position
     */
    void add(SysUserPosition userPos);
    
    /**
     *批量新增岗位用户对应.
     * @param positionId positionId
     * @param userIds userIds
     */
    void addPosToUsers(Long positionId, Long[] userIds);
    
    /**
     *
     * @param userPos user position
     */
    void setMajor(SysUserPosition userPos);
    
    /**
     * 
     * @param userId userId
     * @param positionIds positionIds
     * @since V1.0.0
     */
    void doRefresh(Long userId, Long[] positionIds);
    
    
    /**
     * 获取岗位id字符串，用逗号分隔
     * @param userId
     * @return 岗位id字符串
     */
    String getPositionIdStrByUserId(Long userId);
    
}

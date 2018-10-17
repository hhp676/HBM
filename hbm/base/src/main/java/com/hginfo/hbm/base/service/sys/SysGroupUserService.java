/**
* Project Name:hbm-base.
* File Name:SysGroupUserService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:54
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
* 小组用户表: sys_group_user. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:54 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysGroupUserService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysGroupUser> getPageList(BasePage<SysGroupUser> pageInfo, SysGroupUser filter, final String... loadProps);

    /**
     * deleteByIDs:(批量删除用户小组对应关系). <br/>
     * @author yinyanzhen
     * @param groupUserIds groupUserIds
     * @since V1.0.0
     */
    void deleteByIDs(Long[] groupUserIds);
    
    /**
     *
     * @param groupUser group user
     */
    void add(SysGroupUser groupUser);
    
    /**
     * 添加小组和多个用户对应关系.
     * @param groupId groupId
     * @param userIds userIds
     */
    void addGroupToUsers(Long groupId, Long[] userIds);

    /**
     *
     * @param groupUser group user
     */
    void delete(SysGroupUser groupUser);

    /**
     * 将该成员调整为组长，原组长改为组员。
     * @param groupUser group user
     */
    void setLeader(SysGroupUser groupUser);
    
    /**
     * 
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return List<SysGroupUser>
     */
    List<SysGroupUser> getList(SysGroupUser filter, final String... loadProps);
    
    /**
     * 刷新设置用户和组的关联关系。
     * @param userId userId
     * @param groupIds groupIds
     * @since V1.0.0
     */
    void doRefresh(Long userId, Long[] groupIds);
    
    
    /**
     * 获取用户组id字符串，逗号分隔
     * @param userId
     * @return 用户组id字符串
     */
    String getGroupIdsByUserId(Long userId);

}

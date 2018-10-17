/*
 * Project Name:hbm-base.
 * File Name:SysGroupService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年11月29日 下午3:26:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysOrganization;

import java.util.List;

/**
* 小组表: sys_group. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:54 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysGroupService {

    /**
     *
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return group list
     */
    List<SysGroup> getList(SysGroup filter, final String... loadProps);

    /**
     *
     * @param parentId 父节点Id
     * @return 子节点
     */
    List<SysGroup> getChildren(long parentId);

    /**
     *
     * @param groupId groupId
     * @return group
     */
    SysGroup getById(long groupId);

    /**
     *
     * @param newGroup new group
     * @return saved group
     */
    SysGroup createGroup(SysGroup newGroup);

    /**
     *
     * @param editGroup edit group
     * @return saved group
     */
    SysGroup editGroup(SysGroup editGroup);

    /**
     *
     * @param groupId group id
     * @return deleted group
     */
    SysGroup deleteGroup(long groupId);
}

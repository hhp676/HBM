/*
 * Project Name:hbm-be.
 * File Name:SysGroupServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.service.sys.SysGroupService;
import com.hginfo.hbm.be.dao.sys.SysGroupDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
* 小组表: sys_group. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysGroupServiceImpl extends BizService<SysGroup, SysGroupDao> implements SysGroupService {
    @Override
    public List<SysGroup> getChildren(long parentId) {
        SysGroup filter = new SysGroup();
        filter.setIsDelete(0);
        filter.setOrgId(parentId);
        return getList(filter);
    }

    @Override
    public SysGroup getById(long groupId) {
        return get(groupId);
    }

    @Override
    public SysGroup createGroup(SysGroup newGroup) {
        add(newGroup);
        return newGroup;
    }

    @Override
    public SysGroup editGroup(SysGroup editGroup) {
        update(editGroup);
        return editGroup;
    }

    @Override
    public SysGroup deleteGroup(long groupId) {
        SysGroup group = get(groupId);
        delete(groupId);
        return group;
    }
}

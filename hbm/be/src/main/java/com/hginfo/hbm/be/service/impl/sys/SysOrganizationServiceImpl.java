/*
 * Project Name:hbm-be.
 * File Name:SysOrganizationServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.service.sys.SysOrganizationService;
import com.hginfo.hbm.be.dao.sys.SysOrganizationDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

import java.util.List;
import java.util.Map;

/**
* 组织架构表: sys_organization. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysOrganizationServiceImpl extends BizService<SysOrganization, SysOrganizationDao> 
    implements SysOrganizationService {

    @Override
    public SysOrganization getRoot() {
        SysOrganization filter = new SysOrganization();
        filter.setIsDelete(0);
        filter.setFid(0L);

        return getOne(filter);
    }

    @Override
    public List<SysOrganization> getChildren(long parentId) {
        SysOrganization filter = new SysOrganization();
        filter.setIsDelete(0);
        filter.setFid(parentId);

        return getList(filter);
    }

    @Override
    public SysOrganization getById(long id) {
        return get(id);
    }

    @Override
    public SysOrganization createOrganization(SysOrganization newOrg) {
        add(newOrg);
        return newOrg;
    }

    @Override
    public SysOrganization editOrganization(SysOrganization editOrg) {
        update(editOrg);
        return editOrg;
    }

    @Override
    public SysOrganization deleteOrganization(long orgId) {
        SysOrganization org = get(orgId);
        delete(orgId);
        return org;
    }
    
    @Override
    public List<Map<String, Object>> queryOrgUserList() {
        return this.getDao().queryOrgUserList();
    }
}

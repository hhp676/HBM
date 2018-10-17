/*
 * Project Name:hbm-be.
 * File Name:SysOrganizationDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysOrganizationMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 组织架构表: sys_organization. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysOrganizationDao extends SingleKeyBaseDao<SysOrganization> implements SysOrganizationMapper {

    /**
     * 统计部门下有效人员数量.
     * @see com.hginfo.hbm.be.mapper.sys.SysOrganizationMapper#queryOrgUserList()
     */
    @Override
    public List<Map<String, Object>> queryOrgUserList() {
        return this.getSqlSession().getMapper(SysOrganizationMapper.class)
            .queryOrgUserList();
        
    }

}

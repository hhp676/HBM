/*
 * Project Name:hbm-be.
 * File Name:SysUserRoleDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysUserRoleMapper;
import org.springframework.stereotype.Repository;

/**
 *  用户角色表: sys_user_role. <br />
 * dao 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysUserRoleDao extends SingleKeyBaseDao<SysUserRole> implements SysUserRoleMapper {
    @Override
    public Page<SysUserRole> groupPageQuery(BasePage<SysUserRole> pageRequest) {
        return pageQuery("getGroupList", pageRequest);
        
    }
}

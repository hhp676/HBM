/*
 * Project Name:hbm-be.
 * File Name:SysRoleDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysRoleMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统角色表: sys_role. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysRoleDao extends SingleKeyBaseDao<SysRole> implements SysRoleMapper {
    
    @Override
    public List<SysRole> getRolesByAuth(Long authId) {
        return getMapperByType(SysRoleMapper.class).getRolesByAuth(authId);
    }
    
    @Override
    public List<SysRole> getRolesByUser(Long userId) {
        return getMapperByType(SysRoleMapper.class).getRolesByUser(userId);
    }

}

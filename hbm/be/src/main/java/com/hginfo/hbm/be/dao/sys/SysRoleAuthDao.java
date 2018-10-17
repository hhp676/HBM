/*
 * Project Name:hbm-be.
 * File Name:SysRoleAuthDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysRoleAuthMapper;
import org.springframework.stereotype.Repository;

/**
 * 角色权限表: sys_role_auth. <br />
 * dao 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysRoleAuthDao extends SingleKeyBaseDao<SysRoleAuth> implements SysRoleAuthMapper {

    @Override
    public void mybatisDelete(SysRoleAuth filter) {
        getMapperByType(SysRoleAuthMapper.class).mybatisDelete(filter);
    }

}

/**
 * Project Name:hbm-be.
 * File Name:SysRoleMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 系统角色表: sys_role. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysRoleMapper extends BaseSqlMapper {

    /**
     * 获取权限对应角色列表。
     * @author licheng
     * @param authId authId
     * @return 角色列表
     * @since V1.0.0
     */
    List<SysRole> getRolesByAuth(Long authId);
    
    /**
     * 获取用户对应角色列表。
     * @author licheng
     * @param userId userId
     * @return 角色列表
     * @since V1.0.0
     */
    List<SysRole> getRolesByUser(Long userId);
}

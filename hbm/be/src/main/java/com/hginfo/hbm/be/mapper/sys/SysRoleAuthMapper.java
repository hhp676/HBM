/**
 * Project Name:hbm-be.
 * File Name:SysRoleAuthMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 角色权限表: sys_role_auth. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysRoleAuthMapper extends BaseSqlMapper {
    
    /**
     * 使用mybatis的delete。
     * @author licheng
     * @param filter filter
     * @since V1.0.0
     */
    void mybatisDelete(SysRoleAuth filter);
}

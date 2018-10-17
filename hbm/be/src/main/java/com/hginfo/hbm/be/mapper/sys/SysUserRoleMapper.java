/**
 * Project Name:hbm-be.
 * File Name:SysUserRoleMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 *  用户角色表: sys_user_role. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysUserRoleMapper extends BaseSqlMapper {
    /**
     * pageQuery:(聚合查询返回分页数据). <br/>
     * @author yinyanzhen
     * @param pageRequest pageRequest
     * @return Page<SysUserRole>
     * @since V1.0.0
     */
    Page<SysUserRole> groupPageQuery(BasePage<SysUserRole> pageRequest);
}

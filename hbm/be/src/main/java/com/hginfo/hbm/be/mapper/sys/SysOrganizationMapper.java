/*
 * Project Name:hbm-be.
 * File Name:SysOrganizationMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;
import java.util.Map;

import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 组织架构表: sys_organization. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysOrganizationMapper extends BaseSqlMapper {
    /**
     * queryOrgPosUserTotal:(统计部门下有效人员数量). <br/>
     * @author yinyanzhen
     * @return list
     * @since V1.0.0
     */
    List<Map<String, Object>> queryOrgUserList();
}

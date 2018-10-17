/**
 * Project Name:hbm-be.
 * File Name:SysOperationMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 系统操作类型表: sys_operation. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:32 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysOperationMapper extends BaseSqlMapper {
    /**
     * queryOperationCountInAuth:(查询权限表中,该操作类型使用数量). <br/>
     * @author yinyanzhen
     * @return int
     * @since V1.0.0
     */
    int queryOperationCountInAuth(Long operationID);
}

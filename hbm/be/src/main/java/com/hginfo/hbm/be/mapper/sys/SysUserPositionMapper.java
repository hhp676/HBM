/**
 * Project Name:hbm-be.
 * File Name:SysUserPositionMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 用户岗位表: sys_user_position. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysUserPositionMapper extends BaseSqlMapper {
    
    /**
     * 根据用户Id查询用户的职务Id。
     * @param userId 用户Id
     * @return 职务Id
     */
    List<Long> getJobIdListByUserId(long userId);

}

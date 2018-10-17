/**
 * Project Name:hbm-be.
 * File Name:SysStaffInfoMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 员工信息表: sys_staff_info. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysStaffInfoMapper extends BaseSqlMapper {
	SysStaffInfo getByUserId(Long userId);
}

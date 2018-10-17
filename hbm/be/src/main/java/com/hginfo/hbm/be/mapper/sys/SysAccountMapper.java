/**
 * Project Name:hbm-be.
 * File Name:SysAccountMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 登录账号表: sys_account. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:32 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysAccountMapper extends BaseSqlMapper {
	SysAccount getByUserId(Long userId);
}

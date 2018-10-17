/*
 * Project Name:hbm-be.
 * File Name:SysUserLogServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.be.dao.sys.SysUserLogDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 用户操作日志表: sys_user_log. <br />
 * service impl 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysUserLogServiceImpl extends RelService<SysUserLog, SysUserLogDao>
        implements SysUserLogService {

}

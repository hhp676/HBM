/*
 * Project Name:hbm-be.
 * File Name:SysUserLogDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年11月29日 下午2:54:29
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysUserLogMapper;
import org.springframework.stereotype.Repository;

/**
 * 用户操作日志表: sys_user_log. <br />
 * dao 层 <br />
 * Date: 2016年11月29日 下午2:54:29 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysUserLogDao extends SingleKeyBaseDao<SysUserLog> implements SysUserLogMapper {

}

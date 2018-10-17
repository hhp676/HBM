/*
 * Project Name:hbm-be.
 * File Name:SysUserAuthDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysUserAuthMapper;
import org.springframework.stereotype.Repository;

/**
 * 用户权限表: sys_user_auth. <br />
 * dao 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysUserAuthDao extends SingleKeyBaseDao<SysUserAuth> implements SysUserAuthMapper {

}

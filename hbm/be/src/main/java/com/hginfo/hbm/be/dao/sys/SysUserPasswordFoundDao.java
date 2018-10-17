/*
 * Project Name:hbm-be.
 * File Name:SysUserPasswordFoundDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年02月27日 下午6:49:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysUserPasswordFoundMapper;

/**
 * 密码找回表: sys_user_password_found. <br />
 * dao 层 <br />
 * Date: 2017年02月27日 下午6:49:59 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysUserPasswordFoundDao extends SingleKeyBaseDao<SysUserPasswordFound>
        implements SysUserPasswordFoundMapper {

}

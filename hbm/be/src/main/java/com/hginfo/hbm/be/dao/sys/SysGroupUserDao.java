/*
 * Project Name:hbm-be.
 * File Name:SysGroupUserDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysGroupUserMapper;
import org.springframework.stereotype.Repository;

/**
 * 小组用户表: sys_group_user. <br />
 * dao 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysGroupUserDao extends SingleKeyBaseDao<SysGroupUser> implements SysGroupUserMapper {

}

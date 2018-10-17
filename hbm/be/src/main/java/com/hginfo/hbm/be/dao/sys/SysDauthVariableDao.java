/*
 * Project Name:hbm-be.
 * File Name:SysDauthVariableDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年01月10日 上午10:58:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthVariable;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthVariableMapper;
import org.springframework.stereotype.Repository;

/**
 * 数据权限变量表: sys_dauth_variable. <br />
 * dao 层 <br />
 * Date: 2017年01月10日 上午10:58:32 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthVariableDao extends SingleKeyBaseDao<SysDauthVariable> implements SysDauthVariableMapper {

}

/*
 * Project Name:hbm-be.
 * File Name:SysVariableDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年08月15日 下午7:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.SysVariable;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysVariableMapper;

/**
 * 系统变量：K-V类型。: sys_variable. <br />
 * dao 层 <br />
 * Date: 2017年08月15日 下午7:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysVariableDao extends SingleKeyBaseDao<SysVariable>
        implements SysVariableMapper {

}

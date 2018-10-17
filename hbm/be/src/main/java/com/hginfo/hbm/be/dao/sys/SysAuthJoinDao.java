/*
 * Project Name:hbm-be.
 * File Name:SysAuthJoinDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年03月09日 下午3:26:46
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysAuthJoin;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysAuthJoinMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统权限关联表: sys_auth_join. <br />
 * dao 层 <br />
 * Date: 2017年03月09日 下午3:26:46 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysAuthJoinDao extends SingleKeyBaseDao<SysAuthJoin>
        implements SysAuthJoinMapper {

}

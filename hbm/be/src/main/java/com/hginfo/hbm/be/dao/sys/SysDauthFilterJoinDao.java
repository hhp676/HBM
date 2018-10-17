/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterJoinDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年01月14日 下午4:34:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterJoin;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthFilterJoinMapper;
import org.springframework.stereotype.Repository;

/**
 * 数据权限过滤器关联: sys_dauth_filter_join. <br />
 * dao 层 <br />
 * Date: 2017年01月14日 下午4:34:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthFilterJoinDao extends SingleKeyBaseDao<SysDauthFilterJoin>
        implements SysDauthFilterJoinMapper {

}

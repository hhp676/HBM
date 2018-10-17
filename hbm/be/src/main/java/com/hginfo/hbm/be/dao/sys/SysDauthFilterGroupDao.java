/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterGroupDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年01月13日 下午3:52:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterGroup;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthFilterGroupMapper;
import org.springframework.stereotype.Repository;

/**
 * 数据权限过滤器组: sys_dauth_filter_group. <br />
 * dao 层 <br />
 * Date: 2017年01月13日 下午3:52:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthFilterGroupDao extends SingleKeyBaseDao<SysDauthFilterGroup>
        implements SysDauthFilterGroupMapper {

}

/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterTypeDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月22日 下午5:39:08
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterType;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthFilterTypeMapper;
import org.springframework.stereotype.Repository;

/**
 * 数据权限过滤类型表: sys_dauth_filter_type. <br />
 * dao 层 <br />
 * Date: 2016年12月22日 下午5:39:08 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthFilterTypeDao extends SingleKeyBaseDao<SysDauthFilterType> implements SysDauthFilterTypeMapper {

}

/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterItemDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月30日 上午9:41:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterItem;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthFilterItemMapper;
import org.springframework.stereotype.Repository;

/**
 * 数据权限过滤器项: sys_dauth_filter_item. <br />
 * dao 层 <br />
 * Date: 2016年12月30日 上午9:41:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthFilterItemDao extends SingleKeyBaseDao<SysDauthFilterItem>
        implements SysDauthFilterItemMapper {

}

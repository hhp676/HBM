/*
 * Project Name:hbm-be.
 * File Name:SysIconDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysIconMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统图标表: sys_icon. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysIconDao extends SingleKeyBaseDao<SysIcon> implements SysIconMapper {

}

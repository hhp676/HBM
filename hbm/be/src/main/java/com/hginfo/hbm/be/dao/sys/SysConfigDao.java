/*
 * Project Name:hbm-be.
 * File Name:SysConfigDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:03
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysConfig;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysConfigMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统设置表: sys_config. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:03 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysConfigDao extends SingleKeyBaseDao<SysConfig> implements SysConfigMapper {

}

/*
 * Project Name:hbm-be.
 * File Name:SysDictGroupDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:31:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDictGroup;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDictGroupMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统字典组表: sys_dict_group. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:31:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysDictGroupDao extends SingleKeyBaseDao<SysDictGroup> implements SysDictGroupMapper {

}

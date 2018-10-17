/*
 * Project Name:hbm-be.
 * File Name:SysMetaConstraintDetailDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年05月08日 下午3:55:58
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDetail;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysMetaConstraintDetailMapper;

/**
 * 约束字段表: sys_meta_constraint_detail. <br />
 * dao 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysMetaConstraintDetailDao extends SingleKeyBaseDao<SysMetaConstraintDetail>
        implements SysMetaConstraintDetailMapper {

}

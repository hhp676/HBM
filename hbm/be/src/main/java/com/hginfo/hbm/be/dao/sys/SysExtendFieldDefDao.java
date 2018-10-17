/*
 * Project Name:hbm-be.
 * File Name:SysExtendFieldDefDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysExtendFieldDef;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysExtendFieldDefMapper;
import org.springframework.stereotype.Repository;

/**
 * 扩展字段定义表: sys_extend_field_def. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysExtendFieldDefDao extends SingleKeyBaseDao<SysExtendFieldDef> implements SysExtendFieldDefMapper {

}

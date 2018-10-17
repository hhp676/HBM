/*
 * Project Name:hbm-be.
 * File Name:SysExtendFieldDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysExtendField;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysExtendFieldMapper;
import org.springframework.stereotype.Repository;

/**
 * 扩展字段表: sys_extend_field. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysExtendFieldDao extends SingleKeyBaseDao<SysExtendField> implements SysExtendFieldMapper {

}

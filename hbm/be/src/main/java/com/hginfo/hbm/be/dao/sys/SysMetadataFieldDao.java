/*
 * Project Name:hbm-be.
 * File Name:SysMetadataFieldDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysMetadataField;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysMetadataFieldMapper;
import org.springframework.stereotype.Repository;

/**
 * 元数据字段表: sys_metadata_field. <br />
 * dao 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysMetadataFieldDao extends SingleKeyBaseDao<SysMetadataField> implements SysMetadataFieldMapper {

}

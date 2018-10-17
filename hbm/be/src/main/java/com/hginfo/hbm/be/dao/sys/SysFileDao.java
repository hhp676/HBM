/*
 * Project Name:hbm-be.
 * File Name:SysFileDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年11月29日 下午2:54:28
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysFile;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysFileMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统文件表: sys_file. <br />
 * dao 层 <br />
 * Date: 2016年11月29日 下午2:54:28 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysFileDao extends SingleKeyBaseDao<SysFile> implements SysFileMapper {

}

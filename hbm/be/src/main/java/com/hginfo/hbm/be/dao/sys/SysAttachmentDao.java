/*
 * Project Name:hbm-be.
 * File Name:SysAttachmentDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:03
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysAttachment;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysAttachmentMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统附件表: sys_attachment. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:03 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysAttachmentDao extends SingleKeyBaseDao<SysAttachment> implements SysAttachmentMapper {

}

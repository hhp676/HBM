/*
 * Project Name:hbm-be.
 * File Name:SysNoticeDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.SysNotice;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysNoticeMapper;

/**
 * 通知公告: sys_notice. <br />
 * dao 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Repository
public class SysNoticeDao extends SingleKeyBaseDao<SysNotice>
        implements SysNoticeMapper {

}

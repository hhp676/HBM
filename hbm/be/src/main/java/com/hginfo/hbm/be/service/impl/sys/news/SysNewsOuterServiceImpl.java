/*
 * Project Name:hbm-be.
 * File Name:SysNewsOuterServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.news;

import com.hginfo.hbm.base.entity.sys.news.SysNewsOuter;
import com.hginfo.hbm.base.service.sys.news.SysNewsOuterService;
import com.hginfo.hbm.be.dao.sys.news.SysNewsOuterDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 外部消息详情: sys_news_outer. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysNewsOuterServiceImpl extends BizService<SysNewsOuter, SysNewsOuterDao>
        implements SysNewsOuterService {

}

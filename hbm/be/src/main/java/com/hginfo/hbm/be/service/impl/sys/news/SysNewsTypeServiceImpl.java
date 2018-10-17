/*
 * Project Name:hbm-be.
 * File Name:SysNewsTypeServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.news;

import com.hginfo.hbm.base.entity.sys.news.SysNewsType;
import com.hginfo.hbm.base.service.sys.news.SysNewsTypeService;
import com.hginfo.hbm.be.dao.sys.news.SysNewsTypeDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 消息类型表: sys_news_type. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysNewsTypeServiceImpl extends BizService<SysNewsType, SysNewsTypeDao>
        implements SysNewsTypeService {

}

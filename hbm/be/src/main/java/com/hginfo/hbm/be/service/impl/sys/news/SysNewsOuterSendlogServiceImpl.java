/*
 * Project Name:hbm-be.
 * File Name:SysNewsOuterSendlogServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.news;

import com.hginfo.hbm.base.entity.sys.news.SysNewsOuterSendlog;
import com.hginfo.hbm.base.service.sys.news.SysNewsOuterSendlogService;
import com.hginfo.hbm.be.dao.sys.news.SysNewsOuterSendlogDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 外部消息发送日志: sys_news_outer_sendlog. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysNewsOuterSendlogServiceImpl extends BizService<SysNewsOuterSendlog, SysNewsOuterSendlogDao>
        implements SysNewsOuterSendlogService {

}

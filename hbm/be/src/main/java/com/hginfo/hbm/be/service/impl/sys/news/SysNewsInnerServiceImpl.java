/*
 * Project Name:hbm-be.
 * File Name:SysNewsInnerServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.news;

import com.hginfo.hbm.base.entity.sys.news.SysNewsInner;
import com.hginfo.hbm.base.service.sys.news.SysNewsInnerService;
import com.hginfo.hbm.be.dao.sys.news.SysNewsInnerDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 内部消息详情: sys_news_inner. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysNewsInnerServiceImpl extends BizService<SysNewsInner, SysNewsInnerDao>
        implements SysNewsInnerService {
    @Override
    public SysNewsInner get(Long primaryKey, String... loadProps) {
        return super.get(primaryKey, loadProps);
        
    }
}

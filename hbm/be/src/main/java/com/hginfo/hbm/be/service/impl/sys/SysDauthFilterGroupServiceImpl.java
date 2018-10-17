/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterGroupServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年01月13日 下午3:52:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterGroup;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthFilterGroupService;
import com.hginfo.hbm.be.dao.sys.SysDauthFilterGroupDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限过滤器组: sys_dauth_filter_group. <br />
 * service impl 层 <br />
 * Date: 2017年01月13日 下午3:52:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthFilterGroupServiceImpl extends BizService<SysDauthFilterGroup, SysDauthFilterGroupDao>
        implements SysDauthFilterGroupService {

    @Override
    public Page<SysDauthFilterGroup> getPageList(BasePage<SysDauthFilterGroup> basePage,
        SysDauthFilterGroup filter) {
        
        SysDauthFilterGroup realFilter = filter == null ? new SysDauthFilterGroup() : filter;
        realFilter.setIsDelete(0);
        
        return super.getPageList(basePage, filter);
    }
}

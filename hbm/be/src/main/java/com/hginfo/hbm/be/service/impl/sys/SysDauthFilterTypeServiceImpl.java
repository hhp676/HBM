/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterTypeServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterType;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthFilterTypeService;
import com.hginfo.hbm.be.dao.sys.SysDauthFilterTypeDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限过滤类型表: sys_dauth_filter_type. <br />
 * service impl 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthFilterTypeServiceImpl extends BizService<SysDauthFilterType, SysDauthFilterTypeDao> 
    implements SysDauthFilterTypeService {

    @Override
    public Page<SysDauthFilterType> getPageList(BasePage<SysDauthFilterType> basePage,
        SysDauthFilterType filter, final String... loadProps) {
        SysDauthFilterType realFilter = filter == null ? new SysDauthFilterType() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, realFilter);
        
    }
}

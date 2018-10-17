/*
 * Project Name:hbm-be.
 * File Name:SysDauthVariableServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年01月10日 上午10:58:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthVariable;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthVariableService;
import com.hginfo.hbm.be.dao.sys.SysDauthVariableDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限变量表: sys_dauth_variable. <br />
 * service impl 层 <br />
 * Date: 2017年01月10日 上午10:58:32 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthVariableServiceImpl extends BizService<SysDauthVariable, SysDauthVariableDao>
        implements SysDauthVariableService {

    @Override
    public Page<SysDauthVariable> getPageList(BasePage<SysDauthVariable> basePage,
        SysDauthVariable filter) {
        
        SysDauthVariable realFilter = filter == null ? new SysDauthVariable() : filter;
        realFilter.setIsDelete(0);
        
        return super.getPageList(basePage, filter);
        
    }
}

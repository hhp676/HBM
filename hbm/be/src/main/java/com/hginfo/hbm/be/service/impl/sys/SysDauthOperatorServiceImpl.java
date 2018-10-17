/*
 * Project Name:hbm-be.
 * File Name:SysDauthOperatorServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthOperator;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthOperatorService;
import com.hginfo.hbm.be.dao.sys.SysDauthOperatorDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限运算符表: sys_dauth_operator. <br />
 * service impl 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthOperatorServiceImpl extends BizService<SysDauthOperator, SysDauthOperatorDao> 
    implements SysDauthOperatorService {

    @Override
    public Page<SysDauthOperator> getPageList(BasePage<SysDauthOperator> basePage,
        SysDauthOperator filter, final String... loadProps) {
        SysDauthOperator realFilter = filter == null ? new SysDauthOperator() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, realFilter);
        
    }
    
    /**
     * 根据过滤类型获取支持的运算符。
     * @param filterTypeId 
     * @return 运算符。
     */
    public List<SysDauthOperator> getDauthOperators(long filterTypeId) {
        return getDao().getDauthOperators(filterTypeId);
    }
}

/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterJoinServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年01月14日 下午4:34:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterJoin;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthFilterJoinService;
import com.hginfo.hbm.be.dao.sys.SysDauthFilterJoinDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限过滤器关联: sys_dauth_filter_join. <br />
 * service impl 层 <br />
 * Date: 2017年01月14日 下午4:34:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthFilterJoinServiceImpl extends BizService<SysDauthFilterJoin, SysDauthFilterJoinDao>
        implements SysDauthFilterJoinService {
    
    /**
     * 
     */
    @Autowired
    private SysDauthFilterItemServiceImpl sysDauthFilterItemServiceImpl;
    
    
    @Override
    public List<SysDauthFilterJoin> getList(SysDauthFilterJoin filter) {
        List<SysDauthFilterJoin> joinList = super.getList(filter);
        for (SysDauthFilterJoin join : joinList) {
            if (join.getSysDauthFilterItem() != null) {
                sysDauthFilterItemServiceImpl.convertBean(join.getSysDauthFilterItem());
            }
        }
        return joinList;
    }

    @Override
    public Page<SysDauthFilterJoin> getPageList(BasePage<SysDauthFilterJoin> basePage,
        SysDauthFilterJoin filter) {
        
        SysDauthFilterJoin realFilter = filter == null ? new SysDauthFilterJoin() : filter;
        realFilter.setIsDelete(0);
        
        Page<SysDauthFilterJoin> page = super.getPageList(basePage, filter);
        List<SysDauthFilterJoin> joinList = page.getResult();
        for (SysDauthFilterJoin join : joinList) {
            if (join.getSysDauthFilterItem() != null) {
                sysDauthFilterItemServiceImpl.convertBean(join.getSysDauthFilterItem());
            }
        }
        return page;
    }

	@Override
	public Page<SysDauthFilterJoin> getWinPageList(BasePage<SysDauthFilterJoin> basePage,
		SysDauthFilterJoin filter) {
		
		SysDauthFilterJoin realFilter = filter == null ? new SysDauthFilterJoin() : filter;
        realFilter.setIsDelete(0);
        
        basePage.setFilters(realFilter);
        Page<SysDauthFilterJoin> page = getDao().pageQuery("getWinList", basePage);
        List<SysDauthFilterJoin> joinList = page.getResult();
        for (SysDauthFilterJoin join : joinList) {
            if (join.getSysDauthFilterItem() != null) {
                sysDauthFilterItemServiceImpl.convertBean(join.getSysDauthFilterItem());
            }
        }
        return page;
	}
}

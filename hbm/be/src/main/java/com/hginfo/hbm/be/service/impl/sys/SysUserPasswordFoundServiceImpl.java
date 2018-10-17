/*
 * Project Name:hbm-be.
 * File Name:SysUserPasswordFoundServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年02月27日 下午6:49:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hbm.be.dao.sys.SysUserPasswordFoundDao;
import com.hginfo.hbm.be.service.base.BizService;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysUserPasswordFoundService;

/**
 * 密码找回表: sys_user_password_found. <br />
 * service impl 层 <br />
 * Date: 2017年02月27日 下午6:49:59 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysUserPasswordFoundServiceImpl extends BizService<SysUserPasswordFound, SysUserPasswordFoundDao>
        implements SysUserPasswordFoundService {

    @Override
    public List<SysUserPasswordFound> getList(SysUserPasswordFound filter) {
        SysUserPasswordFound realFilter = filter == null ? new SysUserPasswordFound() : filter;
        realFilter.setIsDelete(0);
        return super.getList(realFilter);
    }

    
    @Override
    public void add(SysUserPasswordFound entity) {
        super.add(entity);
    }
   
}

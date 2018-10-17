/*
 * Project Name:hbm-base.
 * File Name:SysUserPasswordFoundService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年02月27日 下午6:49:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 密码找回表: sys_user_password_found. <br />
 * service interface 层 <br />
 * Date: 2017年02月27日 下午6:49:59 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysUserPasswordFoundService {

    /**
     * 返回list.
     * @param filter filter
     * @return page result
     */
    List<SysUserPasswordFound> getList(SysUserPasswordFound filter);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SysUserPasswordFound entity);

}

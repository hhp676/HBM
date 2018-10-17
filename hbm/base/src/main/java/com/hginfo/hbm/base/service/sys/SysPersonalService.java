/*
 * Project Name:hbm-base.
 * File Name:SysDictService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月1日 下午6:50:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysDictGroup;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hutils.exception.BaseException;

import java.util.List;

/**
 * 个人中心Service。 <br />
 * service interface 层 <br />
 * @author yuyanlin
 */
public interface SysPersonalService {
    /**
     * getLoginUserInfo:(获取登录用户信息). <br/>
     * @author yinyanzhen
     * @return SysUser
     * @since V1.0.0
     */
    SysUser getLoginUserInfo();
    
    /**
     * getLoginUserStaffInfo:(获取登录用户扩展信息). <br/>
     * @author yinyanzhen
     * @return SysStaffInfo
     * @since V1.0.0
     */
    SysStaffInfo getLoginUserStaffInfo();
    
    /**
     * editLoginUser:(修改登录用户信息). <br/>
     * @author yinyanzhen
     * @param user user
     * @return SysUser
     * @since V1.0.0
     */
    SysUser editLoginUser(SysUser user);
    
    /**
     * updatePwd:(修改登录用户密码). <br/>
     * @author yinyanzhen
     * @param oldPwd oldPwd
     * @param newPwd newPwd
     * @since V1.0.0
     */
    void updatePwd(String oldPwd, String newPwd);
}

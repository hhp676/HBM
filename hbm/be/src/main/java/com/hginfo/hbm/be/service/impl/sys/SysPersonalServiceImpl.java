/*
 * Project Name:hbm-base.
 * File Name:SysDitServiceImpl.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月1日 下午6:50:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.service.sys.SysPersonalService;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.SecurityLevelUtil;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.exception.BaseException;
import com.hginfo.hutils.exception.BaseRuntimeException;

import com.hginfo.hutils.password.CheckResult;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 个人中心Service。 <br />
 * service impl 层 <br />
 * @author yuyanlin
 * @since V1.0.0
 */
@HService
public class SysPersonalServiceImpl implements SysPersonalService {
    
    @Autowired
    private SysUserServiceImpl      sysUserService;
    @Autowired
    private SysStaffInfoServiceImpl sysStaffInfoService;
    @Autowired
    private SysAccountServiceImpl   sysAccountService;
    
    @Override
    public SysUser getLoginUserInfo() {
        SysUser loginUser = sysUserService.get(CurrentUserUtils.getUserId());
        return loginUser;
    }
    
    @Override
    public SysStaffInfo getLoginUserStaffInfo() {
        SysStaffInfo staffInfo = sysStaffInfoService.getByUserId(CurrentUserUtils.getUserId());
        return staffInfo;
    }
    
    @Override
    public SysUser editLoginUser(SysUser user) {
        user.setUserId(CurrentUserUtils.getUserId());
        sysUserService.update(user);
        return user;
    }
    
    @Override
    public void updatePwd(String oldPwd, String newPwd) {
        SysAccount account = sysAccountService.getByUserId(CurrentUserUtils.getUserId());
        CheckResult checkResult = SecurityLevelUtil.checkPassword(account.getLoginName(),newPwd);
        if (!checkResult.isValid()){
            throw new BaseRuntimeException(checkResult.getMsg());
        }
        String encryptPassword = sysAccountService.encryptPassword(oldPwd, account.getLoginName());
        if (!encryptPassword.equals(account.getLoginPwd())) {
            throw new BaseRuntimeException("旧密码错误");
        }
        SysAccount updateVo = new SysAccount();
        String newEncryptpwd = sysAccountService.encryptPassword(newPwd, account.getLoginName());
        updateVo.setLoginPwd(newEncryptpwd);
        updateVo.setAccountId(account.getAccountId());
        sysAccountService.update(updateVo);
        
    }
    
}

/*
 * Project Name:hbm-be.
 * File Name:SysUserAuthServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.util.Assert;

import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.service.sys.SysUserAuthService;
import com.hginfo.hbm.be.dao.sys.SysUserAuthDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.CollectionsUtil;

/**
 * 用户权限表: sys_user_auth. <br />
 * service impl 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author yuqing
 * @since V1.0.0
 */
@HService
public class SysUserAuthServiceImpl extends RelService<SysUserAuth, SysUserAuthDao>
    implements SysUserAuthService {
    
    @Override
    public void addBatch(Long authId, Long[] userIds, Integer authType) {
        Assert.notNull(authId);
        Assert.notNull(userIds);
        Assert.notNull(authType);
        SysUserAuth filter = new SysUserAuth();
        filter.setAuthId(authId);
        filter.setAuthType(authType);
        List<SysUserAuth> existingUsers = this.getList(filter);
        
        List<Long> userList = Arrays.asList(userIds);
        List<Long> existingUserList = existingUsers.stream().map(o -> o.getUserId())
            .collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(userList, existingUserList);
        
        for (Long userId : addList) {
            if(userId != null){
                
                SysUserAuth sysUserAuth = new SysUserAuth();
                sysUserAuth.setAuthId(authId);
                sysUserAuth.setUserId(userId);
                sysUserAuth.setAuthType(authType);
                sysUserAuth.setIsFinal(Constants.ZERO);
                super.add(sysUserAuth);
            }
        }
    }
    
    @Override
    public void deleteBatch(Long authId, Long[] userIds, Integer authType) {
        Assert.notNull(authId);
        Assert.notNull(userIds);
        for (Long userId : userIds) {
            if(userId != null){
                
                SysUserAuth sysUserAuth = new SysUserAuth();
                sysUserAuth.setAuthId(authId);
                sysUserAuth.setUserId(userId);
                sysUserAuth.setAuthType(authType);
                this.deleteBatch(sysUserAuth);
            }
        }
    }
    
    @Override
    public void doRefresh(Long userId, Long[] authIds, Integer authType) {
        
        SysUserAuth filter = new SysUserAuth();
        filter.setUserId(userId);
        filter.setAuthType(authType);
        List<SysUserAuth> existingAuths = super.getList(filter);
        
        List<Long> authList = Arrays.asList(authIds);
        List<Long> existingAuthIds = existingAuths.stream().map(o -> o.getAuthId())
            .collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(authList, existingAuthIds);
        List<Long> subList = CollectionsUtil.subtract(existingAuthIds, authList);
        
        for (Long authId : addList) {
            if (authId == null) {
                continue;
            }
            SysUserAuth sysUserAuth = new SysUserAuth();
            sysUserAuth.setUserId(userId);
            sysUserAuth.setAuthId(authId);
            sysUserAuth.setIsFinal(Constants.ZERO);
            sysUserAuth.setAuthType(authType);
            this.add(sysUserAuth);
        }
        
        for (Long authId : subList) {
            if (authId == null) {
                continue;
            }
            SysUserAuth sysUserAuth = new SysUserAuth();
            sysUserAuth.setUserId(userId);
            sysUserAuth.setAuthId(authId);
            sysUserAuth.setAuthType(authType);
            this.deleteBatch(sysUserAuth);
        }
        
    }
    
}

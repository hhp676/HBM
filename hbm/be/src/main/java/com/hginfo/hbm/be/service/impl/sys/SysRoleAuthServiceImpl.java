
/**
* Project Name:hbm-be.
* File Name:SysRoleAuthServiceImpl.java
* Package Name:com.hginfo.hbm.be.service.impl.sys
* Date:2016年11月29日 下午3:43:44
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.be.service.impl.sys;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.util.Assert;

import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.base.service.sys.SysRoleAuthService;
import com.hginfo.hbm.be.dao.sys.SysRoleAuthDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.CollectionsUtil;

/**
* 角色权限表: sys_role_auth. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysRoleAuthServiceImpl extends RelService<SysRoleAuth, SysRoleAuthDao>
    implements SysRoleAuthService {
    
    @Override
    public void doRefresh(Long roleId, Long[] authIds) {
        
        SysRoleAuth filter = new SysRoleAuth();
        filter.setRoleId(roleId);
        List<SysRoleAuth> existingAuths = super.getList(filter);
        
        List<Long> authList = Arrays.asList(authIds);
        List<Long> existingAuthIds = existingAuths.stream().map(o -> o.getAuthId())
            .collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(authList, existingAuthIds);
        List<Long> subList = CollectionsUtil.subtract(existingAuthIds, authList);
        
        for (Long authId : addList) {
            SysRoleAuth sysRoleAuth = new SysRoleAuth();
            sysRoleAuth.setRoleId(roleId);
            sysRoleAuth.setAuthId(authId);
            sysRoleAuth.setIsFinal(Constants.ZERO);
            super.add(sysRoleAuth);
        }
        
        for (Long authId : subList) {
            SysRoleAuth sysRoleAuth = new SysRoleAuth();
            sysRoleAuth.setRoleId(roleId);
            sysRoleAuth.setAuthId(authId);
            this.deleteBatch(sysRoleAuth);
        }
    }
    
    @Override
    public void deleteByRole(Long roleId) {
        SysRoleAuth filter = new SysRoleAuth();
        filter.setRoleId(roleId);
        this.deleteBatch(filter);
    }

    @Override
    public Map<String, Integer> addBatch(Long authId, Long[] roleIds) {
        Assert.notNull(authId);
        Assert.notNull(roleIds);
        SysRoleAuth filter = new SysRoleAuth();
        filter.setAuthId(authId);
        List<SysRoleAuth> existingUsers = this.getList(filter);
        
        List<Long> userList = Arrays.asList(roleIds);
        List<Long> existingUserList = existingUsers.stream().map(o -> o.getRoleId())
            .collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(userList, existingUserList);
        
        for (Long roleId : addList) {
            if(roleId != null ){
                
                SysRoleAuth sysRoleAuth = new SysRoleAuth();
                sysRoleAuth.setAuthId(authId);
                sysRoleAuth.setRoleId(roleId);
                sysRoleAuth.setIsFinal(Constants.ZERO);
                super.add(sysRoleAuth);
            }
        }
        
        Map<String, Integer> returnMap = new HashMap();
        returnMap.put("total", userList.size());
        returnMap.put("existCount", userList.size() - addList.size());
        returnMap.put("addCount", addList.size());
        return returnMap;
    }

    @Override
    public void deleteBatch(Long authId, Long[] roleIds) {
        Assert.notNull(authId);
        Assert.notNull(roleIds);
        for (Long roleId : roleIds) {
            if(roleId != null ){
                SysRoleAuth sysRoleAuth = new SysRoleAuth();
                sysRoleAuth.setAuthId(authId);
                sysRoleAuth.setRoleId(roleId);
                this.deleteBatch(sysRoleAuth);
            }
        }
    }
    
}

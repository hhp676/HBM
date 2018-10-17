/**
 * Project Name:hbm-be
 * File Name:SysAccountServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月18日下午5:03:57
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hbm.be.dao.sys.SysAccountDao;
import com.hginfo.hbm.be.dao.sys.SysStaffInfoDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.encrypt.DigestUtils;

/**
 * SysAccountServiceImpl.
 * ClassName:SysAccountServiceImpl <br/>
 * Date: 2016年11月18日 下午5:03:57 <br/>
 * @author licheng
 * @since V1.0.0
 */
@HService
public class SysAccountServiceImpl extends BizService<SysAccount, SysAccountDao>
    implements SysAccountService {
    @Autowired
    private SysStaffInfoDao staffInfoDao;
    
    @Autowired
    private SysUserRoleServiceImpl sysUserRoleServiceImpl;
    
    /**
     * 
     */
    private static final Log LOG = LogFactory.getLog(SysAccountService.class);
    
    @Override
    public SysAccount findUserByLoginName(String loginName) {
        
        Assert.notNull(loginName);
        SysAccount queryAccount = this.getNewEntity();
        queryAccount.setLoginName(loginName);
        //查询登录账户表
        SysAccount sysAccount = getDao().selectOne(queryAccount);
        //查询人员信息表
        SysStaffInfo staffInfo = staffInfoDao.getByUserId(sysAccount.getUserId());
        //账户信息已被删除或着附属信息被删除时,该账户无效
        if (sysAccount.getIsDelete() == 1 
            || staffInfo.getIsDelete() == 1 || staffInfo.getStaffStatus() == 0) {
            sysAccount = null;
        }
        return sysAccount;
    }
    
    @Override
    public boolean isSuperAdmin(Long userId) {
        
        SysUserRole filter = new SysUserRole();
        filter.setUserId(userId);
        List<SysUserRole> existingList = sysUserRoleServiceImpl.getList(filter);

        return existingList.stream().map(SysUserRole::getRoleId)
            .collect(Collectors.toList()).contains(Constants.SUPER_ROLE_ID);
    }
    
    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash.
     */
    @Override
    public String encryptPassword(String plainPwd, String salt) {
        Assert.notNull(salt);
        plainPwd = String.valueOf(plainPwd);
        byte[] saltByte = salt.getBytes();
        byte[] hashPassword = DigestUtils.sha1(plainPwd.getBytes(), saltByte, HASH_INTERATIONS);
        return Hex.encodeHexString(hashPassword);
    }
    
    @Override
    public SysAccount getByUserId(Long userId) {
        SysAccount queryVo = this.getNewEntity();
        queryVo.setUserId(userId);
        return getDao().selectOne(queryVo);
    }
    
    @Override
    public void updateLogin(SysAccount sysAccount) {
        this.getDao().update(sysAccount);
    }
    
}

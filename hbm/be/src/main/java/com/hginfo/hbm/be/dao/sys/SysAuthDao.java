/*
 * Project Name:hbm-be.
 * File Name:SysAuthDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年11月29日 下午2:54:28
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysAuthMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统权限表: sys_auth. <br />
 * dao 层 <br />
 * Date: 2016年11月29日 下午2:54:28 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysAuthDao extends SingleKeyBaseDao<SysAuth> implements SysAuthMapper {
    
    @Override
    public List<SysAuth> getAllSysAuthByUserId(Integer type, long userid) {
        return getMapperByType(SysAuthMapper.class).getAllSysAuthByUserId(type, userid);
    }
    
    @Override
    public List<SysAuth> getAllSysAuthAndModel(Integer category) {
        return getMapperByType(SysAuthMapper.class).getAllSysAuthAndModel(category);
        
    }
    
    @Override
    public Integer getEqAndContainCode(SysAuth sysAuth) {
        return getMapperByType(SysAuthMapper.class).getEqAndContainCode(sysAuth);
    }
    
    @Override
    public Integer getEqAndContainURI(SysAuth sysAuth) {
        return getMapperByType(SysAuthMapper.class).getEqAndContainURI(sysAuth);
    }
    
    @Override
    public Integer checkAuthRelation(Long authId) {
        return getMapperByType(SysAuthMapper.class).checkAuthRelation(authId);
    }
    
    @Override
    public List<SysAuth> getAuthsByRoles(Long[] roleIds) {
        return getMapperByType(SysAuthMapper.class).getAuthsByRoles(roleIds);
    }
    
    @Override
    public List<SysAuth> getAuthsByUser(SysUserAuth filter) {
        return getMapperByType(SysAuthMapper.class).getAuthsByUser(filter);
    }
    
    @Override
    public List<SysAuth> getPreUriList(SysAuth sysAuth) {
        return getMapperByType(SysAuthMapper.class).getPreUriList(sysAuth);
    }
    
    @Override
    public List<SysAuth> queryUserAuths(Long userID) {
        return getMapperByType(SysAuthMapper.class).queryUserAuths(userID);
    }
    
}

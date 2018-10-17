/*
 * Project Name:hbm-be.
 * File Name:SysUserDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年11月29日 下午2:54:28
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysUserMapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 用户表: sys_user. <br />
 * dao 层 <br />
 * Date: 2016年11月29日 下午2:54:28 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysUserDao extends SingleKeyBaseDao<SysUser> implements SysUserMapper {
    
    /***
     * 根据用户名称获取用户信息。
     * @param userName userName
     * @return SysUser SysUser
     */
    public SysUser getUserByLoginName(String userName) {
        return getMapperByType(SysUserMapper.class).getUserByLoginName(userName);
    }
    
    /**
     * 聚合查询入职时间 .
     * @see com.hginfo.hbm.be.mapper.sys.SysUserMapper#getUserEntryGroup(java.util.Map)
     */
    @Override
    public List<Map<String, Object>> getUserEntryGroup(Map vo) {
        return this.getSqlSession().getMapper(SysUserMapper.class).getUserEntryGroup(vo);
        
    }
    
    /**
     * 聚合查询离职时间 .
     * @see com.hginfo.hbm.be.mapper.sys.SysUserMapper#getUserQuitGroup(java.util.Map)
     */
    @Override
    public List<Map<String, Object>> getUserQuitGroup(Map vo) {
        return this.getSqlSession().getMapper(SysUserMapper.class).getUserQuitGroup(vo);
        
    }

}

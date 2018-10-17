/*
 * Project Name:hbm-be.
 * File Name:SysModelDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysModelMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统模块表: sys_model. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysModelDao extends SingleKeyBaseDao<SysModel> implements SysModelMapper {
    
    @Override
    public SysModel getTopModel(SysModel sysModel) {
        return getMapperByType(SysModelMapper.class).getTopModel(sysModel);
    }
    
    @Override
    public List<SysModel> getSubMenu(SysModel sysModel) {
        return getMapperByType(SysModelMapper.class).getSubMenu(sysModel);
    }
    
    @Override
    public Integer getEqAndContainCode(SysModel sysModel) {
        return getMapperByType(SysModelMapper.class).getEqAndContainCode(sysModel);
    }
    
    @Override
    public Integer getEqAndContainURI(SysModel sysModel) {
        return getMapperByType(SysModelMapper.class).getEqAndContainURI(sysModel);
    }
    
    @Override
    public List<SysAuth> getPreUriList(SysModel sysModel) {
        return getMapperByType(SysModelMapper.class).getPreUriList(sysModel);
        
    }
    
}

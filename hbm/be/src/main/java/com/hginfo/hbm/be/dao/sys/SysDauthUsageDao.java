/*
 * Project Name:hbm-be.
 * File Name:SysDauthUsageDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年01月19日 上午11:51:19
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthUsage;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthUsageMapper;
import org.springframework.stereotype.Repository;

/**
 * 数据权限应用表: sys_dauth_usage. <br />
 * dao 层 <br />
 * Date: 2017年01月19日 上午11:51:19 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthUsageDao extends SingleKeyBaseDao<SysDauthUsage> implements SysDauthUsageMapper {

    @Override
    public SysDauthUsage getDauthUsage(String methodName) {
        return getMapperByType(SysDauthUsageMapper.class).getDauthUsage(methodName);
    }
    
    @Override
    public String getDauthCodeByMethodName(String methodName) {
        return getMapperByType(SysDauthUsageMapper.class).getDauthCodeByMethodName(methodName);
    }
    
    @Override
    public void setAllInvalid() {
        getMapperByType(SysDauthUsageMapper.class).setAllInvalid();
    }

}

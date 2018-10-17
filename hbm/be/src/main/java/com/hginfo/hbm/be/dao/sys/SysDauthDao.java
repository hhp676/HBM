/*
 * Project Name:hbm-be.
 * File Name:SysDauthDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年01月12日 下午6:28:35
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauth;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.dauth.bean.DauthFilterGroupBean;
import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.be.mapper.sys.SysDauthMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 数据权限表: sys_dauth. <br />
 * dao 层 <br />
 * Date: 2017年01月12日 下午6:28:35 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthDao extends SingleKeyBaseDao<SysDauth> implements SysDauthMapper {
    
    @Override
    public List<DauthFilterItemBean> getDauthFilterItemList(long filterGroupId) {
        return getMapperByType(SysDauthMapper.class).getDauthFilterItemList(filterGroupId);
    }
    
    @Override
    public List<DauthFilterGroupBean> getDauthFilterGroupList(String dauthCode) {
        return getMapperByType(SysDauthMapper.class).getDauthFilterGroupList(dauthCode);
    }

}

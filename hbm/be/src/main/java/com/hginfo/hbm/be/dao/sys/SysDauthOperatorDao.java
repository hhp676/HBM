/*
 * Project Name:hbm-be.
 * File Name:SysDauthOperatorDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月22日 下午5:39:08
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthOperator;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthOperatorMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 数据权限运算符表: sys_dauth_operator. <br />
 * dao 层 <br />
 * Date: 2016年12月22日 下午5:39:08 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthOperatorDao extends SingleKeyBaseDao<SysDauthOperator> implements SysDauthOperatorMapper {
    
    @Override
    public List<SysDauthOperator> getDauthOperators(long filterTypeId) {
        return getMapperByType(SysDauthOperatorMapper.class).getDauthOperators(filterTypeId);
        
    }

}

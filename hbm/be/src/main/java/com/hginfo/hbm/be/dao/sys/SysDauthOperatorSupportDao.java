/*
 * Project Name:hbm-be.
 * File Name:SysDauthOperatorSupportDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月22日 下午5:39:08
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDauthOperatorSupport;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDauthOperatorSupportMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 数据权限运算符支持表: sys_dauth_operator_support. <br />
 * dao 层 <br />
 * Date: 2016年12月22日 下午5:39:08 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysDauthOperatorSupportDao extends SingleKeyBaseDao<SysDauthOperatorSupport>
    implements SysDauthOperatorSupportMapper {
    
    @Override
    public List<Integer> getDauthValueTypes(long filterTypeId, long operatorId) {
        return getMapperByType(SysDauthOperatorSupportMapper.class).getDauthValueTypes(filterTypeId, operatorId);
    }
    
}

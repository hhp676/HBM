/*
 * Project Name:hbm-be.
 * File Name:SysAccountDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:03
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysAccountMapper;
import org.springframework.stereotype.Repository;

/**
 * 登录账号表: sys_account. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:03 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysAccountDao extends SingleKeyBaseDao<SysAccount>
        implements SysAccountMapper {

    @Override
    public SysAccount getByUserId(Long userId) {
        return getMapperByType(SysAccountMapper.class).getByUserId(userId);
    }

}

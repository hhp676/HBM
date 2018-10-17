/*
 * Project Name:hbm-be.
 * File Name:SysUserPositionDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysUserPositionMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户岗位表: sys_user_position. <br />
 * dao 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysUserPositionDao extends SingleKeyBaseDao<SysUserPosition> implements SysUserPositionMapper {

    @Override
    public List<Long> getJobIdListByUserId(long userId) {
        return getMapperByType(SysUserPositionMapper.class).getJobIdListByUserId(userId);
    }

}

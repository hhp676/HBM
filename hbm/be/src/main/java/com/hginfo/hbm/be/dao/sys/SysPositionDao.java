/*
 * Project Name:hbm-be.
 * File Name:SysPositionDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysPositionMapper;
import org.springframework.stereotype.Repository;

/**
 * 岗位表: sys_position. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysPositionDao extends SingleKeyBaseDao<SysPosition> implements SysPositionMapper {
    
    @Override
    public String getPosIdsByFid(Long posFID) {
        return this.getMapperByType(SysPositionMapper.class).getPosIdsByFid(posFID);
    }

}

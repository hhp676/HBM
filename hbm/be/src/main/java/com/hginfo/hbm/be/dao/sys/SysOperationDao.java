/*
 * Project Name:hbm-be.
 * File Name:SysOperationDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysOperationMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统操作类型表: sys_operation. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysOperationDao extends SingleKeyBaseDao<SysOperation> implements SysOperationMapper {

    @Override
    public int queryOperationCountInAuth(Long operationID) {
        return getMapperByType(SysOperationMapper.class).queryOperationCountInAuth(operationID);
    }

}

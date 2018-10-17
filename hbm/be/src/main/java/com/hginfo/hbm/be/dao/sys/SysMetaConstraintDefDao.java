/*
 * Project Name:hbm-be.
 * File Name:SysMetaConstraintDefDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年05月08日 下午3:55:58
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDef;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysMetaConstraintDefMapper;

import java.util.List;

/**
 * 约束定义表: sys_meta_constraint_def. <br />
 * dao 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysMetaConstraintDefDao extends SingleKeyBaseDao<SysMetaConstraintDef>
        implements SysMetaConstraintDefMapper {

    /**
     *
     * @param tableName tableName
     * @return list
     */
    public List<SysMetaConstraintDef> getListByTableName(String tableName) {
        return getSqlSession().selectList(getMapperNamespace() + ".getListByTableName", tableName);
    }

}

/*
 * Project Name:hbm-be.
 * File Name:SysMetaConstraintDefServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年05月08日 下午3:55:58
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDef;
import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDetail;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hbm.base.service.sys.SysMetaConstraintDefService;
import com.hginfo.hbm.be.dao.sys.SysMetaConstraintDefDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import org.apache.commons.beanutils.BeanUtils;

import javax.persistence.Entity;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * 约束定义表: sys_meta_constraint_def. <br />
 * service impl 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysMetaConstraintDefServiceImpl extends BizService<SysMetaConstraintDef, SysMetaConstraintDefDao>
        implements SysMetaConstraintDefService {

    /**
     * 根据表名获取约束定义列表。
     * @param tableName 表名
     * @return 约束定义列表
     */
    public List<SysMetaConstraintDef> getListByTableName(String tableName) {
        return getDao().getListByTableName(tableName);
    }
}

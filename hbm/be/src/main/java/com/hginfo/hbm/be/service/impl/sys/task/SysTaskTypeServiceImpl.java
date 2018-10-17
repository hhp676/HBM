/*
 * Project Name:hbm-be.
 * File Name:SysTaskTypeServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.task;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.task.SysTaskType;
import com.hginfo.hbm.base.service.sys.task.SysTaskTypeService;
import com.hginfo.hbm.be.dao.sys.task.SysTaskTypeDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 任务类型表: sys_task_type. <br />
 * service impl 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysTaskTypeServiceImpl extends BizService<SysTaskType, SysTaskTypeDao>
        implements SysTaskTypeService {
    /**
     * 获取list（可选）.
     * @see com.hginfo.hbm.be.service.base.BizService#getList(com.hginfo.hbm.base.BizEntity, java.lang.String[])
     */
    @Override
    public List<SysTaskType> getList(SysTaskType filter, String... loadProps) {
        return this.getAllList(filter, loadProps);
    }

}

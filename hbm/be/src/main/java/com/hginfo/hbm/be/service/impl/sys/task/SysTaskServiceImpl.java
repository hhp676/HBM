/*
 * Project Name:hbm-be.
 * File Name:SysTaskServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.task;

import com.hginfo.hbm.base.entity.sys.task.SysTask;
import com.hginfo.hbm.base.service.sys.task.SysTaskService;
import com.hginfo.hbm.be.dao.sys.task.SysTaskDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 任务表: sys_task. <br />
 * service impl 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysTaskServiceImpl extends BizService<SysTask, SysTaskDao>
        implements SysTaskService {
    /**
     * TODO 简单描述该方法的实现功能（可选）.
     * @see com.hginfo.hbm.base.service.sys.task.SysTaskService#getById(java.lang.Long)
     */
    @Override
    public SysTask get(Long id) {
            return super.get(id);
    }
}

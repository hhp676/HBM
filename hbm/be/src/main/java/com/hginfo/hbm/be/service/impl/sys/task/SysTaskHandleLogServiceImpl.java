/*
 * Project Name:hbm-be.
 * File Name:SysTaskHandleLogServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.task;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hginfo.hbm.base.entity.sys.task.SysTaskHandleLog;
import com.hginfo.hbm.base.service.sys.task.SysTaskHandleLogService;
import com.hginfo.hbm.be.dao.sys.task.SysTaskHandleLogDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 任务办理日志: sys_task_handle_log. <br />
 * service impl 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysTaskHandleLogServiceImpl extends RelService<SysTaskHandleLog, SysTaskHandleLogDao>
        implements SysTaskHandleLogService {

    @Override
    public List<Map> getAfterDateNewTaskUserIds(Date date) {
        return this.getDao().getAfterDateNewTaskUserIds(date);
    }
}

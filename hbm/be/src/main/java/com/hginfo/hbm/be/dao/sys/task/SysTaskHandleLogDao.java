/*
 * Project Name:hbm-be.
 * File Name:SysTaskHandleLogDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys.task;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.task.SysTaskHandleLog;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.task.SysTaskHandleLogMapper;

/**
 * 任务办理日志: sys_task_handle_log. <br />
 * dao 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Repository
public class SysTaskHandleLogDao extends SingleKeyBaseDao<SysTaskHandleLog>
        implements SysTaskHandleLogMapper {
    @Override
    public List<Map> getAfterDateNewTaskUserIds(Date date) {
        return getMapperByType(SysTaskHandleLogMapper.class).getAfterDateNewTaskUserIds(date);
    }
}

/*
 * Project Name:hbm-be.
 * File Name:SysTaskHandleLogMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys.task;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 任务办理日志: sys_task_handle_log。 <br />
 * mapper 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysTaskHandleLogMapper extends BaseSqlMapper {
    /**
     * getAfterDateNewTaskUserIds:(查询时间点后有任务的人员id). <br/>
     * @author yinyanzhen
     * @param date date
     * @return List<Map> List<Map>
     * @since V1.0.0
     */
    List<Map> getAfterDateNewTaskUserIds(Date date);
}

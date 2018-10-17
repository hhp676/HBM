/*
 * Project Name:hbm-base.
 * File Name:SysTaskHandleLogService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.task;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hginfo.hbm.base.entity.sys.task.SysTaskHandleLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 任务办理日志: sys_task_handle_log. <br />
 * service interface 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysTaskHandleLogService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysTaskHandleLog> getPageList(BasePage<SysTaskHandleLog> pageInfo,
                                         SysTaskHandleLog filter, String... loadProps);
    /**
     * getAfterDateNewTaskUserIds:(查询时间点后有任务的人员id). <br/>
     * @author yinyanzhen
     * @param date date
     * @return int int
     * @since V1.0.0
     */
    List<Map> getAfterDateNewTaskUserIds(Date date);
}

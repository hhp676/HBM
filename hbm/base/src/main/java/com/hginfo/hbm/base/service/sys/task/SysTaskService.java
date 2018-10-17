/*
 * Project Name:hbm-base.
 * File Name:SysTaskService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.task;

import com.hginfo.hbm.base.entity.sys.task.SysTask;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 任务表: sys_task. <br />
 * service interface 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysTaskService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysTask> getPageList(BasePage<SysTask> pageInfo,
                                         SysTask filter, String... loadProps);
    /**
     * getById:(id获取任务信息). <br/>
     * @author yinyanzhen
     * @param id id
     * @return SysTask SysTask
     * @since V1.0.0
     */
    SysTask get(Long id);
    
}

/*
 * Project Name:hbm-base.
 * File Name:SysTaskHandlerService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.task;

import com.hginfo.hbm.base.entity.sys.task.SysTaskHandler;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 任务办理人表: sys_task_handler. <br />
 * service interface 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysTaskHandlerService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysTaskHandler> getPageList(BasePage<SysTaskHandler> pageInfo,
                                         SysTaskHandler filter, String... loadProps);
}

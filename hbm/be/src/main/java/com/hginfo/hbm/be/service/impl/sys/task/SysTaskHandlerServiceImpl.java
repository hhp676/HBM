/*
 * Project Name:hbm-be.
 * File Name:SysTaskHandlerServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.task;

import com.hginfo.hbm.base.entity.sys.task.SysTaskHandler;
import com.hginfo.hbm.base.service.sys.task.SysTaskHandlerService;
import com.hginfo.hbm.be.dao.sys.task.SysTaskHandlerDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 任务办理人表: sys_task_handler. <br />
 * service impl 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysTaskHandlerServiceImpl extends RelService<SysTaskHandler, SysTaskHandlerDao>
        implements SysTaskHandlerService {
}

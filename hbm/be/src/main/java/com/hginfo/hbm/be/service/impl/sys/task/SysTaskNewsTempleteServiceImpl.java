/*
 * Project Name:hbm-be.
 * File Name:SysTaskNewsTempleteServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.task;

import com.hginfo.hbm.base.entity.sys.task.SysTaskNewsTemplete;
import com.hginfo.hbm.base.service.sys.task.SysTaskNewsTempleteService;
import com.hginfo.hbm.be.dao.sys.task.SysTaskNewsTempleteDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 任务消息模版配置: sys_task_news_templete. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysTaskNewsTempleteServiceImpl extends BizService<SysTaskNewsTemplete, SysTaskNewsTempleteDao>
        implements SysTaskNewsTempleteService {

}

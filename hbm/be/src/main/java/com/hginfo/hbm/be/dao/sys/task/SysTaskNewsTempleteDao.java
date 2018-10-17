/*
 * Project Name:hbm-be.
 * File Name:SysTaskNewsTempleteDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys.task;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.task.SysTaskNewsTemplete;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.task.SysTaskNewsTempleteMapper;

/**
 * 任务消息模版配置: sys_task_news_templete. <br />
 * dao 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Repository
public class SysTaskNewsTempleteDao extends SingleKeyBaseDao<SysTaskNewsTemplete>
        implements SysTaskNewsTempleteMapper {

}

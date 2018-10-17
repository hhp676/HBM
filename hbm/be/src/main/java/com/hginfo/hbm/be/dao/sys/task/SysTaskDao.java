/*
 * Project Name:hbm-be.
 * File Name:SysTaskDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys.task;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.task.SysTask;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.task.SysTaskMapper;

/**
 * 任务表: sys_task. <br />
 * dao 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Repository
public class SysTaskDao extends SingleKeyBaseDao<SysTask>
        implements SysTaskMapper {

}

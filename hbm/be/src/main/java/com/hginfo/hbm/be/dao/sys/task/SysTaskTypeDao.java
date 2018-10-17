/*
 * Project Name:hbm-be.
 * File Name:SysTaskTypeDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys.task;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.sys.task.SysTaskType;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.task.SysTaskTypeMapper;

/**
 * 任务类型表: sys_task_type. <br />
 * dao 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Repository
public class SysTaskTypeDao extends SingleKeyBaseDao<SysTaskType>
        implements SysTaskTypeMapper {

}

/*
 * Project Name:hbm-base.
 * File Name:SysTaskTypeService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.task;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.task.SysTaskType;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 任务类型表: sys_task_type. <br />
 * service interface 层 <br />
 * Date: 2017年06月08日 下午2:44:48 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysTaskTypeService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysTaskType> getPageList(BasePage<SysTaskType> pageInfo,
                                         SysTaskType filter, String... loadProps);
    
    /**
     * getList:(获取任务类别列表). <br/>
     * @author yinyanzhen
     * @param filter filter
     * @param loadProps loadProps
     * @return List<SysTaskType> List<SysTaskType>
     * @since V1.0.0
     */
    List<SysTaskType> getList(SysTaskType filter, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SysTaskType entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(SysTaskType entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);
}

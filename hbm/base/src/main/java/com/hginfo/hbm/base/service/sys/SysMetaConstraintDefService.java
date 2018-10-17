/*
 * Project Name:hbm-base.
 * File Name:SysMetaConstraintDefService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年05月08日 下午3:55:58
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDef;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
 * 约束定义表: sys_meta_constraint_def. <br />
 * service interface 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysMetaConstraintDefService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysMetaConstraintDef> getPageList(BasePage<SysMetaConstraintDef> pageInfo,
                                           SysMetaConstraintDef filter, String... loadProps);

    /**
     *
     * @param filter      filter
     * @param loadProps   需要级联加载的实体属性
     * @return list
     */
    List<SysMetaConstraintDef> getList(SysMetaConstraintDef filter, String... loadProps);

    /**
     * 获取对象。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 对象
     */
    SysMetaConstraintDef get(Long id, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SysMetaConstraintDef entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(SysMetaConstraintDef entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);
}

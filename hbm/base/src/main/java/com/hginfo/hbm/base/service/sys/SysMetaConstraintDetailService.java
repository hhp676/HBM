/*
 * Project Name:hbm-base.
 * File Name:SysMetaConstraintDetailService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年05月08日 下午3:55:58
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDetail;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
 * 约束字段表: sys_meta_constraint_detail. <br />
 * service interface 层 <br />
 * Date: 2017年05月08日 下午3:55:58 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysMetaConstraintDetailService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysMetaConstraintDetail> getPageList(BasePage<SysMetaConstraintDetail> pageInfo,
                                              SysMetaConstraintDetail filter, String... loadProps);

    /**
     *
     * @param filter      filter
     * @param loadProps   需要级联加载的实体属性
     * @return list
     */
    List<SysMetaConstraintDetail> getList(SysMetaConstraintDetail filter, String... loadProps);

    /**
     * 获取对象。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 对象
     */
    SysMetaConstraintDetail get(Long id, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SysMetaConstraintDetail entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(SysMetaConstraintDetail entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);
}

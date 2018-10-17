/*
 * Project Name:hbm-base.
 * File Name:SysNewsInnerService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.news;

import com.hginfo.hbm.base.entity.sys.news.SysNewsInner;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 内部消息详情: sys_news_inner. <br />
 * service interface 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysNewsInnerService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysNewsInner> getPageList(BasePage<SysNewsInner> pageInfo,
                                         SysNewsInner filter, String... loadProps);
    
    /**
     * get:(主键查询). <br/>
     * @author yinyanzhen
     * @param id id
     * @param loadProps loadProps
     * @return SysNewsInner
     * @since V1.0.0
     */
    SysNewsInner get(Long id, String... loadProps);
//
//    /**
//     * 新增。
//     * @param entity entity
//     */
//    void add(SysNewsInner entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(SysNewsInner entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);
}

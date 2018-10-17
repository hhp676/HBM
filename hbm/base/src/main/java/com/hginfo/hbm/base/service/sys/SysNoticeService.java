/*
 * Project Name:hbm-base.
 * File Name:SysNoticeService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysNotice;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 通知公告: sys_notice. <br />
 * service interface 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysNoticeService {
    
    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysNotice> getPageList(BasePage<SysNotice> pageInfo, SysNotice filter,
        String... loadProps);
    
    /**
     * id获取对象.
     * @param id id
     * @return SysNotice
     */
    SysNotice get(Long id);
    
    /**
     * 新增,保存类型标记为发布的同时处理发布动作。
     * @param entity entity
     * @param saveType saveType
     */
    void save(SysNotice entity, String saveType);
    
    /**
    * 删除。
    * @param id id
    */
    void delete(Long id);
    
    /**
     * 发布or取消发布。
     * @param id id
     * @param pubType pubType
     */
    void doPub(Long id, String pubType);
}

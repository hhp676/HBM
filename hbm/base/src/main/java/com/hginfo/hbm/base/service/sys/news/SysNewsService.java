/*
 * Project Name:hbm-base.
 * File Name:SysNewsService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.news;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.news.SysNews;
import com.hginfo.hbm.base.entity.sys.news.SysNewsTemplete;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 消息表: sys_news. <br />
 * service interface 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysNewsService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysNews> getPageList(BasePage<SysNews> pageInfo,
                                         SysNews filter, String... loadProps);
    /**
     * saveSysNews:(保存消息配置信息). <br/>
     * @author yinyanzhen
     * @param newsTypeId newsTypeId
     * @param newsTempLeteId newsTempLeteId
     * @param newsFrom newsFrom
     * @param newsDoNode newsDoNode
     * @param bizId bizId
     * @param isInit isInit
     * @param isToAll isToAll
     * @return SysNews SysNews
     * @since V1.0.0
     */
    SysNews saveSysNews(Long newsTypeId, Long newsTempLeteId, String newsFrom,
        Integer newsDoNode, Long bizId, Integer isInit, Integer isToAll);
    
    /**
     * saveNewsDetail:(保存消息具体信息). <br/>
     * @author yinyanzhen
     * @param isIn isIn
     * @param newsId newsId
     * @param sysUser sysUser
     * @param newsTemplete newsTemplete
     * @param title title
     * @param newsContent newsContent
     * @since V1.0.0
     */
    void saveNewsDetail(Integer isIn, Long newsId, SysUser sysUser, SysNewsTemplete newsTemplete,
        String title, String newsContent);
//
//    /**
//     * 新增。
//     * @param entity entity
//     */
//    void add(SysNews entity);
//
//    /**
//     * 修改。
//     * @param entity entity
//     */
//    void update(SysNews entity);
//
//    /**
//     * 删除。
//     * @param id id
//     */
//    void delete(Long id);
}

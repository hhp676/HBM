/*
 * Project Name:hbm-base.
 * File Name:SysNewsTypeService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys.news;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.news.SysNewsType;

/**
 * 消息类型表: sys_news_type. <br />
 * service interface 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysNewsTypeService {

    /**
     * getList:(获取任务类别列表). <br/>
     * @author yinyanzhen
     * @param filter filter
     * @param loadProps loadProps
     * @return List<SysTaskType> List<SysTaskType>
     * @since V1.0.0
     */
    List<SysNewsType> getList(SysNewsType filter, String... loadProps);
}

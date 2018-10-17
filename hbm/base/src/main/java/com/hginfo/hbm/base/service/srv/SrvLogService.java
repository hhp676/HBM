/*
 * Project Name:hbm-base.
 * File Name:SrvLogService.java
 * Package Name:com.hginfo.hbm.base.service.srv
 * Date:2017年06月08日 上午10:07:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.srv;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 接口日志表: srv_log. <br />
 * service interface 层 <br />
 * Date: 2017年06月08日 上午10:07:12 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SrvLogService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SrvLog> getPageList(BasePage<SrvLog> pageInfo,
                             SrvLog filter, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SrvLog entity);


    /**
     * 获取最大的执行时间。
     * @return processTime processTime
     */
    int getMaxProcessTime();




}

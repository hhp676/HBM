/*
 * Project Name:hbm-base.
 * File Name:SysVariableService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2017年08月15日 下午7:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysVariable;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 系统变量：K-V类型。: sys_variable. <br />
 * service interface 层 <br />
 * Date: 2017年08月15日 下午7:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysVariableService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysVariable> getPageList(BasePage<SysVariable> pageInfo,
                                  SysVariable filter, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SysVariable entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(SysVariable entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);

    /**
     * 通过key获取数据。
     * @param key key
     */
    SysVariable get(String key);

    /**
     * 通过key获取数据(读取锁)。
     * @param key key
     */
    SysVariable getForUpdate(String key);

    /**
     * 获取RSR密钥对。
     * @return
     */
    byte[] doGetRSAKeyPair();

}

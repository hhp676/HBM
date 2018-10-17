/*
 * Project Name:hbm-base.
 * File Name:SrvInterfaceService.java
 * Package Name:com.hginfo.hbm.base.service.srv
 * Date:2017年06月08日 上午10:07:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.srv;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;
import java.util.Map;

/**
 * 接口表: srv_interface. <br />
 * service interface 层 <br />
 * Date: 2017年06月08日 上午10:07:12 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SrvInterfaceService {


    /**
     * 获取接口列表。
     * @param filter filter
     * @param loadProps loadProps
     * @return list
     */
    List<SrvInterface> getList(SrvInterface filter, final String... loadProps);

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SrvInterface> getPageList(BasePage<SrvInterface> pageInfo,
                                   SrvInterface filter, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(SrvInterface entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(SrvInterface entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);

    /**
     * 通过主键获取对象。
     * @param primaryKey 主键
     * @param loadProps 扩展对象
     * @return 实体对象
     */
    SrvInterface get(final Long primaryKey, final String... loadProps);

    /**
     * 生成初始数据。
     *  @param interfaces 接口集合
     * @param forced 是否强制重新生成
     */
    void updateData(List<SrvInterface> interfaces, boolean forced);

    /**
     * 更新缓存。
     * @return
     */
    Map<String,SrvInterface> updateCache();

    /**
     * 查询对象的主键ID（根据类名、方法名和参数名确实唯一ID）。
     * @param query 查询对象
     * @return 主键
     */
    Long getId(SrvInterface query);

    /**
     * 获取有效接口数量（包括可用和不可用的）。
     * @return int
     */
    int getEffectiveCount();

    /**
     * 获取可用接口数量。
     * @return int
     */
    int getEnabledCount();

}

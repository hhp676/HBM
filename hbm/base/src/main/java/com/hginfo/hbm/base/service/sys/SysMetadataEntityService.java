/*
 * Project Name:hbm-base.
 * File Name:SysMetadataEntityService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysMetadataEntity;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.vo.MetaField;
import com.hginfo.hbm.base.vo.MetaTable;

/**
 * 元数据实体表: sys_metadata_entity. <br />
 * service interface 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysMetadataEntityService {
    
    /**
     * 获取实体。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 实体
     */
    SysMetadataEntity get(Long id, final String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysMetadataEntity> getPageList(BasePage<SysMetadataEntity> pageInfo,
        SysMetadataEntity filter, final String... loadProps);
    /**
     * 获取实体数据。
     * @param filter 条件
     * @param loadProps 需要级联加载的实体属性
     * @return 实体数据
     */
    List<SysMetadataEntity> getList(SysMetadataEntity filter, final String... loadProps);
    /**
     * 获取所有的表信息。
     * @return 表信息。
     */
    List<MetaTable> getMetaTables();
    
    /**
     * 获取某个表的所有字段。
     * @param tableName 表名
     * @return 字段
     */
    List<MetaField> getMetaFieldsByTable(String tableName);
    
    /**
     * 新增。
     * @param sysMetadataEntity 实体
     */
    void add(SysMetadataEntity sysMetadataEntity);
    
    /**
     * 修改。
     * @param sysMetadataEntity 实体
     */
    void update(SysMetadataEntity sysMetadataEntity);
    /**
     * 删除。
     * @param entityId 实体Id
     */
    void delete(long entityId);

}

/*
 * Project Name:hbm-base.
 * File Name:SysMetadataFieldService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysMetadataField;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 元数据字段表: sys_metadata_field. <br />
 * service interface 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysMetadataFieldService {
    
    
    /**
     * 获取对象。
     * @param id id
     * @param loadProps 需要级联加载的实体属性
     * @return 对象
     */
    SysMetadataField get(Long id, final String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysMetadataField> getPageList(BasePage<SysMetadataField> pageInfo,
        SysMetadataField filter, final String... loadProps);
    /**
     * 获取字段。
     * @param filter 查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 字段信息。
     */
    List<SysMetadataField> getList(SysMetadataField filter, final String... loadProps);
    
    /**
     * 新增。
     * @param sysMetadataField 
     */
    void add(SysMetadataField sysMetadataField);
    
    /**
     * 修改。
     * @param sysMetadataField 
     */
    void update(SysMetadataField sysMetadataField);
    /**
     * 删除。
     * @param fieldId Id
     */
    void delete(long fieldId);

}

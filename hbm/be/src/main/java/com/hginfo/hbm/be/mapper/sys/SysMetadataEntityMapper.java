/*
 * Project Name:hbm-be.
 * File Name:SysMetadataEntityMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import com.hginfo.hbm.base.vo.MetaTable;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 元数据实体表: sys_metadata_entity。 <br />
 * mapper 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysMetadataEntityMapper extends BaseSqlMapper {
    
    /**
     * 获取所有的表信息。
     * @param metaTable 
     * @return 表信息。
     */
    List<MetaTable> getMySQLMetaTables(MetaTable metaTable);
}

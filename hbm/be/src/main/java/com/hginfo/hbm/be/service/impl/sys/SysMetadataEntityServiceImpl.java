/*
 * Project Name:hbm-be.
 * File Name:SysMetadataEntityServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import com.alibaba.druid.util.JdbcConstants;
import com.hginfo.hbm.base.entity.sys.SysMetadataEntity;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysMetadataEntityService;
import com.hginfo.hbm.base.vo.MetaField;
import com.hginfo.hbm.base.vo.MetaTable;
import com.hginfo.hbm.be.dao.sys.SysMetadataEntityDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.annotation.Config;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 元数据实体表: sys_metadata_entity. <br />
 * service impl 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysMetadataEntityServiceImpl
    extends BizService<SysMetadataEntity, SysMetadataEntityDao>
    implements SysMetadataEntityService {
    
    /**
     * 
     */
    @Config("jdbc.schema")
    private String jdbcSchema;
    
    @Override
    public Page<SysMetadataEntity> getPageList(final BasePage<SysMetadataEntity> basePage,
        final SysMetadataEntity filter, final String... loadProps) {
        
        SysMetadataEntity realFilter = filter == null ? new SysMetadataEntity() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, filter, loadProps);
        
    }
    
    /**
     * 获取所有的表信息。
     * @return 表信息。
     */
    public List<MetaTable> getMetaTables() {
        String databaseId = getDao().getSqlSession().getConfiguration().getDatabaseId();
        if (JdbcConstants.MYSQL.equals(databaseId)) {
            MetaTable m = new MetaTable();
            m.setSchema(jdbcSchema);
            return getDao().getMySQLMetaTables(m);
        } else {
            return getDao().getMetaTables(jdbcSchema);
        }
        
    }
    
    /**
     * 获取某个表的所有字段。
     * @param tableName 表名
     * @return 字段
     */
    public List<MetaField> getMetaFieldsByTable(String tableName) {
        return getDao().getMetaFieldsByTable(tableName,jdbcSchema);
    }
}

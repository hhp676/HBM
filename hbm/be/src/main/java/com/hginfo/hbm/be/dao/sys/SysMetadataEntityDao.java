/*
 * Project Name:hbm-be.
 * File Name:SysMetadataEntityDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysMetadataEntity;
import com.hginfo.hbm.base.vo.MetaField;
import com.hginfo.hbm.base.vo.MetaTable;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysMetadataEntityMapper;
import com.hginfo.hutils.StringUtil;
import org.springframework.stereotype.Repository;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 元数据实体表: sys_metadata_entity. <br />
 * dao 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Repository
public class SysMetadataEntityDao extends SingleKeyBaseDao<SysMetadataEntity>
    implements SysMetadataEntityMapper {
    
    /**
     * 非mysql获取所有的表信息。
     * @param schema 
     * @return 表信息。
     */
    public List<MetaTable> getMetaTables(String schema) {
        List<MetaTable> tableList = new ArrayList<>();
        try {
            DatabaseMetaData dm = getSqlSession().getConnection().getMetaData();
            ResultSet rs = dm.getTables(null, schema, null, new String[] {"TABLE" });
            while (rs.next()) {
                MetaTable table = new MetaTable();
                table.setTableName(rs.getString("TABLE_NAME"));
                table.setTableDesc(rs.getString("REMARKS"));
                tableList.add(table);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tableList;
    }
    
    /**
     * mysql获取所有的表信息。
     * @param metaTable 
     * @return 表信息。
     */
    public List<MetaTable> getMySQLMetaTables(MetaTable metaTable) {
        return getMapperByType(SysMetadataEntityMapper.class).getMySQLMetaTables(metaTable);
    }
    
    /**
     * 获取某个表的所有字段。
     * @param tableName 表名
     * @param jdbcSchema jdbcSchema
     * @return 字段
     */
    public List<MetaField> getMetaFieldsByTable(String tableName , String jdbcSchema) {
        List<MetaField> fieldList = new ArrayList<>();
        if (StringUtil.isNotEmpty(tableName)) {
            try {
                DatabaseMetaData dm = getSqlSession().getConnection().getMetaData();
                ResultSet rsCol = dm.getColumns(null, jdbcSchema, tableName, null);
                while (rsCol.next()) {
                    MetaField field = new MetaField();
                    field.setFieldName(rsCol.getString("COLUMN_NAME"));
                    field.setFieldDesc(rsCol.getString("REMARKS"));
                    fieldList.add(field);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return fieldList;
    }
    
}

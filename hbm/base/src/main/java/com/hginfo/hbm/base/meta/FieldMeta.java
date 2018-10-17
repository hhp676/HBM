package com.hginfo.hbm.base.meta;

import java.io.Serializable;

/**
 * 数据库字段的元数据信息
 * Created by qiujingde on 2016/12/19.
 */
public class FieldMeta implements Serializable {
    private static final long serialVersionUID = 4562616829349195416L;

    /**
     * 
     */
    private String tableAlias;
    /**
     *
     */
    private String fieldName;
    /**
     *
     */
    private String dbFieldName;
    /**
     *
     */
    private Class<?> fieldType;

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getDbFieldName() {
        return dbFieldName;
    }

    public void setDbFieldName(String dbFieldName) {
        this.dbFieldName = dbFieldName;
    }

    public Class<?> getFieldType() {
        return fieldType;
    }

    public void setFieldType(Class<?> fieldType) {
        this.fieldType = fieldType;
    }

    public String getTableAlias() {
        return tableAlias;
    }

    public void setTableAlias(String tableAlias) {
        this.tableAlias = tableAlias;
    }
    
    
}

package com.hginfo.hbm.base.meta;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.hginfo.hutils.StringUtil;

/**
 * 对应数据库表的元数据信息。<br />
 * Created by qiujingde on 2016/12/19.
 * @author qiujingde
 */
public class TableMeta implements Serializable {
    private static final long serialVersionUID = 4325248525053764186L;
    /**
     *
     */
    private String alias;

    /**
     *
     */
    private Map<String, FieldMeta> fieldMap = new HashMap<>();

    /**
     *
     */
    private Map<String, String> colMap = new HashMap<>();
    
    /**
     * 
     */
    private Map<String, TableMeta> associationMap = new HashMap<>();

    /**
     * 保存字段信息。
     * @param field    字段信息
     * @param dbField  数据库字段
     * @param fieldType 字段类型
     */
    public void addField(String field, String dbField, Class<?> fieldType) {
        FieldMeta fMeta = new FieldMeta();
        fMeta.setFieldName(field);
        fMeta.setDbFieldName(dbField);
        fMeta.setFieldType(fieldType);
        fieldMap.put(field, fMeta);

        colMap.put(dbField, field);
    }
    
    /**
     * 关联对象信息。
     * @param associationFieldName    关联对象字段信息
     * @param associationTableMeta    关联对象元数据类型
     */
    public void addAssociation(String associationFieldName, TableMeta associationTableMeta) {
        associationMap.put(associationFieldName, associationTableMeta);
    }

    /**
     * 根据字段获取数据库字段。
     * @param field 字段
     * @return 数据字段
     */
    public FieldMeta getDbField(String field) {
        if (StringUtil.isNotEmpty(field) && field.indexOf(".") > 0) {
            String associationName = field.split("\\.")[0];
            return associationMap.get(associationName).getDbField(field.substring(associationName.length() + 1));
        }
        FieldMeta fieldMeta = fieldMap.get(field);
        fieldMeta.setTableAlias(alias);
        return fieldMeta;
    }

    /**
     *
     * @param dbField db column name
     * @return field name
     */
    public String getField(String dbField) {
        return colMap.get(dbField);
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }
}

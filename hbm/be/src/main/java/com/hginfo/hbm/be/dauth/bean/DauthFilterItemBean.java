package com.hginfo.hbm.be.dauth.bean;

/**
 * 数据权限过滤器组，数据解析用. <br />
 * Date: 2017年02月15日 下午15:41:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public class DauthFilterItemBean {

    /**
     * 过滤器编号。
     */
    private Long filterItemId;
    
    /**
     * 过滤器组编号。
     */
    private Long filterGroupId;
    
    /**
     * 过滤器组名称。
     */
    private String filterGroupName;
    
    /**
     * 实体Id。
     */
    private Long entityId;
    
    /**
     * 实体 表名。
     */
    private String tableName;
    /**
     * 实体 表别名。
     */
    private String tableAlias;
    
    /**
     * 过滤类型ID。
     */
    private Long filterTypeId;
    
    /**
     * 过滤类型编码。
     */
    private String filterTypeCode;
    
    /**
     * 过滤类型名称（数值型表字段、字符型表字段、当前用户岗位、当前用户职务、无字段）。
     */
    private String filterTypeName;
    
    /**
     * 过滤类型 类型（普通类型--数据库字段、系统变量）。
     */
    private Integer filterTypeType;
    
    /**
     * 字段ID。
     */
    private Long fieldId;
    
    /**
     * 字段名称。
     */
    private String fieldName;
    
    /**
     * 字段列名。
     */
    private String fieldColumnName;
    
    /**
     * 运算符ID。
     */
    private Long operatorId;
    
    /**
     * 运算符名称。
     */
    private String operatorName;
    
    /**
     * 运算符值。
     */
    private String operatorValue;
    
    /**
     * 值类型（当前用户、职务、岗位、数据权限变量、自定义值、自定义SQL）。
     */
    private Integer valueType;
    
    /**
     * 值，如果类型是公共范围时，此字段与sys_dauth_variable关联。
     */
    private String filterValue;
    
    /**
     * 过滤器值（处理之后的）。
     */
    private String filterValueStr;
    
    /**
     * 解析后的sql条件的字段（左侧）。
     */
    private String dauthSqlField;
    
    /**
     * 解析后的sql条件的值（右侧）。
     */
    private String dauthSqlValue;
    
    /**
     * java解析的sql。
     * 如果dauthSql非空或非空串，则表示java解析的结果，无需再进行freemarker sql解析。
     */
    private String dauthSql;
    
    
    public Long getFilterItemId() {
        return filterItemId;
    }

    public void setFilterItemId(Long filterItemId) {
        this.filterItemId = filterItemId;
    }

    public Long getEntityId() {
        return entityId;
    }

    public void setEntityId(Long entityId) {
        this.entityId = entityId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTableAlias() {
        return tableAlias;
    }

    public void setTableAlias(String tableAlias) {
        this.tableAlias = tableAlias;
    }

    public Long getFilterTypeId() {
        return filterTypeId;
    }

    public void setFilterTypeId(Long filterTypeId) {
        this.filterTypeId = filterTypeId;
    }

    public String getFilterTypeCode() {
        return filterTypeCode;
    }

    public void setFilterTypeCode(String filterTypeCode) {
        this.filterTypeCode = filterTypeCode;
    }

    public String getFilterTypeName() {
        return filterTypeName;
    }

    public void setFilterTypeName(String filterTypeName) {
        this.filterTypeName = filterTypeName;
    }

    public Integer getFilterTypeType() {
        return filterTypeType;
    }

    public void setFilterTypeType(Integer filterTypeType) {
        this.filterTypeType = filterTypeType;
    }

    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
    }


    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFieldColumnName() {
        return fieldColumnName;
    }

    public void setFieldColumnName(String fieldColumnName) {
        this.fieldColumnName = fieldColumnName;
    }

    public Long getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperatorValue() {
        return operatorValue;
    }

    public void setOperatorValue(String operatorValue) {
        this.operatorValue = operatorValue;
    }

    public Integer getValueType() {
        return valueType;
    }

    public void setValueType(Integer valueType) {
        this.valueType = valueType;
    }

    public String getFilterValue() {
        return filterValue;
    }

    public void setFilterValue(String filterValue) {
        this.filterValue = filterValue;
    }

    public String getFilterValueStr() {
        return filterValueStr;
    }

    public void setFilterValueStr(String filterValueStr) {
        this.filterValueStr = filterValueStr;
    }

    public Long getFilterGroupId() {
        return filterGroupId;
    }

    public void setFilterGroupId(Long filterGroupId) {
        this.filterGroupId = filterGroupId;
    }

    public String getFilterGroupName() {
        return filterGroupName;
    }

    public void setFilterGroupName(String filterGroupName) {
        this.filterGroupName = filterGroupName;
    }
    
    public String getDauthSqlField() {
        return dauthSqlField;
    }

    public void setDauthSqlField(String dauthSqlField) {
        this.dauthSqlField = dauthSqlField;
    }

    public String getDauthSqlValue() {
        return dauthSqlValue;
    }

    public void setDauthSqlValue(String dauthSqlValue) {
        this.dauthSqlValue = dauthSqlValue;
    }
    
    public String getDauthSql() {
        return dauthSql;
    }

    public void setDauthSql(String dauthSql) {
        this.dauthSql = dauthSql;
    }

    @Override
    public String toString() {
        String format = "DauthFilterItemBean["
                + "filterItemId: %d, "
                + "filterGroupId: %d, "
                + "filterGroupName: %s, "
                + "entityId: %d, "
                + "tableName: %s, "
                + "tableAlias: %s, "
                + "filterTypeId: %d, "
                + "filterTypeName: %s, "
                + "filterTypeType: %d, "
                + "fieldId: %d, "
                + "fieldColumnName: %s, "
                + "operatorId: %d, "
                + "operatorValue: %s, "
                + "valueType: %d, "
                + "filterValue: %s, "
                + "filterValueStr: %s, "
                + "dauthSqlField: %s, "
                + "dauthSqlValue: %s,"
                + "dauthSql: %s] ";
        return String.format(format,
                filterItemId,
                filterGroupId,
                filterGroupName,
                entityId,
                tableName,
                tableAlias,
                filterTypeId,
                filterTypeName,
                filterTypeType,
                fieldId,
                fieldColumnName,
                operatorId,
                operatorValue,
                valueType,
                filterValue,
                filterValueStr,
                dauthSqlField,
                dauthSqlValue,
                dauthSql);
    }

}

package com.hginfo.hdf.generator.entity;

import com.hginfo.hdf.generator.utils.CamelCaseUtil;

/**
 * 每一列详细信息 包含字段长度，类型，列名称。
 * 
 * @author henry
 * @author qiujingde
 * 
 */
public class Column {

    /**
     *
     */
    private String colName;

    /**
     *
     */
    private String colDesc;

    /**
     *
     */
    private String colType;

    /**
     *
     */
    private String javaType;

    /**
     *
     */
    private String fieldName;

    /**
     * 首字母大写。
     */
    private String fieldNameBig;

    /**
     * 是否为空。
     */
    private String nullable;

    /**
     *
     */
    private String length;

    /**
     *
     */
    private String seOperName;

    /**
     *
     */
    private String geOperName;

    /**
     *
     */
    private boolean pkFlag;

    /**
     * entity的toString方法用到的格式化串。
     */
    private String formatCode;

    private Table table;


    public boolean isPkFlag() {
        return pkFlag;
    }

    public void setPkFlag(boolean pkFlag) {
        this.pkFlag = pkFlag;
    }

    public String getGeOperName() {
        return geOperName;
    }

    public void setGeOperName(String geOperName) {
        this.geOperName = geOperName;
    }

    public String getSeOperName() {
        return seOperName;
    }

    public void setSeOperName(String seOperName) {
        this.seOperName = seOperName;
    }

    public String getColName() {
        return colName;
    }

    /**
     * 设置列明，同时根据列名生成get，set名。
     * @param colName 列名
     */
    public void setColName(String colName) {
        this.colName = colName;

        String lowerCase = CamelCaseUtil.lowerCamelCase(colName);
        String upperCase = CamelCaseUtil.upperCamelCase(colName);
        String fnS = "set" + upperCase;
        String fnG = "get" + upperCase;

        this.setFieldName(lowerCase);
        this.setFieldNameBig(upperCase);
        this.setSeOperName(fnS);
        this.setGeOperName(fnG);
    }

    public String getColType() {
        return colType;
    }

    public void setColType(String colType) {

        this.colType = colType;
    }

    public String getFieldNameBig() {
        return fieldNameBig;
    }

    /**
     * 首字母大写。
     * @param field 列名
     */
    public void setFieldNameBig(String field) {
        this.fieldNameBig = field;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getColDesc() {
        return colDesc;
    }

    public void setColDesc(String colDesc) {
        this.colDesc = colDesc == null ? "" : colDesc;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getNullable() {
        return nullable;
    }

    public void setNullable(String nullable) {
        this.nullable = nullable;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getFormatCode() {
        return formatCode;
    }

    public void setFormatCode(String formatCode) {
        this.formatCode = formatCode;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }
}

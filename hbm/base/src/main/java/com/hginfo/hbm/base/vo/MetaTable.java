/**
 * Project Name:hbm-base
 * File Name:MetaTable.java
 * Package Name:com.hginfo.hbm.base.vo
 * Date:2016年12月26日下午6:51:56
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.vo;

import java.io.Serializable;

/**
 * MetaTable。
 * ClassName:MetaTable <br/>
 * Date: 2016年12月26日 下午6:51:56 <br/>
 * @author shichengqun
 * @since V1.0.0
 */
public class MetaTable implements Serializable {
    
    private static final long serialVersionUID = -8593932977182594830L;
    
    
    /**
    *
    */
    private String            tableName;
    
    /**
    *
    */
    private String            tableDesc;
    
    /**
     * 
     */
    private String            schema;
    
    
    public String getTableName() {
        return tableName;
    }
    
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    
    public String getTableDesc() {
        return tableDesc;
    }
    
    public void setTableDesc(String tableDesc) {
        this.tableDesc = tableDesc;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

}

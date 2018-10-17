/**
 * Project Name:hbm-base
 * File Name:MetaField.java
 * Package Name:com.hginfo.hbm.base.vo
 * Date:2016年12月26日下午6:51:56
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.vo;

import java.io.Serializable;

/**
 * 每一列信息。
 * ClassName:MetaField <br/>
 * Date: 2016年12月26日 下午6:51:56 <br/>
 * @author shichengqun
 * @since V1.0.0
 */
public class MetaField implements Serializable{

    /**
     */
    private static final long serialVersionUID = 960484029675537008L;

    /**
     *
     */
    private String fieldName;
    
    /**
     *
     */
    private String fieldDesc;


    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFieldDesc() {
        return fieldDesc;
    }

    public void setFieldDesc(String fieldDesc) {
        this.fieldDesc = fieldDesc;
    }


}

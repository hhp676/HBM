/**
 * Project Name:hbm-fe-bootstrap
 * File Name:Page.java
 * Package Name:com.hginfo.hbm.fe.bs.page
 * Date:2017年3月22日下午2:00:39
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.page;

import java.io.Serializable;
import java.util.List;

/**
 * bootstrap需要的分页数据保存类。
 * ClassName:Page <br/>
 * Date: 2017年3月22日 下午2:00:39 <br/>
 * @param <T> 实体类型
 * @author licheng
 * @since V1.0.0
 */
public class Page<T extends Serializable> {
    /**
    *
    */
    private List<T> rows;
    
    /**
    *
    */
    private int     total;
    
    /**
    *
    */
    public Page() {
    }
    
    /**
    *
    * @param base 原page对象
    */
    public Page(com.hginfo.hbm.base.page.Page<T> base) {
        total = base.getTotalCount();
        rows = base.getResult();
    }
    
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
    
    public void setTotal(int total) {
        this.total = total;
    }
    
    public List<T> getRows() {
        return rows;
    }
    
    public int getTotal() {
        return total;
    }
}

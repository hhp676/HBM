/*
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.fe.mc.page;

import java.io.Serializable;
import java.util.List;

/**
 * easyUI需要的分页数据保存类。 <br />
 * Date: 2016年12月2日 上午11:32:54 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 * @param <T> 实体类型
 */
public class Page<T extends Serializable> {

    /**
     *
     */
    private List<T> rows;

    /**
     *
     */
    private int total;

    /**
     *
     */
    public Page() { }

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

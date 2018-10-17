/*
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.srv.admin.page;

import com.hginfo.hutils.Constants;

import java.io.Serializable;
import java.util.List;

/**
 * SRV ADMIN分页数据保存类。 <br />
 * Date: 2016年12月2日 上午11:32:54 <br />
 *
 * @author licheng
 * @since V1.0.0
 * @param <T> 实体类型
 */
public class Page<T extends Serializable> {

    /**
     *
     */
    private List<T> data;

    /**
     *
     */
    private int recordsFiltered;

    /**
     *
     */
    private int recordsTotal;

    /**
     * 视图标识号。
     */
    private int draw;


    /**
     *
     */
    public Page() { }

    /**
     *
     * @param base 原page对象
     */
    public Page(com.hginfo.hbm.base.page.Page<T> base) {
        recordsTotal = base.getTotalCount();
        recordsFiltered = base.getTotalCount();
        data = base.getResult();
        draw = base.getDraw();
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<T> getData() {
        return data;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getDraw() {
        return draw;
    }
}

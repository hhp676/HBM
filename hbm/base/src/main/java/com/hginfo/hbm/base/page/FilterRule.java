package com.hginfo.hbm.base.page;

import java.io.Serializable;

/**
 * 对应easyui表头过滤的条件。<br />
 * Created by qiujingde on 2016/12/19.
 * @author qiujingde
 */
public class FilterRule implements Serializable {
    private static final long serialVersionUID = 6913654173002609098L;

    /**
     * 对应字段。
     */
    private String field;
    /**
     * 运算符。
     */
    private String op;
    /**
     * 过滤值。
     */
    private String value;

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}

package com.hginfo.hbm.base;

import java.io.Serializable;

/**
 * Created by qiujingde on 2017/2/15.<br />
 * 多主键实体，主键组合类基类。<br />
 * 此类的实现必须覆盖equals和hashCode实现。
 * @author qiujingde
 */
public abstract class MultiKey implements Serializable {
    private static final long serialVersionUID = -2655133681310698805L;
}

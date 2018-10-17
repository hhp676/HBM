/*
 * Project Name:hbm-core
 * File Name:CollectionsUtil.java
 * Package Name:com.hginfo.hbm.core.utils
 * Date:2016年12月3日下午1:53:22
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.utils;

import com.hginfo.hbm.base.BizEntity;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * CollectionsUtil。
 * ClassName:CollectionsUtil <br/>
 * Date: 2016年12月3日 下午1:53:22 <br/>
 * modified by qiujingde: <br />
 *     调整工具类的package并修改部分代码。<br />
 * @author licheng
 * @author qiujingde
 * @since V1.0.0
 */
public final class CollectionsUtil {

    /**
     * 私有构造方法，防止此类被实例化。
     */
    private CollectionsUtil() { }

    /**
     * 空Map。
     */
    private static final Map<Long, ?> EMPTY_MAP = Collections.unmodifiableMap(new HashMap<Long, Object>());
    
    /**
     * 实体对象列表转换为以主键为KEY的MAP集合。
     * @param <E> E
     * @param entityList 实体对象列表
     * @return MAP集合
     * @since V1.0.0
     */
    @SuppressWarnings("unchecked")
    public static <E extends BizEntity> Map<Long, E> entityToMap(List<E> entityList) {
        if (entityList == null) {
            return (Map<Long, E>) EMPTY_MAP;
        }
        return entityList.stream().collect(Collectors.toMap(BizEntity::getId, Function.identity()));
    }
    
}

/**
 * Project Name:hbm-base
 * File Name:IgnoreSqlFilter.java
 * Package Name:com.hginfo.hbm.annotation
 * Date:2016年10月26日下午8:01:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 注解支持忽略SQL注入过滤。
 * ClassName:IgnoreSqlFilter <br/>
 * Date: 2016年10月26日 下午8:01:48 <br/>
 * @author licheng
 */
@Target({ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface IgnoreSqlFilter {
    
    /**
     * 是否启用。
     * @author licheng
     * @return 结果
     * @since V1.0.0
     */
    boolean enabled() default true;
    
}

/**
 * Project Name:hbm-core
 * File Name:SysLog.java
 * Package Name:com.hginfo.hbm.core.annotation
 * Date:2017年1月19日下午6:44:23
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ClassName:SysLog.
 * Date: 2017年1月19日 下午6:44:23 <br/>
 * @author licheng
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface SysLog {
    
    /**
     * @return logType.
     */
    int logType() default 0;
    
    /**
     * @return tenantId.
     */
    int tenantId() default 1;
    
    /**
     * @return key1
     */
    String key1() default "";
    
    /**
     * @return key2
     */
    String key2() default "";
    
    /**
     * @return content
     */
    String content() default "";
    
}

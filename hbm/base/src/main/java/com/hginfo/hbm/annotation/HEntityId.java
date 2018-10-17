package com.hginfo.hbm.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by qiujingde on 2017/2/7.
 * 标注实体类中实体属性对应的编码属性。
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface HEntityId {
    /**
     * 编码属性。
     * @return 编码属性。
     */
    String value() default "";
}

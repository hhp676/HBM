package com.hginfo.hbm.fe.core.log;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 用户操作日志的注解，应用于Controller方法上。
 */
@Target({ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface UserLog {
    /**
     * 用户操作名称。
     * 
     * @return 用户操作名称，默认为空串
     */
    String name() default "";
    
    /**
     * 用户操作code。
     * 
     * @return 用户操作名称，默认为空串
     */
    String code() default "";
    
    /**
     * 用户操作英文名称。
     * @return 用户操作英文名称，默认为空串
     */
    String engName() default "";
    
    /**
     * 关键词1。
     * @return 关键词1
     */
    String key1() default "";
    
    /**
     * 关键词2。
     * @return 关键词2
     */
    String key2() default "";
    
    /**
     * 关键词3。
     * @return 关键词3
     */
    String key3() default "";
    
    /**
     * 需要存储content_json的类。
     * 
     * @return contentClass
     */
    Class contentClass() default UserLog.class;
}

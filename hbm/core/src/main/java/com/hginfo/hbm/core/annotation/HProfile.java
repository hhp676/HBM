package com.hginfo.hbm.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义的设置信息注入标记。<br />
 * 有此注解的类，自动调整类的scope：<br />
 *    1）如果类未设置scope或scope为singleton调整为Session；<br />
 *    2）如果类未设置scopedProxyMode或其值为DEFAULT，调整为TARGET_CLASS。 <br />
 * <br />
 * 此注解标志的字段，首先从 SysUserProfileService中取值，然后从SysConfigService中取值。<br />
 * 取值是对应的code，对应{@link #value()}的值，为空时去注解字段的名字。<br />
 * Created by qiujingde on 2016/12/8.<br />
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface HProfile {
    /**
     * 设置项code。
     * @return 设置项code。
     */
    String value() default "";
}

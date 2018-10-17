package com.hginfo.hbm.annotation;

import com.hginfo.hbm.base.dict.HDictValidator;
import org.springframework.core.annotation.AliasFor;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

/**
 * 字典项值验证注解。<br />
 * 可用来验证注解的字段的值是不是属于注解标注的字典组。<br />
 * Created by qiujingde on 2016/12/12.
 */
@Constraint(validatedBy = HDictValidator.class)
@Target({java.lang.annotation.ElementType.FIELD })
@Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@Documented
public @interface HDict {

    /**
     * groupCode.
     * @return 字典组code
     */
    @AliasFor("groupCode")
    String value() default "";

    /**
     * groupCode.
     * @return 字典组code
     */
    @AliasFor("value")
    String groupCode() default "";

    /**
     * subGroupCode.
     * @return 子字典组code
     */
    String subGroupCode() default "";

    /**
     * priority.
     * @return 权重
     */
    long priority() default 0;

    /**
     * @return message
     */
    String message() default "{com.hginfo.hbm.annotation.HDict.message}";

    /**
     * @return Class<?>[]
     */
    Class<?>[] groups() default {};

    /**
     * @return Class<? extends Payload>[]
     */
    Class<? extends Payload>[] payload() default {};
}

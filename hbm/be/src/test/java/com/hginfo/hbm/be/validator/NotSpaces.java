package com.hginfo.hbm.be.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

/**
 * 不能含有空格的校验
 * @author shichengqun
 *
 */
@Constraint(validatedBy = NotSpacesValidator.class) //具体的实现    
@Target( {java.lang.annotation.ElementType.FIELD })    
@Retention(java.lang.annotation.RetentionPolicy.RUNTIME)    
@Documented    
public @interface NotSpaces {

	String message() default "{com.hginfo.constraints.NotSpaces.message}";

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };
}

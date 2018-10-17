package com.hginfo.hbm.be.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


/**
 * 自定义validator校验是否有空格
 * @author shichengqun
 *
 */
public class NotSpacesValidator implements ConstraintValidator<NotSpaces, String>{

	/**  
     * 初始参数,可获取其中的值
     */  
	public void initialize(NotSpaces constraintAnnotation) {
		
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(value != null && value.indexOf(" ") > 0){    
            return false;
        }   
		return true;
	}

}

package com.hginfo.hbm.be.validator;

import java.math.BigDecimal;
import java.util.Map;

import javax.validation.ConstraintViolationException;
import javax.validation.Validator;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.service.TOrderService;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hvalidate.BeanValidators;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-validate.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class BeanValidatorTest {

	@Autowired
	private Validator validator;
	
	@Autowired
	private TOrderService tOrderService;
	
	@Test
	public void test() {
		TOrder o1 = new TOrder();
		o1.setAmount(new BigDecimal(1));
		o1.setCreatetime(DateTimeUtil.convertStringToDate("2016-09-08", "yyyy-MM-dd"));
		o1.setTestSize(2);
		o1.setTestRemark("3");
		o1.setTestSpace("aa bb");
		o1.setTestMobile("10111111111");
		
		/*Set<ConstraintViolation<TOrder>> constraints = validator.validate(o1);
		for (ConstraintViolation<TOrder> constraintViolation : constraints) {
			System.out.println("字段名称：" + constraintViolation.getPropertyPath() + " 的错误信息为：" + constraintViolation.getMessage());
		}*/
		try{
		    BeanValidators.validateWithException(validator, o1);
		    
		}catch(Exception e){
		    if(e instanceof ConstraintViolationException){
		        Map<String, String> map = BeanValidators.extractPropertyAndMessage((ConstraintViolationException)e);
		        System.out.println(map);
		        System.out.println(BeanValidators.extractPropertyAndMessageAsList((ConstraintViolationException)e,"=="));
		    }
		    
		}
	}
}

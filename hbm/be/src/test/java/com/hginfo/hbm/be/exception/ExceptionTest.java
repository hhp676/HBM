package com.hginfo.hbm.be.exception;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbm.be.dao.TUserDao;
import com.hginfo.hbm.be.service.TUserService;

/**
 * ClassName:ExceptionTest <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年9月9日 下午5:34:42 <br/>
 * @author Administrator
 * @version
 * @since V1.0.0
 * @see
 */

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class ExceptionTest {
    
    @Autowired
    private TUserDao tUserDao;
    
    @Autowired
    private TUserService tUserService;
    
    /**
     * 需要在applicationContext.xml中加入ExceptionAdvisor的配置
     */
    @Test(expected = java.lang.ArithmeticException.class)
    public void test(){
        //tUserDao.testUser();
        
        tUserService.testUserException();
        
        //tUserService.testUserNoException();
        System.out.println("后续处理~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }
    
}


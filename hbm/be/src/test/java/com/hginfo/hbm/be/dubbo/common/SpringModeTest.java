package com.hginfo.hbm.be.dubbo.common;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbm.be.dubbo.common.service.TestModeService;
import com.hginfo.hbm.be.dubbo.dubbopackage.service.TestDubboPackageService;
import com.hginfo.hbm.be.service.TOrderService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * 测试hdubbo:mode mode的属性作用。
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-db.xml",
        "classpath:spring/applicationContext-hibernate.xml",
        "classpath:spring/applicationContext-mybatis.xml",
        "classpath:spring/applicationContext-tx.xml",
        "classpath:dubbo/applicationContext-hdubbo-spring.xml"})  
public class SpringModeTest {
    
    
    @HReference
    private TestModeService dubboDemoService;
    
    @HReference(qualifier = "tOrderService")
    private TOrderService tOrderService;
    
    @HReference
    private TestDubboPackageService testDubboPackageService;
    
    @Test
    public void testMode(){
        System.out.println("==============testMode==========================");
        System.out.println("===tOrderService===" + tOrderService);
        System.out.println("===dubboDemoService===" + dubboDemoService);
        System.out.println("===testDubboPackageService===" + testDubboPackageService);
        dubboDemoService.test();
    }
}

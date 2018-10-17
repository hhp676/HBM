package com.hginfo.hbm.be.dubbo.forcedubbo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbm.be.dubbo.common.service.TestModeService;
import com.hginfo.hbm.be.dubbo.forcedubbo.service.TestForceDubboService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * 测试HService/HReference forcedubbo的属性作用。
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-db.xml",
        "classpath:spring/applicationContext-hibernate.xml",
        "classpath:spring/applicationContext-mybatis.xml",
        "classpath:spring/applicationContext-tx.xml",
        "classpath:dubbo/applicationContext-hdubbo-dubbo.xml"})  
public class DubboForceDubboTest {
    
    @HReference(forceDubbo = true)
    private TestForceDubboService testForceDubboService;
    
    @HReference
    private TestModeService testModeService;
    
    @Test
    public void testForceDubbo(){
        System.out.println("==============testForceDubbo==========================");
        System.out.println("===testForceDubboService===" + testForceDubboService);
        System.out.println("===testModeService===" + testModeService);
        testForceDubboService.test();
    }
}


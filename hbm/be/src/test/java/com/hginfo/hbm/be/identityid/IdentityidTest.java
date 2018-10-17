/**
 * Project Name:hbm-backend
 * File Name:IdentityidTest.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午11:29:43
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.identityid;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbm.core.identityid.Identityid;
import com.hginfo.hutils.Constants;

import junit.framework.TestCase;

/**
 * 唯一ID生成单元测试。
 * ClassName:IdentityidTest <br/>
 * Date: 2016年10月14日 上午11:29:43 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml" })
public class IdentityidTest extends TestCase {
    
    /**
     * 唯一ID生成。
     */
    @Autowired
    private Identityid identityidFactory;
    
    /**
     * .
     * @author licheng
     * @since V1.0.0
     */
    @Test
    public void mainTest() {
        
        List<Long> identityids = new ArrayList<>();
        for (int i = 0; i < Constants.NUMBER_1000; i++) {
            long indentityid = identityidFactory.getIdentityid();
            System.out.println("=====" + indentityid);
            assertTrue(!identityids.contains(indentityid));
            identityids.add(indentityid);
        }
        
    }
    
}

/**
 * Project Name:oa-adp
 * File Name:ProducerConsumerTest.java
 * Package Name:com.hongguaninfo.hgdf.adp.jms.service
 * Date:2017年6月19日下午7:28:38
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.jms.service;

import javax.jms.Destination;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * ClassName:ProducerConsumerTest <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2017年6月19日 下午7:28:38 <br/>
 * @author henry
 * @version
 * @since V1.0.0
 * @see
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext-test.xml" })
public class ProducerConsumerTest {
    
    @Autowired
    private ProducerService producerService;
    
    @Autowired
    @Qualifier("queueDest")
    private Destination destination;
    
    @Test
    public void testSend() {
        for (int i = 0; i < 2; i++) {
            producerService.sendMessage(destination, "你好，生产者！这是消息：" + (i + 1));
        }
    }
    
}

/**
 * Project Name:hbm-be
 * File Name:TestSqlFilterService.java
 * Package Name:com.hginfo.hbm.be.service
 * Date:2016年10月19日下午6:07:09
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.TOrderDao;

import junit.framework.TestCase;

/**
 * 多数据库支持测试。
 * ClassName:TestSqlFilterService <br/>
 * Date: 2016年10月19日 下午6:07:09 <br/>
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
public class TestSqlFilterService extends TestCase {
    
    @Autowired
    private TOrderDao tOrderDao;
    
    @Test
    @Transactional
    public void testSqlFilter() {
        TOrder tOrder = new TOrder();
        tOrder.setTestName("licheng_testName' or 1=1 or 1='");
        tOrder.setClientname("licheng_clientName");
        List<TOrder> r = tOrderDao.getTOrderList(tOrder);
        System.out.println(r);
    }
    
    @Test
    @Transactional
    public void testSqlFilter2() {
        TOrder tOrder = new TOrder();
        tOrder.setTestName("licheng_testName' uniON sElect 1,2,3,4");
        tOrder.setClientname("licheng_clientName");
        List<TOrder> r = tOrderDao.getTOrderList(tOrder);
        System.out.println(r);
    }
    
    @Test
    @Transactional
    public void testSqlFilterForOtherParameter() {
        Map<String, Object> map = new HashMap<>();
        map.put("testName", "11update%11");
        map.put("testName22", new ArrayList(Arrays.asList("Ryan", "Julie", "Bob")));
        Map<String, Object> subMap = new HashMap<>();
        subMap.put("subTestname", "subMap1111 select * from 1 aaa");
        map.put("submap", subMap);
        
        TOrder tOrder = new TOrder();
        tOrder.setTestName("[sub order testName]%select/**/1,2%");
        tOrder.setClientname("[sub order clientName]%UpdaTer%");
        tOrder.setTestSubSql(" CLIENTNAME_ = 'a' ");
        map.put("suborder", tOrder);
        
        //List<TOrder> r = tOrderDao.selectList("getTOrderListBySql", "1 and 2");
        List<TOrder> r = tOrderDao.selectList("getTOrderListBySql", map);
        System.out.println(r);
    }
    
}

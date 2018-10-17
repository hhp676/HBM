/**
 * Project Name:hbm-be
 * File Name:TestMultiDBService.java
 * Package Name:com.hginfo.hbm.be.service
 * Date:2016年10月19日下午6:07:09
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.datasource.DataSourceConstants;
import com.hginfo.hbm.be.datasource.DataSourceKey;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import junit.framework.TestCase;

/**
 * 多数据库支持测试。
 * ClassName:TestMultiDBService <br/>
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
public class TestMultiDBService extends TestCase {
    
    @Autowired
    private TOrderDao tOrderDao;
    
    @Test
    @Transactional
    public void testMysql() {
        TOrder tOrder = new TOrder();
        tOrder.setTestName("licheng_testName");
        tOrder.setClientname("licheng_clientName");
        List<TOrder> r = tOrderDao.getTOrderList(tOrder);
        System.out.println(r);
    }
    
    @Test
    @Transactional
    @DataSourceKey(DataSourceConstants.TEST)
    public void testOracle() {
        TOrder tOrder = new TOrder();
        tOrder.setTestName("licheng_testName");
        tOrder.setClientname("licheng_clientName");
        List<TOrder> r = tOrderDao.getTOrderList(tOrder);
        System.out.println(r);
    }
    
    @Test
    @Transactional
    public void testMybatis() {
        TOrder tOrder = new TOrder();
        tOrder.setTestName("licheng_testName");
        tOrder.setClientname("licheng_clientName");
        List<TOrder> r = tOrderDao.getTOrderByAnnotation(tOrder);
        System.out.println(r);
    }
    
    @Test
    @Transactional
    public void testMysqlPager() {
        BasePage page = new BasePage<>();
        page.setPage(1);
        Page r = tOrderDao.pageQuery(page);
        System.out.println(r);
    }
    
}

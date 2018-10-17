package com.hginfo.hbm.be.service;

import java.math.BigDecimal;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.base.entity.TUser;
import com.hginfo.hbm.be.dao.base.HBaseDAO;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class TUserServiceTest {
    
    @Autowired
    private HBaseDAO<TUser> tUserDao;
    
    @Autowired
    private HBaseDAO<TOrder> tOrderDao;
    
    @Test
    @Transactional
    //@Rollback(false)
    public void test() {
        TOrder o = new TOrder();
        o.setClientname("testOrder:" + new Date());
        o.setAmount(new BigDecimal(11));
        tOrderDao.save(o);
        
        TOrder o1 = new TOrder();
        o1.setClientname("update");
        o1.setId((long)Integer.MAX_VALUE);
        tOrderDao.update(o1);
        
        TUser u = new TUser();
        u.setUserName("testUser:" + new Date());
        tUserDao.save(u);
        
        TUser u1 = new TUser();
        u1.setUserName("aaa");
        u1.setId((long)Integer.MAX_VALUE);
        tUserDao.update(u1);
    }
    
}


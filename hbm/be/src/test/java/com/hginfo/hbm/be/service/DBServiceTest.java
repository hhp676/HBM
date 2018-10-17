package com.hginfo.hbm.be.service;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.dao.TestDao;
import com.hginfo.hbm.be.dao.base.HBaseDAO;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class DBServiceTest {
	
	private static Logger logger = Logger.getLogger(DBServiceTest.class);

	@Autowired  
    private HBaseDAO<TOrder> hBaseDAO;  
	
	@Autowired
	private TOrderDao tOrderDao;
	
	@Autowired
	private TestDao testDao;
  
    @Test
    @Transactional
    public void insertHOrder() {
    	TOrder o = new TOrder();
    	o.setId(testDao.getIdentityid());
    	o.setClientname("bbb");
    	o.setAmount(new BigDecimal("52.16"));
    	o.setCreatetime(new Date());
    	//hBaseDAO.save(o);
    	logger.debug("===="+o.getId()+"====");
    	testDao.save(o);
    	
    	System.out.println(testDao.getNameById(o.getId().intValue()));
    	//testDao.deleteById(TOrder.class, new BigDecimal(26));
    	
    	
    	/*TOrder o1 = new TOrder();
        o1.setClientname("tx-mybatis-1");
        o1.setAmount(new BigDecimal("1"));
        o1.setCreatetime(new Date());
        tOrderDao.save(o1);*/
    }

    //@Test
    //@Transactional
    public void insertHANDMOrder(){
    	TOrder o = new TOrder();
    	o.setClientname("tx-hibernate");
    	o.setAmount(new BigDecimal("11"));
    	o.setCreatetime(new Date());
    	hBaseDAO.save(o);
    	
    	TOrder o1 = new TOrder();
    	o1.setClientname("tx-mybatis-1");
    	o1.setAmount(new BigDecimal("1"));
    	o1.setCreatetime(new Date());
    	tOrderDao.save(o1);
    	
    	logger.warn("hibernate:" + tOrderDao.getNameById(o.getId().intValue()));
    	
    	TOrder o2 = new TOrder();
    	o2.setClientname("tx-mybatis-2");
    	o2.setAmount(new BigDecimal("11"));
    	o2.setCreatetime(new Date());
    	tOrderDao.save(o2);

    }
    
}

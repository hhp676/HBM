package com.hginfo.hbm.be.datasource2;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.be.service.TOrderMutilService;
import com.hginfo.hbm.be.service.TOrderOtherService;
import com.hginfo.hbm.be.service.TOrderService;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class DataSourceMutilTest {
	
	private static Logger logger = Logger.getLogger(DataSourceMutilTest.class);

	@Autowired
	private TOrderService tOrderService;
	
	@Autowired
	private TOrderMutilService tOrderServiceMutil;
	
	@Autowired
    private TOrderOtherService tOrderService2;
	
  
    @Test
    public void insertHANDMOrder(){
    	/*tOrderService.insertHBMByDefault();
    	tOrderService.insertTEST();
    	tOrderService.insertHBMByDefault();
    	
    	logger.warn("保存两次hbm，一次TEST");*/
    	
    	/*tOrderService.insertTEST();
    	tOrderService.insertHBMByKey();
    	tOrderService.insertTEST();
    	
    	logger.warn("保存两次TEST，一次HBM");*/
    	
    	/*tOrderService.insertTEST();
    	tOrderService.insertHBMByDefalutValue();
    	tOrderService.insertHBMByKey();
    	
    	logger.warn("保存两次HBM，一次TEST");*/
    	
    	/*tOrderService.getByHBM();
    	
    	tOrderService.getByTest();*/
    	
    	
    	//tOrderService.insertMutil();
    	
    	//tOrderService.getMutil();
    	
    	//tOrderServiceMutil.getMutil();
    	
    	//tOrderServiceMutil.saveMutil();
        
        
        tOrderService2.getByHBM();
        tOrderService2.getByTest();
        tOrderService2.getByHBM();
        
        /*tOrderService.insertTEST();
        tOrderService.insertHBMByKey();
        tOrderService.insertTEST();*/
        
    	
    	//tOrderService.getMutilNoTransaction();
    }
    
    
}

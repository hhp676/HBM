package com.hginfo.hbm.be.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.datasource.DataSourceConstants;
import com.hginfo.hbm.be.datasource.DataSourceKey;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

@Service
public class TOrderOtherService {
	
	private static Log log = LogFactory.getLog(TOrderOtherService.class);
	
	@Autowired
    private TOrderDao tOrderDao;
	
	@DataSourceKey(DataSourceConstants.HBM)
    public void getByHBM(){
    	log.warn("TOrderService2----新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
	
	@DataSourceKey(DataSourceConstants.TEST)
    public void getByTest(){
    	log.warn("TOrderService2----新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
	
}

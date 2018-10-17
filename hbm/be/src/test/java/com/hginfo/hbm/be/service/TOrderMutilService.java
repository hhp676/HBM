package com.hginfo.hbm.be.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 事务管理器会对此控制
 * @author Administrator
 *
 */
@Component
public class TOrderMutilService {
	
	@Autowired
    private TOrderOtherService tOrderService2;
	
	@Autowired
    private TOrderService tOrderService;
	
	/**
	 * 执行此方法会报错
	 */
	public void getMutil(){
    	tOrderService2.getByHBM();
    	tOrderService2.getByTest();
    	tOrderService2.getByHBM();
    }

	/**
     * 执行此方法会报错
     */
	public void saveMutil(){
	    tOrderService.insertTEST();
        tOrderService.insertHBMByKey();
        tOrderService.insertTEST();
	}
}

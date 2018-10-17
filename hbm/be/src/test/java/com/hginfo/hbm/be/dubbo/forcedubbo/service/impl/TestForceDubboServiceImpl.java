package com.hginfo.hbm.be.dubbo.forcedubbo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.dao.TestDao;
import com.hginfo.hbm.be.dubbo.forcedubbo.service.TestForceDubboService;
import com.hginfo.hdubbo.annotation.HService;


//@HService(forceDubbo = true)
@HService
public class TestForceDubboServiceImpl implements TestForceDubboService {
    
    @Autowired
    private TestDao testDao;
    
    @Autowired
    @Qualifier("tOrderDao")
    private TOrderDao tOrderDao;
    
    
    public void test(){
        System.out.println("===testDao===" + testDao);
        System.out.println("===tOrderDao===" + tOrderDao);
    }
    
}


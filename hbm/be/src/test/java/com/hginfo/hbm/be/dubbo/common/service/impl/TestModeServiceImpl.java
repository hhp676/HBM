package com.hginfo.hbm.be.dubbo.common.service.impl;

import com.hginfo.hbm.be.dubbo.common.service.TestModeCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.dao.TestDao;
import com.hginfo.hbm.be.dubbo.common.service.TestModeService;
import com.hginfo.hdubbo.annotation.HService;

@HService
public class TestModeServiceImpl implements TestModeService {
    
    @Autowired
    private TestDao testDao;
    
    @Autowired
    @Qualifier("tOrderDao")
    private TOrderDao tOrderDao;
    
    
    public void test(){
        System.out.println("===testDao===" + testDao);
        System.out.println("===tOrderDao===" + tOrderDao);
    }

    @Override
    public void testCallback(TestModeCallback callback) {
        callback.callback();
    }
}


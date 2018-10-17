package com.hginfo.hbm.be.service.impl.test;

import com.hginfo.hbm.base.service.test.TestBaseService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 基础service实现类。
 * Date: 2016年11月21日 下午6:02:30 <br/>
 * @param <T> 实体
 * @author shichenqgun
 */
public class TestBaseServiceImpl<T> implements TestBaseService<T> {
    
    private Log log = LogFactory.getLog(TestBaseServiceImpl.class);
    
    /**
     * @param t 
     */
    @Override
    public void add(T t) {
        log.info("=========BaseService=========add t=========");
    }
    
    /**
     * @param t 
     */
    @Override
    public void update(T t) {
        log.info("=========BaseService=========update t=========");
    }
    
}


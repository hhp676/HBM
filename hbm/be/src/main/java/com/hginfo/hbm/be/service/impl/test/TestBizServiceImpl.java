package com.hginfo.hbm.be.service.impl.test;

import com.hginfo.hbm.base.service.test.TestBizService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 基础业务service实现类。
 * Date: 2016年11月21日 下午6:02:30 <br/>
 * @param <T> 实体
 * @author shichenqgun
 */
public class TestBizServiceImpl<T> extends TestBaseServiceImpl<T> implements TestBizService<T> {
    
    private Log log = LogFactory.getLog(TestBaseServiceImpl.class);
    
    /**
     * @param t 
     */
    @Override
    public void delete(T t) {
        log.info("=========BizServiceImpl=========delete t=========");
    }
}


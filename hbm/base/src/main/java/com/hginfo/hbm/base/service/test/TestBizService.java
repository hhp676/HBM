package com.hginfo.hbm.base.service.test;

/**
 * 基础业务service接口。
 * @param <T> 实体类型
 * @author shichegnqun
 */
public interface TestBizService<T> extends TestBaseService<T> {
    
    /**
     * @param t 
     */
    void delete(T t);
}


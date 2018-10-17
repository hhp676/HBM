package com.hginfo.hbm.base.service.test;

/**
 * 基础service接口。
 * @param <T> 实体类型
 * @author shichegnqun
 */
public interface TestBaseService<T> {
    
    /**
     * 新增。
     * @param t 实体
     */
    void add(T t);
    
    /**
     * 修改。
     * @param t 实体
     */
    void update(T t);
    
    
}

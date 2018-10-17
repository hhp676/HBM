package com.hginfo.hbm.base.service.test;
import com.hginfo.hbm.base.entity.test.FeUser;

/**
 * 测试。
 * @author shichenqgun
 */
public interface FeUserService extends TestBizService<FeUser> {
    
    /**
     * 测试validate。
     * @param o 
     * @param o1 
     */
    void testValid(FeUser o, FeUser o1);
    
    /**
     * 测试。
     * @param o 
     */
    void test(FeUser o);
    
    
    /**
     * 测试无参数。
     */
    void test();
    
    /**
     * 测试有参数。
     * @param userName 
     */
    void test(String userName);
    
    /**
     * 测试异常。
     */
    void testEx();
    
    /**
     * 测试获取dao、mapper信息。
     */
    void testGetDao();
}


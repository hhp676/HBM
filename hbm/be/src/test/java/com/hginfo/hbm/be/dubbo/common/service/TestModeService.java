
package com.hginfo.hbm.be.dubbo.common.service;

/**
 * dubbo demo。
 * date: 2016年10月14日 下午3:43:06 <br/>
 */
public interface TestModeService {
 
    public void test();

    void testCallback(TestModeCallback callback);
}


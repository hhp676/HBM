/**
 * Project Name:hbm-Identityid
 * File Name:IdentityidForSingle.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午10:37:21
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.identityid;

import java.util.concurrent.atomic.AtomicInteger;

import com.hginfo.hutils.Constants;

/**
 * 单机唯一ID生成实现类。
 * ClassName:IdentityidForSingle <br/>
 * Date: 2016年10月14日 上午10:37:21 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class IdentityidSingle implements Identityid {
    
    /**
     * 
     */
    private static AtomicInteger atomicInc            = new AtomicInteger(
        (new java.util.Random()).nextInt());
    
    /**
     * 基础时间。
     */
    private static final Long    BENCHMARK_TIME       = 476862781000L;
    
    /**
     * 19位最大数做与操作 00000000 00000111 11111111 11111111。
     */
    private static final int     INCNUMBER_AND_NUMBER = 524287;
    
    /**
     * 生成方法：13位毫秒时间戳+6位循环自增数。
     */
    @Override
    public long getIdentityid() {
        long identityid = (System.currentTimeMillis() - BENCHMARK_TIME) << Constants.TWENTY;
        int incNumber = atomicInc.getAndIncrement();
        return identityid | (incNumber & INCNUMBER_AND_NUMBER);
        
    }
    
}

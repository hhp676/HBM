/**
 * Project Name:hbm-generic
 * File Name:Identityid.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午10:34:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.identityid;

/**
 * 唯一ID生成工厂类。
 * ClassName:identityidFactory <br/>
 * Date: 2016年10月14日 上午10:34:20 <br/>
 * @author licheng
 */
public interface Identityid {
    
    /**
     * 获取生成的唯一ID。
     * @author licheng
     * @return 唯一ID
     * @since V1.0.0
     */
    long getIdentityid();

    
}

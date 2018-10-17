/**
 * Project Name:hbm-core
 * File Name:AspectOrderConstants.java
 * Package Name:com.hginfo.hbm.core.constants
 * Date:2017年2月27日下午6:22:41
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.constants;
/**
 * 切面顺序的常量类。
 * Date: 2017年2月27日 下午6:22:41 <br/>
 * @author shichengqun
 */
public final class AspectOrderConstants {
    
    
    /**
     * 动态切换数据源切面的order=1，比事务提前。
     */
    public static final int ORDER_DATASOURCE = 1;
    
    
    /**
     * userlog校验aop的切面order=90。
     */
    public static final int ORDER_USERLOG = 90;
    
    
    /**
     * 
     * Creates a new instance of AspectOrderConstants.
     *
     */
    private AspectOrderConstants() {
    }
    
}


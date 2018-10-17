/**
 * Project Name:hbm-be
 * File Name:FunctionInterface.java
 * Package Name:com.hginfo.hbm.be.test
 * Date:2016年11月30日下午3:09:09
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.test;

/**
 * ClassName:FunctionInterface <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年11月30日 下午3:09:09 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
@FunctionalInterface
public interface FunctionInterface {
    
     Long test();
    
     default void test2(){
        
    }
    
}

/**
 * Project Name:hbm-fe-core
 * File Name:FrontEndUtil.java
 * Package Name:com.hginfo.hbm.fe.core.utils
 * Date:2017年5月25日下午7:09:56
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.utils;

import com.hginfo.hbm.base.vo.FrontEndType;

/**
 * 前端类型工具类。
 * ClassName:FrontEndUtil <br/>
 * Date: 2017年5月25日 下午7:09:56 <br/>
 * @author licheng
 */
public final class FrontEndUtil {
    
    /**
     * 当前前端类型。
     */
    private static FrontEndType curFrontEndType = FrontEndType.easyui;
    
    public static FrontEndType getCurFrontEndType() {
        return curFrontEndType;
    }
    
    public static void setCurFrontEndType(FrontEndType frontEndType) {
        curFrontEndType = frontEndType;
    }
    
    /**
     * 根据字符设置当前前端类型。
     * @author licheng
     * @param curFrontEndType 前端类型
     * @since V1.0.0
     */
    public static void setCurFrontEndType(String curFrontEndType) {
        setCurFrontEndType(FrontEndType.valueOf(curFrontEndType));
    }
    
    /**
     * Creates a new instance of FrontEndUtil.
     */
    private FrontEndUtil() {
        
    }
}

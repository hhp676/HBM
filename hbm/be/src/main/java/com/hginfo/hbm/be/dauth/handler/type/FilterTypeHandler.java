/**
 * Project Name:hbm-be
 * File Name:FilterTypeHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.type
 * Date:2017年2月16日上午10:05:47
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.type;

import java.util.HashMap;
import java.util.Map;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;

/**
 * 过滤类型处理器接口。
 * ClassName:FilterTypeHandler <br/>
 * Date: 2017年2月16日 上午10:05:47 <br/>
 * @author shichengqun
 */
public abstract class FilterTypeHandler {
    
    /**
     * 存过滤类型code与handler的对应关系。
     */
    private static Map<String, FilterTypeHandler> handlerMap = new HashMap<>();
    
    /**
     * 过滤类型处理方法，处理完成后设置item.dauthSqlField。
     * @param item 过滤器项
     */
    public abstract void hander(DauthFilterItemBean item);
    
    /**
     * 添加handler。
     * @param filterTypeCode 过滤类型code
     * @param handler 处理器
     */
    public static void addHandler(String filterTypeCode, FilterTypeHandler handler) {
        handlerMap.put(filterTypeCode, handler);
    }
    
    /**
     * 添加handler。
     * @param filterTypeCode 过滤类型code
     * @return handler 处理器
     */
    public static FilterTypeHandler getHandler(String filterTypeCode) {
        return handlerMap.get(filterTypeCode);
    }
}


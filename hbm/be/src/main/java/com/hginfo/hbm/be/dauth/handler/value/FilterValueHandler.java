/**
 * Project Name:hbm-be
 * File Name:FilterValueHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.type
 * Date:2017年2月16日上午10:05:47
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.value;

import java.util.HashMap;
import java.util.Map;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;

/**
 * 过滤器值处理器接口。
 * ClassName:FilterValueHandler <br/>
 * Date: 2017年2月16日 上午10:05:47 <br/>
 * @author shichengqun
 */
public abstract class FilterValueHandler {
    
    /**
     * 存过滤器值类型与handler的对应关系。
     */
    private static Map<Integer, FilterValueHandler> handlerMap = new HashMap<>();
    
    /**
     * 过滤器值处理方法，处理完成后设置item.dauthSqlValue。
     * @param item 过滤器项
     */
    public abstract void hander(DauthFilterItemBean item);
    
    
    /**
     * 添加handler。
     * @param filterValueType 过滤器值类型
     * @param handler 处理器
     */
    public static void addHandler(Integer filterValueType, FilterValueHandler handler) {
        handlerMap.put(filterValueType, handler);
    }
    
    /**
     * 添加handler。
     * @param filterValueType 过滤器值类型
     * @return handler 处理器
     */
    public static FilterValueHandler getHandler(Integer filterValueType) {
        return handlerMap.get(filterValueType);
    }
}


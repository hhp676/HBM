/**
 * Project Name:hbm-be
 * File Name:FilterOperatorHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.operator
 * Date:2017年2月18日上午10:24:40
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.operator;

import java.util.HashMap;
import java.util.Map;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;

/**
 * 运算符处理器。
 * Date: 2017年2月18日 上午10:24:40 <br/>
 * @author shichengqun
 */
public abstract class FilterOperatorHandler {
    
    /**
     * 存运算符value与handler的对应关系。
     */
    private static Map<String, FilterOperatorHandler> handlerMap = new HashMap<>();
    
    /**
     * 运算符处理方法。
     * 1、处理完成后设置item.dauthSql
     * 2、返回此过滤器项 一定满足数据权限、一定不满足数据权限、需sql解析
     * @param item 过滤器项
     * @return 1：一定满足数据权限 ;-1:一定不满足数据权限 ; 0:需sql解析
     */
    public abstract int hander(DauthFilterItemBean item);
    
    
    /**
     * 添加handler。
     * @param operatorValue 运算符值
     * @param handler 处理器
     */
    public static void addHandler(String operatorValue, FilterOperatorHandler handler) {
        handlerMap.put(operatorValue, handler);
    }
    
    /**
     * 添加handler。
     * @param operatorValue 运算符值
     * @return handler 处理器
     */
    public static FilterOperatorHandler getHandler(String operatorValue) {
        return handlerMap.get(operatorValue);
    }
}


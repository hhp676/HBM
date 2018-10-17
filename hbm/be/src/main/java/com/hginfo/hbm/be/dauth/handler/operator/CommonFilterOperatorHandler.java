/**
 * Project Name:hbm-be
 * File Name:CommonFilterOperatorHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.operator
 * Date:2017年2月18日上午10:42:08
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.operator;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;

/**
 * 通用运算符解析器。
 * Date: 2017年2月18日 上午10:42:08 <br/>
 * @author shichengqun
 */
@Component
public class CommonFilterOperatorHandler extends FilterOperatorHandler {
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_EQUAL, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_NOTEQUAL, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_GREATER, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_GREATEROREQUAL, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_LESS, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_LESSOREQUAL, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_IN, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_NOTIN, this);
    }
    
    @Override
    public int hander(DauthFilterItemBean item) {
        //不做处理，交由freemarker进行sql拼接。
        return SysDauthConstants.DAUTH_OPERATOR_RESULT_SQLPARSE;
    }
}


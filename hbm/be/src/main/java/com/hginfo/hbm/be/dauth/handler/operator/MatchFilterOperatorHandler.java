/**
 * Project Name:hbm-be
 * File Name:MatchFilterOperatorHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.operator
 * Date:2017年2月18日上午11:45:49
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.operator;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;

/**
 * 符合、不符合  运算符处理器。
 * Date: 2017年2月18日 上午11:45:49 <br/>
 * @author shichengqun
 */
@Component
public class MatchFilterOperatorHandler extends FilterOperatorHandler {
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_MATCH, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_NOTMATCH, this);
    }
    @Override
    public int hander(DauthFilterItemBean item) {
        if (SysDauthConstants.DAUTH_FILTER_OPERATOR_MATCH.equals(item.getOperatorValue())) {
            item.setDauthSql(item.getDauthSqlValue());
        } else {
            item.setDauthSql("!(" + item.getDauthSqlValue() + ")");
        }
        return SysDauthConstants.DAUTH_OPERATOR_RESULT_SQLPARSE;
    }
}


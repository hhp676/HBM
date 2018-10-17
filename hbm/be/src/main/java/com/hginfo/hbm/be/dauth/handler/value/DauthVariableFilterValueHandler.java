/**
 * Project Name:hbm-be
 * File Name:DauthVariableFilterValueHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.value
 * Date:2017年2月16日下午7:52:15
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.value;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.be.service.impl.sys.SysDauthVariableServiceImpl;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 数据权限变量处理器。
 * Date: 2017年2月16日 下午7:52:15 <br/>
 * @author shichengqun
 */
@Component
public class DauthVariableFilterValueHandler extends FilterValueHandler {
    
    /**
     * 
     */
    private static Log log = LogFactory.getLog(DauthVariableFilterValueHandler.class);

    /**
     * 
     */
    @Autowired
    private SysDauthVariableServiceImpl sysDauthVariableServiceImpl;
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterValueHandler.addHandler(SysDauthConstants.FILTER_VALUE_TYPE_DAUTH_VARIABLE, this);
    }
    
    @Override
    public void hander(DauthFilterItemBean item) {
        try {
            item.setDauthSqlValue(sysDauthVariableServiceImpl
                .get(Long.parseLong(item.getFilterValue())).getVariableValue());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new DauthParseException(SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_VARIABLEFAIL, e);
        }
        
    }

}


/**
 * Project Name:hbm-be
 * File Name:CommonFilterValueHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.value
 * Date:2017年2月16日下午7:40:38
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.value;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;

/**
 * 通用处理器。
 * Date: 2017年2月16日 下午7:40:38 <br/>
 * @author shichengqun
 */
@Component
public class CommonFilterValueHandler extends FilterValueHandler {
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterValueHandler.addHandler(SysDauthConstants.FILTER_VALUE_TYPE_CUSTOM_SQL, this);
        FilterValueHandler.addHandler(SysDauthConstants.FILTER_VALUE_TYPE_CUSTOM_VALUE, this);
        FilterValueHandler.addHandler(SysDauthConstants.FILTER_VALUE_TYPE_POSITION, this);
        FilterValueHandler.addHandler(SysDauthConstants.FILTER_VALUE_TYPE_JOB, this);
    }
    
    @Override
    public void hander(DauthFilterItemBean item) {
        item.setDauthSqlValue(item.getFilterValue());
    }
    
}


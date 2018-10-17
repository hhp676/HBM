/**
 * Project Name:hbm-be
 * File Name:CurrentUserFilterValueHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.value
 * Date:2017年2月17日下午4:21:13
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.value;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;

/**
 * 当前用户处理。
 * Date: 2017年2月17日 下午4:21:13 <br/>
 * @author shichengqun
 */
@Component
public class CurrentUserFilterValueHandler extends FilterValueHandler {
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterValueHandler.addHandler(SysDauthConstants.FILTER_VALUE_TYPE_CURRUSER, this);
    }

    @Override
    public void hander(DauthFilterItemBean item) {
        item.setDauthSqlValue(Long.toString(CurrentUserUtils.getUserId()));        
    }

}


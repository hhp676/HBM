/**
 * Project Name:hbm-be
 * File Name:NoFieldFilterTypeHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.type
 * Date:2017年2月17日下午6:40:41
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.type;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;

/**
 * 无字段处理器。
 * Date: 2017年2月17日 下午6:40:41 <br/>
 * @author shichengqun
 */
@Component
public class NoFieldFilterTypeHandler extends FilterTypeHandler {

    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterTypeHandler.addHandler(SysDauthConstants.DAUTH_FILTER_TYPE_NOFIELD, this);
    }
    
    @Override
    public void hander(DauthFilterItemBean item) {
        //无字段的，即为直接拼接用户自定义sql，暂不处理。
    }

}


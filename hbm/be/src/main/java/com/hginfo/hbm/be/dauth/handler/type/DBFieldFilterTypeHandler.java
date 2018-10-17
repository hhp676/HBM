/**
 * Project Name:hbm-be
 * File Name:DBFieldFilterTypeHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.type
 * Date:2017年2月16日上午10:31:26
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.type;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;

/**
 * 数据库字段 类型 处理。
 * Date: 2017年2月16日 上午10:31:26 <br/>
 * @author shichengqun
 */
@Component
public class DBFieldFilterTypeHandler extends FilterTypeHandler {
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterTypeHandler.addHandler(SysDauthConstants.DAUTH_FILTER_TYPE_NUMBERFIELD, this);
        FilterTypeHandler.addHandler(SysDauthConstants.DAUTH_FILTER_TYPE_STRINGFIELD, this);
    }
    
    @Override
    public void hander(DauthFilterItemBean item) {
        item.setDauthSqlField(item.getTableAlias() + "." + item.getFieldColumnName());
    }
}


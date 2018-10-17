/**
 * Project Name:hbm-be
 * File Name:CurrentUserPositionFilterTypeHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.type
 * Date:2017年2月17日下午4:29:42
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.type;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.be.service.impl.sys.SysUserPositionServiceImpl;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hutils.StringUtil;

/**
 * 当前用户岗位处理器。
 * Date: 2017年2月17日 下午4:29:42 <br/>
 * @author shichengqun
 */
@Component
public class CurrentUserPositionFilterTypeHandler extends FilterTypeHandler {

    /**
     * 
     */
    @Autowired
    private SysUserPositionServiceImpl sysUserPositionServiceImpl;
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterTypeHandler.addHandler(SysDauthConstants.DAUTH_FILTER_TYPE_CURRENTUSERPOSITION, this);
    }
    
    @Override
    public void hander(DauthFilterItemBean item) {
        SysUserPosition filter = new SysUserPosition();
        filter.setUserId(CurrentUserUtils.getUserId());
        List<SysUserPosition> userPositions = sysUserPositionServiceImpl.getList(filter); 
        if (userPositions != null && !userPositions.isEmpty()) {
            List<Long> userPositionIds = userPositions.stream().map(SysUserPosition::getPositionId)
                .collect(Collectors.toList());
            item.setDauthSqlField(StringUtil.join(userPositionIds, SysDauthConstants.DAUTH_TEMP_VAR_SEPARATOR));
            return;
        }
        throw new DauthParseException(SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_USERPOSITIONFAIL);
    }
}


/**
 * Project Name:hbm-be
 * File Name:SysTokenServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月25日下午7:18:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysToken;
import com.hginfo.hbm.base.service.sys.SysTokenService;
import com.hginfo.hbm.be.dao.sys.SysTokenDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.IdentitiesUtil;

import java.util.Date;

/**
 * SysTokenServiceImpl.
 * ClassName:SysTokenServiceImpl <br/>
 * Date: 2016年11月25日 下午7:18:59 <br/>
 * @author licheng
 * @since V1.0.0
 */
@HService
public class SysTokenServiceImpl extends BizService<SysToken, SysTokenDao> implements SysTokenService {

    /**
     * 默认Token失效时间为3天.
     */
    private static final int DEFAULT_TIMEOUT = 3600 * 24 * 3;
    
    @Override
    public boolean isValidToken(SysToken sysToken) {
        if (sysToken == null || sysToken.getAccountId() == null
            || sysToken.getTokenSign() == null) {
            return false;
        }
        SysToken result = getDao().selectOne(sysToken);
        if (result == null
            || DateTimeUtil.compareDate(new Date(), result.getDueTime()) == Constants.ONE) {
            return false;
        }
        return true;
    }
    
    @Override
    public SysToken createToken(Long accountId) {
        //TODO 获取系统配置默认token有效期
        return createToken(accountId, DEFAULT_TIMEOUT);
    }
    
    @Override
    public SysToken createToken(Long accountId, int timeout) {
        SysToken newToken = this.getNewEntity();
        newToken.setAccountId(accountId);
        newToken.setTokenSign(IdentitiesUtil.uuid());
        newToken.setDueTime(DateTimeUtil.getNewDate(new Date(), timeout));
        this.add(newToken);
        return newToken;
    }
    
}

/*
 * Project Name:hbm-be.
 * File Name:SysVariableServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年08月15日 下午7:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysVariable;
import com.hginfo.hbm.base.service.sys.SysVariableService;
import com.hginfo.hbm.be.dao.sys.SysVariableDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.ObjectAndByteUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.encrypt.HexUtil;
import com.hginfo.hutils.encrypt.RSAUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.bouncycastle.util.encoders.Hex;

import java.security.KeyPair;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

/**
 * 系统变量：K-V类型。: sys_variable. <br />
 * service impl 层 <br />
 * Date: 2017年08月15日 下午7:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysVariableServiceImpl extends RelService<SysVariable, SysVariableDao>
        implements SysVariableService {

    private static final Log LOGGER = LogFactory.getLog(SysVariableServiceImpl.class);

    @Override
    public SysVariable get(String key) {
        SysVariable query = new SysVariable();
        query.setVarKey(key);
        List<SysVariable> list = this.getList(query);
        return (list.isEmpty()) ? null : list.get(Constants.ZERO);
    }

    @Override
    public SysVariable getForUpdate(String key) {
        SysVariable query = new SysVariable();
        query.setVarKey(key);
        List<SysVariable> list = this.getList("getListForUpdate",query);
        return (list.isEmpty()) ? null : list.get(Constants.ZERO);
    }

    @Override
    public byte[] doGetRSAKeyPair() {
        byte[] bytes = null;
        String rsaKeyPairKey = "rsaKeyPair";
        SysVariable variable = getForUpdate(rsaKeyPairKey);
        if (variable == null) {
            throw new BaseRuntimeException("数据库中没有找到:" + rsaKeyPairKey);
        }
        if (StringUtil.isEmpty(variable.getVarValue())) {
            RSAUtil.getKeyPairGen().initialize(RSAUtil.getKeySize(),
                    new SecureRandom(DateFormatUtils.format(new Date(), "yyyyMMdd").getBytes()));
            KeyPair keyPair = RSAUtil.getKeyPairGen().generateKeyPair();
            bytes = ObjectAndByteUtil.toByteArray(keyPair);
            String oneKeyPairStr = HexUtil.toHexString(bytes);
            variable.setVarValue(oneKeyPairStr);
            update(variable);
        } else {
            bytes = HexUtil.toByteArray(variable.getVarValue());
        }
        return bytes;
    }


}

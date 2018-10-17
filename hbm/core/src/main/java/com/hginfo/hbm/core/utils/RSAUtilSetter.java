package com.hginfo.hbm.core.utils;

import com.hginfo.hbm.base.service.sys.SysVariableService;
import com.hginfo.hutils.ObjectAndByteUtil;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.encrypt.RSAUtil;

import java.security.KeyPair;

/**
 * Created by licheng on 2017/8/17.
 */
public class RSAUtilSetter {

    /***
     *
     */
    private static SysVariableService sysVariableService;


    /**
     * 获取配置的系统变量服务。
     *
     * @return value
     * @author licheng
     * @since V1.0.0
     */
    private static SysVariableService getSysVariableService() {
        if (sysVariableService == null) {
            sysVariableService = SpringContextUtil.getBean(SysVariableService.class);
        }
        return sysVariableService;
    }

    /**
     * 重写RSA密钥对的获取方式，保持分布式环境下的密钥的一致性。
     * 从数据库获取rsaKeyPair。
     * 返回RSA密钥对。
     *
     * @return 密钥对
     * @author licheng
     * @since V1.0.0
     */
    public static void setKeyPair() {
        byte[] bytes = getSysVariableService().doGetRSAKeyPair();
        KeyPair keyPair = (KeyPair) ObjectAndByteUtil.toObject(bytes);
        RSAUtil.setOneKeyPair(keyPair);
    }

}

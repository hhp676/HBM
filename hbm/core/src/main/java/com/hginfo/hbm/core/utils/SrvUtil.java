package com.hginfo.hbm.core.utils;

import com.hginfo.hbm.base.entity.srv.SrvInterface;

/**
 * 接口工程工具类。
 * Created by licheng on 2017-6-16.
 */
public class SrvUtil {

    /**
     * 获取接口缓存KEY值。
     * @param srvInterface 接口对象
     * @return key
     */
    public static String getInterfaceCacheKey(SrvInterface srvInterface){
        return String.format("%s-%s-%s",srvInterface.getClassName(),srvInterface.getMethodName(),srvInterface.getParameters());
    }
}

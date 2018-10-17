package com.hginfo.hbm.srv.toolkit;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.core.cache.CacheUtils;
import com.hginfo.hbm.core.constants.CacheConstants;
import com.hginfo.hbm.core.utils.SrvUtil;
import com.hginfo.hutils.Constants;
import com.hginfo.hutils.SpringContextUtil;

import java.lang.reflect.Method;
import java.util.Map;

/**
 * Created by licheng on 2017-6-15.
 */
public class InterfaceUtil {

    /***
     *
     */
    private static SrvInterfaceService srvInterfaceService;

    /**
     * 获取接口服务对象。
     * @author licheng
     * @return SrvInterfaceService
     * @since V1.0.0
     */
    public static SrvInterfaceService getsrvInterfaceService() {
        if (srvInterfaceService == null) {
            srvInterfaceService = SpringContextUtil.getBean(SrvInterfaceService.class);
        }
        return srvInterfaceService;
    }

    /**
     * 是否允许方法访问。
     * @param method 当前请求控制器方法
     * @return
     */
    public static boolean isAccess(Method method){
        String queryKey = SrvUtil.getInterfaceCacheKey(getInterfaceByMethod(method));
        Map<String,SrvInterface> cache = CacheUtils.get(CacheConstants.SRV,CacheConstants.SRV_INTERFACE_DATALIST,Map.class);
        if (cache ==null || cache.isEmpty()){
            cache = getsrvInterfaceService().updateCache();
        }
        if (cache.containsKey(queryKey)){
            if (cache.get(queryKey).getIfSwitch() == Constants.ONE){
                return true;
            }
        }
        return false;
    }

    /**
     * 通过方法获取接口对象。
     * @param method
     * @return
     */
    public static SrvInterface getInterfaceByMethod(Method method){
        SrvInterface srvInterface = new SrvInterface();
        srvInterface.setClassName( method.getDeclaringClass().getName());
        srvInterface.setMethodName( method.getName());
        srvInterface.setParameters(UrlMappingUtil.getUniqueMethodParameter(method.getParameters()));
        return srvInterface;
    }


}

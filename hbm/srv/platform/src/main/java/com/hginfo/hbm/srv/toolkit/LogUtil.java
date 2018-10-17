package com.hginfo.hbm.srv.toolkit;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvLogService;
import com.hginfo.hutils.SpringContextUtil;

/**
 * Created by licheng on 2017-6-16.
 */
public class LogUtil {

    /***
     *
     */
    private static SrvLogService srvLogService;

    /**
     * 获取接口日志服务对象。
     * @author licheng
     * @return SrvInterfaceService
     * @since V1.0.0
     */
    public static SrvLogService getSrvLogService() {
        if (srvLogService == null) {
            srvLogService = SpringContextUtil.getBean(SrvLogService.class);
        }
        return srvLogService;
    }

    /**
     * 保存调用日志。
     */
    public static void saveSrvLog(SrvLog srvLog){
        getSrvLogService().add(srvLog);
    }
}

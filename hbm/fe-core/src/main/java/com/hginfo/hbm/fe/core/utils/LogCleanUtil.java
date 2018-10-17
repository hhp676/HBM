package com.hginfo.hbm.fe.core.utils;

import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysLogService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.SpringContextUtil;

import java.util.Date;

/**
 * 日期清理工具。
 * Created by licheng.
 */
public class LogCleanUtil {

    private static SysLogService sysLogService;

    /**
     * 最近一次检测时间（用于自动清理过期的系统日志）。
     */
    private static Date lastCheckTime = DateTimeUtil.addDays(new Date(), -1);

    /**
     * 获取日志服务。
     *
     * @return value
     * @author licheng
     * @since V1.0.0
     */
    public static SysLogService getSysLogService() {
        if (sysLogService == null) {
            sysLogService = SpringContextUtil.getBean(SysLogService.class);
        }
        return sysLogService;
    }

    public static void cleanSysLog() {
        Date now = new Date();
        //是否需要检测。
        if ((now.getTime() - lastCheckTime.getTime()) < Constants.THREE
                * Constants.SECONDS_PER_HOUR * Constants.NUMBER_1000) {
            return;
        }
        lastCheckTime = now;
        getSysLogService().doClean();
    }

}

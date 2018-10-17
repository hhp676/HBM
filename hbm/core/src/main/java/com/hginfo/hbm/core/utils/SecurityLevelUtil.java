package com.hginfo.hbm.core.utils;

import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hutils.PasswordUtil;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.password.CheckResult;

/**
 * Created by licheng on 2017/9/1.
 */
public class SecurityLevelUtil {

    private static SysConfigService sysConfigService;


    public static CheckResult checkPassword(String loginName, String password){

        int validLevel = Constants.ONE;
        if (sysConfigService == null) {
            sysConfigService = SpringContextUtil.getBean(SysConfigService.class);
        }
        validLevel = Integer.parseInt(sysConfigService.getProperty(Constants.SYS_SECURITY_LEVEL));
        return PasswordUtil.check(password,loginName, validLevel);
    }

}

/**
 * Project Name:hbm-core
 * File Name:SysLogAspect.java
 * Package Name:com.hginfo.hbm.core.aspect
 * Date:2017年1月19日下午7:33:01
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import com.hginfo.hbm.base.service.sys.SysLogService;
import com.hginfo.hbm.core.annotation.SysLog;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 系统日志注解切面。
 * ClassName:SysLogAspect
 * Date: 2017年1月19日 下午7:33:01 <br/>
 * @author licheng
 */
@Aspect
@Component
public class SysLogAspect {
    
    /**
     * 
     */
    private Log                  log = LogFactory.getLog(SysLogAspect.class);
    
    /**
     * 
     */
    private static final int KEY_MAX_LENGTH = 255;
    
    /**
     * 
     */
    private static SysLogService sysLogService;
    
    /**
     * 系统日志注解切面。
     * @author licheng
     * @param joinPoit joinPoit
     * @param sysLog sysLog
     * @since V1.0.0
     */
    @After(value = "@annotation(sysLog)")
    public void saveSysLog(JoinPoint joinPoit, SysLog sysLog) {
        try {
            
            
            sysLogService = sysLogService == null ? SpringContextUtil.getBean(SysLogService.class)
                : sysLogService;
            
            com.hginfo.hbm.base.entity.sys.SysLog entity = new com.hginfo.hbm.base.entity.sys.SysLog();
            entity.setTenantId(sysLog.tenantId());
            entity.setLogType(sysLog.logType());
            entity.setKey1(StringUtil.left(sysLog.key1(), KEY_MAX_LENGTH));
            entity.setKey2(StringUtil.left(sysLog.key2(), KEY_MAX_LENGTH));
            entity.setKey3(StringUtil.left(this.objArgs2Str(joinPoit.getArgs()), KEY_MAX_LENGTH));
            entity
                .setKey4(StringUtil.left(joinPoit.getTarget().getClass().getName(), KEY_MAX_LENGTH));
            entity.setKey5(StringUtil.left(joinPoit.getSignature().getName(), KEY_MAX_LENGTH));
            entity.setContent(sysLog.content());
            sysLogService.add(entity);
        } catch (Exception ex) {
            log.error(ex.getMessage(), ex);
        }
        
    }
    
    /**
     * 参数转字符串。
     * @author licheng
     * @param objects objects
     * @return string
     * @since V1.0.0
     */
    private String objArgs2Str(Object[] objects) {
        
        String str = "";
        if (objects == null) {
            return str;
        }
        try {
            for (Object obj : objects) {
                
                str += obj.toString();
            }
        } catch (Exception e) {
        }
        return str;
    }
    
}

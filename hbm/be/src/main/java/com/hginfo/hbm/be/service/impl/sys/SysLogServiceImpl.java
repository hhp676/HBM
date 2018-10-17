/*
 * Project Name:hbm-be.
 * File Name:SysLogServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月29日 上午10:31:34
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.Date;

import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.sys.SysLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.base.service.sys.SysLogService;
import com.hginfo.hbm.be.dao.sys.SysLogDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.FtpUtil;

/**
 * 系统日志表: sys_log. <br />
 * service impl 层 <br />
 * Date: 2016年12月29日 上午10:31:34 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysLogServiceImpl extends RelService<SysLog, SysLogDao> implements SysLogService {
    
    /**
     * 最近一次检测时间（用于自动清理过期的系统日志）。
     */
    private static Date        lastCheckTime = new Date();
    
    /**
     * 
     */
    @Autowired
    private SysConfigService   sysConfigService;
    
    /**
     * 
     */
    @Autowired
    private SysUserServiceImpl sysUserServiceImpl;
    
    /**
     */
    private Log                log           = LogFactory.getLog(getClass());
    
    @Override
    public Page<SysLog> getPageList(BasePage<SysLog> pageInfo, SysLog filter) {
        Page<SysLog> list = super.getPageList(pageInfo, filter);
        sysUserServiceImpl.setRelCrtUser(list.getResult());
        return list;
    }
    
    @Override
    public void add(SysLog e) {
        try {
            doChkAndClean();
            addTrans(e);
        } catch (Exception ex) {
            log.error(ex.getMessage());
        }
    }
    
    /**
     * TODO 事务无法独立。
     * add By Independent Transactional。
     * @param e entity
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void addTrans(SysLog e) {
        super.add(e);
    }
    
    /**
     * 检测并清理日志,默认超过6小时才处理一次。
     * @author licheng
     * @since V1.0.0
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void doChkAndClean() {
        Date now = new Date();
        //强制设置最后检测时间。
        //lastCheckTime = DateTimeUtil.getBackDayOfDay(-1);
        if ((now.getTime() - lastCheckTime.getTime()) < Constants.FIVE
            * Constants.SECONDS_PER_HOUR * Constants.NUMBER_1000) {
            return;
        }
        doClean();
    }


    /**
     * 清理日志,默认超过6小时才处理一次。
     * @author licheng
     * @since V1.0.0
     */
    @Override
    public void doClean(){
        Date now = new Date();
        int day = Constants.TEN;
        try {
            day = Integer
                    .parseInt(sysConfigService.getProperty(Constants.SYS_CONFIG_SYSLOG_TIMEOUT));
        } catch (Exception ex) {
        }

        Date maxTime = DateTimeUtil.getBackDayOfDay(now, 0 - day);
        String hql = String.format("delete %s where crtTime < ? ", SysLog.class.getName());
        this.getDao().executeHql(hql, new Object[] {maxTime });
        lastCheckTime = now;
    }
}

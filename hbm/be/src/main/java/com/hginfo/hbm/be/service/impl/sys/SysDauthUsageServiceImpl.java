/*
 * Project Name:hbm-be.
 * File Name:SysDauthUsageServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年01月19日 上午11:51:19
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.Date;

import com.hginfo.hbm.base.entity.sys.SysDauthUsage;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthUsageService;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.dao.sys.SysDauthUsageDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限应用表: sys_dauth_usage. <br />
 * service impl 层 <br />
 * Date: 2017年01月19日 上午11:51:19 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthUsageServiceImpl extends BizService<SysDauthUsage, SysDauthUsageDao>
        implements SysDauthUsageService {
    
    @Override
    public Page<SysDauthUsage> getPageList(BasePage<SysDauthUsage> basePage, SysDauthUsage filter) {
        SysDauthUsage realFilter = filter == null ? new SysDauthUsage() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, realFilter);
        
    }
    
    /**
     * 根据methodName获取。
     * @param methodName 方法名。
     * @return 数据
     */
    public SysDauthUsage getDauthUsage(String methodName) {
        return getDao().getDauthUsage(methodName);
    }
    
    /**
     * 根据mothodName获取dauthCode,当方法未配置权限时为null。
     * @param methodName 方法名
     * @return dauthCode 
     */
    public String getDauthCodeByMethodName(String methodName) {
        return getDao().getDauthCodeByMethodName(methodName);
    }
    
    /**
     * 把所有数据设置为不再用。
     */
    public void setAllInvalid() {
        getDao().setAllInvalid();
    }
    
    
    /**
     * 添加原始数据。
     * @param e 
     */
    public void addOriginalUsage(SysDauthUsage e) {
        e.setIsDelete(0);
        e.setCrtUserId(Constants.SUPER_ID);
        e.setUpdUserId(Constants.SUPER_ID);
        e.setCrtTime(new Date());
        e.setUpdTime(new Date());
        getDao().save(e);
    }
    /**
     * 修改原始数据。<br>
     * 暂不记录修改时间(每次程序启动都修改)----否则修改时间无意义
     * @param e 
     */
    public void updateOriginalUsage(SysDauthUsage e) {
        getDao().update(e);
    }
    
    
    @Override
    public void deleteUsageDauth(long usageId) {
        SysDauthUsage usage = new SysDauthUsage();
        usage.setUsageId(usageId);
        usage.setUpdUserId(CurrentUserUtils.getUserId());
        usage.setUpdTime(new Date());
        Updater<SysDauthUsage> updater = new Updater<SysDauthUsage>(usage);
        updater.include("dauthId");
        this.updateByUpdater(updater, usage); 
    }
}

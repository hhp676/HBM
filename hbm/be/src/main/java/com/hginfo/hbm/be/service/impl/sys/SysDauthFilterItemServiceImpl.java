/*
 * Project Name:hbm-be.
 * File Name:SysDauthFilterItemServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月30日 上午9:41:02
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysDauthFilterItem;
import com.hginfo.hbm.base.entity.sys.SysDauthVariable;
import com.hginfo.hbm.base.entity.sys.SysJob;
import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthFilterItemService;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.dao.sys.SysDauthFilterItemDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.NumberUtil;

/**
 * 数据权限过滤器项: sys_dauth_filter_item. <br />
 * service impl 层 <br />
 * Date: 2016年12月30日 上午9:41:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthFilterItemServiceImpl extends BizService<SysDauthFilterItem, SysDauthFilterItemDao>
        implements SysDauthFilterItemService {
    
    /**
     * 
     */
    @Autowired
    private SysDauthVariableServiceImpl sysDauthVariableServiceImpl;
    
    /**
     * 
     */
    @Autowired
    private SysPositionServiceImpl sysPositionServiceImpl;
    
    /**
     * 
     */
    @Autowired
    private SysJobServiceImpl sysJobServiceImpl;

    @Override
    public Page<SysDauthFilterItem> getPageList(BasePage<SysDauthFilterItem> basePage,
        SysDauthFilterItem filter, final String... loadProps) {
        
        SysDauthFilterItem realFilter = filter == null ? new SysDauthFilterItem() : filter;
        realFilter.setIsDelete(0);
        
        Page<SysDauthFilterItem> page = super.getPageList(basePage, filter);
        List<SysDauthFilterItem> itemList = page.getResult();
        for (SysDauthFilterItem item : itemList) {
            convertBean(item);
        }
        return page;
    }
    
    /**
     * 修改，包括field即使为null。
     * @param sysDauthFilterItem bean
     */
    @Override
    public void updateIncludeField(SysDauthFilterItem sysDauthFilterItem) {
        sysDauthFilterItem.setUpdUserId(CurrentUserUtils.getUserId());
        sysDauthFilterItem.setUpdTime(new Date());
        Updater<SysDauthFilterItem> updater = new Updater<>(sysDauthFilterItem);
        updater.include("fieldId");
        this.updateByUpdater(updater, sysDauthFilterItem);
    }
    
    /**
     * 对filterItem的部分数据封装。
     * @param item 
     */
    public void convertBean(SysDauthFilterItem item) {
        item.setFilterValueStr(item.getFilterValue());
        int valueType = item.getValueType() == null ? -1 : item.getValueType();
        if (SysDauthConstants.FILTER_VALUE_TYPE_DAUTH_VARIABLE == valueType) {
            if (!NumberUtil.isNaN(item.getFilterValue())) {
                SysDauthVariable variable = sysDauthVariableServiceImpl.get(Long.parseLong(item.getFilterValue()));
                item.setFilterValueStr(variable == null ? "" : variable.getVariableName());
            }
        } else if (SysDauthConstants.FILTER_VALUE_TYPE_POSITION == valueType) {
            String positionIds = item.getFilterValue() == null ? "" : item.getFilterValue();
            String[] ids = positionIds.split(",");
            String positionNames = "";
            SysPosition position = null;
            for (String id : ids) {
                if (!NumberUtil.isNaN(id)) {
                    position = sysPositionServiceImpl.get(Long.parseLong(id));
                    positionNames += position == null ? "" : "," + position.getPositionName();
                }
            }
            item.setFilterValueStr(positionNames.length() > 0 ? positionNames.substring(1) : positionNames);
        } else if (SysDauthConstants.FILTER_VALUE_TYPE_JOB == valueType) {
            String jobIds = item.getFilterValue() == null ? "" : item.getFilterValue();
            String[] ids = jobIds.split(",");
            String jobNames = "";
            SysJob job = null;
            for (String id : ids) {
                if (!NumberUtil.isNaN(id)) {
                    job = sysJobServiceImpl.get(Long.parseLong(id));
                    jobNames += job == null ? "" : "," + job.getJobName();
                }
            }
            item.setFilterValueStr(jobNames.length() > 0 ? jobNames.substring(1) : jobNames);
        }
    }
}

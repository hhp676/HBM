/*
 * Project Name:hbm-be.
 * File Name:SysDauthOperatorSupportServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysDauthOperatorSupport;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthOperatorSupportService;
import com.hginfo.hbm.be.dao.sys.SysDauthOperatorSupportDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 数据权限运算符支持表: sys_dauth_operator_support. <br />
 * service impl 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthOperatorSupportServiceImpl extends BizService<SysDauthOperatorSupport, SysDauthOperatorSupportDao>
    implements SysDauthOperatorSupportService {
    
    /**
     * 
     */
    @Autowired
    private SysDictServiceImpl sysDictServiceImpl;
    
    @Override
    public List<SysDictItem> getDauthValueTypes(long filterTypeId, long operatorId) {
        List<Integer> valueTypeList = getDao().getDauthValueTypes(filterTypeId, operatorId);
        
        List<SysDictItem> itemList = sysDictServiceImpl.getItemList(DictConstants.DICT_FILTER_VALUE_TYPE);
        
        return itemList.stream().filter(item -> {
            return valueTypeList.contains(Integer.parseInt(item.getItemValue()));
        }).collect(Collectors.toList());
    }
    
    @Override
    public Page<SysDauthOperatorSupport> getPageList(BasePage<SysDauthOperatorSupport> basePage,
        SysDauthOperatorSupport filter) {
        SysDauthOperatorSupport realFilter = filter == null ? new SysDauthOperatorSupport() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, realFilter);
        
    }
}

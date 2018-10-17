/*
 * Project Name:hbm-be.
 * File Name:SysDauthServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年01月12日 下午6:28:35
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysDauth;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysDauthService;
import com.hginfo.hbm.be.dao.sys.SysDauthDao;
import com.hginfo.hbm.be.dauth.bean.DauthFilterGroupBean;
import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.be.dauth.handler.operator.FilterOperatorHandler;
import com.hginfo.hbm.be.dauth.handler.type.FilterTypeHandler;
import com.hginfo.hbm.be.dauth.handler.value.FilterValueHandler;
import com.hginfo.hbm.be.dauth.parse.DauthSqlParse;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.SysDauthUtil;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;

/**
 * 数据权限表: sys_dauth. <br />
 * service impl 层 <br />
 * Date: 2017年01月12日 下午6:28:35 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysDauthServiceImpl extends BizService<SysDauth, SysDauthDao>
        implements SysDauthService {
    
    /**
     * 
     */
    private static Log log = LogFactory.getLog(SysDauthServiceImpl.class);
    
    /**
     * 
     */
    @Autowired
    private DauthSqlParse dauthSqlParse;

    @Override
    public Page<SysDauth> getPageList(BasePage<SysDauth> basePage, SysDauth filter) {
        SysDauth realFilter = filter == null ? new SysDauth() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, realFilter);
        
    }
    
    
    /**
     * 获取数据权限所有的过滤器项。
     * @param dauthId dauthId
     * @return 过滤器项
     */
    public List<DauthFilterItemBean> getDauthFilterItemList(long dauthId) {
        return getDao().getDauthFilterItemList(dauthId);
    }
    
    @Override
    public String parseDauth(long dauthId, long userId) {
        
        //在方法的开始设置当前用户为userId，方法结束为原来用户Id，一定注意此处理是成对维护的。
        long currUserId = CurrentUserUtils.getUserId();
        CurrentUserUtils.setUserId(userId);
        try {
            SysDauth dauth = this.get(dauthId);
            return this.getDauthSQL(dauth.getDauthCode(), true);
        } finally {
            CurrentUserUtils.setUserId(currUserId);
        }
    }
    /**
     * 根据数据权限code获取数据权限SQL。
     * @param dauthCode 数据权限code
     * @param isThrowException 是否抛出异常。  数据权限校验功能 : 需要抛出异常；具体数据权限拦截 : 不抛出异常
     * @return 数据权限SQL
     */
    public String getDauthSQL(String dauthCode, boolean isThrowException) {
        
        //如果不启用数据权限，则直接返回 1=1
        if (!SysDauthUtil.isDauthFlagValid()) {
            return SysDauthConstants.DAUTH_DEFAULT_SQL;
        }
        
        //如果是超级管理员，则直接返回 1=1
        if (SysDauthUtil.getSysAccountService().isSuperAdmin(CurrentUserUtils.getUserId())) {
            return SysDauthConstants.DAUTH_DEFAULT_SQL;
        }
        
        //如果dauthCode是空，则返回 1!=1
        if (StringUtil.isEmpty(dauthCode)) {
            return SysDauthConstants.DAUTH_NODAUTH_SQL;
        }
        
        List<DauthFilterGroupBean> dbGroupList = getDao().getDauthFilterGroupList(dauthCode);
        List<DauthFilterGroupBean> groupList = new ArrayList<>(); 
        if (dbGroupList != null && !dbGroupList.isEmpty()) {
            int opHandlerResult;
            for (DauthFilterGroupBean group : dbGroupList) {
                List<DauthFilterItemBean> itemList = getDao().getDauthFilterItemList(group.getFilterGroupId());
                if (itemList != null && !itemList.isEmpty()) {
                    for (DauthFilterItemBean item : itemList) {
                        try {
                            FilterTypeHandler.getHandler(item.getFilterTypeCode()).hander(item);
                            FilterValueHandler.getHandler(item.getValueType()).hander(item);
                            opHandlerResult = FilterOperatorHandler.getHandler(item.getOperatorValue()).hander(item);
                        } catch (Exception e) {
                            //数据权限校验功能  需要 抛出异常，从而进行提示；具体数据权限拦截时不抛出异常，认为此规则组不通过
                            opHandlerResult = SysDauthConstants.DAUTH_OPERATOR_RESULT_NOPASS;
                            if (isThrowException) {
                                if (e instanceof DauthParseException) {
                                    throw e;
                                } else {
                                    throw new DauthParseException(
                                        SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_DEFAULT, e);
                                }
                            } else {
                                log.error(e.getMessage(), e);
                            }
                        }
                        //如果此项不满足，则整个group都不会满足
                        if (SysDauthConstants.DAUTH_OPERATOR_RESULT_NOPASS == opHandlerResult) {
                            group.setFalseFlag(true);
                            break;
                        }
                    }
                    //如果需要sql解析，则group设置itemList
                    if (group.getFalseFlag() == null || !group.getFalseFlag()) {
                        group.setFilterItemBeanList(itemList);
                    }
                    groupList.add(group);
                }
            }
        }
        log.info("dauthCode:" + dauthCode + ", 对应数据权限组：" + Arrays.toString(groupList.toArray()));
        if (groupList != null && !groupList.isEmpty()) {
            return dauthSqlParse.parseSql(groupList);
        }
        return SysDauthConstants.DAUTH_DEFAULT_SQL;
    }
    
}

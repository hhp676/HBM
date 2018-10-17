/**
 * Project Name:hbm-be
 * File Name:ContainsFilterOperatorHandler.java
 * Package Name:com.hginfo.hbm.be.dauth.handler.operator
 * Date:2017年2月18日上午10:41:30
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.handler.operator;

import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hutils.CollectionsUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 存在、不存在 运算符解析器。
 * Date: 2017年2月18日 上午10:41:30 <br/>
 * @author shichengqun
 */
@Component
public class ContainsFilterOperatorHandler extends FilterOperatorHandler {
    
    /**
     * 初始化。
     */
    @PostConstruct
    private void init() {
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_CONTAINS, this);
        FilterOperatorHandler.addHandler(SysDauthConstants.DAUTH_FILTER_OPERATOR_NOTCONTAINS, this);
    }
    
    
    
    @Override
    public int hander(DauthFilterItemBean item) {
        
        /*
         * 1、过滤器项的过滤类型解析中要求：除无字段类型的，其他类型的都要求 dauthSqlField不能为空；
         * 2、只处理dauthSqlField与dauthSqlValue非空情况
         * 3、默认返回不满足数据权限
         */
        String fields = item.getDauthSqlField();
        String values = item.getDauthSqlValue();
        if (StringUtil.isNotEmpty(fields) && StringUtil.isNotEmpty(values)) {
            List<String> fieldList = Arrays.asList(fields.split(SysDauthConstants.DAUTH_TEMP_VAR_SEPARATOR));
            List<String> valueList = Arrays.asList(values.split(SysDauthConstants.DAUTH_TEMP_VAR_SEPARATOR));
            List<String> subsList = CollectionsUtil.subtract(valueList, fieldList);
            boolean isContain = false;
            //如果相减后size与原来不相等，则有相同项，则为符合。
            if (subsList.size() != valueList.size()) {
                isContain = true;
            }
            
            boolean containsFlag = isContain
                && SysDauthConstants.DAUTH_FILTER_OPERATOR_CONTAINS.equals(item.getOperatorValue());
            
            boolean notContainsFlag = !isContain
                && SysDauthConstants.DAUTH_FILTER_OPERATOR_NOTCONTAINS.equals(item.getOperatorValue());
            
            //如果实际结果是匹配 且 运算符是匹配 ，则返回1=1；如果实际结果是不匹配 且 运算符是不匹配 ，则返回1=1；
            if (containsFlag || notContainsFlag) {
                item.setDauthSql(SysDauthConstants.DAUTH_DEFAULT_SQL);
                return SysDauthConstants.DAUTH_OPERATOR_RESULT_PASS;
            }
        }
        item.setDauthSql(SysDauthConstants.DAUTH_NODAUTH_SQL);
        return SysDauthConstants.DAUTH_OPERATOR_RESULT_NOPASS;
    }
    
}


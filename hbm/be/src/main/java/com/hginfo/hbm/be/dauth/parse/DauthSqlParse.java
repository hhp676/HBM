/**
 * Project Name:hbm-be
 * File Name:DauthSqlParse.java
 * Package Name:com.hginfo.hbm.be.dauth.parse
 * Date:2017年2月18日下午12:00:45
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.parse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.hginfo.hbm.be.dauth.bean.DauthFilterGroupBean;
import com.hginfo.hbm.be.freemarker.BeFreeMarkerFactory;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

import freemarker.template.Template;

/**
 * 数据权限的SQL解析器。
 * Date: 2017年2月18日 下午12:00:45 <br/>
 * @author shichengqun
 */
@Component
public class DauthSqlParse {
    
    /**
     * 
     */
    private static Log log = LogFactory.getLog(DauthSqlParse.class);
    
    /**
     * freemarker factory。
     */
    @Autowired
    private BeFreeMarkerFactory freeMarkerFactory;
    
    /**
     * 数据权限sql模板。
     */
    private Template dauthSqlTemplate;
    
    /**
     * 初始化加载sql模板。
     * @throws Exception 加载模板异常
     */
    @PostConstruct
    private void init() throws Exception {
        dauthSqlTemplate = freeMarkerFactory.getTemplate(SysDauthConstants.DAUTH_SQL_PARSE_TEMPLATE);
    }
    
    /**
     * 数据权限的解析。
     * @param groupList 数据权限的组信息
     * @return 返回数据权限解析后的sql
     */
    public String parseSql(List<DauthFilterGroupBean> groupList) {
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("groupList", groupList);
            return FreeMarkerTemplateUtils.processTemplateIntoString(dauthSqlTemplate, map);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new DauthParseException(SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_DEFAULT, e);
        }
    }
    
    
}


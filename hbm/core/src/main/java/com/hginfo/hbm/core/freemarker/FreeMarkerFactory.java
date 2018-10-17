/**
 * Project Name:hbm-core
 * File Name:FreeMarkerFactory.java
 * Package Name:com.hginfo.hbm.core.freemarker
 * Date:2017年2月20日上午11:24:02
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.core.freemarker;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.exception.BaseRuntimeException;
import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 用来返回freemarker 模板的。
 * Date: 2017年2月20日 上午11:24:02 <br/>
 * @author shichengqun
 */
public class FreeMarkerFactory {
    
    /**
     * 
     */
    private static Log log = LogFactory.getLog(FreeMarkerFactory.class);
    
    /**
     * 
     */
    private Configuration configuration;
    
    /**
     * 返回freemarker模板。
     * @param name 
     * @return 模板
     */
    public Template getTemplate(String name) {
        try {
            return configuration.getTemplate(name);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new BaseRuntimeException(e.getMessage());
        }
    }

    public void setConfiguration(Configuration configuration) {
        this.configuration = configuration;
    }
    
    
    
}


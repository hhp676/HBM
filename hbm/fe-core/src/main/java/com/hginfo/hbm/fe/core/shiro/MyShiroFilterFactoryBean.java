/**
 * Project Name:oa-core
 * File Name:MyShiroFilterFactoryBean.java
 * Package Name:com.hongguaninfo.hgdf.adp.shiro.filter
 * Date:2016年10月13日上午10:55:16
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
*/

package com.hginfo.hbm.fe.core.shiro;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.FilterChainManager;
import org.apache.shiro.web.filter.mgt.FilterChainResolver;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.BeanInitializationException;

/**
 * 重写ShiroFilterFactoryBean的目的是为了重写ShiroHttpServletResponse;
 * 重写ShiroHttpServletResponse实现去掉页面跳转中URL中带的jsessionid=xxx...
 * ClassName:MyShiroFilterFactoryBean <br/>
 * Date:     2016年10月13日 上午10:55:16 <br/>
 * @author   henry
 * @since    V2.6.0
 */
public class MyShiroFilterFactoryBean extends ShiroFilterFactoryBean {
    
    @Override
    public Class getObjectType() {
        return MySpringShiroFilter.class;
    }
    
    @Override
    protected AbstractShiroFilter createInstance() throws Exception {
        
        SecurityManager securityManager = getSecurityManager();
        if (securityManager == null) {
            String msg = "SecurityManager property must be set.";
            throw new BeanInitializationException(msg);
        }
        
        if (!(securityManager instanceof WebSecurityManager)) {
            String msg = "The security manager does not implement the WebSecurityManager interface.";
            throw new BeanInitializationException(msg);
        }
        
        FilterChainManager manager = createFilterChainManager();
        
        PathMatchingFilterChainResolver chainResolver = new PathMatchingFilterChainResolver();
        chainResolver.setFilterChainManager(manager);
        
        return new MySpringShiroFilter((WebSecurityManager) securityManager, chainResolver);
    }
    
    /**
     * ClassName: MySpringShiroFilter.
     */
    private static final class MySpringShiroFilter extends AbstractShiroFilter {
        
        /**
         * Creates a new instance of MySpringShiroFilter.
         * @param webSecurityManager webSecurityManager
         * @param resolver resolver
         */
        protected MySpringShiroFilter(WebSecurityManager webSecurityManager,
            FilterChainResolver resolver) {
            super();
            if (webSecurityManager == null) {
                throw new IllegalArgumentException("WebSecurityManager property cannot be null.");
            }
            setSecurityManager(webSecurityManager);
            if (resolver != null) {
                setFilterChainResolver(resolver);
            }
        }
        
        @Override
        protected ServletResponse wrapServletResponse(HttpServletResponse orig,
            ShiroHttpServletRequest request) {
            return new MyShiroHttpServletResponse(orig, getServletContext(), request);
        }
    }
}

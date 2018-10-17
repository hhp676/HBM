/**
 * Project Name:hbm-fe-core
 * File Name:DefaultFilter.java
 * Package Name:com.hginfo.hbm.fe.core.filter
 * Date:2016年10月27日下午3:31:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 默认过滤器，
 * 已经添加xss过滤。
 * ClassName:DefaultFilter <br/>
 * Date: 2016年10月27日 下午3:31:54 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class DefaultFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // init
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {
        chain.doFilter(new DefaultHttpServletRequestWrapper((HttpServletRequest) request), response);
        
    }
    
    @Override
    public void destroy() {
        // destory
    }
    
}

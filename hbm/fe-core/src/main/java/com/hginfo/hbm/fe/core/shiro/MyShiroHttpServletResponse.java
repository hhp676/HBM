/**
 * Project Name:oa-core
 * File Name:MyShiroHttpServletResponse.java
 * Package Name:com.hongguaninfo.hgdf.adp.shiro.filter
 * Date:2016年10月13日上午10:53:14
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
*/

package com.hginfo.hbm.fe.core.shiro;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.ShiroHttpServletResponse;

/**
 * 重写ShiroHttpServletResponse实现去掉页面跳转中URL中带的jsessionid=xxx...
 * ClassName:MyShiroHttpServletResponse <br/>
 * Date:     2016年10月13日 上午10:53:14 <br/>
 * @author   henry
 * @since    V2.6.0
 */
public class MyShiroHttpServletResponse extends ShiroHttpServletResponse {
    
    /**
     * Creates a new instance of MyShiroHttpServletResponse.
     * @param wrapped wrapped
     * @param context context
     * @param request request
     */
    public MyShiroHttpServletResponse(HttpServletResponse wrapped, ServletContext context,
        ShiroHttpServletRequest request) {
        super(wrapped, context, request);
    }
    
    @Override
    protected String toEncoded(String url, String sessionId) {
        if ((url == null) || (sessionId == null)) {
            return (url);
        }
        
        String path = url;
        String query = "";
        String anchor = "";
        int question = url.indexOf('?');
        if (question >= 0) {
            path = url.substring(0, question);
            query = url.substring(question);
        }
        int pound = path.indexOf('#');
        if (pound >= 0) {
            anchor = path.substring(pound);
            path = path.substring(0, pound);
        }
        StringBuilder sb = new StringBuilder(path);
        sb.append(anchor);
        sb.append(query);
        return (sb.toString());
    }
}

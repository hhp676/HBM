/**
 * Project Name:hbm-fe-bootstrap
 * File Name:BlockTag.java
 * Package Name:com.hginfo.hbm.fe.bs.tag
 * Date:2017年1月3日下午2:52:53
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.tag;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.hginfo.hutils.StringUtil;

/**
 * JSP模版继承：BlockTag。
 * ClassName:BlockTag <br/>
 * Date: 2017年1月3日 下午2:52:53 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class BlockTag extends BodyTagSupport {
    
    /**
     * @since V1.0.0
     */
    private static final long serialVersionUID = -5159395435201872564L;
    
    /**
     * 占位模块名称。
     */
    private String            name;
    
    @Override
    public int doStartTag() throws JspException {
        return super.doStartTag();
    }
    
    @Override
    public int doEndTag() throws JspException {
        ServletRequest request = pageContext.getRequest();
        //block标签中的默认值
        String defaultContent = (getBodyContent() == null) ? ""
            : getBodyContent().getString();
        String bodyContent = (String) request.getAttribute(OverrideTag.PREFIX + name);
        //如果页面没有重写该模块则显示默认内容
        bodyContent = StringUtil.isEmpty(bodyContent) ? defaultContent
            : bodyContent;
        try {
            pageContext.getOut().write(bodyContent);
        } catch (IOException e) {
        }
        return super.doEndTag();
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
}

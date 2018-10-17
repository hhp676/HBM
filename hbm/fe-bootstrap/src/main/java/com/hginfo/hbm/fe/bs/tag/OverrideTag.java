/**
 * Project Name:hbm-fe-bootstrap
 * File Name:OverrideTag.java
 * Package Name:com.hginfo.hbm.fe.bs.tag
 * Date:2017年1月3日下午3:15:37
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.tag;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.hginfo.hutils.StringUtil;

/**
 * JSP模版继承：OverrideTag。
 * ClassName:OverrideTag <br/>
 * Date: 2017年1月3日 下午3:15:37 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class OverrideTag extends BodyTagSupport {
    /**
     * @since V1.0.0
     */
    private static final long  serialVersionUID = -2047682170385813077L;
    
    /**
     * 模块名的前缀。
     */
    public static final String PREFIX           = "JspTemplateBlockName_";
    
    /**
     * 模块名。
     */
    private String             name;
    
    @Override
    public int doStartTag() throws JspException {
        return super.doStartTag();
    }
    
    @Override
    public int doEndTag() throws JspException {
        ServletRequest request = pageContext.getRequest();
        //标签内容
        BodyContent bodyContent = getBodyContent();
        request.setAttribute(PREFIX + name, StringUtil.trim(bodyContent.getString()));
        return super.doEndTag();
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
}

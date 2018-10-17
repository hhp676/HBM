package com.hginfo.hbm.fe.core.spring;

import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ServletModelAttributeMethodProcessor;

import javax.servlet.ServletRequest;

/**
 * Created by licheng on 2017/8/11.
 */
public class HgServletModelAttributeMethodProcessor extends ServletModelAttributeMethodProcessor {

    private String[] disallowedFields = new String[]{"orderStr", "filterStr"};

    public HgServletModelAttributeMethodProcessor() {
        super(true);
    }

    @Override
    protected void bindRequestParameters(WebDataBinder binder, NativeWebRequest request) {
        ServletRequest servletRequest = request.getNativeRequest(ServletRequest.class);
        ServletRequestDataBinder servletBinder = (ServletRequestDataBinder) binder;
        servletBinder.setDisallowedFields(disallowedFields);
        servletBinder.bind(servletRequest);
    }


}

/**
 * Project Name:hbm-fe-core
 * File Name:HgWebSessionManager.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2017年5月26日下午4:43:23
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro;

import java.io.Serializable;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.core.utils.FrontEndUtil;

/**
 * ClassName:HgWebSessionManager <br/>
 * Date: 2017年5月26日 下午4:43:23 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
public class HgWebSessionManager extends DefaultWebSessionManager {
    
    /**
     * Creates a new instance of SessionManager.
     */
    public HgWebSessionManager() {
        super();
    }
    
    @Override
    protected Serializable getSessionId(ServletRequest request, ServletResponse response) {
        
        if (FrontEndUtil.getCurFrontEndType() != FrontEndType.srv) {
            return super.getSessionId(request, response);
        }
        
        /**
         * SRV项目：如果HEADRE中包含“sessionId”参数，则使用此sid会话。
         */
        String sessionId = ((HttpServletRequest) request).getHeader("sessionId");
        if (sessionId != null && !"".equals(sessionId)) {
            //设置当前session状态
            request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID_SOURCE,
                ShiroHttpServletRequest.URL_SESSION_ID_SOURCE);
            request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID, sessionId);
            request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID_IS_VALID,
                Boolean.TRUE);
            return sessionId;
        } else {
            return super.getSessionId(request, response);
        }
        
    }
    
}

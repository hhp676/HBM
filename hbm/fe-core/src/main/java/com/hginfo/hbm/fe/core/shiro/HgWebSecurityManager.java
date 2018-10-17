/**
 * Project Name:hbm-fe-core
 * File Name:HgWebSecurityManager.java
 * Package Name:com.hginfo.hbm.fe.core.shiro
 * Date:2017年5月24日下午7:48:48
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.core.shiro;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.SubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.subject.WebSubject;

import com.hginfo.hbm.core.profile.ProfileScope;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 继承WebSecurityManager，处理当前用户Id。
 * 
 * Date: 2017年5月24日 下午7:48:48 <br/>
 * @author shichengqun
 */
public class HgWebSecurityManager extends DefaultWebSecurityManager {
    
    /**
     */
    private static Log log = LogFactory.getLog(HgWebSecurityManager.class);
    
    /**
     * 
     * Creates a new instance of HgWebSecurityManager.
     *
     */
    public HgWebSecurityManager() {
        super();
    }

    /**
     * 
     * Creates a new instance of HgWebSecurityManager.
     *
     * @param singleRealm 单个realm
     */
    public HgWebSecurityManager(Realm singleRealm) {
        super(singleRealm);
    }

    /**
     * 
     * Creates a new instance of HgWebSecurityManager.
     *
     * @param realms 多个realm
     */
    public HgWebSecurityManager(Collection<Realm> realms) {
        super(realms);
    }
    
    
    
    /**
     * 保存当前请求相关信息。
     * <p>1、当前用户ID（通过spring拦截器的形式，shiro的filter中有service调用时，dubbo下通过CurrentUserUtils获取当前用户ID获取不到）
     * @see org.apache.shiro.mgt.DefaultSecurityManager#createSubject(org.apache.shiro.subject.SubjectContext)
     */
    @Override
    public Subject createSubject(SubjectContext subjectContext) {
        Subject subject = super.createSubject(subjectContext);
        CurrentUserUtils.setUserId(SessionUtils.getUserId(subject));
        log.info("当前用户ID:" + CurrentUserUtils.getUserId());
        // 重置当前线程的scope数据。
        // qiujingde add at 2016-12-14 15:53
        ProfileScope.reset();
        
        // 重置当前线程的本地化代码。
        I18nUtil.clearCurrentLocale();
        I18nUtil.setCurrentLocale((HttpServletRequest) ((WebSubject) subject).getServletRequest());
        log.info("当前本地化代码:" + I18nUtil.getCurrentLocale());
        
        return subject;
    }
}


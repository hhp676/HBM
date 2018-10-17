/**
 * Project Name:hbm-be
 * File Name:DauthServiceInterceptor.java
 * Package Name:com.hginfo.hbm.be.dauth.interceptor
 * Date:2017年2月23日下午2:01:31
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.interceptor;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.be.dauth.annotation.DauthUpdateValidate;
import com.hginfo.hbm.be.dauth.annotation.DauthUpdateValidate.DauthUpdateValidates;
import com.hginfo.hbm.be.dauth.utils.DauthThreadContext;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * 处理service上配置的数据权限code。
 * @author shichengqun
 */
@Aspect
@Component
public class DauthServiceInterceptor {
    
    /**
     */
    private static Log log = LogFactory.getLog(DauthServiceInterceptor.class); 
    
    /**
     * 单个关系切点表达式。
     */
    private static final String VALIDATE_POINTCUT_SINGLE = "execution(* *..service..impl..*.*(..))"
        + " && @annotation(validate)";
    
    /**
     * 多个关系切点表达式。
     */
    private static final String VALIDATE_POINTCUT_MULTIPLE = "execution(* *..service..impl..*.*(..))"
        + " && @annotation(validates)";
    
    /**
     * 绑定实体与权限关系。
     * @param point 切点
     * @param validate 实体权限关联
     */
    @Before(value = VALIDATE_POINTCUT_SINGLE)
    public void singleBefore(JoinPoint point, DauthUpdateValidate validate) {
        Signature s = point.getSignature();
        Object target = point.getTarget();
        String methodName = target.getClass().getCanonicalName() + "." + s.getName();
        log.info("Service方法为：" + methodName + ", 实体数据权限关系：" + validate);
        
        bindEntityDauthCode(validate);
    }
    
    /**
     * 绑定实体与权限关系。
     * @param point 切点
     * @param validates 实体权限关联组
     */
    @Before(value = VALIDATE_POINTCUT_MULTIPLE)
    public void multipleBefore(JoinPoint point, DauthUpdateValidates validates) {
        Signature s = point.getSignature();
        Object target = point.getTarget();
        String methodName = target.getClass().getCanonicalName() + "." + s.getName();
        log.info("Service方法为：" + methodName + ", 实体数据权限关系：" + validates);
        
        if (validates.value() == null || validates.value().length == 0) {
            throw new BaseRuntimeException("@DauthUpdateValidates 的 value 不能为空！");
        }
        
        DauthUpdateValidate[] duvs = validates.value();
        for (DauthUpdateValidate validate : duvs) {
            bindEntityDauthCode(validate);
        }
    }
    
    /**
     * 解除实体与权限关系。
     * @param point 切点
     * @param validate 实体权限关联
     */
    @After(value = VALIDATE_POINTCUT_SINGLE)
    public void singleAfter(JoinPoint point, DauthUpdateValidate validate) {
        Signature s = point.getSignature();
        Object target = point.getTarget();
        String methodName = target.getClass().getCanonicalName() + "." + s.getName();
        log.info("Service方法为：" + methodName + ", 实体数据权限关系：" + validate);
        
        unBindEntityDauthCode(validate);
    }
    
    /**
     * 解除实体与权限关系。
     * @param point 切点
     * @param validates 实体权限关联
     */
    @After(value = VALIDATE_POINTCUT_MULTIPLE)
    public void multipleAfter(JoinPoint point, DauthUpdateValidates validates) {
        Signature s = point.getSignature();
        Object target = point.getTarget();
        String methodName = target.getClass().getCanonicalName() + "." + s.getName();
        log.info("Service方法为：" + methodName + ", 实体数据权限关系：" + validates);
        
        DauthUpdateValidate[] duvs = validates.value();
        for (DauthUpdateValidate validate : duvs) {
            unBindEntityDauthCode(validate);
        }
    }
    
    /**
     * 绑定实体与数据权限的关系。
     * @param validate 注解
     */
    private void bindEntityDauthCode(DauthUpdateValidate validate) {
        if (validate.entityClass() == null || StringUtil.isEmptyOrBlank(validate.dauthCode())) {
            throw new BaseRuntimeException("@DauthUpdateValidate 的 entityClass 与 dauthCode 不能为空：" + validate);
        }
        String dauthCode = DauthThreadContext.getEntityDauthCode(validate.entityClass().getCanonicalName());
        if (StringUtil.isNotEmpty(dauthCode)) {
            throw new BaseRuntimeException("@DauthUpdateValidate 的 entityClass 与 dauthCode 不能重复绑定：" + validate);
        }
        DauthThreadContext.bindEntityDauthCode(validate.entityClass().getCanonicalName(), validate.dauthCode());
    }
    
    /**
     * 解除绑定实体与数据权限的关系。
     * @param validate 注解
     */
    private void unBindEntityDauthCode(DauthUpdateValidate validate) {
        DauthThreadContext.unBindEntityDauthCode(validate.entityClass().getCanonicalName());
    }
    
}


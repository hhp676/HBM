package com.hginfo.hbm.fe.core.interceptor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 防止重复提交注解，用于方法上.<br/>
 * 在新建页面方法上，设置needSaveToken()为true，此时拦截器会在Session中保存一个token， 同时需要在新建的页面中添加
 * <input type="hidden" name="submitToken" value="${submitToken}">
 * 保存方法需要验证重复提交的，设置needRemoveToken为true 此时会在拦截器中验证是否重复提交
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RepeatSubmitToken {

    /**
     * removeToken:(移除token值). <br/>
     * @author yinyanzhen
     * @return boolean
     * @since V1.0.0
     */
    boolean removeToken() default false;
}

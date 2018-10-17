/*
 * Project Name:hbm-generic
 * File Name:I18nUtil.java
 * Package Name:com.hginfo.hbm.generic.core.base.utils
 * Date:2016年10月14日上午9:38:03
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */


package com.hginfo.hbm.core.utils;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import static com.hginfo.hutils.SpringContextUtil.getCurrentRequest;

/**
 * 本地化工具类.
 * ClassName: I18nUtil <br/>
 * date: 2016年10月14日 上午9:38:03 <br/>
 *
 * 调整人：qiujingde <br />
 * 调整时间：2017年02月27日 <br/>
 * 调整内容：dubbo模式下本地化代码无法直接从上下文中取到，改成在传递参数的时候，同时传递本地化代码。< br />
 *
 * @author licheng
 * @author qiujingde
 * @version V1.0.0
 * @since V1.0.0
 */

public final class I18nUtil {

    /**
     * 日志。
     */
    private static final Log LOG = LogFactory.getLog(I18nUtil.class);

    /**
     * 从cookie中获取本地化代码的解析器。
     */
    private static CookieLocaleResolver localeResolver;

    /**
     * 当前线程的本地代码缓存。<br />
     * 当前线程值的设置方式有3种途径： <br />
     * 1.在web应用的上下文中，每次请求时，应该remove当前线程的值。后续获取时，会触发initValue方法，即使用Cookie
     *   解析器从请求的上下文中获取。<br />
     * 2.在dubbo模式下，请求处理前应该从参数中获取对应的值。<br />
     * 3.web请求或dubbo请求处理过程中产生的子线程都会从父线程中继承该值。<br />
     */
    private static final ThreadLocal<Locale> CURRENT_LOCALE = new InheritableThreadLocal<Locale>();

    /**
     * 默认构造方法设为私有，防止工具类实例化。
     */
    private I18nUtil() { }

    /**
     * 获取当前线程中缓存的本地化代码。
     * @return 本地化代码
     */
    public static Locale getCurrentLocale() {
        Locale locale = CURRENT_LOCALE.get();
        return locale == null ? Locale.getDefault() : locale;
    }

    /**
     * 重置当前线程的值。
     */
    public static void clearCurrentLocale() {
        CURRENT_LOCALE.remove();
    }

    /**
     * 设置当前线程缓存的本地化代码。
     * @param locale 本地化代码
     */
    public static void setCurrentLocale(Locale locale) {
        CURRENT_LOCALE.set(locale);
    }
    
    /**
     * 根据当前请求设置当前线程缓存的本地化代码。
     */
    public static void setCurrentLocale() {
        setCurrentLocale(getCurrentRequest());
    }
    
    /**
     * 根据request设置当前线程缓存的本地化代码。
     * @param request request
     */
    public static void setCurrentLocale(HttpServletRequest request) {
        CURRENT_LOCALE.set(getLocaleResolver().resolveLocale(request));
        
    }

    /**
     * 获取当前上下文的语言代码的内容。
     * @param messageCode 语言代码
     * @return 内容
     * @since V1.0.0
     */
    public static String getMessage(String messageCode) {
        Locale locale = Locale.getDefault();
        try {
            locale = getCurrentLocale();
        } catch (IllegalStateException e) {
            LOG.warn("未设置当前线程的本地化代码，且无法从请求上下文中获取！");
        }
        
        return getMessage(messageCode, locale);
    }
    
    /**
     * 获取当前上下文的语言代码的内容。
     * @param messageCode 语言代码
     * @param locale 本地化
     * @return 内容
     * @since V1.0.0
     */
    public static String getMessage(String messageCode, Locale locale) {
        return SpringContextUtil.getContext().getMessage(messageCode, null, locale);
    }


    /**
     * 从spring上下文中获取本地化代码解析器。<br />
     * 该解析器基于Cookie实现，只有在web上下文中才能正常工作。
     * @return 本地化代码解析器。
     */
    private static CookieLocaleResolver getLocaleResolver() {
        if (localeResolver == null) {
            localeResolver = SpringContextUtil.getBean("localeResolver");
        }
        return localeResolver;
    }
    
}


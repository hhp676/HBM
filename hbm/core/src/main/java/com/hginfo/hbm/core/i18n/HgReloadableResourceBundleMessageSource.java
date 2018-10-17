/*
 * File Name:HgReloadableResourceBundleMessageSource.java
 * Date:2016年10月12日上午11:15:38
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.i18n;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

/**
 * 继承并重写语言解析文件，使其支持语言目录方式加载语言文件。
 * ClassName: HgReloadableResourceBundleMessageSource <br/>
 * date: 2016年10月13日 下午2:44:19 <br/>
 * @author licheng
 * @version V1.0.0
 * @since V1.0.0
 */
public class HgReloadableResourceBundleMessageSource extends ReloadableResourceBundleMessageSource {

    /**
     * 日志。
     */
    private static final Log LOG = LogFactory.getLog(HgReloadableResourceBundleMessageSource.class);

    /**
     * 资源文件列表的初始大小。
     */
    private static final int INIT_LIST_SIZE = 3;
    
    /**
     * properties文件后缀。
     */
    private static final String PROPERTIES_SUFFIX = ".properties";
    
    /**
     * xml文件后缀。
     */
    private static final String XML_SUFFIX        = ".xml";
    
    /**
     * Calculate the filenames for the given bundle basename and Locale,
     * appending language code, country code, and variant code.
     * E.g.: basename "messages", Locale "de_AT_oo" -> "messages_de_AT_OO",
     * "messages_de_AT", "messages_de".
     * <p>Follows the rules defined by {@link java.util.Locale#toString()}.
     * @param basename the basename of the bundle
     * @param locale the locale
     * @return the List of filenames to check
     */
    @Override
    protected List<String> calculateFilenamesForLocale(String basename, Locale locale) {
        List<String> result = new ArrayList<>(INIT_LIST_SIZE);
        String language = locale.getLanguage();
        String country = locale.getCountry();
        String variant = locale.getVariant();
        StringBuilder temp = new StringBuilder(basename);
        
        temp.append('_');
        if (language.length() > 0) {
            temp.append(language);
            result.add(0, temp.toString());
            addDirForLocale(temp.toString(), result);
        }
        
        temp.append('_');
        if (country.length() > 0) {
            temp.append(country);
            result.add(0, temp.toString());
            addDirForLocale(temp.toString(), result);
        }
        
        if (variant.length() > 0 && (language.length() > 0 || country.length() > 0)) {
            temp.append('_').append(variant);
            result.add(0, temp.toString());
        }
        
        return result;
    }
    
    /**
     * 将资源路径前缀作为语言文件目录，获取目录下所有的资源文件作为语言文件。
     * @param resourcePath 路径名称
     * @param result 语言文件集合
     * @since V1.0.0
     */
    private void addDirForLocale(String resourcePath, List<String> result) {
        
        PathMatchingResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
        
        try {
            Resource[] resourcesProperties = resourcePatternResolver
                .getResources(resourcePath + "/**/*" + PROPERTIES_SUFFIX);
            Resource[] resourcesXml = resourcePatternResolver
                .getResources(resourcePath + "/**/*" + XML_SUFFIX);
            resourcesProperties = ArrayUtils.addAll(resourcesProperties, resourcesXml);
            for (Resource resource : resourcesProperties) {
                if (resource.exists()) {
                    String uriPath = resource.getURI().toString();
                    int separateIndex = uriPath.lastIndexOf(".");
                    uriPath = (separateIndex > 0) ? uriPath.substring(0, separateIndex)
                        : uriPath;
                    result.add(uriPath);
                }
            }
        } catch (IOException e) {
            LOG.info("资源文件路径解析错误： " + e.getMessage());
        }
        
    }
}

package com.hginfo.hbm.core.utils;

import com.hginfo.hbm.core.annotation.Config;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.props.PropertiesHelper;
import com.hginfo.hutils.props.PropertyUtil;
import org.springframework.stereotype.Component;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * 配置文件工具类。
 * Created by licheng on 2017/7/31.
 */

public class ConfigUtil {


    /**
     * 工程名。
     */
    private String projectName;

    /**
     * 工程缓存前缀。
     */
    private String redisCachePrefix = null;

    public static final Log LOGGER = LogFactory.getLog(ConfigUtil.class);

    private static ConfigUtil configUtil;

    public static ConfigUtil getInstance() {
        if (configUtil == null) {
            configUtil = new ConfigUtil();
            Properties properties = new Properties();
            try {
                properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
            } catch (IOException e) {
                LOGGER.warn("---- env.properties load fail ! " + e.getMessage());
            }
            configUtil.projectName = properties.getProperty("project.name");
        }
        return configUtil;
    }

    /**
     * 获取工程名称。
     *
     * @return
     */
    public static String getProjectName() {
        return getInstance().projectName;
    }

    /**
     * 获取缓存前缀。
     *
     * @return
     */
    public static String getRedisCachePrefix() {
        return getInstance().redisCachePrefix;
    }

    public static void setRedisCachePrefix(String redisCachePrefix) {
        getInstance().redisCachePrefix = redisCachePrefix;
    }

    public static void setRedisCachePrefixIfNull(String redisCachePrefix) {
        if (getInstance().redisCachePrefix == null){
            getInstance().redisCachePrefix = redisCachePrefix;
        }
    }


    /**
     * 获取缓存前缀全称。
     *
     * @return
     */
    public static String getFullCachePrefix() {
        return String.format("%s:%s:", getProjectName(), getRedisCachePrefix());
    }


}

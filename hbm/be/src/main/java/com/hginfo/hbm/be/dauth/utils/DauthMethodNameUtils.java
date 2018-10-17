package com.hginfo.hbm.be.dauth.utils;

import com.hginfo.hutils.StringUtil;

/**
 * 处理method name相关的工具类。 <br/>
 * Date: 2017年02月10日 下午12:39:47 <br/>
 * @author shichengqun
 */
public class DauthMethodNameUtils {
    
    /**
     * Creates a new instance of SqlNodeUtils.
     */
    private DauthMethodNameUtils() {
    }
    
    /**
     * 获取xx.xxx.xx.method 的简称 xx.method。
     * @param name 全称。
     * @return 简称
     */
    public static String getShortName(String name) {
        //由com.hginfo.xx.xxMapper.method获取xxMapper.method
        if (StringUtil.isNotEmpty(name)) {
            int startIndex = name.substring(0, name.lastIndexOf('.')).lastIndexOf('.');
            return name.substring(startIndex > -1 ? startIndex + 1 : 0);
        }
        return "";
    }
    
    /**
     * 根据xx.xx.xxClass.method，获取xxClass；如果ShortName(只有method)，则返回空串。
     * @param name 
     * @return xxClass
     */
    public static String getMethodClass(String name) {
        if (StringUtil.isNotEmpty(name) && name.indexOf('.') > -1) {
            //由com.hginfo.xx.xxMapper.method获取xxMapper
            int startIndex = name.substring(0, name.lastIndexOf('.')).lastIndexOf('.');
            return name.substring(startIndex > -1 ? startIndex + 1 : 0, name.lastIndexOf('.'));
        }
        return "";
    }
    
}


/**
 * Project Name:hbm-core
 * File Name:SysAuthUtil.java
 * Package Name:com.hginfo.hbm.core.utils
 * Date:2017年3月16日上午9:48:25
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.hginfo.hbm.core.constants.SysAuthConstants;

/**
 * 权限相关工具类。
 * Date: 2017年3月16日 上午9:48:25 <br/>
 * @author shichengqun
 */
public class SysAuthUtil {
    
    
    /**
     * 
     * Creates a new instance of SysAuthUtil.
     *
     */
    private SysAuthUtil() {
        
    }
    
    /**
     * 校验authUris中是否存在与checkUris存在包含关系的。
     * @param authUris
     * @param checkUris
     * @return boolean
     * @since V1.0.0
     */
    public static boolean checkExistRegex(String[] authUris, String[] checkUris) {
        
        return false;
    }
    
    
    /**
     * 校验存在通配符的URL权限 将通配符转成正则表达式，进行比对，校验URI是否存在包含关系。
     *
     * @param authuri 功能权限uri
     * @param checkUri checkUri
     * @return 校验是否成功
     */
    public static boolean checkRegex(String authuri, String checkUri) {
        String regexUri = authuri;
        // STRING_WILDCARD 是字符串通配符  DIGIT_WILDCARD 是数字通配符
        regexUri = regexUri.replace(SysAuthConstants.DIGIT_WILDCARD, SysAuthConstants.DIGIT_PETTERN);
        // %s的只要是个字符串就好了，如果是json格式也无妨，不过不可以随便传'/'
        regexUri = regexUri.replace(SysAuthConstants.STRING_WILDCARD, SysAuthConstants.STRING_PETTERN);
        regexUri = SysAuthConstants.PETTERN_FRONT + regexUri;
        Pattern r = Pattern.compile(regexUri);
        Matcher m = r.matcher(checkUri);
        if (m.find()) {
            String reg = m.group();
            return StringUtils.isNotEmpty(reg) ? checkUri.substring(reg.length()).length() == 0 : false;
        } else {
            return false;
        }
    }
}


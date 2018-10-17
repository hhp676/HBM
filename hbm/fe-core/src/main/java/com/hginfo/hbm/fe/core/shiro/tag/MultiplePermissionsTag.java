/**
 * Project Name:hbm-fe-core
 * File Name:MultiplePermissionsTag.java
 * Package Name:com.hginfo.hbm.fe.core.shiro.tag
 * Date:2017年3月13日下午4:30:30
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro.tag;

import org.apache.shiro.web.tags.PermissionTag;

/**
 * 多个权限校验的tag处理的父类。
 * Date: 2017年3月13日 下午4:30:30 <br/>
 * @author shichengqun
 */
public abstract class MultiplePermissionsTag extends PermissionTag {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 多个权限之间的分隔符“,”。
     */
    private static final String PERMISSION_NAMES_DELIMETER = ",";
    
    
    /**
     * 把权限参数用“,”分割为数组。
     * @param p 权限参数
     * @return 数组
     */
    protected String[] getPermissions(String p) {
        return p.split(PERMISSION_NAMES_DELIMETER);
    }
}


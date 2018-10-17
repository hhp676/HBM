/**
 * Project Name:hbm-fe-easyui
 * File Name:HasAnyPermissionsTag.java
 * Package Name:com.hginfo.hbm.fe.core.shiro.tag
 * Date:2017年3月13日下午3:34:54
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.shiro.tag;

import org.apache.shiro.subject.Subject;

/**
 * 有其中一个权限的tag处理。
 * Date: 2017年3月13日 下午3:34:54 <br/>
 * @author shichengqun
 */
public class HasAnyPermissionsTag extends MultiplePermissionsTag {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected boolean showTagBody(String p) {
        boolean hasAnyPermission = false;
        Subject subject = getSubject();
        if (subject != null) {
            for (String permission : getPermissions(p)) {
                if (subject.isPermitted(permission.trim())) {
                    hasAnyPermission = true;
                    break;
                }
            }
        }
        return hasAnyPermission;
    }
}


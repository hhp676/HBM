/**
 * Project Name:hbm-be
 * File Name:DauthParseException.java
 * Package Name:com.hginfo.hbm.be.dauth.exception
 * Date:2017年2月16日下午7:57:43
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.exception;

import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * 数据权限解析异常。
 * Date: 2017年2月16日 下午7:57:43 <br/>
 * @author shichengqun
 */
public class DauthParseException extends BaseRuntimeException {

    private static final long serialVersionUID = 1L;
    
    /**
     */
    public DauthParseException() {
        super();
    }

    /**
     * @param message 
     */
    public DauthParseException(String message) {
        super(message);
    }

    /**
     * @param cause 
     */
    public DauthParseException(Throwable cause) {
        super(cause);
    }

    /**
     * @param message 
     * @param cause 
     */
    public DauthParseException(String message, Throwable cause) {
        super(message, cause);
    }
    
}


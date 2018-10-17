/**
 * Project Name:hbm-core
 * File Name:DauthNoAuthException.java
 * Package Name:com.hginfo.hbm.core.exception
 * Date:2017年2月22日下午12:09:04
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.exception;

import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * 无数据权限的异常。
 * Date: 2017年2月22日 下午12:09:04 <br/>
 * @author shichengqun
 */
public class DauthNoAuthException extends BaseRuntimeException {

    private static final long serialVersionUID = 1L;
    
    
    /**
     */
    public DauthNoAuthException() {
        this(SysDauthConstants.DAUTH_MESSAGE_NOAUTH_EXCEPTION_DEFAULT);
    }

    /**
     * @param message 
     */
    public DauthNoAuthException(String message) {
        super(message);
    }

    /**
     * @param cause 
     */
    public DauthNoAuthException(Throwable cause) {
        super(cause);
    }

    /**
     * @param message 
     * @param cause 
     */
    public DauthNoAuthException(String message, Throwable cause) {
        super(message, cause);
    }
    
}


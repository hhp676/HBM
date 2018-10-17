package com.hginfo.hbm.core.exception;

import com.hginfo.hutils.exception.BaseException;

/**
 * 业务异常。
 */
public class BizException extends BaseException {

    private static final long serialVersionUID = 1L;

    /**
     */
    public BizException() {
        super();
    }

    /**
     * @param message 
     */
    public BizException(String message) {
        super(message);
    }

    /**
     * @param cause 
     */
    public BizException(Throwable cause) {
        super(cause);
    }

    /**
     * @param message 
     * @param cause 
     */
    public BizException(String message, Throwable cause) {
        super(message, cause);
    }
}

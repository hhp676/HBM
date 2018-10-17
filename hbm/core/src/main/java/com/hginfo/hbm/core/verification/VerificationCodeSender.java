/*
 * Project Name:hbm-core
 * File Name:VerificationCodeSender.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午10:34:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.core.verification;

import com.hginfo.hbm.base.entity.sys.SysUser;

/**
 * 验证码发送接口。
 * ClassName:VerificationCodeSender <br/>
 * @author zhangdianbo
 * @author qiujingde
 * @since V3.0.0-beta1
 */
public interface VerificationCodeSender {
    
    /**
     * 发送验证码。
     * @param reqUser 请求用户。
     * @param code 验证码
     * @since V3.0.0-beta1
     */
    void send(SysUser reqUser, VerificationCode code);

    /**
     * 验证码发送器类型。
     */
    enum SenderType {
        /**
         * 邮件发送器。
         */
        MAIL
    }
    
}

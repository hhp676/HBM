/*
 * Project Name:hbm-core
 * File Name:VerificationCodeSenderFactory.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午11:14:49
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.core.verification;

import com.hginfo.hbm.base.entity.sys.SysUser;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 发送验证码。
 * ClassName:VerificationCodeCoordinatorSender <br/>
 * 可根据选择的发送类型和当前可用的发送类型协调实际使用的发送器。<br />
 *
 * @author zhangdianbo
 * @author qiujingde
 * @since V3.0.0-beta1
 */
public class VerificationCodeCoordinatorSender implements VerificationCodeSender {

    /**
     *
     */
    private Map<SenderType, VerificationCodeSender> senderMap;

    @Override
    public void send(SysUser reqUser, VerificationCode code) {
        // 获取可用发送器。
        List<VerificationCodeSender> codeSenders = new ArrayList<>();
        codeSenders.addAll(senderMap.values());

        codeSenders.forEach(send -> send.send(reqUser, code));
    }

    public void setSenderMap(Map<SenderType, VerificationCodeSender> senderMap) {
        this.senderMap = senderMap;
    }
}


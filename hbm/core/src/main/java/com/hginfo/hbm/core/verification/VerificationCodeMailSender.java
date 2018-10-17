package com.hginfo.hbm.core.verification;


import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hutils.MailSendUtil;

/**
 * 通过邮件发送验证码.
 * ClassName:VerificationCodeMailSender <br/>
 * @author zhangdianbo
 * @author qiujingde
 * @since V1.0.0
 */
public class VerificationCodeMailSender implements VerificationCodeSender {

    /**
     * 邮件标题。
     */
    private static final String MAIL_TITLE = "鸿冠业务管理系统-%s";
    /**
     * 邮件内容模板。
     */
    private static final String MAIL_CONTENT_TEMPLATE =
            "您正在进行邮箱验证，本次请求的验证码为：%s （%d分钟内有效）。<br /><br />"
                    + "点击继续操作：<a href='%s'>%s</a>";

    @Override
    public void send(SysUser reqUser, VerificationCode code) {
        String title = String.format(MAIL_TITLE, code.getOperationName());
        String mailContent = String.format(MAIL_CONTENT_TEMPLATE,
                code.getVerificationCode(),
                code.getValidateMinutes(),
                code.getActionUrl(),
                code.getActionUrl());
        MailSendUtil.sendHtmlEmail(reqUser.getEmail(), title, mailContent);
    }

}

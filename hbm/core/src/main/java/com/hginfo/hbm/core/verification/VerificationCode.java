package com.hginfo.hbm.core.verification;

import java.io.Serializable;
import java.util.EnumSet;

import static com.hginfo.hbm.core.constants.Constants.FIND_PASSWORD_VCODE_TIMEOUT;
import static org.apache.poi.ss.usermodel.DateUtil.SECONDS_PER_MINUTE;

/**
 * 验证码实体类。
 * Created by qiujingde on 2017/3/10.
 *
 * @author qiujingde
 * @since V3.0.0-beta1
 */
public class VerificationCode implements Serializable {
    private static final long serialVersionUID = -9159742923964113547L;

    /**
     * 操作名称。
     */
    private String operationName;
    /**
     * 验证码。
     */
    private String verificationCode;
    /**
     * 操作类型。
     */
    private String actionUrl;
    /**
     * 有效期。
     */
    private int validateMinutes = FIND_PASSWORD_VCODE_TIMEOUT / SECONDS_PER_MINUTE;
    /**
     * 发送类型，默认为邮件。
     */
    private EnumSet<VerificationCodeSender.SenderType> senderTypes =
            EnumSet.allOf(VerificationCodeSender.SenderType.class);

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getActionUrl() {
        return actionUrl;
    }

    public void setActionUrl(String actionUrl) {
        this.actionUrl = actionUrl;
    }

    public int getValidateMinutes() {
        return validateMinutes;
    }

    public void setValidateMinutes(int validateMinutes) {
        this.validateMinutes = validateMinutes;
    }

    public EnumSet<VerificationCodeSender.SenderType> getSenderTypes() {
        return senderTypes;
    }

    public void setSenderTypes(EnumSet<VerificationCodeSender.SenderType> senderTypes) {
        this.senderTypes = senderTypes;
    }
}

package com.hginfo.hbm.fe.core.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.util.ByteSource;

import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.core.utils.HProfileUtil;

/**
 * 普通realm。
 * 适用于登录表单登录。
 * ClassName: GeneralShiroDbRealm <br/>
 * date: 2016年11月24日 上午11:36:14 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class GeneralShiroDbRealm extends BaseShiroDbRealm {
    
    /**
     * 
     */
    private Integer sysLoginVerifCode;
    
    /**
     * 认证回调函数, 登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
        throws AuthenticationException {
        if (!(authcToken instanceof GeneralUserToken)) {
            return null;
        }
        GeneralUserToken token = (GeneralUserToken) authcToken;
        
        //判断验证码
        try {
            sysLoginVerifCode = Integer.parseInt(HProfileUtil.getProperty(Constants.SYS_CONFIG_LOGIN_VERIF_CODE));
        } catch (NumberFormatException e) {
        }
        if (sysLoginVerifCode != null && sysLoginVerifCode == Constants.ONE) {
            String captcha = token.getCaptcha();
            String exitCode = (String) SessionUtils.getSession()
                .getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
            if (null == captcha || !captcha.equalsIgnoreCase(exitCode)) {
                throw new CaptchaException();
            }
        }
        
        SysAccount sysAccount = getSysAccount(token.getUsername());
        
        byte[] salt = new String(sysAccount.getLoginName()).getBytes();
        return new SimpleAuthenticationInfo(
            new ShiroAccount(sysAccount.getAccountId(), sysAccount.getLoginName(),
                sysAccount.getUserId()),
            sysAccount.getLoginPwd(), ByteSource.Util.bytes(salt), getName());
    }
    
}

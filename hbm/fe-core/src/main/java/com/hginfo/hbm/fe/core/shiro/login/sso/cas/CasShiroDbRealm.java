package com.hginfo.hbm.fe.core.shiro.login.sso.cas;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.util.StringUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.Cas20ServiceTicketValidator;
import org.jasig.cas.client.validation.Saml11TicketValidator;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hbm.fe.core.shiro.BaseShiroDbRealm;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 单点登录realm。
 * ClassName: CasShiroDbRealm <br/>
 * date: 2016年11月24日 上午11:49:08 <br/>
 *
 * @author licheng
 * @since V1.0.0
 */
public class CasShiroDbRealm extends BaseShiroDbRealm {
    
    /**
     * 
     */
    @Autowired
    private SysAccountService  sysAccountService;
    
    /**
     */
    private Log                log                                = LogFactory.getLog(getClass());
    
    /**
     * default name of the CAS attribute for remember me authentication (CAS 3.4.10+).
     */
    public static final String DEFAULT_REMEMBER_ME_ATTRIBUTE_NAME = "longTermAuthenticationRequestTokenUsed";
    
    /**
     * 
     */
    public static final String DEFAULT_VALIDATION_PROTOCOL        = "CAS";
    
    /**
     *  this is the url of the CAS server (example : http://host:port/cas).
     */
    private String             casServerUrlPrefix;
    
    /**
     *  this is the CAS service url of the application (example : http://host:port/mycontextpath/shiro-cas).
     */
    private String             casService;
    
    /**
     * CAS protocol to use for ticket validation : CAS (default) or SAML.
       CAS protocol can be used with CAS server version < 3.1 : in this case, 
       no user attributes can be retrieved from the CAS ticket validation response
       (except if there are some customizations on CAS server side)
       SAML protocol can be used with CAS server version >= 3.1 : in this case, 
       user attributes can be extracted from the CAS ticket validation response
    */
    private String             validationProtocol                 = DEFAULT_VALIDATION_PROTOCOL;
    
    /**
     *  default name of the CAS attribute for remember me authentication (CAS 3.4.10+).
     */
    private String             rememberMeAttributeName            = DEFAULT_REMEMBER_ME_ATTRIBUTE_NAME;
    
    /**
     *  this class from the CAS client is used to validate a service ticket on CAS server.
     */
    private TicketValidator    ticketValidator;
    
    @Override
    protected void onInit() {
        super.onInit();
        ensureTicketValidator();
    }
    
    /**
     * ensureTicketValidator.
     * @return TicketValidator
     * @since V1.0.0
     */
    protected TicketValidator ensureTicketValidator() {
        if (this.ticketValidator == null) {
            this.ticketValidator = createTicketValidator();
        }
        return this.ticketValidator;
    }
    
    /**
     * createTicketValidator.
     * @return TicketValidator
     * @since V1.0.0
     */
    protected TicketValidator createTicketValidator() {
        String urlPrefix = getCasServerUrlPrefix();
        if ("saml".equalsIgnoreCase(getValidationProtocol())) {
            return new Saml11TicketValidator(urlPrefix);
        }
        return new Cas20ServiceTicketValidator(urlPrefix);
    }
    
    /**
     * 基于CAS单点登录生成令牌。
     * @author licheng
     * @param token token
     * @return AuthenticationInfo
     * @since V1.0.0
     */
    @SuppressWarnings("deprecation")
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
        throws AuthenticationException {
        
        if (!(token instanceof CasToken)) {
            return null;
        }
        CasToken casToken = (CasToken) token;
        
        String ticket = (String) casToken.getCredentials();
        if (!StringUtils.hasText(ticket)) {
            return null;
        }
        
        TicketValidator ticketValidator = ensureTicketValidator();
        
        try {
            // contact CAS server to validate service ticket
            Assertion casAssertion = ticketValidator.validate(ticket, getCasService());
            // get principal, user id and attributes
            AttributePrincipal casPrincipal = casAssertion.getPrincipal();
            String userId = casPrincipal.getName();
            log.debug("Validate ticket : " + ticket + " in CAS server : " + getCasServerUrlPrefix()
                + " to retrieve user : {" + userId + "}");
            
            Map<String, Object> attributes = casPrincipal.getAttributes();
            // refresh authentication token (user id + remember me)
            casToken.setUserId(userId);
            String rememberMeAttributeName = getRememberMeAttributeName();
            String rememberMeStringValue = (String) attributes.get(rememberMeAttributeName);
            boolean isRemembered = rememberMeStringValue != null
                && Boolean.parseBoolean(rememberMeStringValue);
            if (isRemembered) {
                casToken.setRememberMe(true);
            }
            // create simple authentication info
            List<Object> principals = CollectionUtils.asList(userId, attributes);
            ShiroAccount myPrincipal = getShiroAccount(principals);
            PrincipalCollection principalCollection = new SimplePrincipalCollection(myPrincipal,
                getName());
            return new SimpleAuthenticationInfo(principalCollection, token.getCredentials());
        } catch (TicketValidationException e) {
            throw new CasAuthenticationException("Unable to validate ticket [" + ticket + "]", e);
        }
        
    }
    
    /**
     * 将cas的principal转换为本系统的ShiroAccount。
     * 如果本地系统没有这个用户则会抛出异常，登录失败。
     * @author licheng
     * @param principals principals
     * @return ShiroAccount
     * @since V1.0.0
     */
    private ShiroAccount getShiroAccount(List<Object> principals) {
        String loginName = (String) principals.get(0);
        SysAccount sysAccount = sysAccountService.findUserByLoginName(loginName);
        if (null == sysAccount) {
            throw new UnknownAccountException("No account found for user [" + loginName + "]");
        }
        return new ShiroAccount(sysAccount.getAccountId(), sysAccount.getLoginName(),
            sysAccount.getUserId());
    }
    
    public String getCasServerUrlPrefix() {
        return casServerUrlPrefix;
    }
    
    public void setCasServerUrlPrefix(String casServerUrlPrefix) {
        this.casServerUrlPrefix = casServerUrlPrefix;
    }
    
    public String getCasService() {
        return casService;
    }
    
    public void setCasService(String casService) {
        this.casService = casService;
    }
    
    public String getValidationProtocol() {
        return validationProtocol;
    }
    
    public void setValidationProtocol(String validationProtocol) {
        this.validationProtocol = validationProtocol;
    }
    
    public String getRememberMeAttributeName() {
        return rememberMeAttributeName;
    }
    
    public void setRememberMeAttributeName(String rememberMeAttributeName) {
        this.rememberMeAttributeName = rememberMeAttributeName;
    }
    
    /**
     * 设定Password效验规则为是否相等的简单匹配.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        setCredentialsMatcher(new SimpleCredentialsMatcher());
    }
    
}

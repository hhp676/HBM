package com.hginfo.hbm.fe.core.shiro.session;

import java.io.Serializable;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.base.entity.sys.ShiroAccount;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.core.constants.Constants;

/**
 * Created by qiujingde on 2016/10/31.
 * Session工具类：
 * 1.使用shiro的session
 * @author qiujingde
 * @since V1.0.0
 */
@Component
public final class SessionUtils {
    
    /**
     * 
     */
    private static SessionDAO sessionDAO;
    
    /**
     * Creates a new instance of SessionUtils.
     */
    private SessionUtils() {
    }
    
    @Autowired
    public void setSessionDAO(SessionDAO sessionDAO) {
        SessionUtils.sessionDAO = sessionDAO;
    }
    
    public static SessionDAO getSessionDAO() {
        return sessionDAO;
    }
    
    /**
     * 获取当前session。
     * 如果当前没有session对象，返回null
     * @return 当前session
     */
    public static Session getSession() {
        return SecurityUtils.getSubject().getSession(false);
    }
    
    /**
     * 通过sessionId获取session。
     * @author licheng
     * @param id sessionId
     * @return session对象
     * @since V1.0.0
     */
    public static Session getSessionById(Serializable id) {
        if (getSessionDAO() == null) {
            throw new UnsupportedOperationException("没有合适的sessionDao，无法执行此操作！");
        }
        return getSessionDAO().readSession(id);
    }
    
    /**
     * 获取当前账户Id。
     * @author licheng
     * @return 当前账户Id
     * @since V1.0.0
     */
    public static long getAccountId() {
        ShiroAccount shiroAccount = getShiroAccount();
        return (shiroAccount == null) ? Constants.ANONYMOUS_ID
            : shiroAccount.getAccountId();
    }
    
    /**
     * 获取当前账户登录名。
     * @author licheng
     * @return 当前账户登录名
     * @since V1.0.0
     */
    public static String getLoginName() {
        ShiroAccount shiroAccount = getShiroAccount();
        return (shiroAccount == null) ? null
            : shiroAccount.getLoginName();
    }
    
    /**
     * 获取当前用户对象。
     * 这里保存的是用户第一次登录时的用户数据。
     * @return SysUser SysUser
     */
    public static SysUser getUser() {
        ShiroAccount shiroAccount = getShiroAccount();
        if (null != shiroAccount) {
            return shiroAccount.getSysUser();
        }
        return null;
    }
    
    /**
     * 获取当前用户Id。
     * @author licheng
     * @return 当前用户Id
     * @since V1.0.0
     */
    public static long getUserId() {
        ShiroAccount shiroAccount = getShiroAccount();
        return (shiroAccount == null) ? Constants.ANONYMOUS_ID
            : shiroAccount.getUserId();
    }
    
    /**
     * 根据subject获取当前用户Id。
     * @param subject subject
     * @return 当前用户Id
     */
    public static long getUserId(Subject subject) {
        ShiroAccount shiroAccount = (subject == null) ? null : (ShiroAccount) subject.getPrincipal();
        return (shiroAccount == null) ? Constants.ANONYMOUS_ID : shiroAccount.getUserId();
    }
    
    /**
     * 退出登录。
     * @author licheng
     * @since V1.0.0
     */
    public static void kickUser() {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null && subject.isAuthenticated()) {
            subject.logout();
        }
    }
    
    /**
     * 获取SHIRO账户对象。
     * @author licheng
     * @return ShiroAccount
     * @since V1.0.0
     */
    public static ShiroAccount getShiroAccount() {
        Subject subject = SecurityUtils.getSubject();
        if (null != subject) {
            return (ShiroAccount) subject.getPrincipal();
        }
        return null;
    }
    
    /**
     * 更新Principals。
     * @since V1.0.0
     */
    public static void updatePrincipals() {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            Session session = subject.getSession();
            session.setAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY,
                subject.getPrincipals());
        }
    }
    
    /**
     * 退出当前登录。
     */
    public static void logout() {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null && subject.isAuthenticated()) {
            subject.logout();
        }
    }
    
    /**
     * 是否有权限。
     * @param authCode authCode
     * @return true/false
     */
    public static boolean hasPermission(String authCode) {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null && subject.isPermitted(authCode)) {
            return true;
        }                
        return false;
    }
    
}

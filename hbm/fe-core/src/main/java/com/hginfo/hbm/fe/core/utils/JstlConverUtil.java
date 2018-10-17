package com.hginfo.hbm.fe.core.utils;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.StringUtil;

/**
 * jstl标签fn方法工具类。
 * @author yyzh
 *
 */
@Component
public class JstlConverUtil {
    
    /**
     * 
     */
    private SysUserService        userService;
    
    /**
     * 
     */
    private static JstlConverUtil jstlConverUtil;
    
    /**
     * 由于静态常量,无法获取类内注解的属性值, 需要重新赋值来完成spring注入动作。
     */
    @PostConstruct
    public void init() {
        jstlConverUtil = this;
        jstlConverUtil.userService = this.userService;
    }
    
    /**
     * 根据人员id,返回人员名称。
     * @param userID userID
     * @return userName
     */
    public static String getUserNameByID(Long userID) {
        String userName = "";
        if (userID != null) {
            SysUser user = jstlConverUtil.userService.get(userID);
            if (user != null && StringUtil.isNotBlank(user.getUserName())) {
                userName = user.getUserName();
            }
        }
        return userName;
    }
    
    public SysUserService getUserService() {
        return userService;
    }
    
    @HReference
    public void setUserService(SysUserService userService) {
        this.userService = userService;
    }
    
}

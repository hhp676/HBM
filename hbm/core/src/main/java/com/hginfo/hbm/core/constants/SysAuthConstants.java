/**
 * Project Name:hbm-core
 * File Name:AuthConstants.java
 * Package Name:com.hginfo.hbm.core.constants
 * Date:2016年12月22日下午6:26:25
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.constants;

/**
 * ClassName:AuthConstants 功能权限模块常量类<br/>
 * Date: 2016年12月22日 下午6:26:25 <br/>
 * @author yuqing
 */
public final class SysAuthConstants {
    
    /**
     * response json返回code属性.
     */
    public static final String CODE              = "code";
    /**
     * response json返回message属性.
     */
    public static final String MESSAGE           = "message";
    /**
     * URL校验失败返回信息.
     */
    public static final String URL_AUTHC_FAILURE = "无权访问此URL!";
    /**
     * 字符串通配符.
     */
    public static final String STRING_WILDCARD   = "%s";
    /**
     * 数字类型通配符.
     */
    public static final String DIGIT_WILDCARD    = "%d";
    /**
     * 校验数据正则表达式.
     */
    public static final String DIGIT_PETTERN     = "[-]?[0-9]+(\\.[0-9]+)?";
    /**
     * 校验所有字符正则表达式.
     */
    public static final String STRING_PETTERN    = "[^/]*";
    /**
     * 正则表达式开始符.
     */
    public static final String PETTERN_FRONT     = "^";
    /**
     * 路径分隔符.
     */
    public static final String SEPARATE_SYMBOL   = "/";
    /**
     * session功能权限变量名.
     */
    public static final String SYS_AUTH_LIST     = "sysAuthList";
    
    /**
     * 权限url分隔符";"。
     */
    public static final String AUTH_URI_SEPARATOR = ";";
    
    /**
     * 模块类型。
     */
    public static final int MODEL_TYPE  = 1;
        
    /**
     * 权限类型。
     */
    public static final int AUTH_TYPE   = 2;
    
    /**
     * 主权限：1。
     */
    public static final int AUTH_CATEGORY_MAIN = 1;
    
    /**
     * 附属权限：2。
     */
    public static final int AUTH_CATEGORY_ATTACH = 2;
    
    /**
     * 查询用户所有权限包括附属权限：1。
     */
    public static final Integer AUTH_USER_AUTH_ALL = 1;
    
    /**
     * 查询用户所有主权限。
     */
    public static final Integer AUTH_USER_AUTH_MAIN = null;
          
    /**
     * 模块样式
     */
    public static final String  MODEL_STYLE = "icon_user_man";
         
    /**
     * 权限样式
     */
    public static final String  AUTH_STYLE  = "icon_user_center";
    
    
    /**
     * 授权类型
     */
    
    public static final Integer GRANT_AUTH_TYPE_PLUS = 1; //正授权
    
    public static final Integer GRANT_AUTH_TYPE_MINUS = -1;//负授权
    
    
    /**
     * 默认左侧菜单的menu的系统设置的key
     * 
     */
    public static final String SYS_DEFULT_LEFTMENU_KEY = "sysDefultLeftMenu";
    /**
     * 个人中心的model code。
     */
    public static final String MODEL_CODE_PERSONAL = "sysPersonalMenu";
                                                 
    private SysAuthConstants() {
    
    }
    
}

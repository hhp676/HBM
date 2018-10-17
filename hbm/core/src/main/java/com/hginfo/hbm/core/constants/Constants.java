package com.hginfo.hbm.core.constants;

/**
 * 常量类。<br>
 * date: 2016年10月19日 上午11:30:30 <br/>
 *
 * @author shichengqun
 */
public final class Constants {
    
    /**
     * 匿名用户ID。
     */
    public static final long    ANONYMOUS_ID                  = -1;
    
    /**
     * super ID。
     */
    public static final long    SUPER_ID                      = 1L;
    
    /**
     * super role ID。
     */
    public static final long    SUPER_ROLE_ID                      = 1054552046249782277L;
    
    /**
     * 默认租户ID。
     */
    public static final int     DEFAULT_TENANT_ID             = 1;
    
    /**
     * dubbo传当前用户ID的key。
     */
    public static final String  CURR_USER_ID_CODE             = "DUBBO_CURR_USER_ID";
    
    /**
     * dubbo传当前请求的本地化代码。
     */
    public static final String  CURR_LOCALE_CODE              = "DUBBO_CURR_LOCALE_CODE";
    
    /**
     * 系统默认错误提示信息code。
     */
    public static final String  ERROR_MSG_CODE_DEFAULT        = "com.hginfo.error.message";
    
    /**
     * dubbo调用默认错误提示信息code。
     */
    public static final String  ERROR_MSG_CODE_DUBBO          = "com.hginfo.dubbo.error.message";
    
    /**
     * 500错误页面/统一异常页面。
     */
    public static final String  ERROR_PAGE_500                = "error/500";
    
    /**
     * 选择行数据模式--多选。
     */
    public static final String  SELECT_MODE_MULTIPLE          = "multiple";
    /**
     * 选择行数据模式--单选。
     */
    public static final String  SELECT_MODE_SINGLE            = "SINGLE";
    
    /**
     * 系统日志KEY存储最大长度。
     */
    public static final int     SYS_LOG_KEY_MAXLENGTH         = 64;
    
    /***
     * 邮件验证码超时时间300秒.
     */
    public static final int     FIND_PASSWORD_VCODE_TIMEOUT   = 300;
    
    /***
     * 找回密码申请,请求时间间隔。
     */
    public static final Integer FIND_PASSWORD_RETRY_TIME         = 24 * 60 * 60;
    /***
     * 找回密码申请某段时间内的最大次数。
     */
    public static final Integer FIND_PASSWORD_TIME_MAXCOUNT    = 3;
    
    /**
     * 验证码开关名称。
     */
    public static final String  SYS_CONFIG_LOGIN_VERIF_CODE   = "sysLoginVerifCode";
    
    /**
     * 单用户在线开关名称。
     */
    public static final String SYS_CONFIG_USER_SINGLE_ONLINE = "userSingleOnline";
    
    /**
     * CSRF防御开关名称。
     */
    public static final String  SYS_CONFIG_DEFENSE_CSRF       = "sysDefenseCsrf";
    
    /**
     * 系统日志过期时间。
     */
    public static final String  SYS_CONFIG_SYSLOG_TIMEOUT     = "sysLogTimeout";
    
    /**
     * 系统配置中默认个性化配置类型。
     */
    public static final String  PROFILE            = "profile";
    
    /**
     * 
     */
    public static final String INITIAL_REQUEST_URI = "initialRequestURI";
    /**
     * 系统安全等级。
     */
    public static final String SYS_SECURITY_LEVEL = "sysSecurityLevel";
    
    /**
     * 0.
     */
    public static final Integer ZERO                  = 0;
    
    /**
     * 1.
     */
    public static final Integer ONE                   = 1;
    
    /**
     * 2.
     */
    public static final Integer TWO                   = 2;
    
    /**
     * 3.
     */
    public static final Integer THREE                 = 3;
    
    /**
     * 4.
     */
    public static final Integer FOUR                  = 4;
    
    /**
     * 5.
     */
    public static final Integer FIVE                  = 5;
    
    /**
     * 6.
     */
    public static final Integer SIX                   = 6;
    
    /**
     * 7.
     */
    public static final Integer SEVEN                 = 7;
    
    /**
     * 8.
     */
    public static final Integer EIGHT                 = 8;
    
    /**
     * 9.
     */
    public static final Integer NINE                  = 9;
    
    /**
     * 10.
     */
    public static final Integer TEN                   = 10;

    /**
     * 100.
     */
    public static final Integer NUMBER_100                   = 100;

    /**
     * 1000.
     */
    public static final Integer NUMBER_1000                   = 1000;
    
    /**
     * 每小时秒数.
     */
    public static final Integer SECONDS_PER_HOUR      = 3600;
    
    /**
     * 每分钟秒数。
     */
    public static final Integer SENCONDS_PER_MINUTE   = 60;
    
    /**
     * mysql text 最大长度。
     */
    public static final Integer MYSQL_TEXT_MAX_LENGTH = 65535;
    
    /**
     * 构造函数。
     */
    private Constants() {
        
    }
}

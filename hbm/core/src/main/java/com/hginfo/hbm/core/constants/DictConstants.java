/**
 * Project Name:hbm-core
 * File Name:DictConstants.java
 * Package Name:com.hginfo.hbm.core
 * Date:2016年12月3日上午10:31:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.constants;

/**
 * 字典常量文件。
 * ClassName:DictConstants <br/>
 * Date: 2016年12月3日 上午10:31:12 <br/>
 * @author licheng
 */
public final class DictConstants {
    
    
    /**
     * 通用数字类型True。
     */
    public static final Integer TRUE  = 1;
    
    /**
     * 通用数字类型False。
     */
    public static final Integer FALSE  = 0;
    
    /**
     * 
     */
    public static final Integer IS_VISIBLE_TRUE  = 1;
    
    /**
     * 
     */
    public static final Integer IS_VISIBLE_FALSE = 0;
    
    /**
     * 
     */
    public static final Integer IS_FINAL_TRUE    = 1;
    
    /**
     * 
     */
    public static final Integer IS_FINAL_FALSE   = 0;
    
    /**
     * 模块类型：菜单。
     */
    public static final Integer MODEL_TYPE_MENU  = 1;
    
    /**
     * 模块类型：模块。
     */
    public static final Integer MODEL_TYPE_MODEL = 0;
    
    /**
     * 顶级模块FID。
     */
    public static final Long    TOP_MODEL_FID    = 1052481646384715197L;
    
    /**
     * 默认左侧模块的FID。
     */
    public static final Long    DEFAULT_LEFT_MODEL_FID    = 1052481657072850395L;
    
    /**
     * 模块操作码：访问。
     */
    public static final String    OPRATION_CODE_VIEW    = "view";
    
    
    /**
     * 过滤值类型的数据字典组code。
     */
    public static final String DICT_FILTER_VALUE_TYPE = "DAUTH_FILTER_VALUE_TYPE";
    
    
    /**
     * 系统日志：系统操作日志。
     */
    public static final int SYSLOG_TYPE_OPERATE  = 0;
    
    /**
     * 系统日志：接口调用日志。
     */
    public static final int SYSLOG_TYPE_CALL  = 1;
    
    /**
     * 系统日志：定时任务日志。
     */
    public static final int SYSLOG_TYPE_TASK  = 2;
    
    /**
     * 系统日志：异常信息日志。
     */
    public static final int SYSLOG_TYPE_EXCEPTION  = 3;
    
    /**
     * 用户日志 1：方法执行成功。
     */
    public static final int SYSUSERLOG_RESULT_SUCCESS = 1;
    
    /**
     * 用户日志 0：方法执行异常。
     */
    public static final int SYSUSERLOG_RESULT_FAIL = 0;
    
    /**
     * 构造函数。
     */
    private DictConstants() {
        
    }
}

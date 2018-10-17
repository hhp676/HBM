/**
 * Project Name:hbm-core
 * File Name:SysDauthConstants.java
 * Package Name:com.hginfo.hbm.core.constants
 * Date:2017年01月12日下午6:26:25
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.constants;

/**
 * 数据权限模块常量类。<br/>
 * Date: 2017年01月12日下午6:26:25
 * @author shichengqun
 */
public final class SysDauthConstants {
    
    /**
     * 过滤值类型--自定义SQL=1。
     */
    public static final int FILTER_VALUE_TYPE_CUSTOM_SQL = 1;
    
    /**
     * 过滤值类型--自定义值=2。
     */
    public static final int FILTER_VALUE_TYPE_CUSTOM_VALUE = 2;
    
    /**
     * 过滤值类型--数据权限变量=3。
     */
    public static final int FILTER_VALUE_TYPE_DAUTH_VARIABLE = 3;
    
    /**
     * 过滤值类型--岗位=4。
     */
    public static final int FILTER_VALUE_TYPE_POSITION = 4;
    
    /**
     * 过滤值类型--职务=5。
     */
    public static final int FILTER_VALUE_TYPE_JOB = 5;
    
    /**
     * 过滤值类型--当前用户 =6。
     */
    public static final int FILTER_VALUE_TYPE_CURRUSER = 6;
    
    
    /**
     * 0：在用。
     */
    public static final int DAUTH_USAGE_METHOD_VALID_YES = 0;
    
    /**
     * NumberField：数值型字段。
     */
    public static final String DAUTH_FILTER_TYPE_NUMBERFIELD = "NumberField";
    
    /**
     * StringField：字符型字段。
     */
    public static final String DAUTH_FILTER_TYPE_STRINGFIELD = "StringField";
    
    /**
     * CurrentUserPosition：当前用户岗位。
     */
    public static final String DAUTH_FILTER_TYPE_CURRENTUSERPOSITION = "CurrentUserPosition";
    
    /**
     * CurrentUserJob：当前用户职务。
     */
    public static final String DAUTH_FILTER_TYPE_CURRENTUSERJOB = "CurrentUserJob";
    
    /**
     * NoField：无字段。
     */
    public static final String DAUTH_FILTER_TYPE_NOFIELD = "NoField";
    
    
    
    /**
     * =：等于。
     */
    public static final String DAUTH_FILTER_OPERATOR_EQUAL = "=";
    
    /**
     * !=：不等于。
     */
    public static final String DAUTH_FILTER_OPERATOR_NOTEQUAL = "!=";
    
    /**
     * >：大于。
     */
    public static final String DAUTH_FILTER_OPERATOR_GREATER = ">";
    
    /**
     * >=：大于等于。
     */
    public static final String DAUTH_FILTER_OPERATOR_GREATEROREQUAL = ">=";
    
    /**
     * <：小于。
     */
    public static final String DAUTH_FILTER_OPERATOR_LESS = "<";
    
    /**
     * <=：小于等于。
     */
    public static final String DAUTH_FILTER_OPERATOR_LESSOREQUAL = "<=";
    
    /**
     * in：包含在。
     */
    public static final String DAUTH_FILTER_OPERATOR_IN = "in";
    
    /**
     * not in：不包含在。
     */
    public static final String DAUTH_FILTER_OPERATOR_NOTIN = "not in";
    
    /**
     * contains：存在，存在交集。
     */
    public static final String DAUTH_FILTER_OPERATOR_CONTAINS = "contains";
    
    /**
     * notcontains：不存在，不存在交集。
     */
    public static final String DAUTH_FILTER_OPERATOR_NOTCONTAINS = "notcontains";
    
    /**
     * match：匹配，符合某个sql。
     */
    public static final String DAUTH_FILTER_OPERATOR_MATCH = "match";
    
    /**
     * notmatch：不匹配，不符合某个sql。
     */
    public static final String DAUTH_FILTER_OPERATOR_NOTMATCH = "notmatch";
    
    /**
     * 1：满足数据权限。
     */
    public static final int DAUTH_OPERATOR_RESULT_PASS =  1;
    
    /**
     * -1：不满足数据权限。
     */
    public static final int DAUTH_OPERATOR_RESULT_NOPASS = -1;
    
    /**
     * 0：需要sql解析。
     */
    public static final int DAUTH_OPERATOR_RESULT_SQLPARSE = 0;
    
    /**
     * dauth.ftl 数据权限sql解析模板。
     */
    public static final String DAUTH_SQL_PARSE_TEMPLATE = "dauth.ftl";
    
    
    /**
     * SysDauth开头的不进行数据权限处理。
     */
    public static final String DAUTH_NO_CHECK_PREFIX = "SysDauth";
    
    /**
     * .getById方法不进行数据权限处理。
     */
    public static final String DAUTH_NO_CHECK_GETBYID = ".getById";
    
    

    /**
     * 数据权限处理 生效开关 key。
     */
    public static final String DAUTH_FLAG_KEY = "dauthFlag";
    
    /**
     * 1：启用数据权限处理。
     */
    public static final String DAUTH_FLAG_VALID = "1";
    
    /**
     * 数据权限默认SQL。
     */
    public static final String DAUTH_DEFAULT_SQL = " 1 = 1 ";
    
    /**
     * 数据权限无权限的默认SQL。
     */
    public static final String DAUTH_NODAUTH_SQL = " 1 != 1 ";
    
    /**
     * 临时变量的分割符","。
     */
    public static final String DAUTH_TEMP_VAR_SEPARATOR = ",";
    
    /**
     * and。
     */
    public static final String DAUTH_SQL_AND = "AND";
    
    /**
     * or。
     */
    public static final String DAUTH_SQL_OR = "OR";
    
    /**
     * 数据权限修改方法的前缀名:update。
     */
    public static final String DAUTH_UPDATEMETHOD_UPDATE = "update";
    
    /**
     * 数据权限修改方法的前缀名:delete。
     */
    public static final String DAUTH_UPDATEMETHOD_DELETE = "delete";
    
    
    /**
     * 数据权限解析异常！
     */
    public static final String DAUTH_MESSAGE_PARSE_EXCEPTION_DEFAULT = "数据权限解析异常！";
    
    /**
     * 数据权限解析异常：id获取失败！
     */
    public static final String DAUTH_MESSAGE_PARSE_EXCEPTION_IDFAIL = "数据权限解析异常：id获取失败！";
    
    /**
     * 数据权限解析异常：当前用户职务不能为空！
     */
    public static final String DAUTH_MESSAGE_PARSE_EXCEPTION_USERJOBFAIL = "数据权限解析异常：当前用户职务不能为空！";
    
    /**
     * 数据权限解析异常：当前用户岗位不能为空！
     */
    public static final String DAUTH_MESSAGE_PARSE_EXCEPTION_USERPOSITIONFAIL = "数据权限解析异常：当前用户岗位不能为空！";
    
    
    /**
     * 数据权限解析异常：数据权限变量解析错误！
     */
    public static final String DAUTH_MESSAGE_PARSE_EXCEPTION_VARIABLEFAIL = "数据权限解析异常：数据权限变量解析错误！";
    

    /**
     * 暂无此数据的操作权限！
     */
    public static final String DAUTH_MESSAGE_NOAUTH_EXCEPTION_DEFAULT = "暂无此数据的操作权限！";
    
    
    
    /**
     * 
     * Creates a new instance of SysDauthConstants.
     *
     */
    private SysDauthConstants() {
        
    }
    
}

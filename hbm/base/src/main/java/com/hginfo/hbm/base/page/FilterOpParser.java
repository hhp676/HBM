/**
 * Project Name:hbm-fe-easyui
 * File Name:FilterOpEnum.java
 * Package Name:com.hginfo.hbm.base.page
 * Date:2016年12月23日下午5:39:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.base.page;

import com.hginfo.hutils.SqlFilterUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 表头过滤操作解析。
 * Date: 2016年12月23日 下午5:39:48 <br/>
 * @author shichengqun
 */
public class FilterOpParser {
    
    /**
     * Creates a new instance of FilterOpResolver.
     */
    private FilterOpParser() {
        
    }
    
    /**
     * 过滤参数值名称。
     */
    private static final String FILTER_VAR_VALUE = "_OP_VAR";
    
    /**
     * 获取过滤操作SQL。
     * @param opName 过滤操作名称
     * @param filterValue 过滤值
     * @param isStringField 字段是否字符类型
     * @param isOracle 数据库是否Oracle
     * @return 过滤SQL
     */
    public static String getFilterOpSql(String opName, String filterValue, boolean isStringField, boolean isOracle) {
        FilterOpEnum op = FilterOpEnum.get(opName);
        if (op != null) {
            //如果op默认非字符处理 && 查询字段是字符类型，则拼接单引号按照字符查询处理
            if (!op.isString && isStringField) {
                filterValue = "'" + SqlFilterUtil.escapeLikeQuery(filterValue) + "'";
            } else {
                filterValue = SqlFilterUtil.escapeLikeQuery(filterValue);
            }
            
            if (op.opSql.contains("like")) {
            	//过滤值中含空格
            	if (!StringUtil.isEmpty(filterValue)) {
            		filterValue = filterValue.replaceAll("\\s+", "%");
            	}
            	//oracle escape
            	if (isOracle) {
            		op.opSql.concat("escape'\\'");
            	}
            }
            return op.opSql.replace(FILTER_VAR_VALUE, filterValue);
        }
        
        return "";
    }
    
    /**
     * 过滤操作及相应处理的SQL的枚举。
     * date: 2016年12月23日 下午6:56:26 <br/>
     *
     * @author shichengqun
     */
    public enum FilterOpEnum {
        /**
         * like '%x%'.
         */
        contains("contains", " like '%" + FILTER_VAR_VALUE + "%' ", true),
        
        /**
         * =.
         */
        equal("equal", " = " + FILTER_VAR_VALUE + " ", false),
        
        /**
         * !=.
         */
        notequal("notequal", " != " + FILTER_VAR_VALUE + " ", false),
        
        /**
         * like '%x'.
         */
        beginwith("beginwith", " like '" + FILTER_VAR_VALUE + "%' ", true),
        
        /**
         * like 'x%'.
         */
        endwith("endwith", " like '%" + FILTER_VAR_VALUE + "' ", true),
        
        /**
         * {@code <}.
         */
        less("less", " < " + FILTER_VAR_VALUE + " ", false),
        
        /**
         * {@code <=}.
         */
        lessorequal("lessorequal", " <= " + FILTER_VAR_VALUE + " ", false),
        
        /**
         * {@code >}.
         */
        greater("greater", " > " + FILTER_VAR_VALUE + " ", false),
        
        /**
         * {@code >=}.
         */
        greaterorequal("greaterorequal", " >= " + FILTER_VAR_VALUE + " ", false);
        
        /**
         * 过滤操作名称，与前端对应。
         */
        private String  opName;
        /**
         * 过滤操作SQL。
         */
        private String  opSql;
        
        /**
         * 默认是否字符串处理。
         */
        private boolean isString;
        
        /**
         * Creates a new instance of FilterOpEnum.
         *
         * @param opName 
         * @param opSql 
         * @param isString 
         */
        FilterOpEnum(String opName, String opSql, boolean isString) {
            this.opName = opName;
            this.opSql = opSql;
            this.isString = isString;
        }
        
        /**
         * 获取过滤操作对应的SQL。
         * @param opName 过滤操作名称
         * @return 过滤操作对应的枚举
         */
        public static FilterOpEnum get(String opName) {
            for (FilterOpEnum op : FilterOpEnum.values()) {
                if (op.opName.equals(opName)) {
                    return op;
                }
            }
            return null;
        }
    }
    
}

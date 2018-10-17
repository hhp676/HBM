/**
 * Project Name:hbm-be
 * File Name:SqlInjectInterceptor.java
 * Package Name:com.hginfo.hbm.be.core.interceptor
 * Date:2016年10月18日上午11:03:08
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.interceptor;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.management.openmbean.SimpleType;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.parsing.GenericTokenParser;
import org.apache.ibatis.parsing.TokenHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.scripting.xmltags.ChooseSqlNode;
import org.apache.ibatis.scripting.xmltags.DynamicSqlSource;
import org.apache.ibatis.scripting.xmltags.IfSqlNode;
import org.apache.ibatis.scripting.xmltags.MixedSqlNode;
import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.scripting.xmltags.TextSqlNode;
import org.apache.ibatis.scripting.xmltags.TrimSqlNode;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import com.hginfo.hbm.annotation.IgnoreSqlFilter;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.CollectionsUtil;
import com.hginfo.hutils.ObjectCloneUtil;
import com.hginfo.hutils.ReflectUtil;
import com.hginfo.hutils.SqlFilterUtil;

/**
 * mybatis防sql注入插件
 * 对于所有$引用的实体属性变量调用启用安全过滤。
 * 默认对实体对象中没有@ignoreSqlFilter注解的属性进行sql特殊字符过滤和模糊查询转义
 * 默认对Map中key值没有以_ignoreSqlFilter结尾的属性进行sql特殊字符过滤和模糊查询转义.
 * @author licheng 2016.10.25
 * ClassName:SqlInjectInterceptor <br/>
 * Date: 2016年10月18日 上午11:03:08 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Intercepts({@Signature(type = Executor.class, method = "query", args = {MappedStatement.class,
        Object.class, RowBounds.class, ResultHandler.class }) })
public class SqlInjectInterceptor implements Interceptor {
    
    /**
     */
    private static final int      PARAMETER_INDEX                  = 1;
    
    /**
     * 
     */
    private static final String   IGNORE_SQL_FILTER_MAP_KEY_SUFFIX = "_ignoreSqlFilter";
    
    /**
     * 
     */
    private static final String[] IGNORE_FIELD_NAMES               = new String[] {"orderStr", "filterStr" };
    
    /**
     */
    private Log                   logger                           = LogFactory.getLog(getClass());
    
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object[] queryArgs = invocation.getArgs();
        MappedStatement ms = (MappedStatement) queryArgs[0];
        Object parameter = queryArgs[1];
        SqlSource sqlSource = ms.getSqlSource();
        if (sqlSource instanceof DynamicSqlSource
            && SqlCommandType.SELECT.equals(ms.getSqlCommandType())) {
            doSqlFilter(queryArgs, ms, parameter);
        }
        return invocation.proceed();
    }
    
    /**
     * SQL过滤主方法。
     * @author licheng
     * @param queryArgs 插件参数数组 
     * @param ms MappedStatement
     * @param parameter 参数
     * @return 是否进行了过滤，不很准确
     * @since V1.0.0
     */
    private boolean doSqlFilter(Object[] queryArgs, MappedStatement ms, Object parameter) {
        //TOrder order = (TOrder)parameter;
        //order.setTestName(SqlFilterUtil.escapeLikeQuery(order.getTestName()));
        if (parameter == null) {
            return false;
        }
        if (parameter instanceof String) {
            if (!getVariables(ms).isEmpty()) {
                queryArgs[PARAMETER_INDEX] = SqlFilterUtil.escapeLikeQuery(parameter.toString());
                return true;
            }
            return false;
        }
        if (parameter instanceof SimpleType || parameter instanceof Collection) {
            return false;
        }
        
        List<String> properties = getVariables(ms);
        Object newParameter = null;
        if (!properties.isEmpty()) {
            try {
                newParameter = ObjectCloneUtil.deepClone(parameter);
            } catch (Exception e) {
                logger.debug(e.getMessage());
                return false;
            }
        }
        for (String propertyFullName : properties) {
            Object preObject = newParameter;
            String[] propertyNameArr = propertyFullName.split("\\.");
            for (int i = 0; i < propertyNameArr.length; i++) {
                if (i == propertyNameArr.length - 1) {
                    doSqlFilterForObject(preObject, propertyNameArr[i]);
                } else {
                    preObject = getSubObjectByName(preObject, propertyNameArr[i]);
                    if (preObject == null) {
                        break;
                    }
                }
            }
        }
        queryArgs[PARAMETER_INDEX] = newParameter == null ? parameter
            : newParameter;
        return false;
        
    }
    
    /**
     * 获取对象的子对象.
     * @author licheng
     * @param parameter 对象
     * @param propertyName 属性名称
     * @return 子对象
     * @since V1.0.0
     */
    @SuppressWarnings("rawtypes")
    private Object getSubObjectByName(Object parameter, String propertyName) {
        if (parameter instanceof SimpleType) {
            return null;
        }
        
        if (parameter instanceof Map) {
            if (((Map) parameter).containsKey(propertyName)) {
                return ((Map) parameter).get(propertyName);
            }
            
        } else {
            if (ReflectUtil.hasGetter(parameter, propertyName)) {
                Object value = ReflectUtil.invokeGetter(parameter, propertyName);
                return value;
            }
        }
        return null;
    }
    
    /**
     * 对当前对象的属性进行sql过滤。
     * @author licheng
     * @param parameter 对象
     * @param propertyName 属性名称
     * @since V1.0.0
     */
    @SuppressWarnings({"rawtypes", "unchecked" })
    private void doSqlFilterForObject(Object parameter, String propertyName) {
        if (parameter instanceof SimpleType) {
            return;
        }
        Object value = null;
        if (parameter instanceof Map) {
            if (propertyName.endsWith(IGNORE_SQL_FILTER_MAP_KEY_SUFFIX)) {
                return;
            }
            if (((Map) parameter).containsKey(propertyName)) {
                value = ((Map) parameter).get(propertyName);
                ((Map) parameter).put(propertyName, doSqlFilterForValue(value));
            }
            
        } else {
            if (CollectionsUtil.contains(IGNORE_FIELD_NAMES, propertyName)) {
                return;
            }
            //忽略注解中不需要做过滤的属性
            if (isIgnoreSqlFilter(parameter, propertyName)) {
                return;
            }
            if (ReflectUtil.hasGetter(parameter, propertyName)
                && ReflectUtil.hasSetter(parameter, propertyName)) {
                value = ReflectUtil.invokeGetter(parameter, propertyName);
                ReflectUtil.invokeSetter(parameter, propertyName, doSqlFilterForValue(value));
            }
        }
    }
    
    /**
     * 根据注解配置判断是否要忽略过滤。
     * @author licheng
     * @param parameter 对象
     * @param propertyName 属性名称
     * @return 是否忽略
     * @since V1.0.0
     */
    private boolean isIgnoreSqlFilter(Object parameter, String propertyName) {
        try {
            Field field = parameter.getClass().getDeclaredField(propertyName);
            if (field != null) {
                IgnoreSqlFilter filter = field.getDeclaredAnnotation(IgnoreSqlFilter.class);
                if (filter != null) {
                    Method enableMethod = filter.annotationType().getDeclaredMethod("enabled",
                        new Class[] {});
                    Object enabled = enableMethod.invoke(filter, new Object[] {});
                    return (Boolean) enabled;
                }
            }
        } catch (Exception e) {
            logger.debug("isIgnoreSqlFilter:get annotation property fail!:{}");
        }
        return false;
    }
    
    /**
     * 进行sql过滤：现只针对字符串类型进行过滤。
     * @author licheng
     * @param value 参数
     * @return 过滤后的结果
     * @since V1.0.0
     */
    private Object doSqlFilterForValue(Object value) {
        if (value instanceof String && value != null) {
            return SqlFilterUtil.escapeLikeQuery(value.toString());
        }
        return value;
    }
    
    /**
     * 获取sql语句中的直接变量集合。
     * @author licheng
     * @param ms MappedStatement
     * @return 变量集合
     * @since V1.0.0
     */
    private List<String> getVariables(MappedStatement ms) {
        List<String> properties = new ArrayList<>();
        DynamicSqlSource sqlSource = (DynamicSqlSource) ms.getSqlSource();
        SqlNode rootSqlNode = (SqlNode) ReflectUtil.getFieldValue(sqlSource, "rootSqlNode");
        doSqlNode(rootSqlNode, properties);
        
        return properties;
    }
    
    /**
     * 处理sqlnode结点。
     * @author licheng
     * @param sqlNode 结点
     * @param properties 变量名保存结果集合
     * @since V1.0.0
     */
    @SuppressWarnings("unchecked")
    private void doSqlNode(SqlNode sqlNode, List<String> properties) {
        
        //ForEachSqlNode 不做处理
        if (sqlNode instanceof MixedSqlNode) {
            List<SqlNode> sqlNodes = (List<SqlNode>) ReflectUtil.getFieldValue(sqlNode, "contents");
            for (SqlNode node : sqlNodes) {
                doSqlNode(node, properties);
            }
        } else if (sqlNode instanceof TrimSqlNode || sqlNode instanceof IfSqlNode) {
            SqlNode node = (SqlNode) ReflectUtil.getFieldValue(sqlNode, "contents");
            doSqlNode(node, properties);
        } else if (sqlNode instanceof ChooseSqlNode) {
            List<SqlNode> sqlNodes = (List<SqlNode>) ReflectUtil.getFieldValue(sqlNode,
                "ifSqlNodes");
            for (SqlNode node : sqlNodes) {
                doSqlNode(node, properties);
            }
        } else if (sqlNode instanceof TextSqlNode) {
            String text = (String) ReflectUtil.getFieldValue(sqlNode, "text");
            GenericTokenParser genericTokenParser = new GenericTokenParser("${", "}",
                new MyBindingTokenParser(properties));
            genericTokenParser.parse(text);
        }
    }
    
    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }
    
    @SuppressWarnings("unused")
    @Override
    public void setProperties(Properties properties) {
        Boolean enabled = Boolean.parseBoolean(properties.getProperty("enabled"));
    }
    
    /**
     * 自定义变量解析委托对象。
     * ClassName: MyBindingTokenParser <br/>
     * date: 2016年10月24日 上午11:21:30 <br/>
     * @author licheng
     * @version SqlInjectInterceptor
     * @since V1.0.0
     */
    private static class MyBindingTokenParser implements TokenHandler {
        
        /**
         * 
         */
        private List<String> properties;
        
        /**
         * Creates a new instance of MyBindingTokenParser.
         * @param properties 变量名保存结果集合
         */
        MyBindingTokenParser(List<String> properties) {
            this.properties = properties;
        }
        
        @Override
        public String handleToken(String variableName) {
            if (!properties.contains(variableName)) {
                properties.add(variableName);
            }
            return variableName;
        }
        
    }
    
}

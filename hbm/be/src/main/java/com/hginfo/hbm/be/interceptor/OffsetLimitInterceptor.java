package com.hginfo.hbm.be.interceptor;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import com.hginfo.hbm.be.dialect.DB2Dialect;
import com.hginfo.hbm.be.dialect.DerbyDialect;
import com.hginfo.hbm.be.dialect.Dialect;
import com.hginfo.hbm.be.dialect.H2Dialect;
import com.hginfo.hbm.be.dialect.HSQLDialect;
import com.hginfo.hbm.be.dialect.MySQLDialect;
import com.hginfo.hbm.be.dialect.OracleDialect;
import com.hginfo.hbm.be.dialect.PostgreSQLDialect;
import com.hginfo.hbm.be.dialect.SQLServer2005Dialect;
import com.hginfo.hbm.be.dialect.SQLServerDialect;
import com.hginfo.hbm.be.dialect.SybaseDialect;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * fix:
 * 针对同一运行实例下同时连接使用多个不同数据库的情况进行修改,
 * 数据库语言通过databaseIdProvider获取，分页类使用动态创建替换之前的xml静态配置。
 * @author licheng 2016.10.19
 * 
 * 2012-08-14 由于源代码不兼容mybatis3.1 故在此修改覆盖 henry
 * 
 * 为ibatis3提供基于方言(Dialect)的分页查询的插件
 * 
 * 将拦截Executor.query()方法实现分页方言的插入.
 * 
 * 配置文件内容:
 * 
 * <pre>
 *  &lt;plugins>
 *  &lt;plugin interceptor="cn.org.rapid_framework.ibatis3.plugin.OffsetLimitInterceptor">
 *     &lt;property name="dialectClass" value="cn.org.rapid_framework.jdbc.dialect.MySQLDialect"/>
 *  &lt;/plugin>
 * &lt;/plugins>
 * </pre>
 * 
 * @author badqiu
 * 
 */

@Intercepts({@Signature(type = Executor.class, method = "query", args = {MappedStatement.class,
        Object.class, RowBounds.class, ResultHandler.class }) })
public class OffsetLimitInterceptor implements Interceptor {
    /**
     */
    private Log                  log                    = LogFactory.getLog(getClass());
    /**
     */
    private static final int     MAPPED_STATEMENT_INDEX = 0;
    /**
     */
    private static final int     PARAMETER_INDEX        = 1;
    /**
     */
    private static final int     ROWBOUNDS_INDEX        = 2;
    /**
     */
    private static final int     RESULT_HANDLER_INDEX   = 3;
    /**
     * 数据库方言。
     */
    private Map<String, Dialect> dialectMap             = new HashMap<>();
    
    /**
     * 拦截方法。
     * @param invocation invocation
     * @return Object
     * @throws Exception Exception
     * @see org.apache.ibatis.plugin.Interceptor#intercept(org.apache.ibatis.plugin.Invocation)
     */
    public Object intercept(Invocation invocation) throws Exception {
        processIntercept(invocation.getArgs());
        return invocation.proceed();
    }
    
    /**
     * 具体实现。
     *
     * @param queryArgs 参数
     */
    void processIntercept(final Object[] queryArgs) {
        /*queryArgs = query(MappedStatement ms, Object parameter, RowBounds
        rowBounds, ResultHandler resultHandler)*/
        MappedStatement ms = (MappedStatement) queryArgs[MAPPED_STATEMENT_INDEX];
        Object parameter = queryArgs[PARAMETER_INDEX];
        final RowBounds rowBounds = (RowBounds) queryArgs[ROWBOUNDS_INDEX];
        int offset = rowBounds.getOffset();
        int limit = rowBounds.getLimit();
        Dialect dialect = getCurDialect(ms);
        if (dialect.supportsLimit()
            && (offset != RowBounds.NO_ROW_OFFSET || limit != RowBounds.NO_ROW_LIMIT)) {
            BoundSql boundSql = ms.getBoundSql(parameter);
            String sql = boundSql.getSql().trim();
            if (dialect.supportsLimitOffset()) {
                sql = dialect.getLimitString(sql, offset, limit);
                offset = RowBounds.NO_ROW_OFFSET;
            } else {
                sql = dialect.getLimitString(sql, 0, limit);
            }
            limit = RowBounds.NO_ROW_LIMIT;
            
            queryArgs[ROWBOUNDS_INDEX] = new RowBounds(offset, limit);
            
            BoundSql newBoundSql = copyFromBoundSql(ms, boundSql, sql);
            
            MappedStatement newMs = copyFromMappedStatement(ms, new BoundSqlSqlSource(newBoundSql));
            queryArgs[MAPPED_STATEMENT_INDEX] = newMs;
        }
    }
    
    /**
     * 
     * @param ms ms
     * @param boundSql boundSql
     * @param sql sql
     * @return BoundSql
     */
    private BoundSql copyFromBoundSql(MappedStatement ms, BoundSql boundSql, String sql) {
        BoundSql newBoundSql = new BoundSql(ms.getConfiguration(), sql,
            boundSql.getParameterMappings(), boundSql.getParameterObject());
        for (ParameterMapping mapping : boundSql.getParameterMappings()) {
            String prop = mapping.getProperty();
            if (boundSql.hasAdditionalParameter(prop)) {
                newBoundSql.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop));
            }
        }
        return newBoundSql;
    }
    
    /**
     * @param ms ms
     * @param newSqlSource newSqlSource
     * @return MappedStatement
     */
    private MappedStatement copyFromMappedStatement(MappedStatement ms, SqlSource newSqlSource) {
        Builder builder = new MappedStatement.Builder(ms.getConfiguration(), ms.getId(),
            newSqlSource, ms.getSqlCommandType());
        
        builder.resource(ms.getResource());
        builder.fetchSize(ms.getFetchSize());
        builder.statementType(ms.getStatementType());
        builder.keyGenerator(ms.getKeyGenerator());
        /*
         * 不兼容mybatis3.1 拿掉 builder.keyProperty(ms.getKeyProperty());
         */
        
        // setStatementTimeout()
        builder.timeout(ms.getTimeout());
        
        // setStatementResultMap()
        builder.parameterMap(ms.getParameterMap());
        
        // setStatementResultMap()
        builder.resultMaps(ms.getResultMaps());
        builder.resultSetType(ms.getResultSetType());
        
        // setStatementCache()
        builder.cache(ms.getCache());
        builder.flushCacheRequired(ms.isFlushCacheRequired());
        builder.useCache(ms.isUseCache());
        
        return builder.build();
    }
    
    /**
     * 获取分页实现类。
     * getCurDialect:(这里用一句话描述这个方法的作用). <br/>
     * @author licheng
     * @param ms 
     * @return Dialect
     * @since V1.0.0
     */
    private Dialect getCurDialect(MappedStatement ms) {
        String databaseId = ms.getConfiguration().getDatabaseId();
        if (!dialectMap.containsKey(databaseId)) {
            try {
                dialectMap.put(databaseId,
                    (Dialect) Class.forName(DialectMapping.get(databaseId)).newInstance());
            } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
                log.error("cannot create dialect instance by dialectClass:" + ms.getDatabaseId(),
                    e);
            }
        }
        return dialectMap.get(databaseId);
    }
    
    /**
     * @param target target
     * @return Object
     * @see org.apache.ibatis.plugin.Interceptor#plugin(java.lang.Object)
     */
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }
    
    /**
     * @param properties properties
     * @see org.apache.ibatis.plugin.Interceptor#setProperties(java.util.Properties)
     */
    public void setProperties(Properties properties) {
        
    }
    
    /**
     */
    public static class BoundSqlSqlSource implements SqlSource {
        
        /**
         */
        private BoundSql boundSql;
        
        /**
         * @param boundSql boundSql
         */
        public BoundSqlSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }
        
        /**
         * @param parameterObject parameterObject
         * @return BoundSql
         * @see org.apache.ibatis.mapping.SqlSource#getBoundSql(java.lang.Object)
         */
        public BoundSql getBoundSql(Object parameterObject) {
            return boundSql;
        }
    }
    
    /**
     * 各数据库分页类映射。
     * ClassName: DialectMapping <br/>
     * @author licheng
     * @version MultiDataSourceMapping
     * @since V1.0.0
     */
    public enum DialectMapping {
        
        /**
         * 
         */
        mysql("mysql", MySQLDialect.class.getName()),
        /**
         * 
         */
        oracle("oracle", OracleDialect.class.getName()),
        
        /**
         * 
         */
        db2("db2", DB2Dialect.class.getName()),
        
        /**
         * 
         */
        derby("derby", DerbyDialect.class.getName()),
        
        /**
         * 
         */
        h2("h2", H2Dialect.class.getName()),
        
        /**
         * 
         */
        hsql("hsql", HSQLDialect.class.getName()),
        
        /**
         * 
         */
        postgresql("postgresql", PostgreSQLDialect.class.getName()),
        
        /**
         * 
         */
        sqlserver("sqlserver", SQLServerDialect.class.getName()),
        
        /**
         * 
         */
        sqlserver2005("sqlserver2005", SQLServer2005Dialect.class.getName()),
        
        /**
         * 
         */
        sybase("sybase", SybaseDialect.class.getName());
        
        /**
         * 数据库名称标识。
         */
        private String databaseId;
        
        /**
         * 数据库分页实现类名。
         */
        private String dialectClassName;
        
        /**
         * Creates a new instance of DialectMapping.
         * @param databaseId 数据库名称标识
         * @param dialectClassName 分页实现类名
         */
        DialectMapping(String databaseId, String dialectClassName) {
            this.databaseId = databaseId;
            this.dialectClassName = dialectClassName;
        }
        
        /**
         * 获取实现类名称。
         * @author licheng
         * @param key 
         * @return 类名称
         * @since V1.0.0
         */
        public static String get(String key) {
            DialectMapping[] values = DialectMapping.values();
            for (DialectMapping dialectMapping : values) {
                if (dialectMapping.databaseId.equals(key)) {
                    return dialectMapping.dialectClassName;
                }
            }
            return mysql.dialectClassName;
        }
    }
    
}

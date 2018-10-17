package com.hginfo.hbm.be.dauth.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.builder.SqlSourceBuilder;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.parsing.GenericTokenParser;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.scripting.xmltags.DynamicContext;
import org.apache.ibatis.scripting.xmltags.DynamicSqlSource;
import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import com.hginfo.hbm.be.dauth.utils.DauthMethodNameUtils;
import com.hginfo.hbm.be.dauth.utils.DauthSqlUtils;
import com.hginfo.hbm.be.dauth.utils.DauthThreadContext;
import com.hginfo.hbm.be.interceptor.OffsetLimitInterceptor.BoundSqlSqlSource;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hbm.core.utils.SysDauthUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.ReflectUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 处理数据权限。<br/>
 * <p>
 * 此拦截器需要在sql注入的拦截器之后处理，原因是：sql注入拦截器可以对${}的参数进行处理，减少数据权限中追加sql报错的概率(如果数据权限先执行，如存在sql注入引起的错误，则引发程序报错)
 * date: 2016年11月25日 上午10:44:08 <br/>
 * @author shichengqun
 */
@Intercepts({
        @Signature(type = Executor.class, method = "query", args = {MappedStatement.class,
                Object.class, RowBounds.class, ResultHandler.class }),
        @Signature(type = Executor.class, method = "update", args = {MappedStatement.class,
                Object.class }) })
public class DauthSqlInterceptor implements Interceptor {
    /**
     */
    private Log                 log                             = LogFactory.getLog(getClass());
    /**
     */
    private static final int    MAPPED_STATEMENT_INDEX          = 0;
    
    /**
     */
    private static final int     PARAMETER_INDEX                = 1;
    
    /**
     * 数据权限参数的前缀 __。
     */
    private static final String DAUTH_PARAM_PREFIX    = "__";
    
    /**
     * 数据权限参数的open token ： ${__。
     */
    private static final String DAUTH_TOKEN_OPEN      = "${" + DAUTH_PARAM_PREFIX;
    
    /**
     * 数据权限参数的close token }。
     */
    private static final String DAUTH_TOKEN_CLOSE     = "}";
    
    /**
     * 拦截方法。
     * @param invocation invocation
     * @return Object
     * @throws Exception Exception
     * @see org.apache.ibatis.plugin.Interceptor#intercept(org.apache.ibatis.plugin.Invocation)
     */
    public Object intercept(Invocation invocation) throws Exception {
        try {
            processIntercept(invocation.getArgs());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new DauthParseException(SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_DEFAULT, e);
        }
        return invocation.proceed();
    }
    
    /**
     * 具体实现。<br/>
     * <p>1、通过$${}控制使用的数据权限和位置；在解析时判断全局开关，防止sql中$${}报错</p>
     * <p>2、通过mapper/dao方法配置 自动追加 到where条件中；优先判断全局开关，然后判断有无权限配置</p>
     * <p>3、如果存在$${}时，则不进行 2 的判断</p>
     * @param queryArgs 参数
     */
    void processIntercept(final Object[] queryArgs) {
        
        MappedStatement ms = (MappedStatement) queryArgs[MAPPED_STATEMENT_INDEX];
        String msId = ms.getId();
        
        String mapper = DauthMethodNameUtils.getMethodClass(msId);
        
        log.info("MappedStatement ID:" + msId + ",mapperClass:" + mapper);
        
        //数据权限相关的不进行处理。
        if (mapper.startsWith(SysDauthConstants.DAUTH_NO_CHECK_PREFIX)) {
            return;
        }
        
        Object parameter = queryArgs[PARAMETER_INDEX];
        SqlSource sqlSource = ms.getSqlSource();
        boolean dauthParmFlag = false;
        if (sqlSource instanceof DynamicSqlSource) {
            SqlNode rootSqlNode = (SqlNode) ReflectUtil.getFieldValue(sqlSource, "rootSqlNode");
            try {
                dauthParmFlag = doDauthParamSqlNode(rootSqlNode);
                if (dauthParmFlag) {
                    BoundSql newBoundSql = getBoundSql(rootSqlNode, ms.getConfiguration(), parameter,
                        DauthThreadContext.getDauthMap());
                    MappedStatement newMs = copyFromMappedStatement(ms, new BoundSqlSqlSource(newBoundSql));
                    queryArgs[MAPPED_STATEMENT_INDEX] = newMs;
                }
            } finally {
                DauthThreadContext.removeDauthMap();
            }
        }
        
        log.info("SQL中数据权限参数是否存在:" + dauthParmFlag);
        
        if (!dauthParmFlag) {
            
            //如果不启用数据权限，则直接返回
            if (!SysDauthUtil.isDauthFlagValid()) {
                return;
            }
            
            BoundSql boundSql = ms.getBoundSql(parameter);
            String sql = boundSql.getSql().trim();
            String dbType = ms.getConfiguration() == null ? "" : ms.getConfiguration().getDatabaseId();
            if (!StringUtil.isEmpty(sql)) {
                sql = DauthTokenHandler.getHandler().parseMethodDauth(msId, sql, dbType == null ? "" : dbType);
                BoundSql newBoundSql = copyFromBoundSql(ms, boundSql, sql);
                MappedStatement newMs = copyFromMappedStatement(ms, new BoundSqlSqlSource(newBoundSql));
                queryArgs[MAPPED_STATEMENT_INDEX] = newMs;
            }
        }
    }
    
    
    
    /**
     * 处理sqlnode节点中带有的数据权限参数。
     * @param rootSqlNode 解析sql的根节点
     * @return 是否存在数据权限参数
     */
    private boolean doDauthParamSqlNode(SqlNode rootSqlNode) {
        boolean dataPermissionFlag = false;
        List<SqlNode> textNodeList = new ArrayList<>();
        DauthSqlUtils.getAllTextNode(rootSqlNode, textNodeList);
        for (SqlNode node : textNodeList) {
            String text = (String) ReflectUtil.getFieldValue(node, "text");
            if (text.indexOf(DAUTH_TOKEN_OPEN) > -1) {
                dataPermissionFlag = true;
                GenericTokenParser genericTokenParser = new GenericTokenParser(
                    DAUTH_TOKEN_OPEN, DAUTH_TOKEN_CLOSE,
                    DauthTokenHandler.getHandler());               
                log.info("数据权限控制-通过${__-原SQL片段:" + text);
                
                genericTokenParser.parse(text);
                
            }
        }
        return dataPermissionFlag;
    }
    
    
    /**
     * 获取BoundSql。
     * <p>从DynamicSqlSource.getBoundSql方法复制过来，增加数据权限的参数</p>
     * @param rootSqlNode 节点
     * @param configuration 配置
     * @param parameterObject 参数
     * @param dauthMap 数据权限参数
     * @return boundSql
     */
    private BoundSql getBoundSql(SqlNode rootSqlNode, Configuration configuration,
        Object parameterObject, Map<String, String> dauthMap) {
        DynamicContext context = new DynamicContext(configuration, parameterObject);
        //设置数据权限参数，需要由前缀__
        for (Map.Entry<String, String> entry : dauthMap.entrySet()) {
            context.bind(DAUTH_PARAM_PREFIX + entry.getKey(), entry.getValue());
        }
        rootSqlNode.apply(context);
        SqlSourceBuilder sqlSourceParser = new SqlSourceBuilder(configuration);
        Class<?> parameterType = parameterObject == null ? Object.class : parameterObject.getClass();
        SqlSource sqlSource = sqlSourceParser.parse(context.getSql(), parameterType, context.getBindings());
        BoundSql boundSql = sqlSource.getBoundSql(parameterObject);
        for (Map.Entry<String, Object> entry : context.getBindings().entrySet()) {
          boundSql.setAdditionalParameter(entry.getKey(), entry.getValue());
        }
        
        return boundSql;
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
    
    
}

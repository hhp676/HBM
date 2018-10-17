package com.hginfo.hbm.be.dauth.interceptor;

import javax.annotation.PostConstruct;

import org.apache.ibatis.parsing.TokenHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.druid.sql.SQLUtils;
import com.hginfo.hbm.be.dauth.utils.DauthThreadContext;
import com.hginfo.hbm.be.service.impl.sys.SysDauthServiceImpl;
import com.hginfo.hbm.be.service.impl.sys.SysDauthUsageServiceImpl;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;

/**
 * 数据权限使用$${}的处理。
 * Date: 2016年11月26日 下午3:24:53 <br/>
 * @author shichengqun
 */
@Component
public class DauthTokenHandler implements TokenHandler {
    /**
     */
    private static Log log = LogFactory.getLog(DauthTokenHandler.class);
    /**
     */
    private static DauthTokenHandler handler;
    
    /**
     * 
     */
    @Autowired
    private SysDauthServiceImpl sysDauthServiceImpl;
    
    /**
     * 
     */
    @Autowired
    private SysDauthUsageServiceImpl sysDauthUsageServiceImpl;
    
    /**
     * 初始化方法。 
     */
    @PostConstruct
    private void init() {
        handler = this;
    }
    
    /**
     * 获取handler。 <br/>
     * 不考虑线程安全性，即使出现多个实例也不会产生影响. <br/>
     * @return handler
     */
    public static DauthTokenHandler getHandler() {
        return handler;
    }
    
    
    
    @Override
    public String handleToken(String dauthCode) {
        log.info("handleToken-数据权限的参数为 : " + dauthCode);
        
        if (!DauthThreadContext.getDauthMap().containsKey(dauthCode)) {
            
            //${__}传参的优先级最高，不判断Dao的update*、delete*是否会指定相应权限
            String dauthSql = this.getDauthSQLByCode(dauthCode);
            DauthThreadContext.getDauthMap().put(dauthCode, dauthSql);
            
            log.info("handleToken-数据权限SQL为 : " + dauthSql);
        }
        return dauthCode;
    }
    
    
    /**
     * 处理mapper/dao方法配置数据权限的sql。
     * @param msId MappedStatementId（mapper方法）
     * @param sql 原sql语句
     * @param dbType 数据库类型 
     * @return 带数据权限的SQL
     */
    public String parseMethodDauth(String msId, String sql, String dbType) {
        
        /*
         * 1、Dao的update*、delete*是否会指定相应权限比通过数据权限应用功能配置的优先级高
         * 2、如果当前线程中有数据权限code，则用当前线程中的权限校验；是update*、delete*相关的权限
         */
        String dauthCode = DauthThreadContext.getUpdateMethodDauthCode();
        
        log.info("parseMethodDauth-当前线程中数据权限的参数为 : " + dauthCode);
        if (StringUtil.isEmpty(dauthCode)) {
            dauthCode = sysDauthUsageServiceImpl.getDauthCodeByMethodName(msId);
            log.info("parseMethodDauth-数据权限控制-方法配置DauthCode：" + dauthCode);
        }
        
        
        if (StringUtil.isNotEmpty(dauthCode)) {
            log.info("parseMethodDauth-数据权限控制-方法配置-原SQL：" + sql);
            
            String dauthSql = this.getDauthSQLByCode(dauthCode);
            log.info("parseMethodDauth-数据权限控制-方法配置-数据权限SQL：" + dauthSql);
            
            // 非常感谢alibaba提供的SQLUtils，解决了添加条件的技术问题；alibaba 强大；
            //一定注意sql中  and的优先级比or高，所以SQLUtils解析后会去掉部分括号。
            sql = SQLUtils.addCondition(sql, dauthSql, dbType);
            
            log.info("parseMethodDauth-数据权限控制-方法配置-生成SQL：" + sql);
        }
        return sql;
    }
    
    /**
     * 根据数据权限code获取数据权限sql。
     * @param dauthCode 数据权限code
     * @return 获取数据权限sql
     */
    private String getDauthSQLByCode(String dauthCode) {
        return sysDauthServiceImpl.getDauthSQL(dauthCode, false);
    }
    
}

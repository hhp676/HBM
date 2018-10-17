package com.hginfo.hbm.be.datasource;

import org.springframework.transaction.support.TransactionSynchronizationManager;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * 设置当前线程变量的工具类，用于设置对应的数据源名称。
 * date: 2016年9月8日 下午6:26:20 <br/>
 *
 * @author shichengqun
 */
public final class DataSourceContextHolder {
    
    /**
     * 线程变量。
     */
    private static final ThreadLocal<String> DATASOURCEKEY_CONTEXTHOLDER = new ThreadLocal<>();
    
    /**
     */
    private static Log log = LogFactory.getLog(DataSourceContextHolder.class);
    
    /**
     */
    private DataSourceContextHolder() {
    }
    
    /** 
     * 设置数据源key 。
     * @param dataSourceType  数据库类型 
     */
    public static void setDataSourceKey(String dataSourceType) {
        boolean isActualTransactionActive = TransactionSynchronizationManager.isActualTransactionActive();
        log.error("current thread transaction isActualTransactionActive：" + isActualTransactionActive);
        
        if (isActualTransactionActive) {
            // 已经开启事务，再设置数据源不起作用
            throw new BaseRuntimeException("当前线程已开启事务，不可更换数据源！");
        }
        
        DATASOURCEKEY_CONTEXTHOLDER.set(dataSourceType);
        log.info("切换数据源为：" + dataSourceType);
    }
    
    /** 
     * 获取数据源key 。
     * @return String 
     */
    public static String getDataSourceKey() {
        String key = DATASOURCEKEY_CONTEXTHOLDER.get();
        if (key != null) {
            log.info("获取切换的数据源为：" + key);
        }
        return key;
    }
    
    /** 
     * 清除数据源类型 。
     */
    public static void clearDataSourceKey() {
        log.info("还原数据源为默认");
        DATASOURCEKEY_CONTEXTHOLDER.remove();
    }
}

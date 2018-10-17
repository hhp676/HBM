package com.hginfo.hbm.be.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 数据源路由，实现动态数据源切换逻辑。
 * date: 2016年9月8日 下午6:33:06 <br/>
 *
 * @author shichengqun
 */
public class DynamicDataSource extends AbstractRoutingDataSource {  

    
    /**
     * 如果DataSourceContextHolder还未指定数据源，则使用默认。
     * @return DataSource的key
     * @see org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource#determineCurrentLookupKey()
     */
    @Override  
    protected Object determineCurrentLookupKey() {  
        return DataSourceContextHolder.getDataSourceKey();  
    }  
}  


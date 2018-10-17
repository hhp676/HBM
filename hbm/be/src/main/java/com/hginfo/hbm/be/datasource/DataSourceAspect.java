package com.hginfo.hbm.be.datasource;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.core.constants.AspectOrderConstants;

/**
 * 动态数据源切换的拦截器。<br/>
 * 设置切面通知顺序为1，比事务配置优先级高（在执行切面时优先执行）。
 * date: 2016年9月8日 下午6:18:10 <br/>
 *
 * @author shichengqun
 */
@Aspect
@Order(AspectOrderConstants.ORDER_DATASOURCE)
@Component
public class DataSourceAspect {
    
    
    /**
     * 在方法前执行。
     * @param dataSourceKey 数据源切换key对象
     * @since V1.0.0
     */
    @Before(value = "@annotation(dataSourceKey)")
    public void changeDataSource(DataSourceKey dataSourceKey) {
        DataSourceContextHolder.setDataSourceKey(dataSourceKey.value());
    }
    
    /**
     * 方法后执行。<br>
     * 与@AfterReturing区别：
     *    AfterReturing只有在目标方法成功完成后才会被织入，而After不管目标方法如何完成（包括成功完成和遇到异常），都会织入
     * @param dataSourceKey 数据源切换key对象
     * @throws Exception 异常
     */
    @After(value = "@annotation(dataSourceKey)")
    public void clearDataSource(DataSourceKey dataSourceKey) {
        DataSourceContextHolder.clearDataSourceKey();
    }
    
}

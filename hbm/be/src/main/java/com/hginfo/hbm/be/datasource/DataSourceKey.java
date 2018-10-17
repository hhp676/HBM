package com.hginfo.hbm.be.datasource;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 在事务、非事务方法上加。<br/>
 * 1、不可在事务内部方法加（此时无效，数据源已经确定）<br/>
 * 2、不可在applicationContext-tx.xml中事务配置的所有方法的内部方法上加，包括read-only方法<br/>
 * date: 2016年9月8日 下午6:31:37 <br/>
 *
 * @author shichengqun
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataSourceKey {

    /**
     * 设置DataSource的key。
     * @return key
     */
    String value() default DataSourceConstants.HBM;

}

package com.hginfo.hbm.be.cache;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by qiujingde on 2017/4/26. <br />
 * 设置需要添加缓冲的DAO。
 *
 * @author qiujingde
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface HCacheDao {

    /**
     * 设置缓存前缀。
     * @return 缓存前缀。
     */
    String value() default "";

}

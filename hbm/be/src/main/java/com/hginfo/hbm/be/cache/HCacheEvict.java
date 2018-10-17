package com.hginfo.hbm.be.cache;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by qiujingde on 2017/4/27. <br />
 * 注意：<br />
 * 1.添加在使用mybatis更新数据的方法上。<br />
 * 2.对应方法执行时，会删除对应实体所有的缓存数据（包含实体缓存和查询缓存）。<br />
 * 3.HCacheEvict的代价很大，原则上不应该在有mybatis更新的实体类上添加HCacheDao。<br />
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface HCacheEvict {
}

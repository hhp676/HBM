/**
 * Project Name:hbm-be
 * File Name:DauthUpdate.java
 * Package Name:com.hginfo.hbm.be.dauth.annotation
 * Date:2017年2月23日上午11:12:00
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ServiceImpl中更新数据时是否数据权限校验的标志。<br/>
 * <p>1、此注解只能加到ServiceImpl中的方法上。</p>
 * <p>2、entityClass、dauthCode不能为空。</p>
 * <p>3、在此注解的ServiceImpl方法的执行过程中不能对某一实体类重复设置dauthCode。eg:下面使用方法会报错</p>
 * <pre>AServiceImpl中：</pre>
 * <pre></pre>
 * <pre>  @DauthUpdateValidate(entityClass = B.class, dauthCode = "bUpdateDauth")</pre>
 * <pre>  public void updateA(A a) {</pre>
 * <pre>      dao.update(a);</pre>
 * <pre>      bServiceImpl.updateB();</pre>
 * <pre>  }</pre>
 * <pre>BServiceImpl中：</pre>
 * <pre></pre>
 * <pre>  @DauthUpdateValidate(entityClass = B.class, dauthCode = "bUpdateDauth")</pre>
 * <pre>  public void updateB(B b) {</pre>
 * <pre>      dao.update(b);</pre>
 * <pre>  }</pre>
 * @author shichengqun
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DauthUpdateValidate {
    
    /**
     * 实体类。
     * @return className
     */
    Class entityClass();
    
    /**
     * 数据权限code.
     * @return dauthCode
     */
    String dauthCode();
    
    /**
     * 可在同一个方法上定义多个.<br/>
     * <p>1、value 不能为空</p>
     *
     */
    @Target({ElementType.METHOD})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    public @interface DauthUpdateValidates {

        /**
         * 实体与权限的关系组。
         * @return 关系组
         */
        DauthUpdateValidate[] value();
    }
    
}


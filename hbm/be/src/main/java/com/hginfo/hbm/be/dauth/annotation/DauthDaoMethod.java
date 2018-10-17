/**
 * Project Name:hbm-be
 * File Name:DauthDaoCheck.java
 * Package Name:com.hginfo.hbm.be.dauth.annotation
 * Date:2017年2月22日下午3:01:18
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
 * 需要数据权限校验的Dao更新方法的注解，包括update*、delete* 方法。<br/>
 * 
 * <p>1、此注解只能应用于Dao的update*、delete*方法，且update*、delete*方法是通过hibernate进行1条数据更新的。</p>
 * <p>2、Dao方法的update*、delete*方法参数类型可以是：SingleKeyBaseEntity、Updater、Long，并可以通过参数获取Id。</p>
 * <p>3、此注解只对SingleKeyBaseDao的子类有效，即：只对单主键Dao有效。</p>
 * 
 * Date: 2017年2月22日 下午3:01:18 <br/>
 * @author shichengqun
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DauthDaoMethod {
}


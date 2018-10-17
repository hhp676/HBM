/**
 * Project Name:hbm-be
 * File Name:DauthThreadContext.java
 * Package Name:com.hginfo.hbm.be.dauth.utils
 * Date:2017年2月22日上午10:22:07
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.dauth.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * 数据权限执行上下文信息。
 * Date: 2017年2月22日 上午10:22:07 <br/>
 * @author shichengqun
 */
public abstract class DauthThreadContext {
    
    /**
     * 
     */
    private static final ThreadLocal<Map<Object, Object>> RESOURCES =  new DauthThreadLocalMap<Map<Object, Object>>();
    
    /**
     * 当前 绑定update*、delete*方法的数据权限 的key。
     */
    private static final String DAUTH_UPDATE_DAUTHCODE_KEY = "DAUTH_UPDATE_DAUTHCODE_KEY";
    
    /**
     * 当前 sql中dauthCode与dauthSql绑定的key。
     */
    private static final String DAUTH_DAUTHMAP_KEY = "DAUTH_DAUTHMAP_KEY";
    
    
    /**
     * 绑定当前update*、delete*方法的数据权限code，须与unBindUpdateMethodDauthCode成对出现。<br/>
     * <p>1、通过mybatis的getById查询数据时，则查询此时绑定的权限。</p>
     * @param dauthCode 数据权限code
     */
    public static void bindUpdateMethodDauthCode(String dauthCode) {
        put(DAUTH_UPDATE_DAUTHCODE_KEY, dauthCode);
    }
    
    /**
     * 获取当前update*、delete* methodName对应的dauthCode。<br/>
     * <p>1、通过mybatis的getById查询数据时，则查询此时绑定的权限。</p>
     * @return dauthCode
     */
    public static String getUpdateMethodDauthCode() {
        Object dauthCode = get(DAUTH_UPDATE_DAUTHCODE_KEY);
        return dauthCode == null ? null : dauthCode.toString();
    }
    
    /**
     * 解除绑定当前update*、delete*方法的数据权限code。<br/>
     * <p>1、通过mybatis的getById查询数据完成后，则需要解除绑定的权限。</p>
     */
    public static void unBindUpdateMethodDauthCode() {
        remove(DAUTH_UPDATE_DAUTHCODE_KEY);
    }
    
    /**
     * 绑定数据实体与权限的关系，须与unBindEntityDauthCode成对出现。。
     * @param entityClassName 实体类
     * @param dauthCode dauthCode
     */
    public static void bindEntityDauthCode(String entityClassName, String dauthCode) {
        put(entityClassName, dauthCode);
    }
    
    /**
     * 获取绑定的数据实体dauthCode。
     * @param entityClassName 实体类
     * @return dauthCode
     */
    public static String getEntityDauthCode(String entityClassName) {
        Object dauthCode = get(entityClassName);
        return dauthCode == null ? null : dauthCode.toString();
    }
    
    /**
     * 解除实体与数据权限的绑定。
     * @param entityClassName 实体类
     */
    public static void unBindEntityDauthCode(String entityClassName) {
        remove(entityClassName);
    }
    
    /**
     * 获取绑定的dauthCode与dauthSql的关系，put值时须与removeDauthMap成对出现。。
     * @return dauthMap
     */
    @SuppressWarnings("unchecked")
    public static Map<String, String> getDauthMap() {
        if (get(DAUTH_DAUTHMAP_KEY) == null) {
            put(DAUTH_DAUTHMAP_KEY, new HashMap<Object, Object>());
        }
        return (Map<String, String>) get(DAUTH_DAUTHMAP_KEY);
    }
    
    /**
     * 移除的dauthCode与dauthSql的关系。
     */
    public static void removeDauthMap() {
        remove(DAUTH_DAUTHMAP_KEY);
    }
    
    
    /**
     * 往线程变量中保存值，如果值为null，则删除线程变量中的对应key的值。
     * <pre>
     * if ( value == null ) {
     *     remove( key );
     * }
     * </pre>
     *
     * @param key   key.
     * @param value  value.
     * @throws IllegalArgumentException 如果key是null，则报异常.
     */
    private static void put(Object key, Object value) {
        if (key == null) {
            throw new IllegalArgumentException("key cannot be null");
        }
        if (value == null) {
            remove(key);
            return;
        }
        ensureResourcesInitialized();
        RESOURCES.get().put(key, value);
    }
    
    /**
     * 
     * 删除线程变量中key对应的值。
     * @param key key
     */
    private static void remove(Object key) {
        Map<Object, Object> perThreadResources = RESOURCES.get();
        if (perThreadResources != null) {
            perThreadResources.remove(key);
        }
    }
    
    /**
     * 根据key获取线程变量中的值。
     * @param key key
     * @return 值
     */
    private static Object get(Object key) {
        Map<Object, Object> perThreadResources = RESOURCES.get();
        return perThreadResources != null ? perThreadResources.get(key) : null;
    }
    
    /**
     * 如果RESOURCES为null初始化RESOURCES。
     */
    private static void ensureResourcesInitialized() {
        if (RESOURCES.get() == null) {
            RESOURCES.set(new HashMap<Object, Object>());
        }
    }
    
    
    /**
     * 子线程会继承父线程的信息。
     * date: 2017年2月22日 上午10:26:01 <br/>
     * @author shichengqun
     * @param <T> 
     */
    private static final class DauthThreadLocalMap<T extends Map<Object, Object>>
        extends InheritableThreadLocal<Map<Object, Object>> {
        
        /**
         * 参考shiro的ThreadContext
         * This implementation was added to address a
         * <a href="http://jsecurity.markmail.org/search/?q=#query:+page:1+mid:xqi2yxurwmrpqrvj+state:results">
         * user-reported issue</a>.
         * @param parentValue the parent value, a HashMap as defined in the {@link #initialValue()} method.
         * @return the HashMap to be used by any parent-spawned child threads (a clone of the parent HashMap).
         */
        @SuppressWarnings({"unchecked"})
        @Override
        protected Map<Object, Object> childValue(Map<Object, Object> parentValue) {
            if (parentValue != null) {
                return (Map<Object, Object>) ((HashMap<Object, Object>) parentValue).clone();
            } else {
                return null;
            }
        }
    }
}


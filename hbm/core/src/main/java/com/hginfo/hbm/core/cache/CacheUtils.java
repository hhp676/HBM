package com.hginfo.hbm.core.cache;

import com.hginfo.hbm.core.utils.ConfigUtil;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;

/**
 * Created by qiujingde on 2016/10/27.
 * @author qiujingde
 * 缓存工具类
 *
 * 需要初始化CacheManager
 * 在spring配置中可以使用MethodInvokingFactoryBean完成
 */
public final class CacheUtils {

    /**
     *
     * Creates a new instance of CacheUtils.
     *
     */
    private CacheUtils() {
    }

    /**
     *
     */
    private static CacheManager cacheManager;

    public static CacheManager getCacheManager() {
        return cacheManager;
    }

    /**
     * 缓存名称前缀。
     */
    private static String cachePrefix = null;


    public static void setCacheManager(CacheManager cacheManager) {
        CacheUtils.cacheManager = cacheManager;
    }


    /**
     * 获取缓存。
     * @param name name
     * @return cache
     * @since V1.0.0
     */
    public static Cache getCache(String name) {
        checkStatus();
        if (cachePrefix==null){
            if ("org.springframework.data.redis.cache.RedisCacheManager".equals(getCacheManager().getClass().getName())){
                cachePrefix = ConfigUtil.getFullCachePrefix();
            }
            else {
                cachePrefix = "";
            }
        }
        return cacheManager.getCache(cachePrefix + name);
    }

    /**
     * 设置一个缓存。
     * @param cacheName cacheName
     * @param key key
     * @param value value
     * @since V1.0.0
     */
    public static void cache(String cacheName, Object key, Object value) {
        Cache cache = getCache(cacheName);
        if (cache != null) {
            cache.put(key, value);
        }
    }

    /**
     * 通过KEY获取一个缓存对象。
     * @param cacheName cacheName
     * @param key key
     * @return 对象
     * @since V1.0.0
     */
    public static Object get(String cacheName, Object key) {
        Cache cache = getCache(cacheName);
        return cache != null ? cache.get(key)
            : null;
    }

    /**
     * 获取缓存对象。
     * @param cacheName cacheName
     * @param key key
     * @param type type
     * @param <T> T
     * @return T
     * @since V1.0.0
     */
    public static <T> T get(String cacheName, Object key, Class<T> type) {
        Cache cache = getCache(cacheName);
        return cache != null ? cache.get(key, type)
            : null;
    }

    /**
     * 销毁缓存中一个值。
     * @author licheng
     * @param cacheName cacheName
     * @param key key
     * @since V1.0.0
     */
    public static void evict(String cacheName, Object key) {
        Cache cache = getCache(cacheName);
        if (cache != null) {
            cache.evict(key);
        }
    }

    /**
     * 清除一个缓存。
     * @param cacheName cacheName
     * @since V1.0.0
     */
    public static void clear(String cacheName) {
        Cache cache = getCache(cacheName);
        if (cache != null) {
            cache.clear();
        }
    }

    /**
     * 检测缓存可用状态。
     * @author lichengCacheUtils.get(CacheConstants.SYS_AUTH, allAuthListCacheKey, List.class)
     * @since V1.0.0
     */
    private static void checkStatus() {
        if (cacheManager == null) {
            throw new IllegalStateException("CacheManager未被初始化");
        }
    }

}

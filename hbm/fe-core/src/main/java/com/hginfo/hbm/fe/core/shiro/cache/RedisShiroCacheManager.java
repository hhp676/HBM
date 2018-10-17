package com.hginfo.hbm.fe.core.shiro.cache;

import com.hginfo.hbm.core.utils.ConfigUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.xml.ResourceEntityResolver;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import static com.hginfo.hutils.StringUtil.obj2String;

/**
 * Created by qiujingde on 2016/10/27.
 * @author qiujingde
 * shiro cache manager的redis实现
 */
public class RedisShiroCacheManager implements CacheManager, InitializingBean, ApplicationContextAware {

    private final Log log = LogFactory.getLog(getClass());
    private final ConcurrentMap<String, RedisShiroCache<?, ?>> cacheMap = new ConcurrentHashMap<>(16);

    private ApplicationContext applicationContext;
    private Resource location;
    private RedisTemplate<?, ?> redisTemplate;
    private Long expiration;

    public void setLocation(Resource location) {
        this.location = location;
    }

    public void setRedisTemplate(RedisTemplate<?, ?> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setExpiration(long expiration) {
        this.expiration = expiration;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        if (redisTemplate == null) {
            loadTemplate();
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @Override
    @SuppressWarnings("unchecked")
    public <K, V> Cache<K, V> getCache(String name) {
        name = formatName(name);
        if (log.isTraceEnabled()) {
            log.trace("Acquiring EhCache instance named [" + name + "]");
        }

        try {
            RedisShiroCache<?, ?> cache = cacheMap.get(name);
            if (cache == null) {
                cache = createCache(name);
            }
            return (RedisShiroCache<K, V>) cache;
        } catch (net.sf.ehcache.CacheException e) {
            log.error(obj2String(e.getMessage()), e);
            throw new CacheException(e);
        }
    }

    private synchronized void loadTemplate() {
        if (redisTemplate != null) {
            return;
        }
        Resource actualLocation = this.location;
        if (actualLocation == null) {
            actualLocation = applicationContext.getResource("classpath:shiro/redis-shiro.xml");
        }

        GenericApplicationContext factory = new GenericApplicationContext();
        factory.setParent(applicationContext);
        XmlBeanDefinitionReader reader = new XmlBeanDefinitionReader(factory);
        reader.setEnvironment(applicationContext.getEnvironment());
        reader.setEntityResolver(new ResourceEntityResolver(applicationContext));
        reader.loadBeanDefinitions(actualLocation);
        factory.refresh();

        redisTemplate = factory.getBean(RedisTemplate.class);
    }

    private synchronized RedisShiroCache<?, ?> createCache(String name) {
        RedisShiroCache<?, ?> cache = cacheMap.get(name);
        if (cache == null) {
            cache = new RedisShiroCache<>(redisTemplate, name);
            if (expiration != null) {
                cache.setExpiration(expiration);
            }
            cacheMap.put(name, cache);
        }
        return cache;
    }

    private String formatName(String name){
        return ConfigUtil.getFullCachePrefix() + name;
    }

}

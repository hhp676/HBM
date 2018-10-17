package com.hginfo.hbm.core.cache;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * Created by qiujingde on 2016/10/24.
 * @author qiujingde
 * 缓存测试需要的测试类
 */
@Service
public class CacheTestService {

    private static final Log log = LogFactory.getLog(CacheTest.class);

    @Cacheable(value = "cacheTest", key = "methodName")
    public String getA() {
        log.info("从原方法中获取返回值：");
        return "cache test a";
    }

    @CacheEvict(value = "cacheTest", key = "'getA'")
    public void updateA() {

    }

}

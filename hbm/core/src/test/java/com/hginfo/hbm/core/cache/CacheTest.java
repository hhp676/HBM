package com.hginfo.hbm.core.cache;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;

/**
 * Created by qiujingde on 2016/10/24.
 * @author qiujingde
 * 缓存相关测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-cache.xml" })
public class CacheTest {
    private CacheTestService cacheService;

    @Test
    public void testCache() {
        System.out.println(cacheService.getA());
        System.out.println(cacheService.getA());
        cacheService.updateA();
        System.out.println(cacheService.getA());
    }

    @Test
    public void testUtils() {
        String testCache = "utilsTest";
        assertNotNull(CacheUtils.getCache(testCache));
        CacheUtils.cache(testCache, "test", "testUtils");
        CacheUtils.clear(testCache);
    }

    @Autowired
    public void setCacheService(CacheTestService cacheService) {
        this.cacheService = cacheService;
    }
}

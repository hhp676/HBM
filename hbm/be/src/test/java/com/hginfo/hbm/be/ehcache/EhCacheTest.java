package com.hginfo.hbm.be.ehcache;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.service.TOrderService;
import com.hginfo.hbm.be.service.DBServiceTest;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.statistics.StatisticsGateway;

/**
 * cache cluster test class
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-cache.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class EhCacheTest {
	private static Logger logger = Logger.getLogger(DBServiceTest.class);
	
	@Autowired
	private CacheManager cacheManager;
	
	@Autowired
	private TOrderDao tOrderDao;
	
	@Autowired
	private TOrderService tOrderService;

    @Test
    public void showInfo() throws InterruptedException {
        DateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String[] cacheNames = cacheManager.getCacheNames();
        logger.warn("读取的缓存列表为:");
        for (int i = 0; i < cacheNames.length; i++) {
        	logger.warn("--" + (i + 1) + " " + cacheNames[i]);
        }
        
        logger.warn("TOrder-nameList:" + tOrderDao.getNameList());
        
        logger.warn("TOrder-nameList2:" + tOrderDao.getNameList());
        
        logger.warn("TOrder-nameList3:" + tOrderDao.getNameList());
        
        Cache cache = cacheManager.getCache("CACHE_AUTH_ARVIABLE");
        
        logger.warn("修改TOrder前cache中nameList:" + cache.get("TORDER_NAME_LIST").getObjectValue());
        
        tOrderService.saveOrder();
        
        logger.warn("修改后TOrder-nameList:" + tOrderDao.getNameList());
        logger.warn("修改TOrder后cache中nameList:" + cache.get("TORDER_NAME_LIST").getObjectValue());
        
        
        int elementSize = cache.getSize();
        logger.warn("得到缓存的对象数量：" + elementSize);

        // 缓存元素集合
        logger.warn("-----------------------缓存元素统计数据---------------------------------");
        List keys = cache.getKeys();
        for (Object key : keys) {
            Element ele = cache.get(key);
            logger.warn("-------------KEY: " + ele.getObjectKey() + "-------------");
            logger.warn("内容: " + ele.getObjectValue());
            logger.warn("创建时间: " + sf.format(ele.getCreationTime()));
            logger.warn("最后访问时间: " + sf.format(ele.getLastAccessTime()));
            logger.warn("过期时间: " + sf.format(ele.getExpirationTime()));
            logger.warn("最后更新时间: " + sf.format(ele.getLastUpdateTime()));
            logger.warn("命中次数: " + ele.getHitCount());
            logger.warn("存活时间: " + ele.getTimeToLive() + "ms");
            logger.warn("空闲时间: " + ele.getTimeToIdle() + "ms");
        }
        logger.warn("--------------------------------------------------------");

        logger.warn("-----------------------缓存总统计数据---------------------------------");
        long elementsInMemory1 = cache.getMemoryStoreSize();
        logger.warn("得到缓存对象占用内存的数量：" + elementsInMemory1);

        long elementsInMemory2 = cache.getDiskStoreSize();
        logger.warn("得到缓存对对象占用磁盘的数量：" + elementsInMemory2);

        // 获取缓存统计对象
        StatisticsGateway stat = cache.getStatistics();
        long hits = stat.cacheHitCount();
        logger.warn("得到缓存读取的命中次数：" + hits);

        long cacheMisses = stat.cacheMissCount();
        logger.warn("得到缓存读取的丢失次数：" + cacheMisses);

        long evictionCount = stat.cacheEvictedCount();
        logger.warn("得到缓存读取的已经被销毁的对象丢失次数：" + evictionCount);

        logger.warn("--------------------------------------------------------");

    }
}
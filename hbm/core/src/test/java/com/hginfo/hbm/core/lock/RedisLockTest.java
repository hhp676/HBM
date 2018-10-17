package com.hginfo.hbm.core.lock;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by qiujingde on 2017/5/4.<br />
 * redis分布式锁实现。
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:cache/cache-redis.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-lock.xml" })
public class RedisLockTest {

    private DoRepeatCheckAndLock op;

    @Test
    public void testLock() {
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put("out_trade_no", "out_trade_no_test123456");
        Assert.assertTrue(op.operate(dataMap));
    }

    @Autowired
    public void setOp(DoRepeatCheckAndLock op) {
        this.op = op;
    }
}

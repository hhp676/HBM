package com.hginfo.hbm.core.cache;

import org.junit.Test;
import redis.clients.jedis.Jedis;

/**
 * Created by qiujingde on 2016/10/24.
 * Jedis连接Redis测试
 */
public class JedisTest {

    @Test
    public void connectTest() {

        Jedis jedis = new Jedis("192.168.145.128", 6379);
        jedis.set("hostTest", "ok");

    }

}

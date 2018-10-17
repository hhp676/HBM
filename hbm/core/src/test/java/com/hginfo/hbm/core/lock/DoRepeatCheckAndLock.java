package com.hginfo.hbm.core.lock;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.Map;

/**
 * Created by qiujingde on 2017/5/4.
 * 测试redis分布式锁的业务类。
 */
public class DoRepeatCheckAndLock {
    private final Log log = LogFactory.getLog(getClass());

    /**
     * 重新获取分布锁的sleep间隔，单位ms。
     */
    private static final int SLEEP_INTERVAL = 10;

    /**
     * 获取锁的最大过期时间，超过后直接返回失败。
     */
    private static final int MAX_EXPIRATION = 1000;

    /**
     * redis template.
     */
    private StringRedisTemplate redisTemplate;

    /**
     * redis distributed lock.
     */
    private RedisLock redisLock;


    /**
     * 操作是否成功，正常业务操作完成后返回true，后续相同业务回调也应该返回true。
     * @param xmlMap 操作数据
     * @return 操作是否已成功
     */
    public boolean operate(Map<String, ?> xmlMap) {
        String outTradeNo = (String) xmlMap.get("out_trade_no");
        if (isOperated(outTradeNo)) {
            return true;
        }
        long start = System.currentTimeMillis();
        String lockKey = outTradeNo + ".lock";
        long lockCode = redisLock.getLock(lockKey);
        // 未获取锁时重复检查
        while (lockCode == 0) {
            // 检查是否已超时
            if (System.currentTimeMillis() - start + SLEEP_INTERVAL > MAX_EXPIRATION) {
                return false;
            }
            try {
                Thread.sleep(SLEEP_INTERVAL);
            } catch (InterruptedException e) {
                return false;
            }
            lockCode = redisLock.getLock(lockKey);
        }
        if (isOperated(outTradeNo)) {
            return true;
        }
        try {
            // 实际业务操作
            log.info("Do some real business work!");
            redisTemplate.opsForValue().set(outTradeNo + ".result", 1 + "");

            return true;
        } finally {
            redisLock.releaseLock(lockKey, lockCode);
        }
    }

    /**
     * 检查业务是否已处理。已处理返回true，否则返回false
     * @param outTradeNo 业务号
     * @return 是否已处理
     */
    private boolean isOperated(String outTradeNo) {
        return "1".equals(redisTemplate.opsForValue().get(outTradeNo + ".result"));
    }

    public void setRedisTemplate(StringRedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setRedisLock(RedisLock redisLock) {
        this.redisLock = redisLock;
    }
}

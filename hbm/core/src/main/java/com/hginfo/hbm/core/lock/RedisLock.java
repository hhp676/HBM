package com.hginfo.hbm.core.lock;

import com.hginfo.hbm.core.identityid.IdentityidFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.connection.RedisStringCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.data.redis.core.types.Expiration;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.scripting.support.ResourceScriptSource;

import java.util.Collections;

/**
 * Created by qiujingde on 2017/5/4.<br />
 * 使用redis实行的分布式锁。
 * @author qiujingde
 * @since V3.0.2-beta
 */
public class RedisLock {
    /**
     * 默认过期时间。
     */
    private static final int DEFAULT_LOCK_EXPIRATION = 30000;

    /**
     * spring 提供的 redis template.
     */
    private StringRedisTemplate redisTemplate;

    /**
     * 用来生成随机码。
     */
    private IdentityidFactory idFactory;

    /**
     * redis锁过期时间。
     */
    private int lockExpiration = DEFAULT_LOCK_EXPIRATION;

    /**
     * 获取redis锁，获取成功后返回随机码。
     * @param lockKey lock key
     * @return 加锁生成的随机码，解锁时需要
     */
    public long getLock(String lockKey) {
        return redisTemplate.execute((RedisCallback<Long>) conn -> {
            RedisSerializer<String> serializer = redisTemplate.getStringSerializer();
            long code = idFactory.getIdentityid();
            conn.set(serializer.serialize(lockKey), toBytes(code),
                    Expiration.milliseconds(lockExpiration),
                    RedisStringCommands.SetOption.ifAbsent());

            long saveCode = toLong(conn.get(lockKey.getBytes()));
            return code == saveCode ? code : 0L;
        });
    }

    /**
     * 释放redis锁。
     * @param lockKey lock key
     * @param code code
     */
    public void releaseLock(String lockKey, long code) {
        DefaultRedisScript<Boolean> script = new DefaultRedisScript<>();
        script.setScriptSource(new ResourceScriptSource(new ClassPathResource("/cache/releaseLock.lua")));
        script.setResultType(Boolean.class);
        redisTemplate.execute(script, Collections.singletonList(lockKey), code + "");
    }

    /**
     * 使用字符串保存long值。
     * @param l l
     * @return bytes
     */
    private byte[] toBytes(long l) {
        return (l + "").getBytes();
    }

    /**
     * 获取bytes对应的long值。
     * @param bytes bytes
     * @return long
     */
    private long toLong(byte[] bytes) {
        return Long.parseLong(new String(bytes));
    }

    public void setRedisTemplate(StringRedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setIdFactory(IdentityidFactory idFactory) {
        this.idFactory = idFactory;
    }

    public void setLockExpiration(int lockExpiration) {
        this.lockExpiration = lockExpiration;
    }
}

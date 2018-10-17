package com.hginfo.hbm.be.cache.redis;

import com.hginfo.hbm.base.SingleKeyBaseEntity;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.be.cache.HCacheManager;
import com.hginfo.hbm.core.identityid.IdentityidFactory;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by qiujingde on 2017/4/27. <br />
 * 缓存的处理类，redis实现。
 */
@SuppressWarnings("unused")
public class HRedisCacheManager implements HCacheManager {

    /**
     * 日志。
     *//*
    private final Log log = LogFactory.getLog(HRedisCacheManager.class);*/

    /**
     *
     */
    private static final String APP_NAME = "hdf";
    /**
     *
     */
    private static final byte[] ENTITY_MAP_NAME  = (APP_NAME + "AllEntityMap").getBytes();
    /**
     *
     */
    private static final byte[] QUERY_RESULT_TYPE_KEY = (APP_NAME + "QueryResultType").getBytes();
    /**
     *
     */
    private static final byte[] QUERY_RESULT_LIST_KEY = (APP_NAME + "sdopQueryResult_List").getBytes();
    /**
     *
     */
    private static final byte[] QUERY_RESULT_PAGE_KEY = (APP_NAME + "sdopQueryResult_Page").getBytes();

    /**
     *
     */
    private RedisTemplate<?, ?> redisTemplate;
    /**
     *
     */
    private IdentityidFactory idFactory;
    /**
     *
     */
    private RedisSerializer<Object> serializer
            = new JdkSerializationRedisSerializer(getClass().getClassLoader());

    @Override
    public <E extends SingleKeyBaseEntity> void put(E entity) {
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            byte[] id = toBytes(entity.getId());
            conn.hSet(ENTITY_MAP_NAME, id, serialize(entity));
            conn.sAdd(getEntityIdSetKey(entity.getClass()), id);
            return null;
        });
    }

    @Override
    public <E extends SingleKeyBaseEntity> E get(Class<E> entityClass, long id) {
        return redisTemplate.execute((RedisCallback<E>) conn -> {
            byte[] idBytes = toBytes(id);
            byte[] idSetKey = getEntityIdSetKey(entityClass);
            if (conn.exists(idSetKey) && conn.sIsMember(idSetKey, idBytes))  {
                return deserialize(conn.hGet(ENTITY_MAP_NAME, idBytes));
            }
            return null;
        });
    }

    @Override
    public <E extends SingleKeyBaseEntity> void remove(Class<E> entityClass, long id) {
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            byte[] idBytes = toBytes(id);
            byte[] idSetKey = getEntityIdSetKey(entityClass);
            if (conn.exists(idSetKey) && conn.sIsMember(idSetKey, idBytes)) {
                conn.sRem(idSetKey, idBytes);
                conn.hDel(ENTITY_MAP_NAME, idBytes);
            }
            return null;
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public <E extends SingleKeyBaseEntity> void putQuery(
            Class<E> entityClass, String method, Object[] args, Object value) {

        long cacheId = idFactory.getIdentityid();
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            conn.hSet(getQueryKey(entityClass, method), serialize(args), toBytes(cacheId));
            return null;
        });

        // 获取返回数据类型
        String resultType = getQueryResultType(method, value);
        switch (resultType) {
            case "List":
                putListQuery(cacheId, (List<E>) value);
                break;
            case "Page":
                putPageQuery(cacheId, (Page<E>) value);
                break;
            default:
                    break;
        }
    }

    @Override
    public <E extends SingleKeyBaseEntity> Object getQuery(Class<E> entityClass, String method, Object[] args) {
        return redisTemplate.execute((RedisCallback<?>) conn -> {
            byte[] queryMapKey = getQueryKey(entityClass, method);
            byte[] queryArgs = serialize(args);
            if (conn.exists(queryMapKey)) {
                byte[] idBytes = conn.hGet(queryMapKey, queryArgs);
                if (idBytes != null) {
                    long cacheId = toLong(idBytes);

                    String resultType = getQueryResultType(method);
                    switch (resultType) {
                        case "List":
                            return getListQuery(entityClass, cacheId);
                        case "Page":
                            return getPageQuery(entityClass, cacheId);
                        default:
                            return null;
                    }
                }
            }
            return null;
        });
    }

    @Override
    public <E extends SingleKeyBaseEntity> void clearQuery(Class<E> entityClass) {
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            Set<byte[]> methodKeys = getQueryKeys(entityClass);
            if (methodKeys != null) {
                for (byte[] methodKey : methodKeys) {
                    Map<byte[], byte[]> queries = conn.hGetAll(methodKey);
                    for (Map.Entry<byte[], byte[]> query : queries.entrySet()) {
                        conn.hDel(methodKey, query.getKey());
                        conn.hDel(QUERY_RESULT_LIST_KEY, query.getValue());
                        conn.hDel(QUERY_RESULT_PAGE_KEY, query.getValue());
                    }
                }
            }
            return null;
        });
    }

    @Override
    public <E extends SingleKeyBaseEntity> void clearAll(Class<E> entityClass) {
        clearQuery(entityClass);
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            Set<byte[]> allIds = conn.sMembers(getEntityIdSetKey(entityClass));
            if (allIds != null) {
                for (byte[] id : allIds) {
                    remove(entityClass, toLong(id));
                }
            }
            return null;
        });
    }

    private byte[] toBytes(long l) {
        return (l + "").getBytes();
    }

    private long toLong(byte[] b) {
        return Long.parseLong(toString(b));
    }

    private byte[] serialize(Object obj) {
        return serializer.serialize(obj);
    }

    @SuppressWarnings("unchecked")
    private <E extends SingleKeyBaseEntity> E deserialize(byte[] bytes) {
        return (E) serializer.deserialize(bytes);
    }

    private byte[] getEntityIdSetKey(Class<? extends SingleKeyBaseEntity> entityClass) {
        return (APP_NAME + entityClass.getSimpleName() + "_idSet").getBytes();
    }

    private String getQueryResultType(String method) {
        return redisTemplate.execute((RedisCallback<String>) conn ->
                toString(conn.hGet(QUERY_RESULT_TYPE_KEY, method.getBytes())));
    }

    private String getQueryResultType(String method, Object value) {
        String resultType = getQueryResultType(method);
        if (StringUtil.isBlank(resultType)) {
            resultType = value.getClass().getSimpleName();
            final String save = resultType;
            redisTemplate.execute((RedisCallback<Void>) conn -> {
                conn.hSet(QUERY_RESULT_TYPE_KEY, method.getBytes(), save.getBytes());
                return null;
            });
        }
        Assert.isTrue("List".equals(resultType) || "Page".equals(resultType));
        return resultType;
    }

    private <E extends SingleKeyBaseEntity> void putListQuery(long cacheId, List<E> list) {
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            StringBuilder sb = new StringBuilder();
            sb.append(list.size()).append("_");
            for (E entity : list) {
                sb.append(entity.getId()).append(',');
                byte[] idBytes = toBytes(entity.getId());
                if (!conn.sIsMember(getEntityIdSetKey(entity.getClass()), idBytes)) {
                    put(entity);
                }
            }
            conn.hSet(QUERY_RESULT_LIST_KEY, toBytes(cacheId), sb.toString().getBytes());
            return null;
        });
    }

    private <E extends SingleKeyBaseEntity> void putPageQuery(long cacheId, Page<E> page) {
        putListQuery(cacheId, page.getResult());
        // 保存分页信息
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            byte[] pageInfo = (page.getPageSize() + "_"
                    + page.getThisPageNumber() + "_" + page.getTotalCount()).getBytes();
            conn.hSet(QUERY_RESULT_PAGE_KEY, toBytes(cacheId), pageInfo);
            return null;
        });
    }

    private <E extends SingleKeyBaseEntity> List<E> getListQuery(Class<E> entityClass, long cacheId) {
        return redisTemplate.execute((RedisCallback<List<E>>) conn -> {
            String listValue = toString(conn.hGet(QUERY_RESULT_LIST_KEY, toBytes(cacheId)));
            if (StringUtil.isNoneBlank(listValue)) {
                String[] sizeAndIds = listValue.split("_");
                int size = Integer.parseInt(sizeAndIds[0]);
                String[] ids = sizeAndIds[1].split(",");

                List<E> list = new ArrayList<>();
                for (int i = 0; i < size; i++) {
                    list.add(get(entityClass, Long.parseLong(ids[i])));
                }
                return list;
            }
            return null;
        });
    }

    private <E extends SingleKeyBaseEntity> Page<E> getPageQuery(Class<E> entityClass, long cacheId) {
        return redisTemplate.execute((RedisCallback<Page<E>>) conn -> {
            String pageInfo = toString(conn.hGet(QUERY_RESULT_PAGE_KEY, toBytes(cacheId)));
            List<E> list = getListQuery(entityClass, cacheId);
            if (StringUtil.isNoneBlank(pageInfo) && list != null) {
                String[] ints = pageInfo.split("_");
                int pageSize = Integer.parseInt(ints[0]);
                int pageNo = Integer.parseInt(ints[1]);
                int totalCount = Integer.parseInt(ints[2]);

               return new Page<>(pageNo, pageSize, totalCount, list);
            }
            return null;
        });
    }

    private byte[] getQueryKey(Class<? extends SingleKeyBaseEntity> entityClass, String method) {
        String suffix = getQueryKeySuffix(entityClass);
        redisTemplate.execute((RedisCallback<Void>) conn -> {
            conn.sAdd(suffix.getBytes(), method.getBytes());
            return null;
        });
        return (getQueryKeySuffix(entityClass) + method).getBytes();
    }

    private Set<byte[]> getQueryKeys(Class<? extends SingleKeyBaseEntity> entityClass) {
        return redisTemplate.execute((RedisCallback<Set<byte[]>>)
                conn -> conn.sMembers(getQueryKeySuffix(entityClass).getBytes()));
    }

    private String getQueryKeySuffix(Class<? extends SingleKeyBaseEntity> entityClass) {
        return APP_NAME + entityClass.getSimpleName() + "_Query_";
    }

    private String toString(byte[] bytes) {
        return bytes == null ? null : new String(bytes);
    }

    public void setRedisTemplate(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setIdFactory(IdentityidFactory idFactory) {
        this.idFactory = idFactory;
    }
}

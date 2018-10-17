package com.hginfo.hbm.be.cache;

import com.hginfo.hbm.base.SingleKeyBaseEntity;

/**
 * Created by aseara on 2017/4/27.
 * 缓存的处理接口。
 */
public interface HCacheManager {

    <E extends SingleKeyBaseEntity> void put(E entity);
    <E extends SingleKeyBaseEntity> E get(Class<E> entityClass, long id);

    <E extends SingleKeyBaseEntity> void putQuery(Class<E> entityClass, String method, Object[] args, Object value);
    <E extends SingleKeyBaseEntity> Object getQuery(Class<E> entityClass, String method, Object[] args);

    <E extends SingleKeyBaseEntity> void remove(Class<E> entityClass, long id);

    <E extends SingleKeyBaseEntity> void clearQuery(Class<E> entityClass);
    <E extends SingleKeyBaseEntity> void clearAll(Class<E> entityClass);

}

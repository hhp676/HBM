package com.hginfo.hbm.be.cache;

import com.hginfo.hbm.base.SingleKeyBaseEntity;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.ReflectUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;

/**
 * Created by qiujingde on 2017/4/26. <br />
 * 缓存处理。
 * @author qiujingde
 */
@Aspect
public class HCacheDaoAspect {
    @SuppressWarnings("unused")
    private final Log log = LogFactory.getLog(getClass());

    @Pointcut("target(com.hginfo.hbm.be.dao.base.SingleKeyBaseDao+)")
    private void singleKeyBaseDaoPointcut() { }

    @Pointcut("@target(com.hginfo.hbm.be.cache.HCacheDao)")
    private void hCacheDaoPointcut() { }

    @Pointcut("singleKeyBaseDaoPointcut() && hCacheDaoPointcut()")
    private void cacheDaoPointcut() { }

    @Pointcut("execution(* save(..))")
    private void savePointcut() { }
    @Pointcut("execution(* update(..))")
    private void updatePointcut() { }
    @Pointcut("execution(* updateAllFields(..))")
    private void updateAllFieldsPointcut() { }
    /**
     * 新增或修改的方法，接收一个实体对象作为参数。
     * void save(E o)
     * void update(E o)
     * void updateAllFields(E o)
     */
    @Pointcut("savePointcut() || updatePointcut() || updateAllFieldsPointcut()")
    private void saveOrUpdatePointcut() { }

    /**
     * 使用Updater的更新方法。
     * updateByUpdater(Updater<E> updater)
     */
    @Pointcut("execution(* updateByUpdater(..))")
    private void updateByUpdaterPointcut() { }

    /**
     * 删除方法，接收一个实体对象作为参数。
     * void delete(E o)
     */
    @Pointcut("execution(* delete(..))")
    private void deletePointcut() { }

    /**
     * 删除方法，接收实体编号作为参数。
     */
    @Pointcut("execution(* deleteById(..))")
    private void deleteByIdPointcut() { }

    /**
     * 根据编号获取实体。
     */
    @Pointcut("execution(* getById(..))")
    private void getByIdPointcut() { }

    /**
     * 需要缓存的查询方法，只能支持返回List或Page的方法。
     */
    @Pointcut("@annotation(com.hginfo.hbm.be.cache.HCacheQuery)")
    private void cacheQueryPointcut() { }

    /**
     * 使用mybatis或hql自定义更新sql的方法。
     */
    @Pointcut("@annotation(com.hginfo.hbm.be.cache.HCacheEvict)")
    private void cacheEvictPointcut() { }

    /**
     * 缓存管理。
     */
    private HCacheManager cacheManager;

    /**
     * 新增或修改的方法
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @SuppressWarnings("unchecked")
    @Around("cacheDaoPointcut() && saveOrUpdatePointcut()")
    public Object saveOrUpdate(ProceedingJoinPoint jp) throws Throwable {
        Object result = jp.proceed();
        SingleKeyBaseEntity entity = (SingleKeyBaseEntity) jp.getArgs()[0];
        refresh(jp.getTarget().getClass(), entity.getId());
        return result;
    }

    /**
     * 使用Updater的更新方法
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @SuppressWarnings("unchecked")
    @Around("cacheDaoPointcut() && updateByUpdaterPointcut()")
    public Object updateByUpdater(ProceedingJoinPoint jp) throws Throwable {
        Object result = jp.proceed();
        Updater<? extends SingleKeyBaseEntity> updater
                = (Updater<? extends SingleKeyBaseEntity>) jp.getArgs()[0];
        refresh(jp.getTarget().getClass(), updater.getBean().getId());
        return result;
    }

    /**
     * 删除方法
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @Around("cacheDaoPointcut() && deletePointcut()")
    public Object delete(ProceedingJoinPoint jp) throws Throwable {
        SingleKeyBaseEntity entity = (SingleKeyBaseEntity) jp.getArgs()[0];
        remove(jp.getTarget().getClass(), entity.getId());
        return jp.proceed();
    }

    /**
     * 使用编号的删除方法
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @Around("cacheDaoPointcut() && deleteByIdPointcut()")
    public Object deleteById(ProceedingJoinPoint jp) throws Throwable {
        long id = (Long)jp.getArgs()[0];
        remove(jp.getTarget().getClass(), id);
        return jp.proceed();
    }

    /**
     * 根据编号获取实体的方法
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @Around("cacheDaoPointcut() && getByIdPointcut()")
    public Object getById(ProceedingJoinPoint jp) throws Throwable {
        long id = (Long)jp.getArgs()[0];
        Object result = cacheManager.get(getEntityClass(jp), id);
        if (result == null) {
            result = jp.proceed();
            cacheManager.put((SingleKeyBaseEntity) result);
        }
        return result;
    }

    /**
     * 需要缓存的查询方法
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @Around("cacheDaoPointcut() && cacheQueryPointcut()")
    public Object cacheQuery(ProceedingJoinPoint jp) throws Throwable {
        Class<? extends SingleKeyBaseEntity> entityClass = getEntityClass(jp);
        String method = getMethodName(jp);
        Object[] args = jp.getArgs();
        Object result = cacheManager.getQuery(entityClass, method, args);
        if (result == null) {
            result = jp.proceed();
            cacheManager.putQuery(entityClass, method, args, result);
        }
        return result;
    }

    /**
     * 使用mybatis或hql自定义更新sql的方法。
     * @param jp     joint point
     * @return 执行结果
     * @throws Throwable throwable
     */
    @Around("cacheDaoPointcut() && cacheEvictPointcut()")
    public Object cacheEvict(ProceedingJoinPoint jp) throws Throwable {
        Object result = jp.proceed();
        clearAll(getEntityClass(jp));
        return result;
    }

    private <E extends SingleKeyBaseEntity> Class<E> getEntityClass(ProceedingJoinPoint jp) {
        return ReflectUtil.getClassGenricType(jp.getTarget().getClass());
    }

    private String getMethodName(ProceedingJoinPoint jp) {
        MethodSignature signature = (MethodSignature) jp.getSignature();
        return signature.toLongString();
    }

    private void remove(Class<?> daoClass, long id) {
        Class<? extends SingleKeyBaseEntity> entityClass
                = ReflectUtil.getClassGenricType(daoClass);
        cacheManager.remove(entityClass, id);
        clearQuery(entityClass);
    }

    /**
     * 更新操作，删除缓存的相关实体，删除查询缓存。
     * 不自动更新当前实体的缓存，防止事务回滚造成缓存无效数据。
     * @param daoClass  dao class
     * @param id id
     */
    private void refresh(Class<?> daoClass, long id) {
        remove(daoClass, id);
    }

    private void clearQuery(Class<? extends SingleKeyBaseEntity> entityClass) {
        cacheManager.clearQuery(entityClass);
    }

    private void clearAll(Class<? extends SingleKeyBaseEntity> entityClass) {
        cacheManager.clearAll(entityClass);
    }

    public void setCacheManager(HCacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }
}

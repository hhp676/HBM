package com.hginfo.hbm.be.service.prop;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hbm.be.service.base.BaseService;
import com.hginfo.hbm.be.service.base.SingleKeyBaseService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by qiujingde on 2017/2/7.
 * 根据属性名，触发对应的load方法
 */
public final class CascadePropLoadUtil {

    /**
     * LOG.
     */
//    private static final Log LOG = LogFactory.getLog(CascadePropLoadUtil.class);

    /**
     * 反射方法缓存。
     */
    private static final Map<String, Map<String, Method>> GETTER_CACHE = new HashMap<>();

    /**
     * 反射方法缓存。
     */
    private static final Map<String, Map<String, Method>> SETTER_CACHE = new HashMap<>();

    /**
     * 实体对象中实体属性与对应编号属性的对应关系缓存。
     */
    private static final Map<String, Map<String, String>> PROP_CACHE = new HashMap<>();

    /**
     * 实体类（用全限定名表示）与BaseService spring bean的对应关系缓存。
     */
    private static final Map<String, BaseService<?, ?, ?>> SERVICE_MAP = new HashMap<>();

    /**
     * 私有构造方法，防止工具栏实例化。
     */
    private CascadePropLoadUtil() { }

    /**
     * 加载对象的实体属性。 <br />
     * 其中实体属性可以级联表示，如sysUser.sysAccount
     * 可在加载对象的sysUser属性后继续加载sysUser的sysAccount属性。
     * @param entity      entity
     * @param props       实体属性列表
     */
    public static void loadProps(final BaseEntity entity, final String... props) {
        if (props != null && props.length > 0) {
            for (String chainedProp : props) {
                loadChainedProp(entity, chainedProp);
            }
        }
    }

    /**
     *
     * @param entity        entity
     * @param chainedProp      loadProp
     */
    private static void loadChainedProp(final BaseEntity entity, final String chainedProp) {
        if (StringUtil.isEmpty(chainedProp)) {
            return;
        }
        BaseEntity currentEntity = entity;
        String[] chain = chainedProp.split("\\.");
        for (String prop : chain) {
            if (currentEntity != null) {
                currentEntity = loadProp(currentEntity, prop);
            }
        }
    }

    /**
     * invoke load method and return result.
     * @param entity    caller
     * @param prop      prop
     * @return load result
     */
    private static BaseEntity loadProp(final BaseEntity entity, final String prop) {
        Method getter = getGetter(entity.getClass(), prop);
        Class<?> propClass = getter.getReturnType();
        // 判断属性类型是否为BaseEntity,保证仅级联处理实体属性。
        if (!BaseEntity.class.isAssignableFrom(propClass)) {
            return null;
        }
        BaseEntity propEntity;
        try {
            propEntity = (BaseEntity) getter.invoke(entity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new BaseRuntimeException(e);
        }
        if (propEntity != null) {
            return propEntity;
        }
        propEntity = getPropEntity(entity, prop, propClass);
        Method setter = getSetter(entity.getClass(), prop, propClass);
        try {
            setter.invoke(entity, propEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new BaseRuntimeException(e);
        }

        return propEntity;
    }

    /**
     * get entity's prop getter method.
     * @param entityClass  entity class
     * @param prop         prop
     * @return method
     */
    private static Method getGetter(final Class<? extends BaseEntity> entityClass, final String prop) {
        GETTER_CACHE.computeIfAbsent(entityClass.getCanonicalName(), key -> new HashMap<>());
        Map<String, Method> methodMap = GETTER_CACHE.get(entityClass.getCanonicalName());
        methodMap.computeIfAbsent(prop, p -> {
            String methodName = "get" + p.replaceFirst("^.", p.substring(0, 1).toUpperCase());
            Method method;
            try {
                method = entityClass.getMethod(methodName);
            } catch (NoSuchMethodException e) {
                throw new BaseRuntimeException(e);
            }
            return method;
        });
        return methodMap.get(prop);
    }

    /**
     *
     * @param entity        caller
     * @param prop          prop
     * @param propClass     return type
     * @return 属性实体对象
     */
    private static BaseEntity getPropEntity(final BaseEntity entity, final String prop, final Class<?> propClass) {
        Class<? extends BaseEntity> entityClass = entity.getClass();

        PROP_CACHE.computeIfAbsent(entityClass.getCanonicalName(), key -> new HashMap<>());
        Map<String, String> propMap = PROP_CACHE.get(entityClass.getCanonicalName());
        propMap.computeIfAbsent(prop, f -> {
                    Field fi;
                    try {
                        fi = entityClass.getDeclaredField(f);
                    } catch (NoSuchFieldException e) {
                        throw new BaseRuntimeException("未找到对应的属性！");
                    }
                    if (!BaseEntity.class.isAssignableFrom(fi.getType())) {
                        throw new BaseRuntimeException("对应属性的类型不匹配！");
                    }

                    HEntityId idAnnotation = fi.getAnnotation(HEntityId.class);
                    if (idAnnotation == null) {
                        throw new BaseRuntimeException("实体属性应添加HEntityId注解，注解的值为对应的编码属性！");
                    }
                    return idAnnotation.value();
                });
        String idField = propMap.get(prop);
        Method idGetter = getGetter(entityClass, idField);
        if (!Long.class.isAssignableFrom(idGetter.getReturnType())) {
            throw new BaseRuntimeException("HEntityId注解的值不是编码属性！");
        }
        Long id;
        try {
            id = (Long) idGetter.invoke(entity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new BaseRuntimeException(e);
        }
        SERVICE_MAP.computeIfAbsent(entityClass.getCanonicalName(),
                k -> SpringContextUtil.getBean(
                        BaseService.getBaseServiceClass(entityClass)));
        BaseService<?, ?, ?> service = SERVICE_MAP.get(entityClass.getCanonicalName());
        return service.getProp(prop, propClass, id);
    }

    /**
     * 根据实体类型，实体编码获取对应的实体。
     * @param entityClass    实体类型
     * @param id            实体编码
     * @return  对应的实体
     */
    @SuppressWarnings("unchecked")
    public static BaseEntity getById(final Class<?> entityClass, final Long id) {
        SERVICE_MAP.computeIfAbsent(
                entityClass.getCanonicalName(),
                k -> SpringContextUtil.getBean(
                        BaseService.getBaseServiceClass((Class<? extends BaseEntity>) entityClass)));
        SingleKeyBaseService<?, ?> service =
                (SingleKeyBaseService<?, ?>) SERVICE_MAP.get(entityClass.getCanonicalName());
        return service.get(id);
    }

    /**
     * get caller setter method.
     * @param entityClass  callerType
     * @param prop        prop
     * @param propClass     param type for setter
     * @return method
     */
    private static Method getSetter(final Class<? extends BaseEntity> entityClass,
                                    final String prop, final Class<?> propClass) {
        SETTER_CACHE.computeIfAbsent(entityClass.getCanonicalName(), key -> new HashMap<>());
        Map<String, Method> setterMap = SETTER_CACHE.get(entityClass.getCanonicalName());
        setterMap.computeIfAbsent(prop, p -> {
            String methodName = "set" + p.replaceFirst("^.", p.substring(0, 1).toUpperCase());
            Method method;
            try {
                method = entityClass.getMethod(methodName, propClass);
            } catch (NoSuchMethodException e) {
                throw new BaseRuntimeException(e);
            }
            return method;
        });
        return setterMap.get(prop);

    }

}

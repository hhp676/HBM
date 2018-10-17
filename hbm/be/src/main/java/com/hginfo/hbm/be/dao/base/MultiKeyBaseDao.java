package com.hginfo.hbm.be.dao.base;

import com.hginfo.hbm.base.MultiKey;
import com.hginfo.hbm.base.MultiKeyBaseEntity;
import com.hginfo.hutils.ReflectUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

import javax.persistence.metamodel.Attribute;
import javax.persistence.metamodel.SingularAttribute;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.IntStream;

/**
 * Created by qiujingde on 2017/2/15.<br />
 * 多主键实体BaseDao.
 * @param <E> entity type
 * @param <P> primary key type
 * @author qiujingde
 */
public class MultiKeyBaseDao<E extends MultiKeyBaseEntity, P extends MultiKey> extends BaseDao<E, P> {

    /**
     * P对应的class。
     */
    private Class<P> keyClass;

    /**
     * 主键属性集合。
     */
    private List<SingularAttribute<P, Long>> idAttributes;

    /**
     * 获取实际的primary key class。
     */
    @SuppressWarnings("unchecked")
    public MultiKeyBaseDao() {
        keyClass = (Class<P>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    @Override
    public void deleteById(P pk) {
        StringBuilder hql = new StringBuilder();
        hql.append("DELETE FROM ").append(getEntityClass().getName());
        List<Object> params = new ArrayList<>();
        IntStream.range(0, getIdAttributes().size())
                .forEach(idx -> {
                    String idName = getIdAttributes().get(idx).getName();
                    hql.append(idx == 0 ? " WHERE " : " AND ").append(idName).append("=?");
                    params.add(ReflectUtil.invokeGetter(pk, idName));
                });
        executeHql(hql.toString(), params);
    }

    @Override
    protected Serializable getIdValue(E bean) {
        try {
            P key = keyClass.newInstance();
            // 设置值
            getIdAttributes().stream().map(Attribute::getName).forEach(idName ->
                    ReflectUtil.invokeSetter(key, idName, ReflectUtil.invokeGetter(bean, idName)));
            return key;
        } catch (InstantiationException | IllegalAccessException e) {
            throw new BaseRuntimeException(e);
        }
    }

    @Override
    protected boolean isIdField(String fieldName) {
        return getIdAttributes().stream().anyMatch(id -> id.getName().equals(fieldName));
    }

    /**
     * 获取主键属性集合。
     * @return 主键属性。
     */
    @SuppressWarnings("unchecked")
    public List<SingularAttribute<P, Long>> getIdAttributes() {
        if (idAttributes == null) {
            idAttributes = new ArrayList<>((Set<SingularAttribute<P, Long>>) getEntityType().getIdClassAttributes());
        }
        return idAttributes;
    }

}

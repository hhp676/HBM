package com.hginfo.hbm.be.dao.base;

import java.io.Serializable;

import javax.persistence.metamodel.SingularAttribute;

import com.hginfo.hbm.base.SingleKeyBaseEntity;
import com.hginfo.hbm.be.dauth.annotation.DauthDaoMethod;
import com.hginfo.hutils.ReflectUtil;

/**
 * Created by qiujingde on 2017/2/14. <br />
 * 单主键实体BaseDao.
 * @param <E> entity type
 */
public class SingleKeyBaseDao<E extends SingleKeyBaseEntity> extends BaseDao<E, Long> {

    /**
     * 实体Id字段，不可直接使用，通过getEntityId使用。
     */
    @SuppressWarnings("rawtypes")
    private SingularAttribute entityId;

    /**
     * 返回实体的id字段。
     * @return id字段
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private SingularAttribute getEntityId() {
        if (this.entityId == null) {
            this.entityId = getEntityType().getId(getEntityType().getIdType().getJavaType());
        }
        return entityId;
    }

    /**
     * 单主键实体新增时自动生成主键。
     * @param o 保存对象
     */
    @Override
    public void save(E o) {
        o.setId(getIdentityid());
        super.save(o);
    }

    /**
     * 通过hibernate删除一个对象。
     * @param id id
     */
    @DauthDaoMethod
    @Override
    public void deleteById(Long id) {
        String hql = "DELETE FROM " + getEntityClass().getName() + " WHERE " + getEntityId().getName() + "=?";
        executeHql(hql, new Object[] {id});
    }

    @Override
    protected Serializable getIdValue(E bean) {
        return (Serializable) ReflectUtil.invokeGetter(bean, getEntityId().getName());
    }

    @Override
    protected boolean isIdField(String fieldName) {
        return getEntityId().getName().equals(fieldName);
    }
}

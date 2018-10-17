package com.hginfo.hbm.be.service.base;

import com.hginfo.hbm.base.MultiKey;
import com.hginfo.hbm.base.MultiKeyBaseEntity;
import com.hginfo.hbm.be.dao.base.MultiKeyBaseDao;
import com.hginfo.hutils.ReflectUtil;

import javax.persistence.metamodel.Attribute;

/**
 * Created by qiujingde on 2017/2/15. <br />
 * 多主键实体BaseService。<br />
 * @author qiujingde
 *
 * @param <E> 实体类型
 * @param <P> 主键类型
 * @param <D> Dao
 */
public class MultiKeyBaseService<E extends MultiKeyBaseEntity, P extends MultiKey, D extends MultiKeyBaseDao<E, P>>
        extends BaseService<E, P, D> {

    @Override
    protected E getUniqueCheckFilter(E entity) {
        E filter = super.getUniqueCheckFilter(entity);

        MultiKeyBaseDao<E, P> dao = getDao();
        dao.getIdAttributes().stream().map(Attribute::getName).forEach(idName ->
                ReflectUtil.invokeSetter(filter, idName, ReflectUtil.invokeGetter(entity, idName)));

        return filter;
    }

}

package com.hginfo.hbm.be.service.base;

import com.hginfo.hbm.base.SingleKeyBaseEntity;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;

import java.util.List;

/**
 * Created by qiujingde on 2017/2/14. <br />
 * 单主键实体Service
 */
public class SingleKeyBaseService<E extends SingleKeyBaseEntity, D extends SingleKeyBaseDao<E>>
        extends BaseService<E, Long, D> {

    /**
     * 批量删除。
     * @param filter 过滤条件
     * @since V1.0.0
     */
    public void deleteBatch(E filter) {
        List<E> list = getList(filter);
        for (E e : list) {
            checkChange(e);
            getDao().deleteById(e.getId());
        }
    }

    @Override
    protected E getUniqueCheckFilter(E entity) {
        E filter = super.getUniqueCheckFilter(entity);
        filter.setId(entity.getId());
        return filter;
    }

}

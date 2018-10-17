package com.hginfo.hbm.be.service.base;

import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.be.dao.base.BaseDao;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hutils.exception.BaseRuntimeException;

import java.util.Date;

/**
 * 关联实体对应Service基类。<br />
 * Created by qiujingde on 2016/11/26.<br />
 *
 * @param <E> 
 * @param <D> 
 * @author qiujingde
 */
public abstract class RelService<E extends RelEntity, D extends SingleKeyBaseDao<E>> extends SingleKeyBaseService<E, D> {

    @Override
    public void add(E e) {
        e.setCrtUserId(CurrentUserUtils.getUserId());
        e.setCrtTime(new Date());
        super.add(e);
    }

    @Override
    protected void checkChange(E e) {
        E checkEntity = get(e.getId());
        if (checkEntity.getIsFinal() == 1) {
            throw new BaseRuntimeException("当前数据已锁定，无法更新或删除");
        }
    }

}

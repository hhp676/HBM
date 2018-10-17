package com.hginfo.hbm.be.service.base;

import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hutils.exception.BaseRuntimeException;

import java.util.Date;
import java.util.List;

import static com.hginfo.hbm.core.constants.Constants.ONE;

/**
 * 业务实体对应Service基类。<br />
 * Created by qiujingde on 2016/11/26.<br />
 * @param <E> 
 * @param <D> 
 * @author qiujingde
 */
public abstract class BizService<E extends BizEntity, D extends SingleKeyBaseDao<E>> extends SingleKeyBaseService<E, D> {

    @Override
    public List<E> getList(E filter, final String... loadProps) {
        filter.setIsDelete(0);
        return super.getList(filter, loadProps);
    }

    @Override
    public Page<E> getPageList(BasePage<E> basePage, E filter, String... loadProps) {
        filter.setIsDelete(0);
        return super.getPageList(basePage, filter, loadProps);
    }

    @Override
    public Page<E> getPageList(String statementName, BasePage<E> basePage, E filter, String... loadProps) {
        filter.setIsDelete(0);
        return super.getPageList(statementName, basePage, filter, loadProps);
    }

    public List<E> getAllList(E filter, final String... loadProps) {
        filter.setIsDelete(null);
        return super.getList(filter, loadProps);
    }

    @Override
    public void add(E e) {
        e.setIsDelete(0);
        e.setCrtUserId(CurrentUserUtils.getUserId());
        e.setUpdUserId(CurrentUserUtils.getUserId());
        e.setCrtTime(new Date());
        e.setUpdTime(new Date());
        super.add(e);
    }

    @Override
    public void update(E e) {
        e.setIsDelete(0);
        e.setUpdUserId(CurrentUserUtils.getUserId());
        e.setUpdTime(new Date());
        super.update(e);
    }

    @Override
    public void delete(E e) {
        deleteLogic(e);
    }

    @Override
    public void delete(Long id) {
        deleteLogic(id);
    }

    /**
     * 根据id删除。
     * @param id id
     */
    public void delete(long id) {
        delete((Long)id);
    }

    protected void deletePhysical(E e) {
        super.delete(e);
    }

    protected void deletePhysical(long id) {
        super.delete(id);
    }

    private void deleteLogic(E e) {
        e.setIsDelete(1);
        super.update(e);
    }

    private void deleteLogic(long id) {
        E e = get(id);
        deleteLogic(e);
    }

    @Override
    protected void checkChange(E e) {
        E checkEntity = get(e.getId());
        if (checkEntity.getIsFinal() == 1) {
            throw new BaseRuntimeException("当前数据已锁定，无法更新或删除");
        }
    }

    @Override
    protected void checkUnique(E e) {
        if (ONE.equals(e.getIsDelete())) {
            return;
        }
        super.checkUnique(e);
    }

    @Override
    protected int checkUniqueCount(E filter) {
        filter.setIsDelete(0);
        return super.checkUniqueCount(filter);
    }

}

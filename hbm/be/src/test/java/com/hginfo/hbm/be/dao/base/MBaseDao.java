package com.hginfo.hbm.be.dao.base;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * 
 * mybatis基础Dao。
 * date: 2014-2-19 上午11:25:27 <br/>
 *
 * @author henry
 * @param <E>
 * @param <P>
 * @since V1.0.0
 */
public abstract class MBaseDao<E extends BaseEntity, P extends Serializable> extends SqlSessionDaoSupport {
    /**
     * 
     */
    protected static final Log LOG = LogFactory.getLog(MBaseDao.class);
    
    /**
     * 注入SqlSessionFactory。
     * @param sqlSessionFactory mybatis sqlSessionFactory
     */
    @Resource
    @Override
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }
    
    /**
     * 根据主键查询。
     * 
     * @param primaryKey 主键
     * @return 对象
     */
    public E getById(P primaryKey) {
        E object = (E) getSqlSession().selectOne(getMapperNamesapce() + ".getById", primaryKey);
        return object;
    }
    
    /**
     * 根据主键删除。
     * 
     * @param primaryKey 主键
     * @return 响应数目
     */
    public int delete(P primaryKey) {
        int affectCount = getSqlSession().delete(getMapperNamesapce() + ".deleteById", primaryKey);
        return affectCount;
    }
    
    /**
     * 根据实体删除 注意可能会造成批量删除。
     * 
     * @param entity 对象
     */
    public void delete(E entity) {
        getSqlSession().delete(getMapperNamesapce() + ".delete", entity);
    }
    
    /**
     * 删除多条。
     * 
     * @param ids 主键
     */
    public void multiDelete(String ids) {
        getSqlSession().delete(getMapperNamesapce() + ".multiDelete", ids);
    }
    
    /**
     * 查询distinct。
     * 
     * @param entity 参数对象
     * @return 查询结果
     */
    public List<E> getDistinct(E entity) {
        return getSqlSession().selectList(getMapperNamesapce() + ".getDistinct", entity);
    }
    
    /**
     * 保存。
     * 
     * @param entity 保存对象
     * @return 响应数目
     */
    public int save(E entity) {
        prepareObjectForSaveOrUpdate(entity);
        return getSqlSession().insert(getMapperNamesapce() + ".insert", entity);
    }
    
    /**
     * 修改主键修改。
     * 
     * @param entity 对象
     * @return 响应数目
     */
    public int update(E entity) {
        prepareObjectForSaveOrUpdate(entity);
        int affectCount = getSqlSession().update(getMapperNamesapce() + ".update", entity);
        return affectCount;
    }
    
    /**
     * 获取list。
     * 
     * @param entity 参数对象
     * @return 查询结果
     */
    public List<E> getList(E entity) {
        List<E> list = getSqlSession().selectList(getMapperNamesapce() + ".getList", entity);
        return list;
    }
    
    /**
     * 获取分页list。
     * 
     * @param entity 参数对象
     * @param bPos 开始位置
     * @param count 数量
     * @return 查询结果
     */
    public List<E> getList(E entity, int bPos, int count) {
        RowBounds rowBounds = new RowBounds(bPos, count);
        List<E> list = getSqlSession().selectList(getMapperNamesapce() + ".getList", entity,
            rowBounds);
        return list;
    }
    
    /**
     * 获取list数量。
     * 
     * @param entity 参数对象
     * @return 条数
     */
    public int getListCount(E entity) {
        Number totalCount = (Number) getSqlSession()
            .selectOne(getMapperNamesapce() + ".getListCount", entity);
        return totalCount.intValue();
    }
    
    /**
     * 批量保存(外部循环)。
     * 
     * @param list 保存的列表
     */
    public void saveBatch(List<E> list) {
        for (E entity : list) {
            prepareObjectForSaveOrUpdate(entity);
            getSqlSession().insert(getMapperNamesapce() + ".insert", entity);
        }
    }
    
    /**
     * 批量保存(内部循环)。
     * 
     * @param list 保存的列表
     */
    public void saveBatchInn(List<E> list) {
        getSqlSession().insert(getMapperNamesapce() + ".insertBatch", list);
    }
    
    /**
     * 用于子类覆盖,在insert,update之前调用。
     * 
     * @param entity 参数对象
     */
    protected void prepareObjectForSaveOrUpdate(E entity) {
        
    }
    
    /**
     * 获取Mapper。
     * 
     * @param <M> 类型
     * @param type mapper类型
     * @return Mapper
     */
    public <M> M getMapperByType(Class<M> type) {
        return this.getSqlSession().getMapper(type);
    }
    
    /**
     * 获取Mapper命名空间 用于被子类覆盖。
     * 
     * @return 命名空间
     */
    public String getMapperNamesapce() {
        throw new SecurityException("not yet implement");
    }
    
    /**
     * rapid分页查询。
     * 
     * @param statementName 查询方法
     * @param countStatementName 查询数量方法
     * @param pageRequest 分页
     * @return 分页结果
     */
    protected Page pageQuery(String statementName, String countStatementName,
        BasePage<E> pageRequest) {
        Number totalCount = (Number) getSqlSession().selectOne(countStatementName,
            pageRequest.getFilters());
        
        if (totalCount == null || totalCount.longValue() <= 0) {
            return new Page(pageRequest, 0);
        }
        Page page = new Page(pageRequest, totalCount.intValue());
        
        List list = getSqlSession().selectList(statementName, pageRequest.getFilters(),
            new RowBounds(pageRequest.getPosStart(), pageRequest.getRows()));
        
        page.setResult(list);
        
        return page;
    }
    
    /**
     * 默认使用 语句+“Count” 作为查询数量语句。
     * 
     * @param statementName 查询方法
     * @param pageRequest  分页
     * @return 分页结果
     */
    public Page pageQuery(String statementName, BasePage pageRequest) {
        return pageQuery(getMapperNamesapce() + "." + statementName,
            getMapperNamesapce() + "." + statementName + "Count", pageRequest);
    }
    
    /**
     * 默认使用 getList + getListCount 作为查询数量语句。
     * 
     * @param pageRequest 分页
     * @return 分页结果
     */
    public Page pageQuery(BasePage pageRequest) {
        return pageQuery(getMapperNamesapce() + ".getList", getMapperNamesapce() + ".getListCount",
            pageRequest);
    }
    
    /**
     * 
     * 分页查询。
     *
     * @param pageRequest 分页
     * @return 分页结果
     */
    public Page pageInventoryQuery(BasePage pageRequest) {
        return pageQuery(getMapperNamesapce() + ".getInventoryList",
            getMapperNamesapce() + ".getInventoryListCount", pageRequest);
    }
    
    /**
     * 获取sql的select结果集。
     * @author licheng
     * @param statementId mapper 声明ID
     * @param parameter 参数
     * @return 结果集合
     * @since V1.0.0
     */
    public List<E> selectList(String statementId, Object parameter) {
        return getSqlSession().selectList(statementId, parameter);
    }
    
    /**
     * 获取一条select结果。
     * @author licheng
     * @param statementId mapper 声明ID
     * @param parameter 参数
     * @return 结果集合
     * @since V1.0.0
     */
    public E selectOne(String statementId, Object parameter) {
        return getSqlSession().selectOne(statementId, parameter);
    }
    
    /**
     * 未实现方法。
     * @return 异常
     */
    public List findAll() {
        throw new UnsupportedOperationException();
    }
    
    /**
     * 
     * 未实现方法。
     *
     * @param entity 参数对象
     * @param uniquePropertyNames 唯一属性
     * @return 是否唯一
     */
    public boolean isUnique(E entity, String uniquePropertyNames) {
        throw new UnsupportedOperationException();
    }
    
    /**
     * SqlSession回调。
     *
     */
    public interface SqlSessionCallback {
        /**
         * @param session SqlSession
         * @return 对象
         */
        Object doInSession(SqlSession session);
    }
    
}

package com.hginfo.hbm.be.dao.base;

import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.be.cache.HCacheQuery;
import com.hginfo.hbm.be.dauth.annotation.DauthDaoMethod;
import com.hginfo.hbm.core.identityid.Identityid;
import com.hginfo.hutils.ReflectUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import javax.persistence.metamodel.Attribute;
import javax.persistence.metamodel.EntityType;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Set;

/**
 * 基础Dao。<br/>
 * 包括hibernate、mybatis相关的dao操作
 * Date: 2016年10月13日 下午2:00:03 <br/>
 * @author qun
 * @param <E> 实体对象类型
 * @param <P> 主键类型
 */
public abstract class BaseDao<E extends BaseEntity, P extends Serializable>
    extends SqlSessionDaoSupport {
    
    /**
     * 
     */
    private static final String GETLIST_NAME      = ".getList";
    /**
     * 
     */
    private static final String GETLISTCOUNT_NAME = ".getListCount";

    private static final String CHECK_UNIQUE_COUNT_NAME = ".checkUniqueCount";

    /**
     * hibernate 的 sessionFactory。
     */
    @Autowired
    private SessionFactory sessionFactory;
    /**
     * 唯一ID生成。
     */
    @Autowired
    private Identityid identityidFactory;
    /**
     * 实体class。
     */
    private Class<E> entityClass;
    /**
     * 实体类型，不可直接使用，通过getEntityType使用。
     */
    @SuppressWarnings("rawtypes")
    private EntityType entityType;

    private String mapperNameSpace;

    /**
     * 注入mybatis 的 SqlSessionFactory。
     * @param sqlSessionFactory mybatis sqlSessionFactory
     */
    @Resource
    @Override
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }
    /**
     * 处理主键、实体类型。
     */
    @SuppressWarnings("unchecked")
    public BaseDao() {
        entityClass = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    /**
     * 获取hibernate的currentSession。
     * @return currentSession
     */
    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * 返回实体类型。
     * @return 实体类型
     */
    @SuppressWarnings("rawtypes")
    public EntityType getEntityType() {
        if (this.entityType == null) {
            this.entityType = this.getCurrentSession().getMetamodel().entity(entityClass);
        }
        return this.entityType;
    }
    
    public long getIdentityid() {
        return identityidFactory.getIdentityid();
    }
    
    /**
     * 用于子类覆盖,在insert,update之前调用，对实体进行处理。
     * 
     * @param o 参数对象
     */
    protected void prepareObjectForSaveOrUpdate(E o) {
        
    }
    
    /**
     * 在insert,update之前调用，内部调用方法用于子类覆盖。
     * @param o 参数对象
     */
    protected void prepareForSaveOrUpdate(E o) {
        prepareObjectForSaveOrUpdate(o);
    }

    /**
     * 通过hibernate保存一个对象。<br/>
     * 对象变为游离状态(detached)
     *
     * @param o 保存对象
     */
    public void save(E o) {
        prepareForSaveOrUpdate(o);
        this.getCurrentSession().save(o);
        // flush方法的目的是先执行SQL，从而使save方法生效
        this.getCurrentSession().flush();
        // evict方法的目的把对象o从session cache中去除
        this.getCurrentSession().evict(o);
    }
    
    /**
     * 通过hibernate保存一个对象。<br/>
     * 对象变为持久化状态(persistent)，hibernate本来的方式
     * 
     * @param o 保存对象
     */
    public void saveForPersistent(E o) {
        prepareForSaveOrUpdate(o);
        this.getCurrentSession().save(o);
    }
    
    /**
     * 批量保存(外部循环)。<br/>
     * 对象变为游离状态(detached)
     * 
     * @param list 保存的列表
     */
    public void saveBatch(List<E> list) {
        for (E o : list) {
            save(o);
        }
    }
    
    /**
     * 批量保存(外部循环)。<br/>
     * 对象变为持久化状态(persistent)，hibernate本来的方式
     * 
     * @param list 保存的列表
     */
    public void saveBatchForPersistent(List<E> list) {
        for (E o : list) {
            saveForPersistent(o);
        }
    }
    
    /**
     * 通过hibernate更新一个对象。<br/>
     * 对象变为游离状态(detached)。<br/>
     * 更新除updatable = false 以外的  非null的 字段
     * 
     * @param o 更新对象
     */
    @DauthDaoMethod
    public void update(E o) {
        this.updateByUpdater(new Updater<>(o));
    }
    
    /**
     * 通过hibernate更新一个对象。<br/>
     * 对象变为游离状态(detached)。<br/>
     * 更新除updatable = false 以外的字段
     * 
     * @param o 更新对象
     */
    @DauthDaoMethod
    public void updateAllFields(E o) {
        prepareForSaveOrUpdate(o);
        this.getCurrentSession().update(o);
        // flush方法的目的是先执行SQL，从而使update方法生效
        this.getCurrentSession().flush();
        // evict方法的目的把对象o从session cache中去除
        this.getCurrentSession().evict(o);
    }

    /**
     * 获取id.
     * @param bean bean
     * @return id
     */
    protected abstract Serializable getIdValue(E bean);
    
    /**
     * 通过updater更新对象。<br/>
     * 对象变为游离状态(detached)，且根据updater的设置更新的字段，默认为更新非null的字段<br/>
     *
     * @param updater update wrapper
     */
    @DauthDaoMethod
    public void updateByUpdater(Updater<E> updater) {
        E bean = updater.getBean();
        
        prepareForSaveOrUpdate(bean);
        
        Serializable idValue = getIdValue(bean);
        E po = getCurrentSession().get(entityClass, idValue);
        
        if (po == null) {
            throw new BaseRuntimeException("could not query the result, Entity:" + entityClass + ", ID:" + idValue);
        }
        
        // 通过持久化状态，自动更新
        copyUpdaterToPersistentObject(updater, po);
        // flush方法的目的是先执行SQL，从而使update方法生效
        this.getCurrentSession().flush();
        // evict方法的目的把对象o从session cache中去除
        this.getCurrentSession().evict(po);
    }

    /**
     * 判断某一字段是否为主键。
     * @param fieldName field name
     * @return 是否为主键
     */
    protected abstract boolean isIdField(String fieldName);
    
    /**
     * 将更新对象拷贝至实体对象。
     * 
     * @param updater 更新对象
     * @param po hibernate持久化的实体对象(数据库中数据)
     */
    @SuppressWarnings({"rawtypes", "unchecked" })
    private void copyUpdaterToPersistentObject(Updater<E> updater, E po) {
        Set<Attribute> propAttrs = getEntityType().getAttributes();
        E bean = updater.getBean();
        Object value;
        String propName;
        for (Attribute prop : propAttrs) {
            propName = prop.getName();
            if (!isIdField(propName)) {
                try {
                    value = ReflectUtil.invokeGetter(bean, propName);
                    if (!updater.isUpdate(propName, value)) {
                        continue;
                    }
                    ReflectUtil.invokeSetter(po, propName, value);
                } catch (Exception e) {
                    throw new BaseRuntimeException(
                        "copy property to persistent object failed: '" + propName + "'", e);
                }
            }
        }
    }
    
    /**
     * 通过hibernate更新一个对象。
     * 对象变为持久化状态(persistent)，hibernate本来的方式
     * 
     * @param o 更新对象
     */
    @DauthDaoMethod
    public void updateForPersistent(E o) {
        prepareForSaveOrUpdate(o);
        this.getCurrentSession().update(o);
    }
    
    /**
     * 通过hibernate保存或更新对象。<br/>
     * 对象变为游离状态(detached)
     * 
     * @param o 保存或更新对象
     */
    public void saveOrUpdate(E o) {
        prepareForSaveOrUpdate(o);
        this.getCurrentSession().saveOrUpdate(o);
        // flush方法的目的是先执行SQL，从而使saveOrUpdate方法生效
        this.getCurrentSession().flush();
        // evict方法的目的把对象o从session cache中去除
        this.getCurrentSession().evict(o);
    }
    
    /**
     * 通过hibernate保存或更新对象。<br/>
     * 对象变为持久化状态(persistent)，hibernate本来的方式
     * 
     * @param o 保存或更新对象
     */
    public void saveOrUpdateForPersistent(E o) {
        prepareForSaveOrUpdate(o);
        this.getCurrentSession().saveOrUpdate(o);
    }
    
    /**
     * 通过hibernate删除一个对象。
     * 
     * @param o 删除对象
     */
    @DauthDaoMethod
    public void delete(E o) {
        this.getCurrentSession().delete(o);
    }
    
    /**
     * 通过hibernate删除一个对象。
     * @param primaryKey pk
     */
    public abstract void deleteById(P primaryKey);
    
    /**
     * 通过hibernate执行HQL语句。
     * 
     * @param hql 查询语句
     * @return 响应数目
     */
    public Integer executeHql(String hql) {
        return this.getCurrentSession().createQuery(hql).executeUpdate();
    }
    
    /**
     * 通过hibernate执行HQL语句。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 响应数目
     */
    @SuppressWarnings("rawtypes")
    public Integer executeHql(String hql, Object[] param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return q.executeUpdate();
    }
    
    /**
     * 通过hibernate执行HQL语句。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 响应数目
     */
    @SuppressWarnings("rawtypes")
    public Integer executeHql(String hql, List<Object> param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && !param.isEmpty()) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.executeUpdate();
    }
    
    /**
     * 获取Mapper命名空间 用于被子类覆盖。
     * 
     * @return 命名空间
     */
    public String getMapperNamespace() {
        if (StringUtil.isNotBlank(mapperNameSpace)) {
            return mapperNameSpace;
        }
        Class<?>[] interfaces = getClass().getInterfaces();
        if (interfaces.length > 0) {
            mapperNameSpace = interfaces[0].getName();
            return mapperNameSpace;
        }
        throw new BaseRuntimeException("not yet implement");
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
     * 根据主键查询。
     * 
     * @param primaryKey 主键
     * @return 对象
     */
    @SuppressWarnings("unchecked")
    public E getById(P primaryKey) {
        if (primaryKey == null) {
            return null;
        }
        return getSqlSession().selectOne(getMapperNamespace() + ".getById", primaryKey);
    }
    
    /**
     * 获取list。
     * 
     * @param entity 参数对象
     * @return 查询结果
     */
    @HCacheQuery
    public List<E> getList(E entity) {
        return getSqlSession().selectList(getMapperNamespace() + GETLIST_NAME, entity);
    }
    
    /**
     * 获取分页list。
     * 
     * @param entity 参数对象
     * @param bPos 开始位置
     * @param count 数量
     * @return 查询结果
     */
    @HCacheQuery
    public List<E> getList(E entity, int bPos, int count) {
        RowBounds rowBounds = new RowBounds(bPos, count);
        return getSqlSession()
                .selectList(getMapperNamespace() + GETLIST_NAME, entity, rowBounds);
    }
    
    /**
     * 获取list数量。
     * 
     * @param entity 参数对象
     * @return 条数
     */
    public int getListCount(E entity) {
        Number totalCount = getSqlSession()
            .selectOne(getMapperNamespace() + GETLISTCOUNT_NAME, entity);
        return totalCount.intValue();
    }

    /**
     * 除本条外符合条件的数量。
     * @param entity entity
     * @return 条数
     */
    public int checkUniqueCount(E entity) {
        Number totalCount = getSqlSession()
                .selectOne(getMapperNamespace() + CHECK_UNIQUE_COUNT_NAME, entity);
        return totalCount.intValue();
    }
    
    /**
     * rapid分页查询。
     * 
     * @param statementName 查询方法
     * @param countStatementName 查询数量方法
     * @param pageRequest 分页
     * @return 分页结果
     */
    @HCacheQuery
    @SuppressWarnings({"rawtypes", "unchecked"})
    Page<E> pageQuery(String statementName, String countStatementName,
        BasePage<E> pageRequest) {
        Number totalCount = getSqlSession().selectOne(countStatementName,
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
    @HCacheQuery
    @SuppressWarnings({"rawtypes", "unchecked"})
    public Page<E> pageQuery(String statementName, BasePage pageRequest) {
        return pageQuery(getMapperNamespace() + "." + statementName,
            getMapperNamespace() + "." + statementName + "Count", pageRequest);
    }
    
    /**
     * 默认使用 getList + getListCount 作为查询数量语句。
     * 
     * @param pageRequest 分页
     * @return 分页结果
     */
    @HCacheQuery
    public Page<E> pageQuery(BasePage<E> pageRequest) {
        return pageQuery(getMapperNamespace() + GETLIST_NAME,
            getMapperNamespace() + GETLISTCOUNT_NAME, pageRequest);
    }
    
    /**
     * 获取sql的select查询结果集。
     * @author licheng
     * @param statementId mapper 声明ID
     * @param parameter 参数
     * @return 结果集合
     * @since V1.0.0
     */
    @HCacheQuery
    public List<E> selectList(String statementId, Object parameter) {
        return getSqlSession().selectList(getMapperNamespace() + "." + statementId, parameter);
    }
    
    /**
     * 获取getList的一条查询结果。
     * @author licheng
     * @param parameter 参数
     * @return 结果集合
     * @since V1.0.0
     */
    public E selectOne(Object parameter) {
        return getSqlSession().selectOne(getMapperNamespace() + GETLIST_NAME, parameter);
    }
    
    /**
     * 获取statementId的一条查询结果。
     * @author licheng
     * @param statementId mapper 声明ID
     * @param parameter 参数
     * @return 结果集合
     * @since V1.0.0
     */
    public E selectOne(String statementId, Object parameter) {
        return getSqlSession().selectOne(getMapperNamespace() + "." + statementId, parameter);
    }

    public <T> T selectResult(String statementId, Object parameter) {
        return getSqlSession().selectOne(getMapperNamespace() + "." + statementId, parameter);
    }

    public <T> List<T> selectResultList(String statementId, Object parameter) {
        return getSqlSession().selectList(getMapperNamespace() + "." + statementId, parameter);
    }

    public Class<E> getEntityClass() {
        return entityClass;
    }
}

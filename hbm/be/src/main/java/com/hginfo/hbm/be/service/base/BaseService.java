/**
 * Project Name:hbm-base
 * File Name:BaseServiceImpl.java
 * Package Name:com.hginfo.hbm.base
 * Date:2016年11月19日上午10:37:50
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.be.service.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDef;
import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDetail;
import com.hginfo.hbm.base.meta.FieldMeta;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.be.dao.base.BaseDao;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.meta.TableNameScanner;
import com.hginfo.hbm.be.service.impl.sys.SysMetaConstraintDefServiceImpl;
import com.hginfo.hbm.be.service.impl.sys.SysMetaConstraintDetailServiceImpl;
import com.hginfo.hbm.be.service.prop.CascadePropLoadUtil;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * BaseService。 <br />
 * ClassName:BaseService <br/>
 * Date: 2016年11月19日 上午10:37:50 <br/>
 * @param <E> 实体类型
 * @param <P> 主键类型
 * @param <D> Dao
 * @author licheng
 * @author qiujingde
 * @since V1.0.0
 */
public abstract class BaseService<E extends BaseEntity, P extends Serializable, D extends BaseDao<E, P>> {

    /**
     *
     * 日志。
     */
    protected final Log log = LogFactory.getLog(getClass());

    /**
     * 保存实体类（全限定名）和对应BaseService类之间的对应关系。
     */
    private static final Map<String, Class<? extends BaseService>> SERVICE_MAP = new HashMap<>();

    /**
     * 对应实体类型。
     */
    private Class<E> entityClass;
    /**
     * 对应的Dao。
     */
    private D dao;
    /**
     * Creates a new instance of BaseService.
     */
    @SuppressWarnings("unchecked")
    BaseService() {
        entityClass = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass())
            .getActualTypeArguments()[0];
        SERVICE_MAP.put(entityClass.getCanonicalName(), getClass());
    }

    /**
     * 根据实体类获取对于的BaseService类。
     * @param entityCls 实体类
     * @return BaseService类
     */
    public static Class<? extends BaseService> getBaseServiceClass(final Class<? extends BaseEntity> entityCls) {
        return SERVICE_MAP.get(entityCls.getCanonicalName());
    }
    /**
     * 获取列表。
     * @param filter    过滤器
     * @param loadProps 需要级联加载的实体属性
     * @return 数据列表
     * @since V1.0.0
     */
    public List<E> getList(final E filter, final String... loadProps) {
        List<E> list = dao.getList(filter);
        if (loadProps != null && loadProps.length > 0) {
            list.forEach(e -> CascadePropLoadUtil.loadProps(e, loadProps));
        }
        return list;
    }

    /**
     * 获取符合条件的记录数。
     * @param filter    过滤器
     * @return 记录数
     */
    protected int checkUniqueCount(final E filter) {
        return dao.checkUniqueCount(filter);
    }
    
    /**
     * 获取列表。
     * @param statementName
     * @param filter    过滤器
     * @param loadProps 需要级联加载的实体属性
     * @return 数据列表
     * @since V1.0.0
     */
    public List<E> getList(String statementName, final E filter, final String... loadProps) {
        List<E> list = dao.selectList(statementName, filter);
        if (loadProps != null && loadProps.length > 0) {
            list.forEach(e -> CascadePropLoadUtil.loadProps(e, loadProps));
        }
        return list;
    }
    
    /**
     * 获取分页列表。
     * @param basePage   分页数据
     * @param filter      查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return           分页列表
     */
    public Page<E> getPageList(final BasePage<E> basePage, final E filter, final String... loadProps) {
        basePage.setFilters(filter);
        Page<E> page = getDao().pageQuery(basePage);
        if (loadProps != null && loadProps.length > 0) {
            page.getResult().forEach(e -> CascadePropLoadUtil.loadProps(e, loadProps));
        }
        page.setDraw(basePage.getDraw());
        return page;
    }
    
    /**
     * 获取分页列表。
     * @param statementName 查询方法
     * @param basePage   分页数据
     * @param filter      查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return           分页列表
     */
    public Page<E> getPageList(String statementName, final BasePage<E> basePage, final E filter,
        final String... loadProps) {
        basePage.setFilters(filter);
        Page<E> page = getDao().pageQuery(statementName, basePage);
        if (loadProps != null && loadProps.length > 0) {
            page.getResult().forEach(e -> CascadePropLoadUtil.loadProps(e, loadProps));
        }
        page.setDraw(basePage.getDraw());
        return page;
    }

    /**
     * 根据属性相关编码获取对应实体对象。 <br />
     * 1.默认情况下，编码即为对应实体编码。<br />
     * 2.
     * @param prop          属性名称
     * @param propClass     属性类型
     * @param id            实体编码
     * @return 实体对象
     */
    public BaseEntity getProp(@SuppressWarnings("unused") final String prop, final Class<?> propClass, final Long id) {
        return CascadePropLoadUtil.getById(propClass, id);
    }

    /**
     * 通过主键获取实体对象。
     * @param primaryKey 主键
     * @param loadProps 需要级联加载的实体属性
     * @return 对象
     * @since V1.0.0
     */
    public E get(final P primaryKey, final String... loadProps) {
        E e = dao.getById(primaryKey);
        CascadePropLoadUtil.loadProps(e, loadProps);
        return e;
    }
    /**
     * 获取符合条件的唯一实体。
     * @param filter 筛选条件
     * @param loadProps 需要级联加载的实体属性
     * @return 返回唯一实体
     */
    public E getOne(final E filter, final String... loadProps) {
        List<E> list = getList(filter, loadProps);
        if (list.size() != 1) {
            throw new BaseRuntimeException("未找到符合条件的实体或符合条件的实体多于一个。");
        }
        return list.get(0);
    }
    
    /**
     * 添加。
     * @param e entity
     * @since V1.0.0
     */
    public void add(E e) {
        checkUnique(e);
        dao.save(e);
    }
    
    /**
     * 批量添加。
     * @param list list
     * @since V1.0.0
     */
    public void addBatch(List<E> list) {
        for (E e : list) {
            add(e);
        }
    }
    /**
     * updateByUpdater:(强制更新). <br/>
     * @author yinyanzhen
     * @param updater updater
     * @param e e
     * @since V1.0.0
     */
    public void updateByUpdater(Updater<E> updater, E e) {
        checkChange(e);
        checkUnique(e);
        dao.updateByUpdater(updater);
    }
    
    /**
     * 更新。
     * @param e entity
     * @since V1.0.0
     */
    public void update(E e) {
        checkChange(e);
        checkUnique(e);
        dao.update(e);
    }
    
    /**
     * 批量更新。
     * @param list list
     * @since V1.0.0
     */
    public void updateBatch(List<E> list) {
        for (E e : list) {
            update(e);
        }
    }
    
    /**
     * 删除。
     * @param e entity
     * @since V1.0.0
     */
    public void delete(E e) {
        checkChange(e);
        dao.delete(e);
    }
    
    /**
     * 删除。
     * @param id 主键ID
     * @since V1.0.0
     */
    public void delete(P id) {
        E e = get(id);
        checkChange(e);
        dao.deleteById(id);
    }
    
    /**
     * 对某个字段进行加运算。
     * @param field 实体字段名称（不是数据库字段）
     * @param value 值
     * @since V1.0.0
     */
    public void doIncrease(String field, BigDecimal value) {
        FieldMeta fieldMeta = this.getNewEntity().getTableMeta().getDbField(field);
        dao.executeHql(String.format("update %s set %s = %s + %s", entityClass.getName(),
            fieldMeta.getDbFieldName(), fieldMeta.getDbFieldName(), value.toString()));
    }
    
    /**
     * 对某个字段进行减运算。
     * @param field 实体字段名称（不是数据库字段）
     * @param value 值
     * @since V1.0.0
     */
    public void doDecrease(String field, BigDecimal value) {
        FieldMeta fieldMeta = this.getNewEntity().getTableMeta().getDbField(field);
        dao.executeHql(String.format("update %s set %s = %s - %s", entityClass.getName(),
            fieldMeta.getDbFieldName(), fieldMeta.getDbFieldName(), value.toString()));
    }
    
    /**
     * 获取本地化语言值。
     * @param i18nCode 本地化代码
     * @param locale 语言
     * @return 语言内容
     * @since V1.0.0
     */
    public String getI18nName(String i18nCode, Locale locale) {
        return I18nUtil.getMessage(i18nCode, locale);
    }
    
    /**
     * 获取本地化语言值。
     * @param i18nCode 本地化代码
     * @return 语言内容
     * @since V1.0.0
     */
    public String getI18nName(String i18nCode) {
        return I18nUtil.getMessage(i18nCode);
    }
    
    /**
     * 获取一个新实体对象。
     * @return entity
     * @since V1.0.0
     */
    protected E getNewEntity() {
        E entity;
        try {
            entity = entityClass.newInstance();
        } catch (Exception e) {
            entity = null;
        }
        return entity;
    }
    
    /**
     * 检查是否可修改。
     * @param e entity
     */
    protected void checkChange(E e) {
        
    }

    /**
     * 检查要更新的实体是否违反唯一限制。
     * @param e entity
     */
    protected void checkUnique(E e) {
        SysMetaConstraintDefServiceImpl defService = SpringContextUtil.getBean(SysMetaConstraintDefServiceImpl.class);
        String tableName = getTableNameByEntityClass(entityClass);
        if (StringUtil.isBlank(tableName)) {
            return;
        }
        List<SysMetaConstraintDef> defList = defService.getListByTableName(tableName.toLowerCase());

        // 检查唯一约束
        for (SysMetaConstraintDef def : defList) {
            checkUnique(e, def);
        }
    }

    /**
     * 检查要更新的实体是否违反特定唯一限制。
     * @param entity  entity
     * @param def     约束定义
     */
    protected void checkUnique(E entity, SysMetaConstraintDef def) {

        SysMetaConstraintDetailServiceImpl detailService
                = SpringContextUtil.getBean(SysMetaConstraintDetailServiceImpl.class);

        SysMetaConstraintDetail colFilter = new SysMetaConstraintDetail();
        colFilter.setDefId(def.getDefId());
        List<SysMetaConstraintDetail> cols = detailService.getList(colFilter, "field");
        if (cols.isEmpty()) {
            return;
        }

        E checkFilter = getUniqueCheckFilter(entity);
        TableMeta meta = entity.getTableMeta();

        for (SysMetaConstraintDetail col : cols) {
            try {
                String field = meta.getField(col.getField().getColumnName());
                Object fieldValue = BeanUtils.getProperty(entity, field);
                if (fieldValue == null || "".equals(fieldValue)) {
                    return;
                }
                BeanUtils.setProperty(checkFilter, field, fieldValue);
            } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e1) {
                String msg = "约束信息定义错误：无法找到"
                        + col.getField().getFieldName() + "对应的字段！";
                log.error(msg, e1);
                throw new BaseRuntimeException(msg, e1);
            }
        }

        int count = checkUniqueCount(checkFilter);
        if (count != 0) {
            throw new BaseRuntimeException(def.getErrorMsg());
        }
    }

    /**
     *
     * @param entity entity
     * @return entity
     */
    protected E getUniqueCheckFilter(E entity) {
        return getNewEntity();
    }

    /**
     * 根据实体类获取对应的表名。
     * @param eClass 实体类
     * @return 对应表名
     */
    private String getTableNameByEntityClass(Class<? extends BaseEntity> eClass) {
        TableNameScanner scanner = SpringContextUtil.getBean(TableNameScanner.class);
        return scanner.getTableNameByEntityClass(eClass);
    }

//    /**
//     * 根据表名获取对应的实体类。
//     * @param tableName 表名
//     * @return 实体类
//     */
//    private Class<? extends BaseEntity> getEntityClassByTableName(String tableName) {
//        TableNameScanner scanner = SpringContextUtil.getBean(TableNameScanner.class);
//        return scanner.getEntityClassByTableName(tableName);
//    }
    
    @Autowired
    public void setDao(D baseDao) {
        this.dao = baseDao;
    }
    
    public D getDao() {
        return dao;
    }
    
}

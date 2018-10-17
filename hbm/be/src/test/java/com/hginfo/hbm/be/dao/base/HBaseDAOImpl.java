package com.hginfo.hbm.be.dao.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.base.page.BasePage;

/**
 * hibernate基础操作类的实现类。
 * date: 2016年9月8日 下午5:35:25 <br/>
 *
 * @author shichengqun
 * @param <T>
 * @since V1.0.0
 */
@Component("hBaseDAO")
@SuppressWarnings("all")
public class HBaseDAOImpl<T> implements HBaseDAO<T> {
    
    /**
     * hibernate sessionFactory。
     */
    private SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    /**
     * 保存一个对象。
     * 
     * @param o 保存对象
     * @return o
     */
    public Serializable save(T o) {
        return this.getCurrentSession().save(o);
    }
    /**
     * 删除一个对象。
     * 
     * @param o 删除对象
     */
    public void delete(T o) {
        this.getCurrentSession().delete(o);
    }
    /**
     * 更新一个对象。
     * 
     * @param o 更新对象
     */
    public void update(T o) {
        this.getCurrentSession().update(o);
    }
    /**
     * 保存或更新对象。
     * 
     * @param o 保存或更新对象
     */
    public void saveOrUpdate(T o) {
        this.getCurrentSession().saveOrUpdate(o);
    }
    /**
     * 查询集合。
     * 
     * @param hql 查询语句
     * @return 查询结果
     */
    public List<T> find(String hql) {
        return this.getCurrentSession().createQuery(hql).getResultList();
    }
    /**
     * 查询集合。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 查询结果
     */
    public List<T> find(String hql, Object[] param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return q.getResultList();
    }
    /**
     * 查询集合。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 查询结果
     */
    public List<T> find(String hql, List<Object> param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.getResultList();
    }
    /**
     * 查询集合(带分页)。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @param page 查询第几页
     * @param rows 每页显示几条记录
     * @return 查询结果
     */
    public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
        if (page == null || page < 1) {
            page = 1;
        }
        if (rows == null || rows < 1) {
            rows = BasePage.DEFAULT_PAGE_SIZE;
        }
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).getResultList();
    }
    /**
     * 查询集合(带分页)。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @param page 查询第几页
     * @param rows 每页显示几条记录
     * @return 查询结果
     */
    public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {
        if (page == null || page < 1) {
            page = 1;
        }
        if (rows == null || rows < 1) {
            rows = BasePage.DEFAULT_PAGE_SIZE;
        }
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).getResultList();
    }
    /**
     * 获得一个对象。
     * 
     * @param c 对象类型
     * @param id id
     * @return Object
     */
    public T get(Class<T> c, Serializable id) {
        return (T) this.getCurrentSession().get(c, id);
    }
    /**
     * 获得一个对象。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return Object
     */
    public T get(String hql, Object[] param) {
        List<T> l = this.find(hql, param);
        if (l != null && l.size() > 0) {
            return l.get(0);
        } else {
            return null;
        }
    }
    /**
     * 获得一个对象。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return Object
     */
    public T get(String hql, List<Object> param) {
        List<T> l = this.find(hql, param);
        if (l != null && l.size() > 0) {
            return l.get(0);
        } else {
            return null;
        }
    }
    /**
     * select count(*) from 类。
     * 
     * @param hql 查询语句
     * @return 条数
     */
    public Long count(String hql) {
        return (Long) this.getCurrentSession().createQuery(hql).getSingleResult();
    }
    /**
     * select count(*) from 类。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 条数
     */
    public Long count(String hql, Object[] param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return (Long) q.getSingleResult();
    }
    /**
     * select count(*) from 类。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 条数
     */
    public Long count(String hql, List<Object> param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return (Long) q.getSingleResult();
    }
    /**
     * 执行HQL语句。
     * 
     * @param hql 查询语句
     * @return 响应数目
     */
    public Integer executeHql(String hql) {
        return this.getCurrentSession().createQuery(hql).executeUpdate();
    }
    /**
     * 执行HQL语句。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 响应数目
     */
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
     * 执行HQL语句。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 响应数目
     */
    public Integer executeHql(String hql, List<Object> param) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.executeUpdate();
    }
    
}

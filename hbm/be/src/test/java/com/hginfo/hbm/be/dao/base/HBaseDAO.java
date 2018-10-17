package com.hginfo.hbm.be.dao.base;

import java.io.Serializable;
import java.util.List;

/**
 * hibernate基础数据库操作类。
 * date: 2016年9月8日 下午5:04:45 <br/>
 *
 * @author shichengqun
 * @param <T> 
 * @since V1.0.0
 */
public interface HBaseDAO<T> {
    
    /**
     * 保存一个对象。
     * 
     * @param o 保存对象
     * @return o
     */
    Serializable save(T o);
    
    /**
     * 删除一个对象。
     * 
     * @param o 删除对象
     */
    void delete(T o);
    
    /**
     * 更新一个对象。
     * 
     * @param o 更新对象
     */
    void update(T o);
    
    /**
     * 保存或更新对象。
     * 
     * @param o 保存或更新对象
     */
    void saveOrUpdate(T o);
    
    /**
     * 查询集合。
     * 
     * @param hql 查询语句
     * @return 查询结果
     */
    List<T> find(String hql);
    
    /**
     * 查询集合。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 查询结果
     */
    List<T> find(String hql, Object[] param);
    
    /**
     * 查询集合。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 查询结果
     */
    List<T> find(String hql, List<Object> param);
    
    /**
     * 查询集合(带分页)。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @param page 查询第几页
     * @param rows 每页显示几条记录
     * @return 查询结果
     */
    List<T> find(String hql, Object[] param, Integer page, Integer rows);
    
    /**
     * 查询集合(带分页)。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @param page 查询第几页
     * @param rows 每页显示几条记录
     * @return 查询结果
     */
    List<T> find(String hql, List<Object> param, Integer page, Integer rows);
    
    /**
     * 获得一个对象。
     * 
     * @param c 对象类型
     * @param id id
     * @return Object
     */
    T get(Class<T> c, Serializable id);
    
    /**
     * 获得一个对象。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return Object
     */
    T get(String hql, Object[] param);
    
    /**
     * 获得一个对象。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return Object
     */
    T get(String hql, List<Object> param);
    
    /**
     * select count(*) from 类。
     * 
     * @param hql 查询语句
     * @return 条数
     */
    Long count(String hql);
    
    /**
     * select count(*) from 类。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 条数
     */
    Long count(String hql, Object[] param);
    
    /**
     * select count(*) from 类。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 条数
     */
    Long count(String hql, List<Object> param);
    
    /**
     * 执行HQL语句。
     * 
     * @param hql 查询语句
     * @return 响应数目
     */
    Integer executeHql(String hql);
    
    /**
     * 执行HQL语句。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 响应数目
     */
    Integer executeHql(String hql, Object[] param);
    
    /**
     * 执行HQL语句。
     * 
     * @param hql 查询语句
     * @param param 查询参数
     * @return 响应数目
     */
    Integer executeHql(String hql, List<Object> param);
    
}

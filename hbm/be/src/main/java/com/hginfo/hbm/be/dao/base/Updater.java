package com.hginfo.hbm.be.dao.base;

import java.util.HashSet;
import java.util.Set;

import com.hginfo.hbm.base.BaseEntity;

/**
 * Hibernate更新对象类
 * 
 * 提供三种更新模式：MAX, MIN, MIDDLE
 * <ul>
 * <li>MIDDLE：默认模式。除了null外，都更新。exclude和include例外。</li>
 * <li>MAX：最大化更新模式。所有字段都更新（包括null）。exclude例外。</li>
 * <li>MIN：最小化更新模式。所有字段都不更新。include例外。</li>
 * </ul>
 * @param <E> 
 */
public class Updater<E extends BaseEntity> {
    
    /**
     * 需更新的对象。
     */
    private E           bean;
    
    /**
     * 更新的字段。
     */
    private Set<String> includeProperties = new HashSet<>();
    
    /**
     * 排除的字段。
     */
    private Set<String> excludeProperties = new HashSet<>();
    
    /**
     * 更新模式，默认middle。
     */
    private UpdateMode  mode              = UpdateMode.MIDDLE;
    
    /**
     * 更新模式的枚举类型。
     */
    public enum UpdateMode {
        MAX, MIN, MIDDLE
    }
    
    /**
     * 构造器。
     * 
     * @param bean 待更新对象
     */
    public Updater(E bean) {
        this.bean = bean;
    }
    
    /**
     * 构造器。
     * 
     * @param bean
     *            待更新对象
     * @param mode
     *            更新模式
     */
    public Updater(E bean, UpdateMode mode) {
        this.bean = bean;
        this.mode = mode;
    }
    
    /**
     * 设置更新模式。
     * 
     * @param updateMode 
     * @return 返回updater
     */
    public Updater<E> setUpdateMode(UpdateMode updateMode) {
        this.mode = updateMode;
        return this;
    }
    
    /**
     * 必须更新的字段。
     * 
     * @param property 
     * @return 返回updater
     */
    public Updater<E> include(String property) {
        includeProperties.add(property);
        return this;
    }
    
    /**
     * 不更新的字段。
     * 
     * @param property 
     * @return 返回updater
     */
    public Updater<E> exclude(String property) {
        excludeProperties.add(property);
        return this;
    }
    
    /**
     * 某一字段是否更新。
     * 
     * @param name
     *            字段名
     * @param value
     *            字段值。用于检查是否为NULL
     * @return 是否更新
     */
    public boolean isUpdate(String name, Object value) {
        if (this.mode == UpdateMode.MAX) {
            return !excludeProperties.contains(name);
        } else if (this.mode == UpdateMode.MIN) {
            return includeProperties.contains(name);
        } else if (this.mode == UpdateMode.MIDDLE) {
            if (value != null) {
                return !excludeProperties.contains(name);
            } else {
                return includeProperties.contains(name);
            }
        }
        return true;
    }
    
    public Set<String> getExcludeProperties() {
        return excludeProperties;
    }
    
    public Set<String> getIncludeProperties() {
        return includeProperties;
    }
    
    public E getBean() {
        return bean;
    }
}

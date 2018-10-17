/**
* Project Name:hbm-base.
* File Name:SysConfigService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:54
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysConfig;
import com.hginfo.hbm.base.entity.sys.SysDictGroup;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;
import java.util.Properties;

/**
* 系统设置表: sys_config. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:54 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysConfigService {

    /**
     * 获取有效的系统配置。
     * @param loadProps 需要级联加载的实体属性
     * @return 系统配置
     */
    SysConfig get(Long id, final String... loadProps);
    
    /**
     * 获取有效的系统配置列表，列表按照配置类型，排序号排列。
     * @return 系统配置列表
     */
    List<SysConfig> getList();
    
    /**
     * 获取系统配置列表。
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return 系统配置列表
     */
    List<SysConfig> getList(SysConfig filter, final String... loadProps);
    
    /**
     * 获取分页数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页数据
     */
    Page<SysConfig> getPageList(BasePage<SysConfig> pageInfo, SysConfig filter, final String... loadProps);

    /**
     * 获取所有的系统配置项，返回包含所有项的Properties。
     * @return 所有配置项集合
     */
    Properties getProps();

    /**
     * 获取有效的，类型为{@code confType}的系统配置列表，列表按照配置类型，排序号排列。
     *
     * @param confType 配置项类型
     * @return 系统配置列表
     */
    List<SysConfig> getList(String confType);

    /**
     * 获取所有类型为{@code confType}的系统配置项，返回包含所有项的Properties。
     *
     * @param confType 配置项类型
     * @return 所有配置项集合
     */
    Properties getProps(String confType);

    /**
     * 获取key对应的配置项值。
     * @param key 配置项Key
     * @return 配置项Value
     */
    String getProperty(String key);

    /**
     * 新增系统配置项。
     * @param conf 新增配置项
     * @return 当前配置项
     */
    SysConfig create(SysConfig conf);
    
    /**
     * 修改系统配置项。
     * @param conf 配置项
     */
    void update(SysConfig conf);

    /**
     * 修改配置项。
     * @param key     配置项Key
     * @param value   配置项新Value
     * @return 当前配置项
     */
    SysConfig edit(String key, String value);

    /**
     * 调整排序。
     * @param key     配置项Key
     * @param sortNo  排序号
     * @return 当前配置项
     */
    SysConfig sort(String key, int sortNo);

    /**
     * 恢复配置项默认值。
     * @param key 配置项Key
     * @return 当前配置项
     */
    SysConfig revert(String key);

    /**
     * 根据Key删除对应配置项。
     * @param key 配置项Key
     * @return 当前配置项
     */
    SysConfig delete(String key);

}

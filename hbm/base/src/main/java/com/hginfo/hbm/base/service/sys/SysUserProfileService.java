/**
* Project Name:hbm-base.
* File Name:SysUserProfileService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysUserProfile;
import java.util.List;
import java.util.Properties;

/**
* 用户设置表: sys_user_profile. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysUserProfileService {

    /**
     * 获取当前用户有效的系统配置列表，列表按照配置类型，排序号排列。
     * @return 系统配置列表
     */
    List<SysUserProfile> getList();
    
    /**
     * 修改当前用户配置项。
     * @author zhangdianbo
     * @param sysUserProfile sysUserProfile
     */
    void edit(SysUserProfile sysUserProfile);
    
    /**
     * 创建当前用户配置项。
     * @author zhangdianbo
     */
    void createUserProfile();
    
    /**
     * 获取当前用户所有的系统配置项，返回包含所有项的Properties。
     * @return 所有配置项集合
     */
    Properties getProps();

    /**
     * 获取当前用户有效的，类型为{@code profileType}的系统配置列表，列表按照配置类型，排序号排列。
     *
     * @param profileType 配置项类型
     * @return 系统配置列表
     */
    List<SysUserProfile> getList(String profileType);

    /**
     * 获取当前用户所有类型为{@code profileType}的系统配置项，返回包含所有项的Properties。
     *
     * @param profileType 配置项类型
     * @return 所有配置项集合
     */
    Properties getProps(String profileType);

    /**
     * 获取当前用户key对应的配置项值。
     * @param key 配置项Key
     * @return 配置项Value
     */
    String getProperty(String key);
    
    /**
     * 新增当前用户系统配置项。
     * @param profile 新增配置项
     */
    void create(SysUserProfile profile);

    /**
     * 修改当前用户配置项。
     * @param key     配置项Key
     * @param value   配置项新Value
     */
    void edit(String key, String value);

    List<SysUserProfile> getList(long userId);

    /**
     * 获取所有的系统配置项，返回包含所有项的Properties。
     * @param userId 对应用户
     * @return 所有配置项集合
     */
    Properties getProps(long userId);

    /**
     * 获取有效的，类型为{@code profileType}的系统配置列表，列表按照配置类型，排序号排列。
     *
     * @param userId 对应用户
     * @param profileType 配置项类型
     * @return 系统配置列表
     */
    List<SysUserProfile> getList(long userId, String profileType);

    /**
     * 获取所有类型为{@code profileType}的系统配置项，返回包含所有项的Properties。
     *
     * @param userId 对应用户
     * @param profileType 配置项类型
     * @return 所有配置项集合
     */
    Properties getProps(long userId, String profileType);
    
    /**
     * 获取key对应的配置项值。
     * @param userId 对应用户
     * @param key 配置项Key
     * @return 配置项Value
     */
    String getProperty(long userId, String key);

    /**
     * 修改配置项。
     * @param userId 对应用户
     * @param key     配置项Key
     * @param value   配置项新Value
     */
    void edit(long userId, String key, String value);



}

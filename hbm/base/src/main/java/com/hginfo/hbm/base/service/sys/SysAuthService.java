/**
* Project Name:hbm-base.
* File Name:SysAuthService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:54
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;
import java.util.Map;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysModel;

/**
* 系统权限表: sys_auth. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:54 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysAuthService {
    
    /**
     * 查询所有权限，包括主权限、附属权限。<br/>
     * 1、查询结果放到内存中，下次请求直接使用
     * 2、create/update/delete权限时，需要重置结果。
     * @return 所有权限
     */
    List<SysAuth> getAllAuthList();
    
    /**
     * 
     * 获得权限树集合. <br/>
     *
     * @author yuqing
     * @param vo (authType null：所有  1：模块+主权限  2：模块+附属权限  )
     * @return map  
     * @since V1.0.0
     */
    Map getSysAuthList(SysAuth vo);
    
    /**
     * getUserAuthList:(根据用户id获取用户权限列表). <br/>
     * @author yinyanzhen
     * @param userID userID
     * @return Map
     * @since V1.0.0
     */
    List<SysAuth> getUserAuthList(Long userID);

    /**
     * getUserAuthList:(根据用户id获取用户正权限列表). <br/>
     * @author yinyanzhen
     * @param userID userID
     * @return Map
     * @since V1.0.0
     */
    List<SysAuth> getUserPAuthList(Long userID);
    
    /**
     * getUserAuthList:(根据用户id获取负授权). <br/>
     * @author yinyanzhen
     * @param userID userID
     * @return Map
     * @since V1.0.0
     */
    List<SysAuth> getUserNAuthList(Long userID);
    
    /**
     * getUserAuthList:(根据角色id获取授权). <br/>
     * @author yinyanzhen
     * @param roleId roleId
     * @return Map
     * @since V1.0.0
     */
    List<SysAuth> getRoleAuthList(Long roleId);
    
    /**
     * 获取某个用户的权限树数据集合。
     * @author licheng
     * @param userId userId
     * @return map
     * @since V1.0.0
     */
    @SuppressWarnings("rawtypes")
    Map getSysAuthListByUserId(Long userId);
    
    /**
     * 根据权限ID获得实体. <br/>
     *
     * @author yuqing
     * @param authId 
     * @return sysauth  
     * @since V1.0.0
     */
    SysAuth getSysAuthById(Long authId);
    
    /**
     * 
     * createSysAuth:(新增权限). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @since V1.0.0
     */
    void createSysAuth(SysAuth sysAuth);
    
    /**
     * 
     * updateSysAuth:(更新权限). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @since V1.0.0
     */
    void updateSysAuth(SysAuth sysAuth);
    
    /**
     * 
     * deleteSysAuth:(删除权限). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @since V1.0.0
     */
    void deleteSysAuth(SysAuth sysAuth);
    
    /**
     * 
     * checkUri:(校验URI格式，不能重复). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return boolean  
     * @since V1.0.0
     */
    boolean checkUri(SysAuth sysAuth);
    
    /**
     * 
     * checkAuthCode:(校验authCode格式，不能重复,不能存在包含关系). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return boolean   
     * @since V1.0.0
     */
    boolean checkAuthCode(SysAuth sysAuth);
    
    /**
     * 
     * checkAuthRelation:(校验模块或权限是否与角色，用户绑定). <br/>
     *
     * @author yuqing
     * @param authId 
     * @return boolean  
     * @since V1.0.0
     */
    boolean checkAuthRelation(Long authId);
    
    /**
     * 
     * checkModelRelation:(校验模块下是否有权限). <br/>
     *
     * @author yuqing
     * @param authId 
     * @return boolean  
     * @since V1.0.0
     */
    boolean checkModelRelation(Long authId);
    
    /**
     * 获取角色的所有权限。
     * @author licheng
     * @param roleId roleId
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysAuth> getAuthsByRole(Long roleId);
    
    /**
     * 获取角色的所有权限。
     * @author licheng
     * @param roleIds roleIds 
     * @return 权限列表  
     * @since V1.0.0
     */
    List<SysAuth> getAuthsByRoles(Long[] roleIds);
    
    /**
     * 获取用户的权限（仅是用户的权限，不包含角色对应的权限）。
     * @author licheng
     * @param userId userId
     * @param authType authType
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysAuth> getAuthsByUser(Long userId, Integer authType);
    
    /**
     * 获取用户的全部权限（包含用户权限和全部角色权限）。
     * @author licheng
     * @param userId userId
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysAuth> getAllRoleAuthsByUser(Long userId);
    
    /**
     * 获取主权限选择框全部数据。
     * @author licheng
     * @return map
     * @since V1.0.0
     */
    @SuppressWarnings("rawtypes")
    Map getAuthManageDialogList();
    
    /**
     * 
     * 根据url查询当前页面层级导航树. <br/>
     * 如：根据/sys/sysAuthMenu/view，可查出导航树“系统-系统管理-权限管理-功能权限”. <br/>
     * 则返回集合List<SysAuth> [{authName:系统,uri:},{authName:系统管理,uri:},{authName:权限管理,uri:},{authName:功能权限,uri:}]. <br/>
     * 由于权限URI里可能存在%s，%d通配符，不可直接使用到连接中，可以进行参数替换再使用
     * @author yuqing
     * @param url 当前jsp请求URL，从根路径开始传，不需要传参数。如/sys/sysAuthMenu/view
     * @return List<SysAuth> 权限集合，按顺序从顶层模块到权限。返回sysAuth的权限名称（authName）为模块名称(modelName)，URI为权限URI
     * @since V1.0.0
     */
    List<SysModel> getMenuNavigationList(String url);
    
    /**
     * 
     * 获得菜单树. <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return map 
     * @since V1.0.0
     */
    Map getMenuTreeList(SysAuth sysAuth);
    
    /**
     * 
     * 更新首页MENU设置. <br/>
     *
     * @author yuqing
     * @param sysAuthList
     * @since V1.0.0
     */
    void updateMenuSet(List sysAuthList);
    
    /***
     * 动态展示配置图标. <br/>
     * 
     * @author zhangdianbo
     * @param authCode
     * @since V1.0.0
     */
    String getIconCss(String authCode);
}

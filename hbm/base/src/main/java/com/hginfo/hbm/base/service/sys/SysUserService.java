/**
* Project Name:hbm-base.
* File Name:SysUserService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;
import java.util.Map;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.base.vo.SysMenu;

/**
* 用户表: sys_user. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysUserService {
    
    /**
     * 主键获取对象。
     * @author licheng
     * @param primaryKey 主键
     * @return 实体对象
     * @since V1.0.0
     */
    SysUser get(Long primaryKey);
    
    /**
     * 获取当前用户顶级菜单列表。
     * @author licheng
     * @param feType 前端类型
     * @return List<SysMenu>
     * @since V1.0.0
     */
    List<SysMenu> getTopMenuList(FrontEndType feType);
    
    /**
     * 获取当前用户一个左侧子菜单列表。
     * @author licheng
     * @param parentId 父ID
     * @param feType 前端类型
     * @return SysMenu
     * @since V1.0.0
     */
    SysMenu getSubMenuList(Long parentId, FrontEndType feType);
    
    /**
    * 获取当前类下的左侧菜单树。
    * @author licheng
    * @param parentId 父ID
    * @param feType 前端类型
    * @return 菜单列表
    * @since V1.0.0
    */
    List<SysMenu> getSubMenuTree(Long parentId, FrontEndType feType);
    
    /**
     * 获取当前用户无层级的扁平菜单列表。
     * @author licheng
     * @param feType 前端类型
     * @return List<SysMenu>
     * @since V1.0.0
     */
    List<SysMenu> getFlatMenuList(FrontEndType feType);
    
    /**
     * 
     * 根据用户编号获取全部用户权限. <br/>
     *
     * @author yuqing
     * @param userid 客户id
     * @param type 1:查询所有权限(包括附属权限)  null/其他：查询主权限
     * @return 全部用户权限
     * @since V1.0.0
     */
    List<SysAuth> getAllSysAuth(Integer type, long userid);
    
    /**
     * 
     * 根据用户编号获取全部用户角色. <br/>
     *
     * @author licheng
     * @param userid 客户id
     * @return 全部用户角色
     * @since V1.0.0
     */
    List<SysRole> getAllSysRole(long userid);
    
    /**
     * 分页获取用户数据。
     * @param pageInfo 分页条件
     * @param filter 过滤条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页结果
     */
    Page<SysUser> getPageList(BasePage<SysUser> pageInfo, SysUser filter, String... loadProps);
    
    /**
     * 
     * 根据权限ID获得授权用户列表. <br/>
     *
     * @author yuqing 
     * @param pageInfo  
     * @param filter 
     * @return Page<SysUser> 
     * @since V1.0.0
     */
    Page<SysUser> getPageListByAuthId(BasePage<SysUser> pageInfo, SysUserAuth filter);
    
    /**
     * 人员选择页面分页数据获取。
     * @param pageInfo 分页条件
     * @param filter 过滤条件
     * @param loadProps 需要级联加载的实体属性
     * @return 分页结果
     */
    Page<SysUser> getWinPageList(BasePage<SysUser> pageInfo, SysUser filter, String... loadProps);
    
    /**
     * 新增用户.
     * @param user user
     * @return SysUser
     */
    SysUser createUser(SysUser user);
    
    /**
     * 修改用户.
     * @param user user
     * @return SysUser
     */
    SysUser editUser(SysUser user);
    
    /**
     * 删除用户.
     * @param userId userId
     */
    void delete(long userId);
    
    /**
     * 获取单个用户.
     * @param userId userId
     * @return SysUser
     */
    SysUser getUserById(long userId);
    
    /**
     * 修改用户密码.
     * @param userId userId
     * @param newPwd newPwd
     */
    void updateUserPwd(long userId, String newPwd);

    /**
     * 根据用户名称获取用户信息.
     * @param userName userName
     * @return SysUser
     */
    SysUser getUserByUserName(String userName);

    /**
     * 根据登录账户名称获取用户信息.
     * @param loginName loginName
     * @return SysUser
     */
    SysUser getUserByLoginName(String loginName);
    
    /**
     * getUserEntryGroup:(聚合查询入职时间). <br/>
     * @author yinyanzhen
     * @param vo vo
     * @return List<Map<String, Object>>
     * @since V1.0.0
     */
    List<Map<String, Object>> getUserEntryGroup(Map vo);
    
    /**
     * getUserQuitGroup:(聚合查询离职时间). <br/>
     * @author yinyanzhen
     * @param vo vo
     * @return List<Map<String, Object>>
     * @since V1.0.0
     */
    List<Map<String, Object>> getUserQuitGroup(Map vo);
    
    /**
     * 获取验证码。
     * @author licheng
     * @param user 用户实体
     * @param vfCode 验证码
     * @param actionUrl 操作URI
     * @param ip ip
     * @since V1.0.0
     */
    void sendVfcode(SysUser user, String loginName, String vfCode, String actionUrl, String ip);
    
}

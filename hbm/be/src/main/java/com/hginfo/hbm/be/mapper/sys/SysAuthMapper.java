/**
 * Project Name:hbm-be.
 * File Name:SysAuthMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 系统权限表: sys_auth. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:32 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysAuthMapper extends BaseSqlMapper {
    
    /**
     * 
     * getAllSysAuthByUserId:(根据用户id获得所有权限). <br/>
     *
     * @author yuqing
     * @param type 1:查询所有权限(包括附属权限)  null/其他：查询主权限
     * @param userId 
     * @return list  
     * @since V1.0.0
     */
    List<SysAuth> getAllSysAuthByUserId(@Param("type") Integer type, @Param("userId") long userId);
    
    /**
     * 
     * getAllSysAuthAndModel:(获得模块、权限集合). <br/>
     *
     * @author yuqing
     * @param category null：所有  1：模块+主权限  2：模块+附属权限  
     * @return list  
     * @since V1.0.0
     */
    List<SysAuth> getAllSysAuthAndModel(@Param("category") Integer category);
    
    /**
     * 
     * getEqAndContainCode:(获得相等或存在包含关系的编号数). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return int  
     * @since V1.0.0
     */
    Integer getEqAndContainCode(SysAuth sysAuth);
    
    /**
     * 
     * getEqAndContainURI:(获得相等或存在包含关系的URI数量). <br/>
     *
     * @author yuqing
     * @param sysAuth  
     * @return int  
     * @since V1.0.0
     */
    Integer getEqAndContainURI(SysAuth sysAuth);
    
    /**
     * 
     * checkAuthRelation:(获得绑定关系数量). <br/>
     *
     * @author yuqing
     * @param authId 
     * @return int  
     * @since V1.0.0
     */
    Integer checkAuthRelation(@Param("authId") Long authId);
    
    /**
     * 获取角色的权限列表。
     * @author licheng
     * @param roleIds roleIds
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysAuth> getAuthsByRoles(Long[] roleIds);
    
    /**
     * 获取用户的权限列表。
     * @author licheng
     * @param filter filter
     * @return 权限列表
     * @since V1.0.0
     */
    List<SysAuth> getAuthsByUser(SysUserAuth filter);
    
    /**
     * 
     * getPreUriList:(获得与URI统配符之前路径匹配的集合). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return list  
     * @since V1.0.0
     */
    List<SysAuth> getPreUriList(SysAuth sysAuth);
    
    /**
     * queryUserAuths:(查询用户的权限列表). <br/>
     * @author yinyanzhen
     * @param userID userID
     * @return List<SysAuth>
     * @since V1.0.0
     */
    List<SysAuth> queryUserAuths(Long userID);
}

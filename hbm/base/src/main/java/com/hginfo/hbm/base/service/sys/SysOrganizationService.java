/**
* Project Name:hbm-base.
* File Name:SysOrganizationService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysOrganization;

import java.util.List;
import java.util.Map;

/**
* 组织架构表: sys_organization. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysOrganizationService {

    /**
     * 组织架构应该有唯一的根节点。
     * @return 根节点
     */
    SysOrganization getRoot();

    /**
     *
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return org list
     */
    List<SysOrganization> getList(SysOrganization filter, final String... loadProps);

    /**
     *
     * @param parentId 父节点ID
     * @return 子节点
     */
    List<SysOrganization> getChildren(long parentId);

    /**
     *
     * @param id
     * @return SysOrganization
     */
    SysOrganization getById(long id);

    /**
     *
     * @param newOrg new organization
     * @return saved organization
     */
    SysOrganization createOrganization(SysOrganization newOrg);

    /**
     *
     * @param editOrg edit organization
     * @return saved organization
     */
    SysOrganization editOrganization(SysOrganization editOrg);

    /**
     *
     * @param orgId organization id
     * @return deleted organization
     */
    SysOrganization deleteOrganization(long orgId);
    
    /**
     * queryOrgPosUserTotal:(获取). <br/>
     * @author yinyanzhen
     * @return List<Map<String, Object>>
     * @since V1.0.0
     */
    List<Map<String, Object>> queryOrgUserList();

}

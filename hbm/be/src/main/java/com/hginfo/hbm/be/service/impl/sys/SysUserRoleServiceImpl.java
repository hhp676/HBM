/*
 * Project Name:hbm-be.
 * File Name:SysUserRoleServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月28日 下午2:20:17
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysUserRoleService;
import com.hginfo.hbm.be.dao.sys.SysUserRoleDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.be.service.prop.CascadePropLoadUtil;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.CollectionsUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *  用户角色表: sys_user_role. <br />
 * service impl 层 <br />
 * Date: 2016年12月28日 下午2:20:17 <br />
 *
 * @author yuyanlin
 * @author yinyanzhen
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysUserRoleServiceImpl extends RelService<SysUserRole, SysUserRoleDao>
    implements SysUserRoleService {

    @Override
    public void add(List<SysUserRole> userRoles) {
        Assert.notNull(userRoles);
        for (SysUserRole userRole : userRoles) {
            if (getList(userRole).size() == 0) {
                add(userRole);
            }
        }
    }

    @Override
    public void delete(List<SysUserRole> userRoles) {
        Assert.notNull(userRoles);
        for (SysUserRole userRole : userRoles) {
            delete(userRole);
        }
    }
    
    @Override
    public void doRefresh(Long userId, Long[] roleIds) {
        SysUserRole filter = new SysUserRole();
        filter.setUserId(userId);
        List<SysUserRole> existingList = this.getList(filter);
        List<Long> roleList = Arrays.asList(roleIds);
        List<Long> existingRoleList = existingList.stream().map(SysUserRole::getRoleId)
            .collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(roleList, existingRoleList);
        List<Long> subList = CollectionsUtil.subtract(existingRoleList, roleList);
        for (Long roleId : addList) {
            if (roleId == null) {
                continue;
            }
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setRoleId(roleId);
            sysUserRole.setUserId(userId);
            sysUserRole.setIsFinal(Constants.ZERO);
            super.add(sysUserRole);
        }
        for (Long roleId : subList) {
            if (roleId == null) {
                continue;
            }
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setRoleId(roleId);
            sysUserRole.setUserId(userId);
            this.deleteBatch(sysUserRole);
        }
        
    }
    
    @Override
    public String getRoleIdStrByUserId(Long userId) {
        SysUserRole filter = new SysUserRole();
        filter.setUserId(userId);
        List<SysUserRole> existingList = getList(filter);

        List<Long> roleIdList = existingList.stream().map(SysUserRole::getRoleId)
            .collect(Collectors.toList());

        return StringUtils.join(roleIdList, ",");
    }

    @Override
    public Page<SysUserRole> getPageListByRole(BasePage<SysUserRole> pageInfo, SysUserRole filter,
        String... loadProps) {
        //聚合逻辑书写至mybatis.xml文件内
        /*filter.setFilterStr((filter.getFilterStr() == null ? "" : filter.getFilterStr()) 
            + " group by sur.USER_ID_");*/
        pageInfo.setFilters(filter);
        Page<SysUserRole> page = this.getDao().groupPageQuery(pageInfo);
        
        if (loadProps != null && loadProps.length > 0) {
            page.getResult().forEach(e -> CascadePropLoadUtil.loadProps(e, loadProps));
        }
        return page;
    }
    
}

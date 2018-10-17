/*
 * Project Name:hbm-fe-easyui
 * File Name:SysUserRoleController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月28日下午5:29:42
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysUserRoleService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.core.model.SysRoleRequestModel.SysUserRoleList;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * 用户角色关联。
 * ClassName:SysUserRoleController <br/>
 * Date: 2016年12月28日 下午5:29:42 <br/>
 * @author licheng
 * @author qiujingde
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysUserRole")
public class SysUserRoleController {
    
    /**
     * 
     */
    private SysUserRoleService sysUserRoleService;
    
    /**
     * list.
     * @param pageInfo pageInfo
     * @param formFilter formFilter
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysUserRole> list(BasePage<SysUserRole> pageInfo, SysUserRole formFilter) {
        pageInfo.parseFilterRules(formFilter);
        pageInfo.parseSortRule(formFilter);
        return new Page<>(sysUserRoleService.getPageListByRole(pageInfo, formFilter, "sysUser.userPosition"));
    }
    
    /**
     * batch add user role.
     * @param list sysUserRole
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @UserLog(code = "addUserRole", name = "角色新增用户对应", engName = "addUserRole")
    public OperationResult add(SysUserRoleList list) {
        sysUserRoleService.add(list.getUserRoles());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * batch delete user role.
     * @param list userRoles to be deleted
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteUserRole", name = "角色删除用户对应", engName = "deleteUserRole")
    public OperationResult delete(SysUserRoleList list) {
        sysUserRoleService.delete(list.getUserRoles());
        return OperationResult.DEFAULT_SUCCESS;
    }

    @HReference
    @SuppressWarnings("unused")
    public void setSysUserRoleService(SysUserRoleService sysUserRoleService) {
        this.sysUserRoleService = sysUserRoleService;
    }
}

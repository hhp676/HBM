/**
 * Project Name:hbm-fe-easyui
 * File Name:SysRoleAuthController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月27日下午8:04:59
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.mc.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.base.service.sys.SysRoleAuthService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * SysRoleAuthController.
 * ClassName:SysRoleAuthController <br/>
 * Date: 2016年12月27日 下午8:04:59 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysRoleAuth")
public class SysRoleAuthController {
    
    /**
     * 
     */
    @HReference
    private SysRoleAuthService sysRoleAuthService;
    
    
    /**
     * 刷新配置数据。
     * @author licheng
     * @param sysRoleAuth sysRoleAuth
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/refresh")
    @ResponseBody
    @UserLog(code = "refreshRoleAuth", name = "刷新角色权限配置数据", engName = "refreshRoleAuth")
    public OperationResult refresh(SysRoleAuth sysRoleAuth) {
        
        sysRoleAuthService.doRefresh(sysRoleAuth.getRoleId(), sysRoleAuth.getAuthIds());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 
     * 权限授予用户. <br/>
     *
     * @author yuqing
     * @param sysRoleAuth 
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/addBatch")
    @ResponseBody
    @UserLog(code = "roleAuthbatchAdd", name = "权限授予角色配置", engName = "roleAuthbatchAdd")
    public OperationResult batchAdd(SysRoleAuth sysRoleAuth) {
        sysRoleAuthService.addBatch(sysRoleAuth.getAuthId(), sysRoleAuth.getRoleIds());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 
     * 批量删除授予用户. <br/>
     *
     * @author yuqing
     * @param sysRoleAuth 
     * @return OperationResult 
     * @since V1.0.0
     */
    @RequestMapping(value = "/deleteBatch")
    @ResponseBody
    @UserLog(code = "roleAuthDeleteBatch", name = "权限取消角色配置", engName = "roleAuthDeleteBatch")
    public OperationResult deleteBatch(SysRoleAuth sysRoleAuth) {
        sysRoleAuthService.deleteBatch(sysRoleAuth.getAuthId(), sysRoleAuth.getRoleIds());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
}

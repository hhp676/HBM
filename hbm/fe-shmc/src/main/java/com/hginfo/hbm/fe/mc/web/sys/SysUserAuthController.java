/**
 * Project Name:hbm-fe-easyui
 * File Name:SysUserAuthController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年1月3日下午4:38:46
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.mc.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.service.sys.SysUserAuthService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * ClassName:SysUserAuthController <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2017年1月3日 下午4:38:46 <br/>
 * @author yuqing
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysUserAuth")
public class SysUserAuthController {
    
    /**
     * 
     */
    private SysUserAuthService sysUserAuthService;
    
    /**
     * 
     * 权限授予用户. <br/>
     *
     * @author yuqing
     * @param sysUserAuth 
     * @return OperationResult  
     * @since V1.0.0
     */
    @RequestMapping(value = "/addBatch")
    @ResponseBody
    @UserLog(code = "userAuthBatchAdd", name = "权限授予用户", engName = "userAuthBatchAdd")
    public OperationResult batchAdd(SysUserAuth sysUserAuth) {
        sysUserAuthService.addBatch(sysUserAuth.getAuthId(), sysUserAuth.getUserIds(),
            sysUserAuth.getAuthType());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 
     * 批量删除授予用户. <br/>
     *
     * @author yuqing
     * @param sysUserAuth 
     * @return OperationResult 
     * @since V1.0.0
     */
    @RequestMapping(value = "/deleteBatch")
    @ResponseBody
    @UserLog(code = "userAuthDeleteBatch", name = "权限批量删除授予用户", engName = "userAuthDeleteBatch")
    public OperationResult deleteBatch(SysUserAuth sysUserAuth) {
        sysUserAuthService.deleteBatch(sysUserAuth.getAuthId(), sysUserAuth.getUserIds(),sysUserAuth.getAuthType());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 刷新用户权限。
     * @param filter sysUserAuth
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/refresh")
    @ResponseBody
    @UserLog(code = "refreshUserAuth", name = "刷新用户权限配置数据", engName = "refreshUserAuth")
    public OperationResult refresh(SysUserAuth filter) {
        sysUserAuthService.doRefresh(filter.getUserId(), filter.getAuthIds(), filter.getAuthType());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    public SysUserAuthService getSysUserAuthService() {
        return sysUserAuthService;
    }
    
    @HReference
    public void setSysUserAuthService(SysUserAuthService sysUserAuthService) {
        this.sysUserAuthService = sysUserAuthService;
    }
    
}

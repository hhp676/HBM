/**
 * Project Name:hbm-fe-easyui
 * File Name:SysModelController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月2日上午10:14:50
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.eu.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.exception.ExceptionUtil;
import com.hginfo.hvalidate.annotation.HValidated;


/**
 * SysModelController.
 * ClassName:SysModelController <br/>
 * Date: 2016年12月2日 上午10:14:50 <br/>
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/model")
public class SysModelController {
    /**
     * 
     */
    private SysModelService sysModelService;
    
    /**
     * 
     * createSysModel:(新增模块). <br/>
     *
     * @author yuqing
     * @param sysModel 
     * @return 封装返回结果 
     * @since V1.0.0
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    @UserLog(code = "createSysModel", name = "新增模块", engName = "createSysModel")
    public OperationResult createSysModel(@HValidated SysModel sysModel) {
        OperationResult result = new OperationResult();
        try {
            sysModelService.createSysModel(sysModel);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
            result.setData(ExceptionUtil.getExceptionMsg(e));
        }
        return result;
    }
    
    /**
     * 
     * updateSysModel:(查新模块). <br/>
     *
     * @author yuqing
     * @param sysModel 
     * @return 封装返回结果 
     * @since V1.0.0
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateSysModel", name = "修改模块", engName = "updateSysModel")
    public OperationResult updateSysModel(@HValidated SysModel sysModel) {
        sysModelService.updateSysModel(sysModel);
        return new OperationResult();
    }

    public SysModelService getSysModelService() {
        return sysModelService;
    }
    
    @HReference
    public void setSysModelService(SysModelService sysModelService) {
        this.sysModelService = sysModelService;
    }
    
    
    
}

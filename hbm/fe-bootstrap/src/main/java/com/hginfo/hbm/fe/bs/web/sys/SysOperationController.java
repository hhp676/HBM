/**
 * Project Name:hbm-fe-easyui
 * File Name:SysOperationController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月23日上午11:59:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysOperationService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.exception.ExceptionUtil;
import com.hginfo.hvalidate.annotation.HValidated;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.bs.op.OperationResult;

/**
 * ClassName:SysOperationController <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年12月23日 上午11:59:04 <br/>
 * @author yuqing
 * @since V1.0.0
 */

@Controller
@RequestMapping("/sys/sysOperation")
public class SysOperationController {
    
    private Log             log = LogFactory.getLog(getClass());
    
    private SysOperationService sysOperationService;
    
    /**
     * 
     * showSysOperation:(展示操作类型列表页). <br/>
     *
     * @author yuqing 
     * @return jsp 
     * @since V1.0.0
     */
    @RequestMapping(value = "/view")
    public String showSysOperation() {
        return "sys/operation/sysOperation_view";
    }
    
    /**
     * 
     * list:. <br/>
     *
     * @author yuqing
     * @param pageInfo 
     * @param formFilter 
     * @return page 
     * @since V1.0.0
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysOperation> list(BasePage<SysOperation> pageInfo, SysOperation formFilter) {
        SysOperation filter = new SysOperation();
        //查询有效的类型
        filter.setIsDelete(0);
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysOperationService.getPageList(pageInfo, filter));
    }
    
    /**
     * 
     * createSysOperation:(新增操作类型). <br/>
     *
     * @author yuqing
     * @param sysOperation  
     * @return 封装返回结果
     * @since V1.0.0
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    @UserLog(code = "createSysOperation", name = "新增操作类型", engName = "createSysOperation")
    public OperationResult createSysOperation(@HValidated SysOperation sysOperation) {
        sysOperationService.createSysOperation(sysOperation);
        return new OperationResult();
    }
    
    /**
     * 
     * updateSysOperation:(更新操作类型). <br/>
     *
     * @author yuqing
     * @param sysOperation  
     * @return 封装返回结果 
     * @since V1.0.0
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateSysOperation", name = "修改操作类型", engName = "updateSysOperation")
    public OperationResult updateSysOperation(@HValidated SysOperation sysOperation) {
        sysOperationService.updateSysOperation(sysOperation);
        return new OperationResult();
    }
    
    /**
     * 
     * deleteSysOperation:(删除操作类型). <br/>
     *
     * @author yuqing
     * @param sysOperation 
     * @return 封装返回结果 
     * @since V1.0.0
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteSysOperation", name = "删除操作类型", engName = "deleteSysOperation")
    public OperationResult deleteSysOperation(@HValidated SysOperation sysOperation) {
        OperationResult result = new OperationResult();
        try {
            sysOperationService.deleteSysOperation(sysOperation);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
            result.setData(ExceptionUtil.getExceptionMsg(e));
        }
        return result;
    }

    public SysOperationService getSysOperationService() {
        return sysOperationService;
    }

    @HReference
    public void setSysOperationService(SysOperationService sysOperationService) {
        this.sysOperationService = sysOperationService;
    }
    
    
}


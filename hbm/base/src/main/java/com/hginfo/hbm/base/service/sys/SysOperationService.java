/**
* Project Name:hbm-base.
* File Name:SysOperationService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
* 系统操作类型表: sys_operation. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysOperationService {
    
    /**
     * 
     * getList. <br/>
     *
     * @author yuqing
     * @param sysOperation operation
     * @param loadProps 需要级联加载的实体属性
     * @return list 
     * @since V1.0.0
     */
    List<SysOperation> getList(SysOperation sysOperation, final String... loadProps);
    
    /**
     * 
     * getPageList. <br/>
     *
     * @author yuqing
     * @param pageInfo 
     * @param filter
     * @param loadProps 需要级联加载的实体属性
     * @return page 
     * @since V1.0.0
     */
    Page<SysOperation> getPageList(BasePage<SysOperation> pageInfo, SysOperation filter, final String... loadProps);
    
    /**
     * 
     * createSysOperation:(新增操作类型). <br/>
     *
     * @author yuqing
     * @param sysOperation 
     * @since V1.0.0
     */
    void createSysOperation(SysOperation sysOperation);
    
    /**
     * 
     * updateSysOperation:(更新操作类型). <br/>
     *
     * @author yuqing
     * @param sysOperation 
     * @since V1.0.0
     */
    void updateSysOperation(SysOperation sysOperation);
    
    /**
     * 
     * deleteSysOperation:(删除操作类型). <br/>
     *
     * @author yuqing
     * @param sysOperation 
     * @since V1.0.0
     */
    void deleteSysOperation(SysOperation sysOperation) throws Exception;
    
}

/**
* Project Name:hbm-be.
* File Name:SysOperationServiceImpl.java
* Package Name:com.hginfo.hbm.be.service.impl.sys
* Date:2016年11月29日 下午3:43:44
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.be.service.impl.sys;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysOperationService;
import com.hginfo.hbm.be.dao.sys.SysOperationDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
* 系统操作类型表: sys_operation. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysOperationServiceImpl extends BizService<SysOperation, SysOperationDao>
    implements SysOperationService {
    @Autowired
    private SysOperationDao sysOperationDao;
    @Override
    public Page<SysOperation> getPageList(BasePage<SysOperation> pageInfo, SysOperation filter, final String... loadProps) {
        pageInfo.setSort("sortNo");
        pageInfo.setOrder("asc");
        pageInfo.parseSortRule(filter);
        return super.getPageList(pageInfo, filter);
    }
    
    @Override
    public void createSysOperation(SysOperation sysOperation) {
        sysOperation.setIsFinal(0);
        super.add(sysOperation);
    }
    
    @Override
    public void updateSysOperation(SysOperation sysOperation) {
        super.update(sysOperation);
    }
    
    @Override
    public void deleteSysOperation(SysOperation sysOperation)throws Exception {
        if(sysOperationDao.queryOperationCountInAuth(sysOperation.getOperationId())==0){
            super.delete(sysOperation.getOperationId());
        }else{
            throw new Exception("当前操作类型已被使用!");
        }
            
    }
    
}

/*
 * Project Name:hbm-be.
 * File Name:SysModelServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.be.dao.sys.SysModelDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hdubbo.annotation.HService;

/**
* 系统模块表: sys_model. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysModelServiceImpl extends BizService<SysModel, SysModelDao> implements SysModelService {

    @Override
    public SysModel getSysModelById(Long modelId) {
        if (modelId == null || modelId == 0) {
            return new SysModel();
        }
        return super.get(modelId);         
    }

    @Override
    public void createSysModel(SysModel sysModel) {
        super.add(sysModel);
    }

    @Override
    public void updateSysModel(SysModel sysModel) {
       super.update(sysModel);
    }

    @Override
    public void deleteSysModel(Long authId) {
        super.delete(authId);
    }
    
}

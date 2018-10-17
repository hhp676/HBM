/*
 * Project Name:hbm-be.
 * File Name:SysStaffInfoServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.base.service.sys.SysStaffInfoService;
import com.hginfo.hbm.be.dao.sys.SysStaffInfoDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
* 员工信息表: sys_staff_info. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysStaffInfoServiceImpl extends BizService<SysStaffInfo, SysStaffInfoDao> implements SysStaffInfoService {

    /**
     * 
     */
    private static final Log LOG = LogFactory.getLog(SysStaffInfoService.class);
    
    /**
     * 
     */
    @Autowired
    private SysStaffInfoDao sysStaffInfoDao;
    
    @Override
    public SysStaffInfo getByUserId(Long userId) {
        SysStaffInfo queryVo = new SysStaffInfo();
        queryVo.setUserId(userId);
        List<SysStaffInfo> list = super.getList(queryVo);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }


    @Override
    public SysStaffInfo editSysStaffInfo(SysStaffInfo sysStaffInfo) {
        sysStaffInfoDao.editSysStaffInfo(sysStaffInfo);
        return null;
    }

}

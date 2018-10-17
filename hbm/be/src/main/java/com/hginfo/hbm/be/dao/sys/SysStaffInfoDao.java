/*
 * Project Name:hbm-be.
 * File Name:SysStaffInfoDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年12月16日 上午11:47:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.mapper.sys.SysStaffInfoMapper;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * 员工信息表: sys_staff_info. <br />
 * dao 层 <br />
 * Date: 2016年12月16日 上午11:47:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysStaffInfoDao extends SingleKeyBaseDao<SysStaffInfo> implements SysStaffInfoMapper {

    @Override
    public SysStaffInfo getByUserId(Long userId) {
        return getMapperByType(SysStaffInfoMapper.class).getByUserId(userId);
    }
 
    /**
    * @param sysStaffInfo sysStaffInfo
    */
    public void editSysStaffInfo(SysStaffInfo sysStaffInfo) {
        sysStaffInfo.setIsDelete(0);
        sysStaffInfo.setUpdUserId(CurrentUserUtils.getUserId());
        sysStaffInfo.setUpdTime(new Date());
        Updater<SysStaffInfo> updater = new Updater<>(sysStaffInfo);
        updater.include("quitTime");
        super.updateByUpdater(updater);
    }

}

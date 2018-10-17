/*
 * Project Name:hbm-be.
 * File Name:SysPositionServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.service.sys.SysPositionService;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.dao.sys.SysPositionDao;
import com.hginfo.hbm.be.dao.sys.SysUserPositionDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.exception.BaseRuntimeException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
* 岗位表: sys_position. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysPositionServiceImpl extends BizService<SysPosition, SysPositionDao> implements SysPositionService {
    /**
     */
    @Autowired
    private SysUserPositionDao sysUserPositionDao;
    
    @Override
    public List<SysPosition> getOrgChildren(long parentId) {
        SysPosition filter = new SysPosition();
        filter.setIsDelete(0);
        filter.setOrgId(parentId);
        filter.setFid(0L);

        return getList(filter);
    }

    @Override
    public List<SysPosition> getPosChildren(long parentId) {
        SysPosition filter = new SysPosition();
        filter.setIsDelete(0);
        filter.setFid(parentId);

        return getList(filter);
    }

    @Override
    public SysPosition getById(long id) {
        return get(id);
    }

    @Override
    public SysPosition createPosition(SysPosition newPos) {
        add(newPos);
        return newPos;
    }

    @Override
    public SysPosition editPosition(SysPosition editPos) {
        SysPosition oldPos = this.getById(editPos.getId());
        //新岗位部门Id与旧数据的部门Id不相同时,需要进行数据的部门变更操作
        if (!oldPos.getOrgId().equals(editPos.getOrgId())) {
            String posIDs = this.getDao().getPosIdsByFid(editPos.getId());
            String[] idArray = posIDs.split(",");
            //第一个值为$,第二个值为本级值,处理时跳过此两个岗位
            if (idArray.length > 2) {
                for (int i = 2; i < idArray.length; i++) {
                    SysPosition pos = new SysPosition();
                    pos.setId(Long.parseLong(idArray[i]));
                    pos.setOrgId(editPos.getOrgId());
                    update(pos);
                }
            }
        }
        //强制更新父岗位字段
        Updater<SysPosition> posUpdater = new Updater<SysPosition>(editPos);
        posUpdater.include("fid");
        editPos.setUpdTime(new Date());
        this.updateByUpdater(posUpdater, editPos);
        return editPos;
    }

    @Override
    public SysPosition deletePosition(long posId) {
        SysUserPosition userPosition = new SysUserPosition();
        userPosition.setPositionId(posId);
        //查询岗位下人员数量
        if (sysUserPositionDao.getListCount(userPosition) > 0) {
            throw new BaseRuntimeException("当前岗位下存在人员信息,不允许删除!");
        }
        SysPosition del = get(posId);
        delete(posId);
        return del;
    }
}

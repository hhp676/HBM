/*
 * Project Name:hbm-be.
 * File Name:SysUserPositionServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月28日 下午2:51:03
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hbm.be.dao.sys.SysUserPositionDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.CollectionsUtil;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;

/**
 * 用户岗位表: sys_user_position. <br />
 * service impl 层 <br />
 * Date: 2016年12月28日 下午2:51:03 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysUserPositionServiceImpl extends RelService<SysUserPosition, SysUserPositionDao>
    implements SysUserPositionService {
    
    @Override
    public void add(SysUserPosition userPos) {
        SysUserPosition filter = new SysUserPosition();
        filter.setUserId(userPos.getUserId());
        
        List<SysUserPosition> oldList = getList(filter);
        // 第一个岗位设为主岗
        userPos.setIsMajor(oldList.size() > 0 ? 0
            : 1);
        
        super.add(userPos);
    }
    
    @Override
    public void addPosToUsers(Long positionId, Long[] userIds) {
        for (Long userId : userIds) {
            SysUserPosition userPos = new SysUserPosition();
            userPos.setPositionId(positionId);
            userPos.setUserId(userId);
            userPos.setIsMajor(0);
            
            super.add(userPos);
        }
        
        
    }
    
    @Override
    public void deleteByIDs(Long[] userPositionIds) {
        for (Long userPositionId:userPositionIds) {
            if (userPositionId != null) {
                this.delete(userPositionId);
            }
        }
        
    }
    
    @Override
    public void setMajor(SysUserPosition userPos) {
        SysUserPosition majorFilter = new SysUserPosition();
        majorFilter.setUserId(userPos.getUserId());
        majorFilter.setIsMajor(1);
        
        List<SysUserPosition> majorPoses = getList(majorFilter);
        majorPoses.forEach(up -> {
            up.setIsMajor(0);
            update(up);
        });
        
        userPos.setIsMajor(1);
        update(userPos);
    }
    
    @Override
    public void doRefresh(Long userId, Long[] positionIds) {
        
        SysUserPosition filter = new SysUserPosition();
        filter.setUserId(userId);
        List<SysUserPosition> existingPositions = super.getList(filter);
        
        List<Long> positionList = Arrays.asList(positionIds);
        List<Long> existingPositionIds = existingPositions.stream()
            .map(SysUserPosition::getPositionId).collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(positionList, existingPositionIds);
        List<Long> subList = CollectionsUtil.subtract(existingPositionIds, positionList);
        
        for (Long positionId : addList) {
            if (positionId == null) {
                continue;
            }
            SysUserPosition sysUserPosition = new SysUserPosition();
            sysUserPosition.setUserId(userId);
            sysUserPosition.setPositionId(positionId);
            sysUserPosition.setIsFinal(Constants.ZERO);
            sysUserPosition.setIsMajor(Constants.ZERO);
            super.add(sysUserPosition);
        }
        
        for (Long positionId : subList) {
            if (positionId == null) {
                continue;
            }
            SysUserPosition sysUserPosition = new SysUserPosition();
            sysUserPosition.setUserId(userId);
            sysUserPosition.setPositionId(positionId);
            this.deleteBatch(sysUserPosition);
        }
        
    }
    
    /**
     * 根据用户Id查询用户的职务Id。
     * @param userId 用户Id
     * @return 职务Id
     */
    public List<Long> getJobIdListByUserId(long userId) {
        return getDao().getJobIdListByUserId(userId);
    }
    
    @Override
    public String getPositionIdStrByUserId(Long userId) {
        SysUserPosition filter = new SysUserPosition();
        filter.setUserId(userId);
        List<SysUserPosition> existingList = this.getList(filter);
        List<Long> positionIdList = existingList.stream().map(o -> o.getPositionId())
            .collect(Collectors.toList());
        return StringUtils.join(positionIdList, ",");
    }
    
}

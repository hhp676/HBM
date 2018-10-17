/*
 * Project Name:hbm-be.
 * File Name:SysGroupUserServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月28日 下午2:41:31
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.service.sys.SysGroupUserService;
import com.hginfo.hbm.be.dao.sys.SysGroupUserDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.CollectionsUtil;

/**
 * 小组用户表: sys_group_user. <br />
 * service impl 层 <br />
 * Date: 2016年12月28日 下午2:41:31 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysGroupUserServiceImpl extends RelService<SysGroupUser, SysGroupUserDao>
    implements SysGroupUserService {
    
    @Override
    public void setLeader(SysGroupUser groupUser) {
        SysGroupUser leaderFilter = new SysGroupUser();
        leaderFilter.setGroupId(groupUser.getGroupId());
        leaderFilter.setIsLeader(1);
        
        List<SysGroupUser> oldLeaders = getList(leaderFilter);
        oldLeaders.forEach(l -> {
            l.setIsLeader(0);
            update(l);
        });
        
        groupUser.setIsLeader(1);
        update(groupUser);
    }
    
    @Override
    public void addGroupToUsers(Long groupId, Long[] userIds) {
        for (Long userId : userIds) {
            SysGroupUser groupUser = new SysGroupUser();
            groupUser.setGroupId(groupId);
            groupUser.setUserId(userId);
            super.add(groupUser);
        }
    }
    
    @Override
    public void deleteByIDs(Long[] groupUserIds) {
        for (Long groupUserId : groupUserIds) {
            this.delete(groupUserId);
        }
        
    }
    
    @Override
    public void doRefresh(Long userId, Long[] groupIds) {
        
        SysGroupUser filter = new SysGroupUser();
        filter.setUserId(userId);
        List<SysGroupUser> existingPositions = super.getList(filter);
        
        List<Long> groupList = Arrays.asList(groupIds);
        List<Long> existingGroupIds = existingPositions.stream().map(o -> o.getGroupId())
            .collect(Collectors.toList());
        List<Long> addList = CollectionsUtil.subtract(groupList, existingGroupIds);
        List<Long> subList = CollectionsUtil.subtract(existingGroupIds, groupList);
        
        for (Long groupId : addList) {
            if (groupId == null) {
                continue;
            }
            SysGroupUser sysGroupUser = new SysGroupUser();
            sysGroupUser.setUserId(userId);
            sysGroupUser.setGroupId(groupId);
            sysGroupUser.setIsFinal(Constants.ZERO);
            sysGroupUser.setIsLeader(Constants.ZERO);
            super.add(sysGroupUser);
        }
        
        for (Long groupId : subList) {
            if (groupId == null) {
                continue;
            }
            SysGroupUser sysGroupUser = new SysGroupUser();
            sysGroupUser.setUserId(userId);
            sysGroupUser.setGroupId(groupId);
            this.deleteBatch(sysGroupUser);
        }
        
    }
    
    @Override
    public String getGroupIdsByUserId(Long userId) {
        SysGroupUser filter = new SysGroupUser();
        filter.setUserId(userId);
        List<SysGroupUser> list = this.getList(filter);
        List<Long> groupIdList = list.stream().map(o -> o.getGroupId())
            .collect(Collectors.toList());
        return StringUtils.join(groupIdList, ",");
    }
    
}

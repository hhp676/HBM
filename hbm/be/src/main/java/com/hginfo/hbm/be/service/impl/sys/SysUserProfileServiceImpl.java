/**
 * Project Name:hbm-be.
 * File Name:SysUserProfileServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysConfig;
import com.hginfo.hbm.base.entity.sys.SysUserProfile;
import com.hginfo.hbm.base.service.sys.SysUserProfileService;
import com.hginfo.hbm.be.dao.sys.SysUserProfileDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
* 用户设置表: sys_user_profile. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysUserProfileServiceImpl extends BizService<SysUserProfile, SysUserProfileDao> 
    implements SysUserProfileService {

    /***
     * 
     */
    private static final Log LOG = LogFactory.getLog(SysUserProfileServiceImpl.class);
    
    /**
     */
    private SysConfigServiceImpl configServiceImpl;
    
    @Override
    public void edit(SysUserProfile sysUserProfile) {
        super.update(sysUserProfile);
    }
    
    /**
     * 获取对应的Profile。
     * @return 对应的设置项
     */
    @Override
    public List<SysUserProfile> getList() {
        return getList(CurrentUserUtils.getUserId());
    }

    @Override
    public Properties getProps() {
        return getProps(CurrentUserUtils.getUserId());
    }

    @Override
    public List<SysUserProfile> getList(String profileType) {
        return getList(CurrentUserUtils.getUserId(), profileType);
    }

    @Override
    public Properties getProps(String profileType) {
        return getProps(CurrentUserUtils.getUserId(), profileType);
    }

    @Override
    public String getProperty(String key) {
        return getProperty(CurrentUserUtils.getUserId(), key);
    }

    @Override
    public void create(SysUserProfile profile) {
        if (profile.getUserId() == null) {
            profile.setUserId(CurrentUserUtils.getUserId());
        }
        if (profile.getSortNo() == null) {
            profile.setSortNo(getNewSortNo(profile.getUserId()));
        }

        super.add(profile);
    }

    @Override
    public void edit(String key, String value) {
        edit(CurrentUserUtils.getUserId(), key, value);
    }


    @Override
    public List<SysUserProfile> getList(long userId) {
        return getList(userId, null);
    }

    @Override
    public Properties getProps(long userId) {
        return getProps(userId, null);
    }

    @Override
    public List<SysUserProfile> getList(long userId, String profileType) {
        SysUserProfile filter = new SysUserProfile();
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        filter.setUserId(userId);
        filter.setProfileType(profileType);
        return getList(filter);
    }

    @Override
    public Properties getProps(long userId, String profileType) {
        SysUserProfile filter = new SysUserProfile();
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        filter.setUserId(userId);
        filter.setProfileType(profileType);

        Properties props = new Properties();
        getList(filter).forEach(profile -> props.setProperty(profile.getProfileKey(), profile.getProfileValue()));

        return props;
    }

    @Override
    public String getProperty(long userId, String key) {
        try {
            SysUserProfile profile = getProfile(userId, key);
            return profile.getProfileValue();
        } catch (Exception e) {
            // 当前用户无对应配置项
        }
        return null;
    }

    @Override
    public void edit(long userId, String key, String value) {
        String profileValue = getProperty(userId, key);
        if (profileValue == null) {
            SysConfig config = configServiceImpl.getConfByKey(key);
            SysUserProfile sysProfile = new SysUserProfile();
            sysProfile.setProfileKey(config.getConfigKey());
            sysProfile.setProfileValue(value);
            sysProfile.setProfileType(config.getDefaultValue());
            sysProfile.setDescr(config.getConfigDesc());
            sysProfile.setUserId(userId);
            sysProfile.setSortNo(getNewSortNo(userId));
            super.add(sysProfile);
        } else {
            SysUserProfile profile = getProfile(userId, key);
            profile.setProfileValue(value);
            super.update(profile);
        }
    }

    /**
     * 配置项修改操作，备份原信息，增加新版本的配置。
     * @param profile 要修改的配置项
     */
    @Override
    public void update(SysUserProfile profile) {
        SysUserProfile filter = new SysUserProfile();
        filter.setUserId(profile.getUserId());
        filter.setProfileKey(profile.getProfileKey());
        filter.setIsDelete(0);
        filter.setIsCurrent(1);

        SysUserProfile oldProfile = getOne(filter);
        oldProfile.setIsCurrent(0);
        super.update(oldProfile);

        profile.setUserProfileId(null);
        profile.setVersion(oldProfile.getVersion() + 1);
        super.update(profile);
    }
    

    /**
     * 获取用户对应的ProfileValue 。
     * @param userId 对应用户编号
     * @param key    profile key
     * @return 对应的设置项
     */
    private SysUserProfile getProfile(long userId, String key) {
        SysUserProfile filter = new SysUserProfile();
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        filter.setUserId(userId);
        filter.setProfileKey(key);

        LOG.debug("filter: userId: " + userId + ", key: " + key + ", isDelete: 0, isCurrent: 1");
       
        return getOne(filter);
    }
    

    /**
     * 获取新的sortNo。
     *
     * @param userId 对应用户编码
     * @return 新的sortNo
     */
    private int getNewSortNo(long userId) {
        List<SysUserProfile> list = getList(userId);
        if (list.size() == 0) {
            return 1;
        }
        return list.get(0).getSortNo() + 1;
    }
    
    
    /**
     * 创建当前用户配置项。
     */
    @Override
    public void createUserProfile() {
        //当前用户个性化配置数据
        SysUserProfile filter = new SysUserProfile();
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        filter.setUserId(CurrentUserUtils.getUserId());
        List<SysUserProfile> userProfileList = getList(filter);
        //默认个性化配置数据
        SysConfig config = new SysConfig();
        config.setIsDelete(0);
        config.setIsCurrent(1);
        config.setConfigType(Constants.PROFILE);
        List<SysConfig> configList = configServiceImpl.getList(config);
        
        if (userProfileList.size() != configList.size()) {
            for (SysConfig sysConfig : configList) {
                String profileValue = getProperty(CurrentUserUtils.getUserId(), sysConfig.getConfigKey());
                if (profileValue == null) {
                    SysUserProfile sysProfile = new SysUserProfile();
                    sysProfile.setProfileKey(sysConfig.getConfigKey());
                    sysProfile.setProfileValue(sysConfig.getConfigValue());
                    sysProfile.setProfileType(sysConfig.getDefaultValue());
                    sysProfile.setDescr(sysConfig.getConfigDesc());
                    create(sysProfile);
                }
            }
        }
    }
    
    @Autowired
    public void setConfigServiceImpl(SysConfigServiceImpl configServiceImpl) {
        this.configServiceImpl = configServiceImpl;
    }
}

/*
 * Project Name:hbm-be.
 * File Name:SysConfigServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.CacheConfig;

import com.hginfo.hbm.base.entity.sys.SysConfig;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.be.dao.sys.SysConfigDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.cache.CacheUtils;
import com.hginfo.hbm.core.constants.CacheConstants;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.NumberUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
* 系统设置表: sys_config. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
@CacheConfig(cacheNames = "sysConfig")
public class SysConfigServiceImpl extends BizService<SysConfig, SysConfigDao>
    implements SysConfigService {
    
    
    @Override
    public List<SysConfig> getList() {
        return getList((String) null);
    }
    
    @Override
    public Page<SysConfig> getPageList(BasePage<SysConfig> pageInfo, SysConfig filter,
        final String... loadProps) {
        filter.setIsDelete(0);
        return super.getPageList(pageInfo, filter);
    }
    
    @Override
    public Properties getProps() {
        return getProps(null);
    }
    
    @Override
    public List<SysConfig> getList(String confType) {
        SysConfig filter = new SysConfig();
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        filter.setConfigType(confType);
        filter.setOrderStr(" CONFIG_TYPE_, SORT_NO_ ");
        
        return getList(filter);
    }
    
    @Override
    public Properties getProps(String confType) {
        SysConfig filter = new SysConfig();
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        filter.setConfigType(confType);
        
        Properties props = new Properties();
        getList(filter)
            .forEach(conf -> props.setProperty(conf.getConfigKey(), conf.getDefaultValue()));
        
        return props;
    }
    
    @Override
    public String getProperty(String key) {
        try {
            String cacheProperty = CacheUtils.get(CacheConstants.SYS_CONFIG, key, String.class);
            if (cacheProperty != null) {
                return cacheProperty;
            }
            SysConfig conf = getConfByKey(key);
            CacheUtils.cache(CacheConstants.SYS_CONFIG, key, conf.getConfigValue());
            return conf.getConfigValue();
        } catch (Exception e) {
            // 无对应配置项
        }
        return null;
    }
    
    @Override
    public SysConfig create(SysConfig conf) {
        if (StringUtils.isBlank(conf.getDefaultValue())) {
            conf.setDefaultValue(conf.getConfigValue());
        }
        if (conf.getSortNo() == null) {
            conf.setSortNo(getNewSortNo(conf));
        }
        //2017-03-22 新增时设置版本号为1
        conf.setVersion(Constants.ONE);
        conf.setIsCurrent(NumberUtil.INTEGER_ONE);
        add(conf);
        return conf;
    }
    
    @Override
    public SysConfig edit(String key, String value) {
        SysConfig conf = new SysConfig();
        BeanUtils.copyProperties(getConfByKey(key), conf);
        conf.setConfigValue(value);
        
        update(conf);
        return conf;
    }
    
    @Override
    public SysConfig sort(String key, int sortNo) {
        SysConfig conf = getConfByKey(key);
        conf.setSortNo(sortNo);
        
        update(conf);
        return conf;
    }
    
    @Override
    public SysConfig revert(String key) {
        SysConfig conf = getConfByKey(key);
        conf.setConfigValue(conf.getDefaultValue());
        
        update(conf);
        return conf;
    }
    
    @Override
    public SysConfig delete(String key) {
        SysConfig conf = getConfByKey(key);
        
        delete(conf);
        CacheUtils.evict(CacheConstants.SYS_CONFIG, key);
        return conf;
    }
    
    /**
     * 配置项修改操作，备份原信息，增加新版本的配置。
     * @param conf 要修改的配置项
     */
    @Override
    public void update(SysConfig conf) {
        SysConfig filter = new SysConfig();
        filter.setConfigKey(conf.getConfigKey());
        filter.setIsDelete(0);
        filter.setIsCurrent(1);
        
        SysConfig oldConf = getOne(filter);
        
        if (oldConf.getIsFinal() == 1) {
            throw new BaseRuntimeException("当前配置项已锁定，无法修改！");
        }
        
        oldConf.setIsCurrent(0);
        super.update(oldConf);
        
        conf.setId(null);
        conf.setVersion(oldConf.getVersion() + 1);
        add(conf);
        CacheUtils.evict(CacheConstants.SYS_CONFIG, conf.getConfigKey());
    }
    
    /**
     * 根据key获取当前有效的配置项。
     * @param key 配置项Key
     * @return 返回当前有效配置项
     */
    public SysConfig getConfByKey(String key) {
        SysConfig conf = new SysConfig();
        conf.setIsDelete(0);
        conf.setIsCurrent(1);
        conf.setConfigKey(key);
        
        return getOne(conf);
    }
    
    /**
     * 获取新的sortNo。
     * @param conf conf
     * @return 新的sortNo
     */
    private int getNewSortNo(SysConfig conf) {
        List<SysConfig> list = getList(conf.getConfigType());
        if (list.size() == 0) {
            return 1;
        }
        SysConfig last = list.get(list.size() - 1);
        return last.getSortNo() + 1;
    }
    
}

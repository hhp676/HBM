/*
 * Project Name:hbm-be.
 * File Name:SrvInterfaceServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.srv
 * Date:2017年06月08日 上午10:07:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.srv;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.be.dao.srv.SrvInterfaceDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.cache.CacheUtils;
import com.hginfo.hbm.core.constants.CacheConstants;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.utils.SrvUtil;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 接口表: srv_interface. <br />
 * service impl 层 <br />
 * Date: 2017年06月08日 上午10:07:12 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SrvInterfaceServiceImpl extends BizService<SrvInterface, SrvInterfaceDao>
        implements SrvInterfaceService {
	private static final String ORACLE = "oracle";
	/**
     */
    private static String DB_TYPE;
    
    @Override
    public void updateData(List<SrvInterface> interfaces, boolean forced) {
        Date now = new Date();
        //更新扫描到的接口信息到数据库
        for (SrvInterface srvInterface : interfaces) {
            Long ifId = this.getId(srvInterface);
            if (ifId == -1L) {
                super.add(srvInterface);
            } else {
                srvInterface.setEnabled(Constants.ONE);
                srvInterface.setIfId(ifId);
                super.update(srvInterface);
            }
        }
        //将历史接口置为不可用状态。
        SrvInterface query = new SrvInterface();
        query.setEndTime(now);
        String updTimeSql = "'%s'";
        if(ORACLE.equals(getDbType())){
        	updTimeSql = "to_date('%s','yyyy-mm-dd hh24:mi:ss')";
        }
        String hql = String.format("update %s set enabled=0 WHERE updTime < "+updTimeSql, this.getDao().getEntityClass().getName(), DateTimeUtil.getDateTimeStr(now));
        this.getDao().executeHql(hql);
        this.updateCache();
    }

    @Override
    public void add(SrvInterface e) {
        super.add(e);
        this.updateCache();
    }

    @Override
    public void update(SrvInterface e) {
        super.update(e);
        this.updateCache();
    }

    @Override
    public Map<String, SrvInterface> updateCache() {

        Map<String, SrvInterface> cache = new HashMap<>();
        List<SrvInterface> list = this.getList(new SrvInterface());
        for (SrvInterface srvInterface : list) {
            cache.put(SrvUtil.getInterfaceCacheKey(srvInterface), srvInterface);
        }
        CacheUtils.cache(CacheConstants.SRV, CacheConstants.SRV_INTERFACE_DATALIST, cache);
        return cache;
    }

    @Override
    public Long getId(SrvInterface srvInterface) {
        SrvInterface query = new SrvInterface();
        query.setClassName(srvInterface.getClassName());
        query.setMethodName(srvInterface.getMethodName());
        query.setParameters(srvInterface.getParameters());
        List<SrvInterface> result = this.getList(query);
        if (!result.isEmpty()) {
            return result.get(Constants.ZERO).getId();
        }
        return -1L;
    }

    @Override
    public int getEffectiveCount(){
        SrvInterface query = new SrvInterface();
        query.setEnabled(Constants.ONE);
        query.setIsDelete(Constants.ZERO);
        return this.getDao().getListCount(query);
    }

    @Override
    public int getEnabledCount(){
        SrvInterface query = new SrvInterface();
        query.setEnabled(Constants.ONE);
        query.setIsDelete(Constants.ZERO);
        query.setIfSwitch(Constants.ONE);
        return this.getDao().getListCount(query);
    }
    
    private static String getDbType() {
        if (DB_TYPE == null) {
            Properties pro = new Properties();
            try {
                pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
            } catch (IOException e1) {
                throw new BaseRuntimeException(e1.getMessage());
            }
            DB_TYPE = pro.getProperty("jdbc.dataSourceType");
        }
        return DB_TYPE;
    }

}

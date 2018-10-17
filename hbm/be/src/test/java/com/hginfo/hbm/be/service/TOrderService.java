package com.hginfo.hbm.be.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.dao.base.HBaseDAO;
import com.hginfo.hbm.be.datasource.DataSourceConstants;
import com.hginfo.hbm.be.datasource.DataSourceKey;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.DateTimeUtil;

/**
 * 
 * @author:
 */

@Service("tOrderService")
public class TOrderService {
    
    private static Log         log = LogFactory.getLog(TOrderService.class);
    
    @Autowired
    private HBaseDAO<TOrder>   hBaseDao;
    
    @Autowired
    private TOrderDao          tOrderDao;
    
    @Autowired
    private TOrderOtherService tOrderService2;
    
    @CacheEvict(cacheNames = "CACHE_AUTH_ARVIABLE", key = "'TORDER_NAME_LIST'")
    public void saveOrder() {
        TOrder o = new TOrder();
        o.setClientname("test@CachEvict" + new Date());
        o.setAmount(new BigDecimal(11));
        hBaseDao.save(o);
    }
    
    /**
     * 不指定数据源，使用默认
     */
    public void insertHBMByDefault() {
        TOrder o = new TOrder();
        o.setClientname("insertHBMByDefault");
        o.setAmount(new BigDecimal("1"));
        o.setCreatetime(new Date());
        hBaseDao.save(o);
        log.warn("新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
    
    /**
     * 使用注解，使用默认
     */
    @DataSourceKey
    public void insertHBMByDefalutValue() {
        TOrder o = new TOrder();
        o.setClientname("insertHBMByDefalutValue");
        o.setAmount(new BigDecimal("2"));
        o.setCreatetime(new Date());
        hBaseDao.save(o);
        log.warn("新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
    
    /**
     * 指定数据源HBM
     */
    @DataSourceKey(DataSourceConstants.HBM)
    public void insertHBMByKey() {
        TOrder o = new TOrder();
        o.setClientname("insertHBMByKey");
        o.setAmount(new BigDecimal("3"));
        o.setCreatetime(new Date());
        hBaseDao.save(o);
        log.warn("新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
    
    /**
     * 指定数据源TEST。
     */
    @DataSourceKey(DataSourceConstants.TEST)
    public void insertTEST() {
        TOrder o = new TOrder();
        o.setClientname("insertTEST:" + DateTimeUtil.getDateTimeStr(new Date()));
        o.setAmount(new BigDecimal("4"));
        o.setCreatetime(new Date());
        hBaseDao.save(o);
        log.warn("新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
    
    @DataSourceKey(DataSourceConstants.HBM)
    public void getByHBM() {
        log.warn("新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
    
    @DataSourceKey(DataSourceConstants.TEST)
    public void getByTest() {
        log.warn("新的OrderNameList:" + tOrderDao.getNameListNoCache());
    }
    
    @DataSourceKey(DataSourceConstants.TEST)
    public void insertMutil() {
        tOrderService2.getByHBM();
        
    }
    
    public void getMutil() {
        tOrderService2.getByHBM();
        tOrderService2.getByTest();
        tOrderService2.getByHBM();
    }
    
    /**
     * 报错证明有事务
     */
    @Transactional(propagation = Propagation.NEVER)
    public void getMutilNoTransaction() {
        tOrderService2.getByHBM();
        tOrderService2.getByTest();
        tOrderService2.getByHBM();
    }
    
}

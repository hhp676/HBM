package com.hginfo.hbm.be.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.TOrderDao;
import com.hginfo.hbm.be.dao.TUserDao;
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

@Service("tUserService")
public class TUserService {
	
	private static Log log = LogFactory.getLog(TUserService.class);

    
    @Autowired
    private TUserDao tUserDao;
    
    public void testUserNoException(){
        try{
            tUserDao.testUser();
        }catch(Exception e){
            System.out.println("不再处理异常~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        }
    }
    
    public void testUser(){
        tUserDao.testUser();
    }
    
    public void testUserException(){
        System.out.println(1/0);
    }

}
package com.hginfo.hbm.be.dao;

import java.math.BigDecimal;

import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.TUser;

/**
 * ClassName:TUserDao <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年9月9日 下午5:47:24 <br/>
 * @author Administrator
 * @version
 * @since V1.0.0
 * @see
 */
@Repository("tUserDao")
public class TUserDao {
    
    
    public void testUser(){
        TUser u = new TUser();
        u.setId(1l);
    }
    
}


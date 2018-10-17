/**
 * Project Name:hbm-Identityid
 * File Name:IdentityidFactory.java
 * Package Name:com.hginfo.hbm.be.core.identityid
 * Date:2016年10月14日上午11:14:49
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.core.identityid;
/**
 * 唯一ID工厂类。
 * ClassName:IdentityidFactory <br/>
 * Date: 2016年10月14日 上午11:14:49 <br/>
 * @author licheng
 */
public class IdentityidFactory implements Identityid {

    /**
     * 
     */
    private Identityid identityidinstance;
    
    
    public Identityid getIdentityidinstance() {
        return identityidinstance;
    }


    public void setIdentityidinstance(Identityid identityidinstance) {
        this.identityidinstance = identityidinstance;
    }


    @Override
    public long getIdentityid() {
        return identityidinstance.getIdentityid();
    }

}


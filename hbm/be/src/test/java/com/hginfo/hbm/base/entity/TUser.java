/**
 * Project Name:hbm-backend
 * File Name:TUser.java
 * Package Name:com.hginfo.hbm.be.entity
 * Date:2016年9月9日上午11:40:41
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.base.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.hginfo.hbm.base.BaseEntity;

/**
 * ClassName:TUser <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年9月9日 上午11:40:41 <br/>
 * @author Administrator
 * @version
 * @since V1.0.0
 * @see
 */
@Entity(name = "T_USER")
public class TUser extends BaseEntity{
    
    private static final long serialVersionUID = -6230093567016833018L;
    private Long id;
    private String userName;
    private int sex;
    private Date createTime;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "ID_")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
        //测试异常
        //System.out.println(1/0);
    }
    
    @Column(name = "USERNAME_")
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    @Column(name = "SEX_")
    public int getSex() {
        return sex;
    }
    public void setSex(int sex) {
        this.sex = sex;
    }
    
    @Column(name = "CREATETIME_")
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    
    
    
    
}


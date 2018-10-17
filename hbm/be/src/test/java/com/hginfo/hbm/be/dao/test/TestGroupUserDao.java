/*
 * Project Name:hbm-be.
 * File Name:TestGroupUserDao.java
 * Package Name:com.hginfo.hbm.be.dao.test
 * Date:2017年02月14日 下午5:07:22
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.test;

import com.hginfo.hbm.base.entity.test.TestGroupUserPK;
import com.hginfo.hbm.be.dao.base.MultiKeyBaseDao;
import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.test.TestGroupUser;
import com.hginfo.hbm.be.dao.base.BaseDao;
import com.hginfo.hbm.be.mapper.test.TestGroupUserMapper;

/**
 * 小组用户表: test_group_user. <br />
 * dao 层 <br />
 * Date: 2017年02月14日 下午5:07:22 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class TestGroupUserDao extends MultiKeyBaseDao<TestGroupUser, TestGroupUserPK>
        implements TestGroupUserMapper {

    @Override
    public String getMapperNamespace() {
        return TestGroupUserMapper.class.getName();
    }


}

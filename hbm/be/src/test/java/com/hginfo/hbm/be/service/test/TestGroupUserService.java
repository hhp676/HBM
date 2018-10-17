/*
 * Project Name:hbm-base.
 * File Name:TestGroupUserService.java
 * Package Name:com.hginfo.hbm.base.service.test
 * Date:2017年02月14日 下午5:07:22
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.test;

import com.hginfo.hbm.base.entity.test.TestGroupUser;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
 * 小组用户表: test_group_user. <br />
 * service interface 层 <br />
 * Date: 2017年02月14日 下午5:07:22 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface TestGroupUserService {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<TestGroupUser> getPageList(BasePage<TestGroupUser> pageInfo,
                                    TestGroupUser filter, String... loadProps);

    /**
     *
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return list result
     */
    List<TestGroupUser> getList(TestGroupUser filter, String... loadProps);

    /**
     * 获取实体。
     * @param groupId group id
     * @param userId user id
     * @return 实体。
     */
    TestGroupUser get(long groupId, long userId);

    /**
     * 新增。
     * @param entity entity
     */
    void add(TestGroupUser entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(TestGroupUser entity);

    /**
     * 删除。
     * @param groupId group id
     * @param userId user id
     */
    void delete(long groupId, long userId);
}

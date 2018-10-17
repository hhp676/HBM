package com.hginfo.hbm.be.service.impl.test;

import com.hginfo.hbm.base.entity.test.TestGroupUser;
import com.hginfo.hbm.base.entity.test.TestGroupUserPK;
import com.hginfo.hbm.be.dao.test.TestGroupUserDao;
import com.hginfo.hbm.be.service.base.MultiKeyBaseService;
import com.hginfo.hbm.be.service.test.TestGroupUserService;
import org.springframework.stereotype.Service;

/**
 * Created by qiujingde on 2017/2/15. <br />
 * 多主键实体测试Service实现。
 * @author qiujingde
 */
@Service
public class TestGroupUserServiceImpl
        extends MultiKeyBaseService<TestGroupUser, TestGroupUserPK, TestGroupUserDao>
        implements TestGroupUserService {

    @Override
    public TestGroupUser get(long groupId, long userId) {
        return get(new TestGroupUserPK(groupId, userId));
    }

    @Override
    public void delete(long groupId, long userId) {
        delete(new TestGroupUserPK(groupId, userId));
    }

}

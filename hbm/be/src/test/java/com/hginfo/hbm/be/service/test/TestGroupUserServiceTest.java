package com.hginfo.hbm.be.service.test;

import com.hginfo.hbm.base.entity.test.TestGroupUser;
import com.hginfo.hbm.base.page.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by qiujingde on 2017/2/15. <br />
 * 多主键支持测试。
 * @author qiujingde
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})
public class TestGroupUserServiceTest {

    private TestGroupUserService service;

    @Test
    public void add() {
        TestGroupUser test = new TestGroupUser();
        test.setGroupId(1054740107663000241L);
        test.setUserId(1L);

        test.setCrtUserId(1L);

        service.add(test);
    }

    @Test
    public void list() {
        TestGroupUser filter = new TestGroupUser();
        filter.setGroupId(1054740107663000241L);
        filter.setCrtUserId(1L);

        List<TestGroupUser> list = service.getList(filter);
        assertEquals(1, list.size());
    }

    @Test
    public void update() {
        TestGroupUser test = service.get(1054740107663000241L, 1L);
        test.setIsLeader(1);

        service.update(test);
    }

    @Test
    public void delete() {
        service.delete(1054740107663000241L, 1L);
    }

    @Autowired
    public void setService(TestGroupUserService service) {
        this.service = service;
    }
}

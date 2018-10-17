package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.service.sys.SysAccountService;
import com.hginfo.hdubbo.annotation.HReference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 *
 * Created by qiujingde on 2016/11/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})
public class SysAccountServiceImplTest {

    @Autowired
    private SysAccountServiceImpl accountService;

    /**
     * 测试BaseDao<E, Long>能否自动注入
     */
    @Test
    public void testBaseService() {

        System.out.println(accountService.getDao().getClass().getCanonicalName());

    }

}
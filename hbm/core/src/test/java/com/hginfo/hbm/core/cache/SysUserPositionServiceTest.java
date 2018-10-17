package com.hginfo.hbm.core.cache;

import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hdubbo.annotation.HReference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by qiujingde on 2017/2/6.
 * dubbo接口传递回调方法功能测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml"})
public class SysUserPositionServiceTest {

    private SysUserPositionService upService;

    @Test
    public void testGetPageList() {
        List<SysUserPosition> ups = upService.getList(new SysUserPosition(), "sysUser");
        assertEquals(3, ups.size());

        assertNotNull(ups.get(0).getSysUser());
        assertNull(ups.get(0).getSysPosition());
    }

    @HReference
    public void setUpService(SysUserPositionService upService) {
        this.upService = upService;
    }
}
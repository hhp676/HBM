package com.hginfo.hbm.be.dubbo.common;

import com.hginfo.hbm.base.service.sys.SysUserProfileService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;

/**
 * Created by qiujingde on 2017/2/28.
 * 动态获取HReference注解服务的测试类。
 * @author qiujingde
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})
public class HReferenceUtilTestForBe {

    private static final Log LOG = LogFactory.getLog(HReferenceUtilTestForBe.class);


    @Test
    public void testBeanFactory() {
        SysUserProfileService bean = SpringContextUtil.getBean(SysUserProfileService.class);
        assertNotNull(bean);
        LOG.info("----SysUserProfileService:" + bean + "-----------------");
    }

}

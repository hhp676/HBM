package com.hginfo.fe.eu.dubbo;

import com.hginfo.hbm.base.service.sys.SysUserProfileService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;

/**
 * Created by qiujingde on 2017/2/28.
 * 动态获取HReference注解服务的测试类。
 * @author qiujingde
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-shiro.xml",
        "classpath:spring/applicationContext-hdubbo-client.xml" })
public class HReferenceUtilTestForFe {

    private static final Log LOG = LogFactory.getLog(HReferenceUtilTestForFe.class);

    @Test
    public void testBeanFactory() {
        SysUserProfileService bean = SpringContextUtil.getHService(SysUserProfileService.class);
        assertNotNull(bean);
        LOG.info("----SysUserProfileService:" + bean + "-----------------");
    }

    @Test(expected = NoSuchBeanDefinitionException.class)
    public void testGetBeanNull() {
        SpringContextUtil.getBean(this.getClass());
    }

    @Test
    public void testGetBean() {
        SysUserProfileService bean = SpringContextUtil.getBean(SysUserProfileService.class);
        assertNotNull(bean);
    }
}

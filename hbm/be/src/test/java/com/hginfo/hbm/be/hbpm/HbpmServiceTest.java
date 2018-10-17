package com.hginfo.hbm.be.hbpm;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hginfo.hbpm.api.entity.HbpmProcessDefinition;
import com.hginfo.hbpm.api.service.HbpmProcessDefinitionService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * hbpm service测试 ,hbm与hbpm嵌入式开发环境.
 * Date: 2017年6月24日 下午12:07:22 <br/>
 * @author shichengqun
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-verification.xml",
        "classpath:spring/applicationContext-activiti.xml",
        "classpath:spring/applicationContext-*.xml" })
public class HbpmServiceTest {
    @HReference
    private HbpmProcessDefinitionService hbpmProcessDefinitionService;
    
    @Test
    public void test() {
        System.out.println(hbpmProcessDefinitionService);
        System.out.println(hbpmProcessDefinitionService.getProcessDefinitionList(new HbpmProcessDefinition()));
    }
}


package com.hginfo.hbm.be.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.TDept;
import com.hginfo.hbm.be.dao.TDeptDao;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import junit.framework.TestCase;

/**
 * 数据权限拦截器测试。
 * @author shichengqun
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml" })
public class TestDataPermissionFilterService extends TestCase {
    
    @Autowired
    private TDeptDao tDeptDao;
    
    @Test
    @Transactional
    public void testFilter() {
        List<String> ids = new ArrayList<>();
        ids.add("a");
        ids.add("b");
        
        Map<String, Object> map = new HashMap<>();
        map.put("deptName", "name");
        map.put("deptCode", "code");
        map.put("remark", "aa");
        map.put("childIds", ids);
        
        TDept t1 = new TDept();
        t1.setDeptId(1L);
        t1.setDeptCode("1c");
        t1.setDeptName("1n");
        
        TDept t2 = new TDept();
        t2.setDeptCode("2c");
        t2.setDeptName("2n");

        tDeptDao.updateTest();
        
        tDeptDao.deleteTest();
        
        tDeptDao.update(t1);
        
        tDeptDao.testNoParam();
        
        TDept t3 = new TDept();
        t3.setDeptCode("a");
        
        BasePage<TDept> bp = new BasePage<>();
        bp.setRows(10);
        bp.setFilters(t3);
        Page<TDept> p = tDeptDao.pageQuery("test1Param", bp);
        
        List<TDept> r = tDeptDao.getDataPermissionList(map);
        
        
        /*tDeptDao.testNoParam();
        
        tDeptDao.test1Param("testc");
        
        tDeptDao.test3Param("testn", 1, 2);
        
        tDeptDao.test2Dept(t1, t2);
        
        tDeptDao.test2Param(t1, map);*/
        
        //System.out.println(r);
    }
    
}

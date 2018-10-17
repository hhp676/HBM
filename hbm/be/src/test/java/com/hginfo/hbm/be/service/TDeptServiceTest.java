package com.hginfo.hbm.be.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.hginfo.hbm.base.entity.TDept;
import com.hginfo.hbm.be.dao.TDeptDao;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})  
public class TDeptServiceTest {
    
    
    @Autowired
    private TDeptDao tDeptDao;
    
    @Autowired
    private TDeptService tDeptService;
    
    
    @Test
    @Transactional
    public void testSaveUpdate(){
        System.out.println("=========================测试保存修改=====================");
        TDept d1 = new TDept();
        d1.setId(55L);
        d1.setDeptCode("test2");
        tDeptDao.save(d1);
        d1.setDeptName("test2Name");
        tDeptDao.update(d1);
    }
    
    @Test   
    public void testUpdate(){
        TDept t = tDeptService.updateTestUpdate();
        System.out.println("========测试通过update修改======TDept：" + tDeptDao.getById(t.getId()));
    }
    
    @Test   
    public void testUpdateAll(){
        TDept t = tDeptService.updateTestUpdateAll();
        System.out.println("========测试通过updateTestUpdateAll修改======TDept：" + tDeptDao.getById(t.getId()));
    }
    
    @Test
    public void test(){
        TDept t1 = tDeptService.saveDeptTest();
        System.out.println("========测试游离状态的保存======DeptName：" + tDeptDao.getById(t1.getId()).getDeptName());
        
        TDept t2 = tDeptService.saveDeptTestForPersistent();
        System.out.println("========测试持久化状态的保存======DeptName：" + tDeptDao.getById(t2.getId()).getDeptName());
        
        TDept t3 = tDeptService.updateDeptTest();
        System.out.println("========测试游离状态的update======DeptName：" + tDeptDao.getById(t3.getId()).getDeptName());
        
        TDept t4 = tDeptService.updateDeptTestForPersistent();
        System.out.println("========测试持久化状态的update======DeptName：" + tDeptDao.getById(t4.getId()).getDeptName());
        
        TDept t5 = tDeptService.deleteTest();
        
        System.out.println("========测试删除之后修改deptName======DeptName：" + tDeptDao.getById(t5.getId()));
    }
    
    @Test
    public void testUpdater(){
        TDept t = tDeptService.updateTestUpdater();
        
        System.out.println("========测试通过updater修改======DeptCode：" + tDeptDao.getById(t.getId()).getDeptCode());
    }
    
    
}


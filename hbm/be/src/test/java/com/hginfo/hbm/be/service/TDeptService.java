package com.hginfo.hbm.be.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hginfo.hbm.base.entity.TDept;
import com.hginfo.hbm.be.dao.TDeptDao;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.dao.base.Updater.UpdateMode;

@Service("tDeptService")
public class TDeptService {
    
    
    @Autowired
    private TDeptDao tDeptDao;
    
    /**
     * 测试游离状态的保存
     */
    public TDept saveDeptTest(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("测试游离状态的保存");
        t.setDeptCode("saveDeptTest");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        t.setDeptName("游离状态之后修改deptName");
        
        return t;
    }
    
    /**
     * 测试持久化状态的保存
     */
    public TDept saveDeptTestForPersistent(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("测试持久化状态的保存");
        t.setDeptCode("saveDeptTestForPersistent");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.saveForPersistent(t);
        
        t.setDeptName("持久化状态之后修改deptName");
        
        return t;
    }
    
    /**
     * 测试游离状态的update
     */
    public TDept updateDeptTest(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("update");
        t.setDeptCode("updateDeptTest");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        t.setDeptName("测试游离状态的update");
        

        TDept t1 = new TDept();
        t1.setId(t.getId());
        t1.setDeptName("测试游离状态的update");
        tDeptDao.update(t1);
        
        t1.setDeptName("测试游离状态的update之后修改deptName");
        
        return t;
    }
    
    /**
     * 测试持久化状态的update
     */
    public TDept updateDeptTestForPersistent(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("update");
        t.setDeptCode("updateDeptTestForPersistent");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        
        TDept t1 = new TDept();
        t1.setId(t.getId());
        t1.setDeptName("测试持久化状态的update");
        tDeptDao.updateForPersistent(t1);
        
        t1.setDeptName("测试持久化状态的update之后修改deptName");
        
        return t;
    }
    
    /**
     * 测试删除
     */
    public TDept deleteTest(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("update");
        t.setDeptCode("updateDeptTestForPersistent");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        tDeptDao.delete(t);
        
        t.setDeptName("测试删除之后修改deptName");
        
        return t;
    }
    /**
     * 测试通过updater修改。
     */
    public TDept updateTestUpdater(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("updater");
        t.setDeptCode("updateTestUpdater");
        t.setRemark("updater-remark");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        TDept t1 = new TDept();
        t1.setId(t.getId());
        t1.setIsDelete(1);
        t1.setDeptCode("updateTestUpdater之后修改DeptCode");
        Updater<TDept> u = new Updater<TDept>(t1);
        u.exclude("isDelete");
        u.include("remark");
        tDeptDao.updateByUpdater(u);
        
        return t;
        
    }
    
    /**
     * 测试update修改。
     */
    public TDept updateTestUpdate(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("update");
        t.setDeptCode("updateTestUpdate");
        t.setRemark("update-remark");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        TDept t1 = new TDept();
        t1.setId(t.getId());
        t1.setDeptName("update by update()");
        t1.setIsDelete(1);
        t1.setIsFinal(5);
        tDeptDao.update(t1);
        
        return t;
        
    }
    
    /**
     * 测试updateAllFields修改。
     */
    public TDept updateTestUpdateAll(){
        TDept t = new TDept();
        t.setId(tDeptDao.getIdentityid());
        t.setDeptName("update");
        t.setDeptCode("updateTestUpdate");
        t.setRemark("update-remark");
        t.setIsDelete(0);
        t.setCrtTime(new Date());
        t.setCrtUserId(1L);
        tDeptDao.save(t);
        
        TDept t2 = new TDept();
        t2.setId(t.getId());
        t2.setDeptName("update by updateAllFields()");
        t2.setIsDelete(0);
        tDeptDao.updateAllFields(t2);
        
        return t;
        
    }
    
}


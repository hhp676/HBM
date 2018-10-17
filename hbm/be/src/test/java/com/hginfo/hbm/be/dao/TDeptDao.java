package com.hginfo.hbm.be.dao;

import com.hginfo.hbm.base.entity.TDept;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.TDeptMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository("tDeptDao")
public class TDeptDao extends SingleKeyBaseDao<TDept> implements TDeptMapper {
    
    public String getMapperNamespace() {
        return TDeptMapper.class.getName();
    }
    
    @Override
    public List<TDept> getDataPermissionList(Map<String, Object> map) {
        return getMapperByType(TDeptMapper.class).getDataPermissionList(map);
    }
    
    @Override
    public List<TDept> testNoParam() {
        return getMapperByType(TDeptMapper.class).testNoParam();
    }
    
    @Override
    public List<TDept> test1Param(String deptCode) {
        return getMapperByType(TDeptMapper.class).test1Param(deptCode);
    }
    
    @Override
    public List<TDept> test3Param(String deptName, Integer num, int size) {
        return getMapperByType(TDeptMapper.class).test3Param(deptName, num, size);
    }
    
    @Override
    public List<TDept> test2Dept(TDept dept1, TDept dept2) {
        return getMapperByType(TDeptMapper.class).test2Dept(dept1, dept2);
    }
    
    @Override
    public List<TDept> test2Param(TDept dept, Map map) {
        return getMapperByType(TDeptMapper.class).test2Param(dept, map);
    }
    
    @Override
    public void updateTest() {
        getMapperByType(TDeptMapper.class).updateTest();
    }
    
    @Override
    public void deleteTest() {
        getMapperByType(TDeptMapper.class).deleteTest();
    }
    
}


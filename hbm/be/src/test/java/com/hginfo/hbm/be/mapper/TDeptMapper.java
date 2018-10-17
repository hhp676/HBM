package com.hginfo.hbm.be.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.hginfo.hbm.base.entity.TDept;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
* mapper 层
*/

public interface TDeptMapper extends BaseSqlMapper {
    
    public List<TDept> getDataPermissionList(Map<String, Object> map);
    
    @Select("select * from T_dept")
    public List<TDept> testNoParam();
    
    public List<TDept> test1Param(@Param("deptCode") String deptCode);
    
    public List<TDept> test3Param(@Param("deptName")String deptName, Integer num, int size);
    
    public List<TDept> test2Dept(@Param("dept1")TDept dept1, @Param("dept2")TDept dept2);
    
    public List<TDept> test2Param(TDept dept, Map map);
    
    public void updateTest();
    
    public void deleteTest();
    
}

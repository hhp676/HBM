package com.hginfo.hbm.base.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.hginfo.hbm.base.BizEntity;

@Entity(name = "T_DEPT")
public class TDept extends BizEntity {

    private static final long serialVersionUID = 965060361571763387L;
    
    private Long deptId;
    
    private String deptName;
    
    private String deptCode;
    
    private String remark;
    
    private List<String> childIds;

    @Id
    @Column(name = "ID_")
    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    @Column(name = "DEPT_NAME_")
    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Column(name = "DEPT_CODE_")
    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    @Column(name = "REMARK_")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    @Transient
    public List<String> getChildIds() {
        return childIds;
    }

    public void setChildIds(List<String> childIds) {
        this.childIds = childIds;
    }

    @Override
    @Transient
    public Long getId() {
        return getDeptId();
    }
    
    public void setId(Long id) {
        setDeptId(id);
    };
    
}


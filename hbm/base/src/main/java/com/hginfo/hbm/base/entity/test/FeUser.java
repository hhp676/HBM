package com.hginfo.hbm.base.entity.test;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hvalidate.annotation.HValidFieldName;
import com.hginfo.hvalidate.constraints.Mobile;
import com.hginfo.hvalidate.group.Insert;
import com.hginfo.hvalidate.group.Update;

/**
 * 测试entity。
 * 
 */
public class FeUser extends BizEntity {
    
    private static final long serialVersionUID = 6996522441154592633L;
    private Long              id;
    
    @NotNull(groups = {Insert.class, Update.class })
    @HValidFieldName("用户名称")
    private String            userName;
    @Max(value = 1L, groups = {Insert.class, Update.class })
    @Min(value = 1L, groups = {Insert.class, Update.class })
    @HValidFieldName("性别")
    private Integer           sex;
    
    /**
     * 角色编号。
     */
    @NotEmpty(groups = Insert.class)
    @Mobile
    private String            roleCode;
    
    
    @NotEmpty(groups = Insert.class)
    private String            roleName;
    
    @NotEmpty(groups = Update.class)
    private String            deptCode;
    @NotEmpty(groups = Update.class)
    private String            deptName;
    
    @NotNull
    private String            remark;
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public Integer getSex() {
        return sex;
    }
    
    public void setSex(Integer sex) {
        this.sex = sex;
    }
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    public String getDeptCode() {
        return deptCode;
    }
    
    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }
    
    public String getDeptName() {
        return deptName;
    }
    
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
    
    public String getRoleCode() {
        return roleCode;
    }
    
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }
    
    public String getRoleName() {
        return roleName;
    }
    
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
}

package com.hginfo.hbm.base.entity.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hvalidate.annotation.HValidFieldName;

/**
 */
@Entity(name = "FE_STUDENT")
@DynamicInsert
public class FeStudent extends BizEntity {

    private static final long serialVersionUID = 3493504520420466045L;
    
    
    private Long studentId;
    
    @NotNull
    @HValidFieldName("学生姓名")
    private String studentName;
    
    @Max(value = 1L)
    @Min(value = 1L)
    @HValidFieldName("性别")
    private Integer sex;
    
    
    private String remark;


    @Id
    @Column(name = "STUDENT_ID_")
    public Long getStudentId() {
        return studentId;
    }


    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    @Column(name = "STUDENT_NAME_")
    public String getStudentName() {
        return studentName;
    }


    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }


    @Column(name = "SEX_")
    public Integer getSex() {
        return sex;
    }


    public void setSex(Integer sex) {
        this.sex = sex;
    }


    @Column(name = "REMARK_")
    public String getRemark() {
        return remark;
    }


    public void setRemark(String remark) {
        this.remark = remark;
    }


    @Override
    @Transient
    public Long getId() {
        return getStudentId();
        
    }


    @Override
    public void setId(Long id) {
        setStudentId(id);
    }

}

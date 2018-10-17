package com.hginfo.hbm.base.entity.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hvalidate.annotation.HValidFieldName;

/**
 * 测试entity。
 * 
 */
@Entity(name = "FE_GROUP_STUDENT")
@DynamicInsert
public class FeGroupStudent extends RelEntity {
    
    private static final long serialVersionUID = -1470954850836137004L;

    private Long joinId;
    
    private Long studentId;
    
    @NotNull
    @HValidFieldName("用户组ID")
    private Long groupId;
    
    private FeStudent student;
    
    private FeGroup group;

    @Override
    @Transient
    public Long getId() {
        return getJoinId();
    }

    @Override
    public void setId(Long id) {
        setJoinId(id);
    }

    @Id
    @Column(name = "JOIN_ID_")
    public Long getJoinId() {
        return joinId;
    }

    public void setJoinId(Long joinId) {
        this.joinId = joinId;
    }

    @Column(name = "STUDENT_ID_")
    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    @Column(name = "GROUP_ID_")
    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    @Transient
    public FeStudent getStudent() {
        return student;
    }

    public void setStudent(FeStudent student) {
        this.student = student;
    }

    @Transient
    public FeGroup getGroup() {
        return group;
    }

    public void setGroup(FeGroup group) {
        this.group = group;
    }
}

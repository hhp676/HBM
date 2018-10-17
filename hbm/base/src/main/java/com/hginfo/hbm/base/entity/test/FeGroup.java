package com.hginfo.hbm.base.entity.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hvalidate.annotation.HValidFieldName;

/**
 * 测试entity。
 * 
 */
@Entity(name = "FE_GROUP")
@DynamicInsert
public class FeGroup extends BizEntity {

    private static final long serialVersionUID = 8924109592041260866L;
    
    private Long groupId;
    
    @NotNull
    @HValidFieldName("用户组名称")
    private String groupName;
    
    
    @Override
    @Transient
    public Long getId() {
        return getGroupId();
        
    }

    @Override
    public void setId(Long id) {
        setGroupId(id);
    }

    @Id
    @Column(name = "GROUP_ID_")
    public Long getGroupId() {
        return groupId;
    }

    
    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    @Column(name = "GROUP_NAME_")
    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    
}


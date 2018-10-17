package com.hginfo.hbm.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.hginfo.hbm.base.entity.sys.SysUser;

/**
 * 业务基础实体。<br/>
 * 主要作用：此实体中定义了持久化的通用字段，继承此类后，hibernate自动进行持久化的更新。<br/>
 * 如不需要此通用字段，可以直接继承{@link com.hginfo.hbm.base.BaseEntity} <br/>
 * date: 2016年10月19日 下午8:07:02 <br/>
 *
 * @author shichengqun
 */
@MappedSuperclass
public abstract class BizEntity extends SingleKeyBaseEntity {


    private static final long serialVersionUID = 923301444855806237L;

    /**
     * 是否删除。
     */
    private Integer isDelete;
    
    /**
     * 是否可修改。
     */
    private Integer isFinal;
    
    /**
     * 创建人Id。
     */
    private Long crtUserId;
    
    /**
     * 修改人Id。
     */
    private Long updUserId;
    
    /**
     * 创建时间。
     */
    private Date crtTime;
    
    /**
     * 创建人用户实体。
     */
    private SysUser crtUser;
    
    /**
     * 创建人用户实体。
     */
    private SysUser updUser;
    
    /**
     * 修改时间。
     */
    private Date updTime;
    
    @Column(name = "IS_DELETE_")
    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    @Column(name = "IS_FINAL_")
    public Integer getIsFinal() {
        return isFinal;
    }

    public void setIsFinal(Integer isFinal) {
        this.isFinal = isFinal;
    }

    @Column(name = "CRT_USER_ID_", updatable = false)
    public Long getCrtUserId() {
        return crtUserId;
    }

    public void setCrtUserId(Long crtUserId) {
        this.crtUserId = crtUserId;
    }

    @Column(name = "UPD_USER_ID_")
    public Long getUpdUserId() {
        return updUserId;
    }

    public void setUpdUserId(Long updUserId) {
        this.updUserId = updUserId;
    }

    @Column(name = "CRT_TIME_", updatable = false)
    public Date getCrtTime() {
        return crtTime;
    }

    public void setCrtTime(Date crtTime) {
        this.crtTime = crtTime;
    }

    @Column(name = "UPD_TIME_")
    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }
    
    @Transient
    public SysUser getCrtUser() {
        return crtUser;
    }

    public void setCrtUser(SysUser crtUser) {
        this.crtUser = crtUser;
    }

    @Transient
    public SysUser getUpdUser() {
        return updUser;
    }

    public void setUpdUser(SysUser updUser) {
        this.updUser = updUser;
    }

}

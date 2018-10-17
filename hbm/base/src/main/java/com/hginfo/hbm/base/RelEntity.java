package com.hginfo.hbm.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.hginfo.hbm.base.entity.sys.SysUser;

/**
 * 关联表对应实体基类<br />
 * 作用参见：{@link com.hginfo.hbm.base.BizEntity} <br />
 * Created by qiujingde on 2016/11/26.<br />
 *
 * @author qiujingde
 */
@MappedSuperclass
public abstract class RelEntity extends SingleKeyBaseEntity {
    private static final long serialVersionUID = 5445255121294422959L;

    /**
     * 创建人Id。
     */
    private Long crtUserId;

    /**
     * 创建时间。
     */
    private Date crtTime;

    /**
     * 是否可修改。
     */
    private Integer isFinal;
    
    /**
     * 创建人用户实体。
     */
    private SysUser crtUser;

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

    @Column(name = "CRT_TIME_", updatable = false)
    public Date getCrtTime() {
        return crtTime;
    }

    public void setCrtTime(Date crtTime) {
        this.crtTime = crtTime;
    }
    
    @Transient
    public SysUser getCrtUser() {
        return crtUser;
    }

    public void setCrtUser(SysUser crtUser) {
        this.crtUser = crtUser;
    }

}

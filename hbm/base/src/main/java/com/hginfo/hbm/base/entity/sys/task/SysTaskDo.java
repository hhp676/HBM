package com.hginfo.hbm.base.entity.sys.task;

import java.io.Serializable;
import java.util.List;

import com.hginfo.hbm.base.entity.sys.news.SysNews;
/**
 * 任务办理,数据封装类
 * ClassName: SysTaskDo. <br/>
 * @author yinyanzhen
 * @version 
 * @since V1.0.0
 */
public class SysTaskDo implements Serializable {
    /**
     */
    private static final long serialVersionUID = 3700340692423151135L;
    /**
     * 业务数据ID.
     */
    private Long businessId;
    
    /**
     * 办理人Id.
     */
    private Long userId;
    
    /**
     * 办理信息描述.
     */
    private String descr;
    
    /**
     * 业务所需通知.
     */
    private List<SysNews.UserNew> userNews;
    
    public Long getBusinessId() {
        return businessId;
    }
    
    public void setBusinessId(Long businessId) {
        this.businessId = businessId;
    }
    
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public String getDescr() {
        return descr;
    }
    
    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    public List<SysNews.UserNew> getUserNews() {
        return userNews;
    }
    
    public void setUserNews(List<SysNews.UserNew> userNews) {
        this.userNews = userNews;
    }
}

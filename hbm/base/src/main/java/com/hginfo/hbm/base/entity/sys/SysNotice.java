/*
 * Project Name:hbm-base.
 * File Name:SysNotice.java
 * Package Name:com.hginfo.hbm.base.entity.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.base.entity.sys;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import com.hginfo.hbm.annotation.HEntityId;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.entity.sys.news.SysNewsType;
import com.hginfo.hbm.base.meta.TableMeta;

/**
 * 通知公告: sys_notice. <br />
 * entity 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Entity(name = "SYS_NOTICE")
@DynamicInsert
public class SysNotice extends BizEntity {

    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表元数据。
     */
    static final TableMeta TABLE_META = new TableMeta();

    static {
        TABLE_META.setAlias("sn");
        TABLE_META.addField("noticeId", "NOTICE_ID_", Long.class);
        TABLE_META.addField("sortNo", "SORT_NO_", Long.class);
        TABLE_META.addField("startTime", "START_TIME_", Date.class);
        TABLE_META.addField("endTime", "END_TIME_", Date.class);
        TABLE_META.addField("autoPub", "AUTO_PUB_", Integer.class);
        TABLE_META.addField("newsTypeId", "NEWS_TYPE_ID_", Long.class);
        TABLE_META.addField("timerLv", "TIMER_LV_", Integer.class);
        TABLE_META.addField("importantLv", "IMPORTANT_LV_", Integer.class);
        TABLE_META.addField("title", "TITLE_", String.class);
        TABLE_META.addField("content", "CONTENT_", String.class);
        TABLE_META.addField("noticeStatus", "NOTICE_STATUS_", Integer.class);
        TABLE_META.addField("isDelete", "IS_DELETE_", Integer.class);
        TABLE_META.addField("isFinal", "IS_FINAL_", Integer.class);
        TABLE_META.addField("crtTime", "CRT_TIME_", Date.class);
        TABLE_META.addField("updTime", "UPD_TIME_", Date.class);
        TABLE_META.addField("crtUserId", "CRT_USER_ID_", Long.class);
        TABLE_META.addField("updUserId", "UPD_USER_ID_", Long.class);
    }

    /**
     * NOTICE_ID_ : 主键。
     */
    private Long noticeId;
    /**
     * SORT_NO_ : 排序。
     */
    private Long sortNo;
    /**
     * START_TIME_ : 开始时间。
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    /**
     * END_TIME_ : 结束时间。
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    /**
     * AUTO_PUB_ : 自动发布(0否,1是)。
     */
    private Integer autoPub;
    /**
     * NEWS_TYPE_ID_ : 发布渠道。
     */
    private Long newsTypeId;
    /**
     * TIMER_LV_ : 优先级(0低,1普通,2高,3紧急)。
     */
    private Integer timerLv;
    /**
     * IMPORTANT_LV_ : 重要性(0低,1一般,2重要,3致命)。
     */
    private Integer importantLv;
    /**
     * TITLE_ : 标题。
     */
    private String title;
    /**
     * CONTENT_ : 正文。
     */
    private String content;
    /**
     * NOTICE_STATUS_ : 通知公告状态(0:未发布,1:已发布)。
     */
    private Integer noticeStatus;
    /**
     * 通知方式。
     * @Transient
     */
    @HEntityId("newsTypeId")
    private SysNewsType sysNewsType;
    /**
     * 实体辅助属性类.
     */
    private Bo bo = new Bo();
    
    /**
     * 通知公告状态转换.
     * @return String
     */
    @Transient
    public String getNoticeStatusStr() {
        switch (this.noticeStatus) {
            case 0: return "未发布";
            case 1: return "已发布";
            default: return "";
        }
    }
    
    /**
     * ClassName: Bo. <br/>
     * date: 2017年7月7日 上午10:06:43 <br/>
     * @author yinyanzhen
     * @version SysNotice
     * @since V1.0.0
     */
    public class Bo implements Serializable {
        private static final long serialVersionUID = 1099575368710959508L;
        //标题模糊查询
        private String titleLike;
        //正文模糊查询
        private String contentLike;
        //查询开始时间
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private Date queryStartTime;
        //查询结束时间
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private Date queryEndTime;
        
        public String getTitleLike() {
            return titleLike;
        }
        public void setTitleLike(String titleLike) {
            this.titleLike = titleLike;
        }
        public String getContentLike() {
            return contentLike;
        }
        public void setContentLike(String contentLike) {
            this.contentLike = contentLike;
        }
        public Date getQueryStartTime() {
            return queryStartTime;
        }
        public void setQueryStartTime(Date queryStartTime) {
            this.queryStartTime = queryStartTime;
        }
        public Date getQueryEndTime() {
            return queryEndTime;
        }
        public void setQueryEndTime(Date queryEndTime) {
            this.queryEndTime = queryEndTime;
        }
    }

    @Override
    @Transient
    public Long getId() {
        return getNoticeId();
    }

    @Override
    public void setId(Long id) {
        setNoticeId(id);
    }

    @Id
    @Column(name = "NOTICE_ID_")
    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    @Column(name = "SORT_NO_")
    public Long getSortNo() {
        return sortNo;
    }

    public void setSortNo(Long sortNo) {
        this.sortNo = sortNo;
    }

    @Column(name = "START_TIME_")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Column(name = "END_TIME_")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Column(name = "AUTO_PUB_")
    public Integer getAutoPub() {
        return autoPub;
    }

    public void setAutoPub(Integer autoPub) {
        this.autoPub = autoPub;
    }
    
    @Column(name = "NEWS_TYPE_ID_")
    public Long getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(Long newsTypeId) {
        this.newsTypeId = newsTypeId;
    }

    @Column(name = "TIMER_LV_")
    public Integer getTimerLv() {
        return timerLv;
    }

    public void setTimerLv(Integer timerLv) {
        this.timerLv = timerLv;
    }

    @Column(name = "IMPORTANT_LV_")
    public Integer getImportantLv() {
        return importantLv;
    }

    public void setImportantLv(Integer importantLv) {
        this.importantLv = importantLv;
    }

    @Column(name = "TITLE_")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "CONTENT_")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "NOTICE_STATUS_")
    public Integer getNoticeStatus() {
        return noticeStatus;
    }

    public void setNoticeStatus(Integer noticeStatus) {
        this.noticeStatus = noticeStatus;
    }

    @Transient
    public SysNewsType getSysNewsType() {
        return sysNewsType;
    }

    public void setSysNewsType(SysNewsType sysNewsType) {
        this.sysNewsType = sysNewsType;
    }

    @Transient
    public Bo getBo() {
        return bo;
    }

    public void setBo(Bo bo) {
        this.bo = bo;
    }

    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}

/*
 * Project Name:hbm-be.
 * File Name:SysNewsServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys.news;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.news.SysNews;
import com.hginfo.hbm.base.entity.sys.news.SysNewsInner;
import com.hginfo.hbm.base.entity.sys.news.SysNewsOuter;
import com.hginfo.hbm.base.entity.sys.news.SysNewsTemplete;
import com.hginfo.hbm.base.service.sys.news.SysNewsService;
import com.hginfo.hbm.be.dao.sys.news.SysNewsDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 消息表: sys_news. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysNewsServiceImpl extends BizService<SysNews, SysNewsDao>
        implements SysNewsService {
    /**
     */
    @Autowired
    private SysNewsInnerServiceImpl newsInnerService;
    /**
     */
    @Autowired
    private SysNewsOuterServiceImpl newsOuterService;
    
    /**
     * saveSysNews:(保存消息配置信息). <br/>
     * @author yinyanzhen
     * @param newsTypeId newsTypeId
     * @param newsTempLeteId newsTempLeteId
     * @param newsFrom newsFrom
     * @param newsDoNode newsDoNode
     * @param bizId bizId
     * @param isInit isInit
     * @param isToAll isToAll
     * @return SysNews SysNews
     * @since V1.0.0
     */
    public SysNews saveSysNews(Long newsTypeId, Long newsTempLeteId, String newsFrom,
        Integer newsDoNode, Long bizId, Integer isInit, Integer isToAll) {
        SysNews sysNews = new SysNews();
        sysNews.setId(this.getDao().getIdentityid());
        sysNews.setNewsTypeId(newsTypeId);
        sysNews.setNewsTempleteId(newsTempLeteId);
        sysNews.setNewsFrom(newsFrom);
        sysNews.setNewsDoNode(newsDoNode);
        sysNews.setBizId(bizId);
        sysNews.setIsInit(isInit);
        sysNews.setIsToall(isToAll);
        //保存消息
        this.add(sysNews);
        return sysNews;
    }

    /**
     * saveNewsDetail:(保存消息具体信息). <br/>
     * @author yinyanzhen
     * @param isIn isIn
     * @param newsId newsId
     * @param sysUser sysUser
     * @param newsTemplete newsTemplete
     * @param title title
     * @param newsContent newsContent
     * @since V1.0.0
     */
    public void saveNewsDetail(Integer isIn, Long newsId, SysUser sysUser, SysNewsTemplete newsTemplete,
        String title, String newsContent) {
      //根据是否内部消息,内部消息,需要存SysNewsInner,外部消息存SysNewsOuter
        if (isIn == 1) {
            SysNewsInner newsInner = new SysNewsInner();
            newsInner.setNewsId(newsId);
            newsInner.setUserId(sysUser.getId());
            if (newsTemplete != null) {
                newsInner.setTimerLv(newsTemplete.getTimerLv());
                newsInner.setImportantLv(newsTemplete.getImportantLv());
            }
            newsInner.setNewsTitle(title);
            newsInner.setNewsContent(newsContent);
            //设置状态为待阅
            newsInner.setNewsStatus(0);
            newsInnerService.add(newsInner);
        } else {
            SysNewsOuter newsOuter = new SysNewsOuter();
            newsOuter.setNewsId(newsId);
            newsOuter.setUserId(sysUser.getUserId());
            newsOuter.setUserEmail(sysUser.getEmail());
            newsOuter.setUserMobile(sysUser.getMobile());
            if (newsTemplete != null) {
                newsOuter.setTimerLv(newsTemplete.getTimerLv());
                newsOuter.setImportantLv(newsTemplete.getImportantLv());
            }
            newsOuter.setNewsTitle(title);
            newsOuter.setNewsContent(newsContent);
            //设置发送次数以及发送状态
            newsOuter.setSendCount(0);
            newsOuter.setSendStatus(0);
            newsOuterService.add(newsOuter);
        }
    }

}

/*
 * Project Name:hbm-be.
 * File Name:SysNoticeServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysNotice;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.news.SysNews;
import com.hginfo.hbm.base.entity.sys.news.SysNewsTemplete;
import com.hginfo.hbm.base.service.sys.SysNoticeService;
import com.hginfo.hbm.be.dao.sys.SysNoticeDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.be.service.impl.sys.news.SysNewsServiceImpl;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 通知公告: sys_notice. <br />
 * service impl 层 <br />
 * Date: 2017年06月27日 下午6:54:47 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysNoticeServiceImpl extends BizService<SysNotice, SysNoticeDao>
        implements SysNoticeService {
    /**
     * 消息表记录消息来源.
     */
    private static final String NEWS_FROM = "sysNotice";
    /**
     */
    @Autowired
    private SysUserServiceImpl sysUserService;
    
    /**
     */
    @Autowired
    private SysNewsServiceImpl sysNewsService;
    
    @Override
    public SysNotice get(Long id) {
        return super.get(id);
    }
    
    @Override
    public void save(SysNotice entity, String saveType) {
        boolean isAdd = false;
        //主键不存在时,该数据为新增
        if (entity.getId() == null) {
            isAdd = true;
            entity.setId(this.getDao().getIdentityid());
        }
        entity.setNoticeStatus(0);
        if ("pub".equals(saveType)) {
            //需要发布时,进行消息发布
            pubSysNotice(entity);
            entity.setNoticeStatus(1);
        }
        if (isAdd) {
            super.add(entity);
        } else {
            super.update(entity);
        }
    }
    
    @Override
    public void delete(Long id) {
        SysNotice sysNotice = get(id);
        //删除公告时,已经发布的公告,需要删除对应的消息信息
        if (1 == sysNotice.getNoticeStatus()) {
            deleteSysNewsByNoticeId(id);
        }
        super.delete(id);
        
    }
    
    @Override
    public void doPub(Long id, String pubType) {
        SysNotice entity = this.get(id, "sysNewsType");
        if ("0".equals(pubType)) {
            entity.setNoticeStatus(0);
            //删除对应通知公告
            deleteSysNewsByNoticeId(id);
        } else {
            entity.setNoticeStatus(1);
            //消息发布
            pubSysNotice(entity);
        }
        //更新通知公告信息
        super.update(entity);
    }
    
    /**
     * pubSysNotice:(通知公告发布). <br/>
     * @author yinyanzhen
     * @param entity entity
     * @since V1.0.0
     */
    private void pubSysNotice(SysNotice entity) {
        SysUser sysUser = new SysUser();
        sysUser.setIsDelete(1);
        List<SysUser> userList = sysUserService.getAllList(sysUser);
        //保存消息主体
        SysNews sysNews = sysNewsService.saveSysNews(entity.getNewsTypeId(), null, 
            NEWS_FROM, null, entity.getId(), 1, 1);
        //new一个假的SysNewsTemplete,用于消息保存使用
        SysNewsTemplete sysNewsTemplete = new SysNewsTemplete();
        sysNewsTemplete.setTimerLv(entity.getTimerLv());
        sysNewsTemplete.setImportantLv(entity.getImportantLv());
        //保存消息明细
        for (SysUser user: userList) {
            sysNewsService.saveNewsDetail(entity.getSysNewsType().getIsIn(), 
                sysNews.getId(), user, sysNewsTemplete, entity.getTitle(), entity.getContent());
        }
    }
    
    /**
     * deleteSysNewsByNoticeId:(根据通知公告信息,删除对应的消息信息). <br/>
     * @author yinyanzhen
     * @param id id
     * @since V1.0.0
     */
    private void deleteSysNewsByNoticeId(Long id) {
        SysNews sysNewsFilter = new SysNews();
        sysNewsFilter.setBizId(id);
        sysNewsFilter.setIsDelete(0);
        //获取消息配置表
        SysNews news = sysNewsService.getOne(sysNewsFilter);
        news.setIsDelete(1);
        sysNewsService.update(news);
    }
}

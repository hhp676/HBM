/*
 * Project Name:hbm-base.
 * File Name:SysNoticeController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年06月27日 下午6:54:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysNotice;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysNoticeService;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.EncodeUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 通知公告Controller。 <br />
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysNotice")
public class SysNoticeController {
    /**
     */
    private static final Log LOG = LogFactory.getLog(SysNoticeController.class);

    /**
     * Service。
     */
    @HReference
    private SysNoticeService service;

    /**
     * 列表页面。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/sysNotice/sysNotice_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @param filter filter
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysNotice> list(BasePage<SysNotice> pageInfo, SysNotice filter) {
        filter.setCrtUserId(SessionUtils.getUserId());
        return new Page<>(service.getPageList(pageInfo, filter, "sysNewsType"));
    }
    
    /**
     * 跳转到明细页面.
     * @param noticeId noticeId
     * @param mode mode
     * @param request request
     * @return String String
     */
    @RequestMapping("/sysNoticeDetail")
    public String sysNoticeDetail(Long noticeId, String mode,  HttpServletRequest request) {
        SysNotice sysNotice = new SysNotice();
        if (noticeId != null && noticeId != 0L) {
            sysNotice = service.get(noticeId);
        }
        request.setAttribute("sysNotice", sysNotice);
        request.setAttribute("mode", mode);
        return "sys/sysNotice/sysNotice_detail";
    }
    
    /**
     * saveNotice:(保存或发布信息). <br/>
     * @author yinyanzhen
     * @param sysNotice sysNotice
     * @param saveType saveType
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/saveNotice")
    @ResponseBody
    public OperationResult saveNotice(@HValidated SysNotice sysNotice, String saveType) {
        if (!sysNotice.getStartTime().before(sysNotice.getEndTime())) {
            throw new BaseRuntimeException("通知公告的开始时间必须小于结束时间!");
        }
        //消息体到达后台以后,需要重新转换为html语言
        sysNotice.setContent(EncodeUtil.unescapeHtml4(sysNotice.getContent()));
        service.save(sysNotice, saveType);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * delNotice:(删除通知公告). <br/>
     * @author yinyanzhen
     * @param id id
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/delNotice")
    @ResponseBody
    public OperationResult delNotice(Long id) {
        service.delete(id);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * pubNotice:(发布or取消发布通知公告). <br/>
     * @author yinyanzhen
     * @param id id
     * @param pubType pubType
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/pubNotice")
    @ResponseBody
    public OperationResult pubNotice(Long id, String pubType) {
        service.doPub(id, pubType);
        return OperationResult.DEFAULT_SUCCESS;
    }
}

/**
 * Project Name:hbm-fe-easyui
 * File Name:LichengTestController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.test
 * Date:2016年12月1日下午2:32:07
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */

package com.hginfo.hbm.fe.eu.web.test;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.base.service.sys.SysOperationService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.base.vo.SysMenu;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.SpringContextUtil;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 个人测试。
 * ClassName:LichengTestController <br/>
 * Date: 2016年12月1日 下午2:32:07 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping(value = "/test/licheng")
public class LichengTestController {

    @HReference
    private SysModelService sysModelService;

    @HReference
    private SysOperationService sysOperationService;

    @HReference
    private SysAuthService sysAuthService;

    @HReference
    private SysUserService sysUserService;

    /**
     * 显示导入页面。
     * @author licheng
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping(value = "/importModelShow")
    @ResponseBody
    public void importModel(HttpServletRequest request, HttpServletResponse response) {
        ResponseUtil.renderHtml(response,
                "<form action='importModel' method='post'><textarea name='text'></textarea><button type='submit' >提交</button></form>",
                new String[]{});
    }

    /**
     * 导入初始菜单。
     * importModel:(这里用一句话描述这个方法的作用). <br/>
     * @author licheng
     * @param request request
     * @return json
     * @since V1.0.0
     */
    @RequestMapping(value = "/importModel")
    @ResponseBody
    public Map importModel(HttpServletRequest request) {

        String text = request.getParameter("text").trim();
        String[] lines = text.split("\\r?\\n");
        int order = 1;
        for (String line : lines) {
            String[] values = line.split(";");
            if (values.length <= 1) {
                continue;
            }
            SysModel sysModel = new SysModel();
            sysModel.setModelName(values[0]);
            sysModel.setModelType(Integer.parseInt(values[1]));
            sysModel.setModelName(values[0]);
            sysModel.setModelCode(values[2]);
            sysModel.setI18nCode(values[2]);
            if (values.length > Constants.THREE) {
                sysModel.setUri(values[Constants.THREE]);
            }
            order = order + 5;
            sysModel.setSortNo(order);
            sysModel.setStyle("");
            sysModel.setTenantId(1);
            sysModelService.add(sysModel);
        }

        return null;
    }

    @RequestMapping(value = "/importAuth")
    @ResponseBody
    public void importAuth(HttpServletRequest request) {
        SysModel query = new SysModel();
        query.setOrderStr("sm.SORT_NO_ asc");
        List<SysModel> modelList = sysModelService.getList(query);

        SysOperation querySysOperation = new SysOperation();
        querySysOperation.setOrderStr("so.SORT_NO_ asc");
        List<SysOperation> operationList = sysOperationService.getList(querySysOperation);
        int order = 1;
        for (SysModel sysModel : modelList) {
            for (SysOperation sysOperation : operationList) {
                SysAuth sysAuth = new SysAuth();
                sysAuth.setTenantId(1);
                sysAuth
                        .setAuthCode(sysModel.getModelCode() + ":" + sysOperation.getOperationCode());
                sysAuth
                        .setAuthName(sysModel.getModelName() + ":" + sysOperation.getOperationName());
                sysAuth.setEngName(sysModel.getModelCode() + ":" + sysOperation.getOperationCode());
                sysAuth
                        .setI18nCode(sysModel.getModelCode() + "." + sysOperation.getOperationCode());
                sysAuth.setModelId(sysModel.getModelId());
                sysAuth.setOperationId(sysOperation.getOperationId());
                sysAuth.setIsInheritable(1);
                sysAuth.setStyle("");
                sysAuth.setUri("");
                sysAuth.setSortNo(order++);
                sysAuth.setIsVisible(Constants.ONE);
                if (sysModel.getIsTopMenu() == DictConstants.TRUE
                        || (sysModel.getIsSubMenu() == DictConstants.TRUE
                        && sysModel.getModelCode().endsWith("Menu"))) {
                    if (sysOperation.getOperationCode().equals("view")) {
                        sysAuthService.createSysAuth(sysAuth);
                    }
                    continue;
                }
                sysAuth.setUri(sysModel.getUri() + sysOperation.getUri());
                sysAuthService.createSysAuth(sysAuth);
            }
        }
    }

    @RequestMapping(value = "/getTopMenuList")
    @ResponseBody
    public List<SysMenu> getTopMenuList(HttpServletRequest request) {
        return sysUserService.getTopMenuList(FrontEndType.easyui);
    }

    @RequestMapping(value = "/getFlatMenuList")
    @ResponseBody
    public List<SysMenu> getFlatMenuList(HttpServletRequest request) {
        return sysUserService.getFlatMenuList(FrontEndType.easyui);
    }

    @RequestMapping(value = "/getSubMenuList/{parentId}")
    @ResponseBody
    public SysMenu getSubMenuList(HttpServletRequest request, @PathVariable Long parentId) {
        return sysUserService.getSubMenuList(parentId, FrontEndType.easyui);
    }

    @RequestMapping(value = "/shiroCacheData")
    @ResponseBody
    public Object shiroCacheSize(HttpServletRequest request) {
        EhCacheManager ehCacheManager = SpringContextUtil.getBean("shiroCacheManager");
        Cache cache = ehCacheManager.getCache("shiro-activeSessionCache");

        Map map = new HashMap();
        for (Object key : cache.keys()) {
            map.put(key, cache.get(key));
        }
        return map;
    }
/*
    @RequestMapping(value = "/shiroCache")
    @ResponseBody
    public Object shiroCache(HttpServletRequest request) {
        EhCacheManager ehCacheManager = SpringContextUtil.getBean("shiroCacheManager");
        Cache cache = ehCacheManager.getCache("shiro-activeSessionCache");
        return cache;
    }

    @RequestMapping(value = "/showAllSession")
    @ResponseBody
    public void shiroCache(HttpServletRequest request, HttpServletResponse response) {
        Collection<Session> sessions = SessionUtils.getSessionDAO().getActiveSessions();
        for (Session session : sessions) {
            Object loginName = session
                    .getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
            if (loginName==null){
                ResponseUtil.renderText(response,"---"+"\r\n");
                continue;
            }
            ResponseUtil.renderText(response,loginName.toString()+"\r\n");
            ResponseUtil.renderText(response,session.getId().toString()+"\r\n");
        }
    }*/

}

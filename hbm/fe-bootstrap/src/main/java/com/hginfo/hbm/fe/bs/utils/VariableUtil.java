/**
 * Project Name:hbm-fe-bootstrap
 * File Name:VariableUtil.java
 * Package Name:com.hginfo.hbm.fe.bs.utils
 * Date:2017年3月21日下午6:13:28
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;

/**
 * 前端公功能变量类。
 * ClassName:VariableUtil <br/>
 * Date: 2017年3月21日 下午6:13:28 <br/>
 * @author licheng
 * @since V1.0.0
 */
public final class VariableUtil {
    
    /**
     * SysUserService.
     */
    @HReference
    private static SysUserService sysUserService;
    
    /**
     * sysAuthService.
     */
    @HReference
    private static SysAuthService sysAuthService;
    
    /**
     * 获取公共变量。
     * @author licheng
     * @param request request
     * @return map
     * @since V1.0.0
     */
    public static Map<String, Object> getCommVariables(HttpServletRequest request) {
        Map<String, Object> commVariables = new HashMap<>();
        commVariables.put("userName", SessionUtils.getUser().getUserName());
        commVariables.put("loginName", SessionUtils.getLoginName());
        //TODO 岗位列表
        
        //加载主菜单
        commVariables.put("topMenus", getSysUserService().getTopMenuList(FrontEndType.bootstrap));
        String uri = String.valueOf(request.getAttribute(Constants.INITIAL_REQUEST_URI));
        if (!StringUtil.isEmpty(request.getContextPath())) {
            uri = uri.substring(request.getContextPath().length());
        }
        
        //加载导航
        List<SysModel> navList = getSysAuthService().getMenuNavigationList(uri);
        List<Long> navIdList = new ArrayList<>();
        navIdList.add(DictConstants.DEFAULT_LEFT_MODEL_FID);
        if (navList != null && !navList.isEmpty()) {
            navIdList = navList.stream().map(SysModel::getModelId).collect(Collectors.toList());
            commVariables.put("title", navList.get(navList.size() - 1).getModelName());
        }
        commVariables.put("navList", navList);
        commVariables.put("navIdList", navIdList);
        
        //加载子菜单
        Long parentId = (navList == null || navList.size() < 2)
            ? DictConstants.DEFAULT_LEFT_MODEL_FID
            : navList.get(1).getModelId();
        commVariables.put("subMenus",
            getSysUserService().getSubMenuTree(parentId, FrontEndType.bootstrap));
        
        return commVariables;
    }
    
    /**
     * 获取sysDauthUsageService。
     * @return sysDauthUsageService
     */
    public static SysUserService getSysUserService() {
        if (sysUserService == null) {
            sysUserService = SpringContextUtil.getBean(SysUserService.class);
        }
        return sysUserService;
    }
    
    /**
     * 获取sysDauthUsageService。
     * @return sysDauthUsageService
     */
    public static SysAuthService getSysAuthService() {
        if (sysAuthService == null) {
            sysAuthService = SpringContextUtil.getBean(SysAuthService.class);
        }
        return sysAuthService;
    }
    
    /**
     * 构造函数。
     */
    private VariableUtil() {
        
    }
    
}

/**
 * Project Name:hbm-fe-easyui
 * File Name:SysCommonController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年3月8日上午10:13:12
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.eu.web.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.service.sys.SysIconService;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.base.vo.SysMenu;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.StringUtil;

/**
 * sys模块公共访问Controller层：只效验是否有登录权限，不效验系统配置的访问控制权限。
 * ClassName:SysCommonController <br/>
 * Date: 2017年3月8日 上午10:13:12 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/common")
public class SysCommonController {
    
    private static Log log  = LogFactory.getLog(SysCommonController.class);
    
    /**
     * 
     */
    @HReference
    private SysUserService   sysUserService;
    
    /**
     * 
     */
    @HReference
    private SysDictService   dictService;
    
    /**
     * 
     */
    @HReference
    private SysIconService   iconService;
    @HReference
    private SysConfigService sysConfigService;
    @HReference
    private SysModelService  sysModelService;
    
    /**
     * 首页左侧导航。
     * @param parentMenuId parentMenuId
     * @param request request
     * @param response response
     * @param model model
     * @return page
     */
    @RequestMapping(value = "/indexLeftNavi/{parentMenuId}")
    public String indexLeftNavi(@PathVariable Long parentMenuId, HttpServletRequest request,
        HttpServletResponse response, Model model) {
        //菜单父节点指向到用户没有权限的菜单时,需要进行异常处理
        List<SysMenu> modelList;
        try {
            modelList = sysUserService.getSubMenuList(parentMenuId, FrontEndType.easyui)
                .getSubMenuList();
        } catch (Exception e) {
            modelList = new ArrayList<>();
        }
        model.addAttribute("modelList", modelList);
        return "page/index_leftnavi";
    }
    
    /**
     * 首页主面板。
     * @param fId fId
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/indexCenter/{fId}")
    public String indexCenter(@PathVariable Integer fId, final Model model) {
        model.addAttribute("fId", fId);
        getLeftMenuInfo(model);
        
        if (fId.intValue() == Constants.ONE) {
            return "page/index_center";
        } else if (fId.intValue() == Constants.TWO) {
            return "page/index_center2";
        } else if (fId.intValue() == Constants.THREE) {
            return "page/index_center3";
        }
        return "page/index_center";
        
    }
    
    /**
     * getLeftMenuInfo:(配置初始化左侧菜单). <br/>
     * @author yinyanzhen
     * @param model model
     * @since V1.0.0
     */
    private void getLeftMenuInfo(final Model model) {
        //获取左侧菜单配置
        String leftMenuCode = sysConfigService.getProperty(SysAuthConstants.SYS_DEFULT_LEFTMENU_KEY);
        if (StringUtil.isBlank(leftMenuCode)) {
            leftMenuCode = SysAuthConstants.MODEL_CODE_PERSONAL;
        }
        SysModel sysModel = new SysModel();
        sysModel.setModelCode(leftMenuCode);
        List<SysModel> modelList = sysModelService.getList(sysModel, "sysIcon");
        if (modelList.size() == 1) {
            sysModel = modelList.get(0);
            //默认左侧菜单,不存在子级菜单时,使用个人中心作为左侧菜单
            List menuList = null;
            try {
                menuList = sysUserService.getSubMenuList(sysModel.getModelId(), FrontEndType.easyui).getSubMenuList();
            } catch (Exception e) {
                log.error("获取系统设置中默认菜单错误：", e);
            }
            if (menuList == null || menuList.size() < 1) {
                sysModel = new SysModel();
                sysModel.setModelCode(SysAuthConstants.MODEL_CODE_PERSONAL);
                sysModel = sysModelService.getList(sysModel, "sysIcon").get(0);
            }
            model.addAttribute("modelID", sysModel.getModelId());
            model.addAttribute("title", sysModel.getModelName());
            model.addAttribute("iconCls", sysModel.getStyle());
        }
    }
    
    /**
     * 首页主面板内容区。
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/indexHome")
    public String home() {
        return "page/index_home";
    }
    
    /**
     * 判断是否有authCode权限。
     * @param authCode 
     * @return true/false
     */
    @RequestMapping(value = "/hasAuth/{authCode}")
    @ResponseBody
    public Map<String, Boolean> createSysModel(@PathVariable String authCode) {
        Map<String, Boolean> result = new HashMap<>();
        result.put("hasAuth", SessionUtils.hasPermission(authCode));
        return result;
    }
    
    /**
     * 获取字典项列表。
     * @param groupCode      字典组code
     * @return 字典项列表
     */
    @RequestMapping(value = "/sysDict/itemList/{groupCode}")
    @ResponseBody
    public List<SysDictItem> itemList(@PathVariable String groupCode) {
        return dictService.getItemList(groupCode);
    }
    
    /**
     * 生成动态css样式。
     * @param request 请求参数
     * @param response 响应对象
     * @param model 数据传递
     */
    @RequestMapping(value = "/sysIcon/iconDynamicCss")
    @ResponseBody
    public void iconDynamicCss(HttpServletRequest request, HttpServletResponse response,
        final Model model) {
        String ctx = request.getContextPath();
        String contentType = "";
        List<SysIcon> sysIconList = iconService.getIconList(null);
        for (SysIcon sysIcon : sysIconList) {
            String iconDynamicCss = "." + sysIcon.getIconCss() + " {" + "background:url('" + ctx
                + sysIcon.getImagePath() + "') no-repeat center center;" + "}" + "\n";
            contentType += iconDynamicCss;
        }
        ResponseUtil.render(response, "text/css", contentType, new String[] {});
    }
    
}

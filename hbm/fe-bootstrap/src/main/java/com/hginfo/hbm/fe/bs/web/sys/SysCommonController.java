/**
 * Project Name:hbm-fe-bootstrap
 * File Name:SysCommonController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年3月8日上午10:13:12
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.web.sys;

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

import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.service.sys.SysIconService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.ResponseUtil;

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
    
    /**
     * 
     */
    @HReference
    private SysUserService sysUserService;
    
    /**
     * 
     */
    @HReference
    private SysDictService dictService;
    
    /**
     * 
     */
    @HReference
    private SysIconService iconService;
    
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
        model.addAttribute("comm_subMenus",
            sysUserService.getSubMenuTree(parentMenuId, FrontEndType.bootstrap));
        return "common/leftMenu";
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

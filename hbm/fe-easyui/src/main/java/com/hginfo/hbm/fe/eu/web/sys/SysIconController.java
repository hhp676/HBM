/*
 * Project Name:hbm-fe-easyui.
 * File Name:SysIconController.java
 * Package Name:com.hginfo.hbm.fe.eu.web
 * Date:2016年12月20日 上午10:03:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysIconService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.FileUtil;
import com.hginfo.hutils.PathUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 图标管理Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月20日 上午10:03:54 <br />
 *
 * @author zhangdianbo
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysIcon")
public class SysIconController {

    
    /**
     *
     */
    private static final OperationResult DEFAULT_SUCCESS_RESULT = new OperationResult();

    /**
     * 图标管理Service。
     */
    private SysIconService iconService;

    /**
     * 图标管理管理菜单。
     * @return sys_icon viewId
     */
    @RequestMapping(value = "/view")
    public String showSysIcon() {
        return "sys/icon/sysIcon_view";
    }
    
    /**
     * 通用的选择图标页面。
     * @param model 数据传递
     * @return sys_icon viewId
     */
    @RequestMapping(value = "/chooseIconView")
    public String chooseIconView(final Model model) {
        model.addAttribute("sysIconList", iconService.getIconList(null));
        return "sys/icon/sysIconChoose_view";
    }
    /**
     * 图标管理分页数据。
     * @param pageInfo 分页信息
     * @return 图标管理分页数据
     */
    @RequestMapping(value = "/iconList")
    @ResponseBody
    public Page<SysIcon> iconList(BasePage<SysIcon> pageInfo) {
        SysIcon filter = new SysIcon();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(iconService.getIconList(pageInfo, filter));
    }
    
    /**
     * 新增图标管理数据。
     * @param icon icon
     * @return 操作结果
     */
    @RequestMapping(value = "/addIcon")
    @ResponseBody
    @UserLog(code = "addIcon", name = "新增图标", engName = "addIcon")
    public OperationResult addIcon(@HValidated SysIcon icon) {
        String filePath = PathUtil.getWebAppPath() + icon.getImagePath().substring(1, icon.getImagePath().length());
        File file = new File(filePath);
        if (!file.exists() || !file.isFile()) {
            throw new BaseRuntimeException("图片路径对应文件不存在!");
        }
        iconService.createIcon(icon);
        return DEFAULT_SUCCESS_RESULT;
    }
    /**
     * 修改图标管理数据。
     * @param icon icon
     * @return 操作结果
     */
    @RequestMapping(value = "/updIcon")
    @ResponseBody
    @UserLog(code = "updateIcon", name = "修改图标", engName = "updateIcon")
    public OperationResult updateIcon(@HValidated SysIcon icon) {
        String filePath = PathUtil.getWebAppPath() + icon.getImagePath().substring(1, icon.getImagePath().length());
        File file = new File(filePath);
        if (!file.exists() || !file.isFile()) {
            throw new BaseRuntimeException("图片路径对应文件不存在!");
        }
        iconService.editIcon(icon);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个图标管理数据。
     * @param iconId iconId
     * @return 操作结果
     */
    @RequestMapping(value = "/delIcon")
    @ResponseBody
    @UserLog(code = "deleteIcon", name = "删除图标", engName = "deleteIcon")
    public OperationResult deleteIcon(long iconId) {
        iconService.deleteIcon(iconId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    
    
    /**
     * 重新生成基础数据。
     * @param request 请求参数
     * @param response 响应对象
     * @return  操作结果
     */
    @RequestMapping(value = "/Reconfiguration")
    @ResponseBody
    @UserLog(code = "reconfiguration", name = "一键配置图标", engName = "reconfiguration")
    public OperationResult reconfiguration(HttpServletRequest request, HttpServletResponse response) {
        List<SysIcon> sysIconList = iconService.getIconList(null);
        for (SysIcon sysIcon : sysIconList) {
            iconService.deleteIconPhysical(sysIcon.getIconId());
        }
        String path = request.getSession().getServletContext().getRealPath(""); 
        path += "/static/images/icons";
        ArrayList<String> listFileName = new ArrayList<String>(); 
        String subfolder = "";
        getFileName(path, listFileName, subfolder);
        int i = 1;
        for (String name : listFileName)
        {   
            SysIcon icon = new SysIcon();
            icon.setIconType(1 + "");
            icon.setSkinCode(i + "");
            int leng = name.indexOf(".");
            String iconCss = name.substring(0, leng);
            icon.setIconCss("icon_auto_" + iconCss);
            icon.setImagePath("/static/images/icons/" + name.replace("__", "/"));
            icon.setSortNo(i);
            icon.setIsFinal(1);
            iconService.createIcon(icon);
            i++;
        }
        return DEFAULT_SUCCESS_RESULT;
    }

    @HReference
    public void setIconService(SysIconService iconService) {
        this.iconService = iconService;
    }
    
    /**
     * 返回path路径下的文件一键生成图标数据使用。
     * @param path path
     * @param fileName 
     * @param subfolder 
     */
    public static void getFileName(String path, ArrayList<String> fileName, String subfolder)
    {
        File file = new File(path);
        File[] files = file.listFiles();
        if (subfolder != "") {
            subfolder += "__";
        }
        for (File a:files) {
            if (!a.isDirectory()) {
                fileName.add(subfolder + a.getName());
            }
        }
        for (File a:files) {
            if (a.isDirectory()) {
                getFileName(a.getAbsolutePath(), fileName, subfolder + a.getName());
            }
        }
    }

}

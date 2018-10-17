/**
 * Project Name:hbm-fe-easyui
 * File Name:SysRoleController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月24日上午11:53:47
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.web.sys;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysRoleService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.exception.ExceptionUtil;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 角色。
 * ClassName:SysRoleController <br/>
 * Date: 2016年12月24日 上午11:53:47 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping(value = "/sys/sysRole")
public class SysRoleController {
    
    /**
     * Service.
     */
    @HReference
    private SysRoleService sysRoleService;
    
    /**
     * 
     */
    @HReference
    private SysAuthService sysAuthService;
    
    /**
     * view.
     * @author licheng
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/role/sysRole_view";
    }
    
    /**
     * about.
     * @author licheng
     * @param sysRole sysRole
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/aboutOne")
    public String aboutOne(SysRole sysRole, Model model) {
        model.addAttribute("biz", sysRoleService.get(sysRole.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 分页数据。
     * @param pageInfo 分页信息
     * @param formFilter 表单过滤条件
     * @return 字典组分页数据
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysRole> list(BasePage<SysRole> pageInfo, SysRole formFilter) {
        SysRole filter = new SysRole();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysRoleService.getPageList(pageInfo, filter));
    }
    
    /**
     * create.
     * @author licheng
     * @param sysRole sysRole
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    @UserLog(code = "createRole", name = "新增角色", engName = "createRole")
    public OperationResult create(@HValidated SysRole sysRole) {
        sysRoleService.add(sysRole);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * create.
     * @author licheng
     * @param sysRole sysRole
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateRole", name = "修改角色", engName = "updateRole")
    public OperationResult update(@HValidated SysRole sysRole) {
        sysRoleService.update(sysRole);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * create.
     * @author licheng
     * @param sysRole sysRole
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteRole", name = "删除角色", engName = "deleteRole")
    public OperationResult delete(SysRole sysRole) {
        sysRoleService.delete(sysRole.getRoleId());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * view.
     * @author licheng
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysRoleAuthView")
    public String sysRoleAuthView() {
        return "sys/role/sysRoleAuth_view";
    }
    
    /**
     * 获取角色权限列表。
     * @author licheng
     * @param sysRole sysRole
     * @return map
     * @since V1.0.0
     */
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/authList")
    @ResponseBody
    public Map authList(SysRole sysRole) {
        return sysAuthService.getAuthManageDialogList();
    }
    
    /**
     * 根据权限ID查询角色列表。
     * @param pageInfo 分页信息
     * @param formFilter 表单过滤条件
     * @return Page<SysRole> 
     */
    @RequestMapping(value = "/pageListByAuthId")
    @ResponseBody
    public Page<SysRole> pageListByAuthId(BasePage<SysRole> pageInfo, SysRoleAuth formFilter) {
        return new Page<>(sysRoleService.getPageListByAuthId(pageInfo, formFilter));
    }
    
    /**
     * 
     * 弹窗选择角色列表展示页面. <br/>
     *
     * @author yuqing
     * @param  request request
     * @return 选择角色列表展示页面 
     * @since V1.0.0
     */
    @RequestMapping("winView")
    public String winView(HttpServletRequest request) {
        String selectMode = request.getParameter("_selectMode");
        boolean singleSelect = true;
        if (Constants.SELECT_MODE_MULTIPLE.equals(selectMode)) {
            singleSelect = false;
        }
        request.setAttribute("singleSelect", singleSelect);
        return "sys/role/sysRole_winView";
    }
    
    /**
     * 弹窗选择用户列表数据。
     * @param pageInfo 分页数据。
     * @param filter 过滤条件
     * @return 分页结果。
     */
    @RequestMapping("winList")
    @ResponseBody
    public Page<SysRole> winList(BasePage<SysRole> pageInfo, SysRole filter) {
        
        pageInfo.parseSortRule(filter);
        pageInfo.parseFilterRules(filter);
        
        return new Page<>(sysRoleService.getPageList(pageInfo, filter));
    }
    
    /**
     * 获取列表。
     * @param filter filter
     * @return data
     */
    @RequestMapping("getList")
    @ResponseBody
    public List<SysRole> getList(SysRole filter) {
        return sysRoleService.getList(filter);
    }
    
}

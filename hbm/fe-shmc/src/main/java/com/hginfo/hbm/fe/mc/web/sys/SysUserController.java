/**
 * Project Name:hbm-fe-easyui
 * File Name:SysUserController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月2日下午7:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.mc.web.sys;

import static com.hginfo.hbm.fe.mc.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysGroupUserService;
import com.hginfo.hbm.base.service.sys.SysPositionService;
import com.hginfo.hbm.base.service.sys.SysRoleService;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hbm.base.service.sys.SysUserRoleService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.base.vo.SysMenu;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * SysUserController.
 * ClassName:SysUserController <br/>
 * Date: 2016年12月2日 下午7:25:54 <br/>
 * @author yuyanlin
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysUser")
public class SysUserController {
    
    /**
     * 
     */
    @HReference
    private SysUserService         sysUserService;
    
    /**
     * 
     */
    @HReference
    private SysPositionService     sysPositionService;
    
    /**
     * 
     */
    @HReference
    private SysUserPositionService sysUserPositionService;
    
    /**
     * 
     */
    @HReference
    private SysGroupUserService    sysGroupUserService;
    
    /**
     * 
     */
    @HReference
    private SysRoleService         sysRoleService;
    
    /**
     * 
     */
    @HReference
    private SysUserRoleService     sysUserRoleService;
    
    /**
     * 
     */
    @HReference
    private SysUserLogService      sysUserLogService;
    
    /**
     * 获取左侧菜单列表。
     * @author licheng
     * @param request request
     * @param parentId 父ID
     * @return 返回数据
     * @since V1.0.0
     */
    @RequestMapping(value = "/getSubMenuList/{parentId}")
    @ResponseBody
    public SysMenu getSubMenuList(HttpServletRequest request, @PathVariable Long parentId) {
        return sysUserService.getSubMenuList(parentId, FrontEndType.easyui);
    }
    
    /**
     * showSysUser.
     * @author licheng
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/view")
    public String showSysUser() {
        return "sys/user/sysUser_view";
    }
    
    /**
     * showSysUserDetail.
     * @author yuyanlin
     * @param userId userId
     * @param mode add:新增  edit:修改  view:详情
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/detail/view/{mode}/{userId}")
    public String showSysUserDetail(@PathVariable Long userId, @PathVariable String mode,
        Model model) {
        SysUser user = sysUserService.getUserById(userId);
        String roleIds = sysUserRoleService.getRoleIdStrByUserId(userId);
        String positionIds = sysUserPositionService.getPositionIdStrByUserId(userId);
        String groupIds = sysGroupUserService.getGroupIdsByUserId(userId);
        model.addAttribute("user", user);
        model.addAttribute("roleIds", roleIds);
        model.addAttribute("positionIds", positionIds);
        model.addAttribute("groupIds", groupIds);
        model.addAttribute("mode", mode);
        return "sys/user/sysUser_detail";
    }
    
    /**
     * 弹窗选择用户列表展示页面。
     * @param request request
     * @return viewId
     */
    @RequestMapping("winView")
    public String winView(HttpServletRequest request) {
        String selectMode = request.getParameter("_selectMode");
        boolean singleSelect = true;
        if (Constants.SELECT_MODE_MULTIPLE.equals(selectMode)) {
            singleSelect = false;
        }
        request.setAttribute("singleSelect", singleSelect);
        return "sys/user/sysUser_winView";
    }
    
    /**
     * 弹窗选择用户列表数据。
     * @param pageInfo 分页数据。
     * @param filter 过滤条件
     * @return 分页结果。
     */
    @RequestMapping("winList")
    @ResponseBody
    public Page<SysUser> winList(BasePage<SysUser> pageInfo, SysUser filter) {
        pageInfo.parseSortRule(filter);
        return new Page<>(
            sysUserService.getWinPageList(pageInfo, filter, "userPosition.sysOrganization"));
    }
    
    /**
     * 分页数据。
     * @param pageInfo 分页信息
     * @param formFilter 表单过滤条件
     * @return 用户分页数据
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysUser> list(BasePage<SysUser> pageInfo, SysUser formFilter) {
        formFilter.setIsDelete(0);
        return new Page<>(sysUserService.getPageList(pageInfo, formFilter, "userAccount",
            "userPosition.sysOrganization", "userPosition.sysJob", "staffInfo"));
    }
    
    /**
     * 根据权限ID查询角色列表。
     * @param pageInfo 分页信息 
     * @param formFilter 表单过滤条件 
     * @return Page<SysRole>  
     */
    @RequestMapping(value = "/pageListByAuthId")
    @ResponseBody
    public Page<SysUser> pageListByAuthId(BasePage<SysUser> pageInfo, SysUserAuth formFilter) {
        return new Page<>(sysUserService.getPageListByAuthId(pageInfo, formFilter));
    }
    
    /**
     * getUserById.
     * @author licheng
     * @param request request
     * @param userId userId
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/getUserById/{userId}")
    @ResponseBody
    public OperationResult getUserById(HttpServletRequest request, @PathVariable Long userId) {
        OperationResult result = new OperationResult();
        SysUser sysUser = sysUserService.get(userId);
        if (null != sysUser) {
            result.setData(JSON.toJSONString(sysUser));
            result.setSuccess(true);
        } else {
            result.setData("用户不存在！");
            result.setSuccess(false);
        }
        return result;
    }
    
    /**
     * 新增用户。
     * @param user user
     * @return 操作结果
     */
    @RequestMapping(value = "/addUser")
    @ResponseBody
    @UserLog(code = "addUser", name = "新增用户", engName = "addUser")
    public OperationResult addUser(@HValidated SysUser user) {
        sysUserService.createUser(user);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 修改用户。
     * @param user user
     * @return 操作结果
     */
    @RequestMapping(value = "/updUser")
    @ResponseBody
    @UserLog(code = "updateUser", name = "更新用户", engName = "updateUser")
    public OperationResult updateUser(@HValidated SysUser user) {
        sysUserService.editUser(user);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 删除一个用户。
     * @param userId userId
     * @return 操作结果
     */
    @RequestMapping(value = "/delUser")
    @ResponseBody
    @UserLog(code = "deleteUser", name = "删除用户", engName = "deleteUser")
    public OperationResult deleteUser(long userId) {
        sysUserService.delete(userId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * ==============
     * 用户日志。
     * ==============
     */
    
    /**
     * user log.
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabLogView")
    public String sysUserTabLogView(SysUserLog filter, Model model) {
        model.addAttribute("filter", filter);
        return "sys/user/sysUserTabLog_view";
    }
    
    /**
     * 查看用户角色-数据。
     * @author licheng
     * @param pageInfo pageInfo
     * @param formFilter formFilter
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabLogList")
    @ResponseBody
    public Page<SysUserLog> logList(BasePage<SysUserLog> pageInfo, SysUserLog formFilter) {
        pageInfo.parseFilterRules(formFilter);
        pageInfo.parseSortRule(formFilter);
        return new Page<>(sysUserLogService.getPageList(pageInfo, formFilter));
    }
    
    /**
     * ==============
     * 用户岗位。
     * ==============
     */
    
    /**
     * 查看用户岗位-页面。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabPosView")
    public String sysUserTabPosView(SysUserPosition filter, Model model) {
        model.addAttribute("filter", filter);
        model.addAttribute("editable", true);
        return "sys/user/sysUserTabPos_view";
    }
    
    /**
     * 查看用户岗位-数据。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabPosList")
    @ResponseBody
    public List<SysUserPosition> sysUserTabPosList(SysUserPosition filter, Model model) {
        filter.setOrderStr("isMajor DESC");
        List<SysUserPosition> positionList = sysUserPositionService.getList(filter, "sysPosition");
        return positionList;
    }
    
    /**
     * ==============
     * 用户小组。
     * ==============
     */
    
    /**
     * 查看用户小组-页面。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabGroupView")
    public String sysUserTabGroupView(SysGroupUser filter, Model model) {
        model.addAttribute("filter", filter);
        model.addAttribute("editable", true);
        return "sys/user/sysUserTabGroup_view";
    }
    
    /**
     * 查看用户小组-数据。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabGroupList")
    @ResponseBody
    public List<SysGroupUser> sysUserTabGroupList(SysGroupUser filter, Model model) {
        List<SysGroupUser> positionList = sysGroupUserService.getList(filter);
        return positionList;
    }
    
    /**
     * ==============
     * 用户角色。
     * ==============
     */
    
    /**
     * 查看用户角色-页面。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabRoleView")
    public String sysUserTabRoleView(SysUserRole filter, Model model) {
        model.addAttribute("filter", filter);
        model.addAttribute("editable", true);
        return "sys/user/sysUserTabRole_view";
    }
    
    /**
     * 查看用户角色-数据。
     * @author licheng
     * @param pageInfo pageInfo
     * @param formFilter formFilter
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabRoleList")
    @ResponseBody
    public Page<SysRole> sysUserTabRoleList(BasePage<SysRole> pageInfo, SysUserRole formFilter) {
        return new Page<>(sysRoleService.getPageListByUserId(pageInfo, formFilter));
    }
    
    /**
     * ==============
     * 用户权限。
     * ==============
     */
    
    /**
     * 查看用户权限-页面。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabAuthView")
    public String sysUserTabAuthView(SysGroupUser filter, Model model) {
        model.addAttribute("filter", filter);
        model.addAttribute("editable", true);
        return "sys/user/sysUserTabAuth_view";
    }
    
    /**
     * 查看用户负权限-页面。
     * @author licheng
     * @param filter filter
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/sysUserTabNAuthView")
    public String sysUserTabNAuthView(SysGroupUser filter, Model model) {
        model.addAttribute("filter", filter);
        model.addAttribute("editable", true);
        return "sys/user/sysUserTabNAuth_view";
    }
    
    /**
     * 改密页面。
     * @author yuyanlin
     * @param userId userId
     * @param model model
     * @return page
     */
    @RequestMapping(value = "/sysUserChangePwdView/{userId}")
    public String sysUserChangePwdView(@PathVariable Long userId, Model model) {
        model.addAttribute("userId", userId);
        return "sys/user/sysUser_changePwd";
    }
    
    /**
     * 改密。
     * @param userId userId
     * @param newPwd newPwd
     * @return result
     */
    @RequestMapping(value = "/updUserPwd")
    @ResponseBody
    @UserLog(code = "updUserPwd", name = "用户管理修改密码", engName = "updUserPwd")
    public OperationResult updUserPwd(Long userId, String newPwd) {
        sysUserService.updateUserPwd(userId, newPwd);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * about.
     * @author yuyanlin
     * @param sysUser user
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/aboutOne")
    public String aboutOne(SysUser sysUser, Model model) {
        model.addAttribute("biz", sysUserService.get(sysUser.getUserId()));
        return "/sys/biz_about";
    }
    
}

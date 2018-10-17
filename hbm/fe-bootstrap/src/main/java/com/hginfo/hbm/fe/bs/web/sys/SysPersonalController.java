/**
 * Project Name:hbm-fe-bootstrap
 * File Name:SysPersonalController.java
 * Package Name:com.hginfo.hbm.fe.bs.web.sys
 * Date:2017年1月5日上午10:55:17
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.bs.web.sys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.entity.sys.SysUserProfile;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysGroupUserService;
import com.hginfo.hbm.base.service.sys.SysPersonalService;
import com.hginfo.hbm.base.service.sys.SysRoleService;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hbm.base.service.sys.SysUserProfileService;
import com.hginfo.hbm.fe.bs.web.base.BaseController;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;
import static com.hginfo.hbm.fe.bs.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import java.util.List;
import java.util.Map;

/**
 * SysPersonalController.
 * ClassName:SysPersonalController <br/>
 * Date: 2017年1月5日 上午10:55:17 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysPersonal")
public class SysPersonalController extends BaseController {
    
    /**
     * 
     */
    @HReference
    private SysPersonalService sysPersonalService;
    
    @HReference
    private SysUserProfileService sysUserProfileService;
    
    @HReference
    private SysUserLogService sysUserLogService;
    
    @HReference
    private SysRoleService sysRoleService;
    
    @HReference
    private SysAuthService sysAuthService;
    
    @HReference
    private SysUserPositionService sysUserPositionService;
    
    @HReference
    private SysGroupUserService sysGroupUserService;
    
    /**
     * 个人信息展示页。
     * @author licheng
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/personal/view")
    public String showPersonal(HttpServletRequest request, HttpServletResponse response,
        Model model) {
        SysUser loginUser = sysPersonalService.getLoginUserInfo();
        SysStaffInfo staffInfo = sysPersonalService.getLoginUserStaffInfo();
        model.addAttribute("user", loginUser);
        model.addAttribute("staff", staffInfo);
        return "sys/personal/personal_view";
    }
    
    
    
    /**
     * 修改密码-展示。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/modifyPwd/view")
    public String showModifyPwd(HttpServletRequest request, HttpServletResponse response,
        Model model) {
        return "sys/personal/modifyPwd_view";
    }
    
    
    /**
     * 修改密码-操作。
     * @param oldPwd oldPwd
     * @param newPwd newPwd
     * @return OperationResult
     * @throws BaseException exception
     * @since V1.0.0
     */
    @RequestMapping(value = "/modifyPwd/update")
    @ResponseBody
    @UserLog(code = "modifyPwd", name = "修改密码", engName = "modifyPwd")
    public OperationResult modifyPwd(String oldPwd, String newPwd) {
        sysPersonalService.updatePwd(oldPwd, newPwd);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    
    /**
     * 更新用户信息。
     * @param sysUser sysUser
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/updBasicInfo")
    @ResponseBody
    @UserLog(code = "updBasicInfo", name = "更新用户基本信息", engName = "updBasicInfo")
    public OperationResult updBasicInfo(@HValidated SysUser sysUser) {
        sysPersonalService.editLoginUser(sysUser);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * ============
     * 我的日志
     * ============
     */
    /**
     * 我的日志-展示。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/logView")
    public String logView(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "sys/personal/sysPersonalTabLog_view";
    }
    
    /**
     * 我的日志-数据。
     * @param pageInfo pageInfo
     * @param formFilter formFilter
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/logList")
    @ResponseBody
    public Page<SysUserLog> logList(BasePage<SysUserLog> pageInfo, SysUserLog formFilter) {
        formFilter.setUserId(SessionUtils.getUserId());
        pageInfo.parseFilterRules(formFilter);
        pageInfo.parseSortRule(formFilter);
        return new Page<>(sysUserLogService.getPageList(pageInfo, formFilter));
    }
    
    
    
    /**
     * ============
     * 我的角色
     * ============
     */
    /**
     * 我的角色-展示。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/roleView")
    public String roleView(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "sys/personal/sysPersonalTabRole_view";
    }
    
    /**
     * 我的角色-数据。
     * @param pageInfo pageInfo
     * @param formFilter formFilter
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/roleList")
    @ResponseBody
    public Page<SysRole> roleList(BasePage<SysRole> pageInfo, SysUserRole formFilter) {
        formFilter.setUserId(SessionUtils.getUserId());
        return new Page<>(sysRoleService.getPageListByUserId(pageInfo, formFilter));
    }
    
    
    
    
    /**
     * ============
     * 我的权限
     * ============
     */
    /**
     * 我的权限-展示。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/authView")
    public String authView(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "sys/personal/sysPersonalTabAuth_view";
    }
    
    /**
     * 我的权限-数据。
     * @return map
     * @since V1.0.0
     */
    @RequestMapping(value = "/authList")
    @ResponseBody
    public Map authList() {
        return sysAuthService.getSysAuthListByUserId(SessionUtils.getUserId());
    }
    
    /**
     * ============
     * 我的岗位
     * ============
     */
    /**
     * 我的岗位-展示。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/posView")
    public String posView(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "sys/personal/sysPersonalTabPos_view";
    }
    
    /**
     * 我的岗位-数据。
     * @param filter filter
     * @param model model
     * @return data
     * @since V1.0.0
     */
    @RequestMapping(value = "/posList")
    @ResponseBody
    public List<SysUserPosition> posList(SysUserPosition filter, Model model) {
        filter.setUserId(SessionUtils.getUserId());
        List<SysUserPosition> positionList = sysUserPositionService.getList(filter, "sysPosition");
        return positionList;
    }
    
    /**
     * ============
     * 我的小组
     * ============
     */
    /**
     * 我的小组-展示。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/groupView")
    public String groupView(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "sys/personal/sysPersonalTabGroup_view";
    }
    
    /**
     * 我的小组-数据。
     * @param filter filter
     * @param model model
     * @return data
     * @since V1.0.0
     */
    @RequestMapping(value = "/groupList")
    @ResponseBody
    public List<SysGroupUser> groupList(SysGroupUser filter, Model model) {
        filter.setUserId(SessionUtils.getUserId());
        List<SysGroupUser> groupList = sysGroupUserService.getList(filter);
        return groupList;
    }
    
    
    
    
    
    
    
    
    
    /**
     * 个性化设置view.
     * @author zhangdianbo
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/personalSetting/view")
    public String showSysUserProfile() {
        //创建当前用户个性化配置
        sysUserProfileService.createUserProfile();
        return "sys/profile/sysUserProfile_view";
    }
    
    /**
     * 个性化设置数据。
     * @author zhangdianbo
     * @return 字典组分页数据
     */
    @RequestMapping(value = "/personalSetting/list")
    @ResponseBody
    public List<SysUserProfile> list() {
        return sysUserProfileService.getList();
    }
    
    /**
     * 个性化设置保存&恢复默认.
     * @author zhangdianbo
     * @param sysUserProfile SysUserProfile
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/personalSetting/update")
    @ResponseBody
    @UserLog(code = "updateUserProfile", name = "个性化设置保存&恢复默认", engName = "updateUserProfile")
    public OperationResult update(@HValidated SysUserProfile sysUserProfile) {
        sysUserProfileService.edit(sysUserProfile);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 个性化设置保存主页修改主题
     * @author zhangdianbo
     * @param key 
     * @param value
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/personalSetting/update/{key}/{value}")
    @ResponseBody
    @UserLog(code = "updateUserProfile", name = "个性化设置保存", engName = "updateUserProfile")
    public OperationResult update(@PathVariable String key, @PathVariable String value) {
        sysUserProfileService.edit(key,value);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    
}

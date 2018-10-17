package com.hginfo.hbm.fe.mc.web.sys.org;

import static com.hginfo.hbm.fe.mc.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.service.sys.SysGroupService;
import com.hginfo.hbm.base.service.sys.SysGroupUserService;
import com.hginfo.hbm.base.service.sys.SysOrganizationService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 小组Controller。<br />
 * Created by qiujingde on 2016/12/26.
 * @author qiujingde
 */
@Controller
@RequestMapping("sys/org")
public class SysGroupController {

    /**
     *
     */
    private SysGroupService groupService;

    /**
     *
     */
    private SysOrganizationService orgService;
    
    /**
     * 
     */
    private SysGroupUserService sysGroupUserService;


    /**
     *
     * @param model model
     * @param orgId  orgId
     * @return viewId
     */
    @RequestMapping("newGroup/{orgId}")
    public String newGroup(Model model, @PathVariable long orgId) {
        SysGroup group = new SysGroup();
        SysOrganization org = orgService.getById(orgId);
        group.setSysOrganization(org);
        group.setOrgId(org.getId());

        model.addAttribute("group", group);
        model.addAttribute("formUrl", "sys/org/addGroup");
        return "sys/org/sysGroup_edit";
    }

    /**
     *
     * @param model model
     * @param groupId group id
     * @return viewId
     */
    @RequestMapping("editGroup/{groupId}")
    public String editGroup(Model model, @PathVariable long groupId) {
        model.addAttribute("group", groupService.getById(groupId));
        model.addAttribute("formUrl", "sys/org/updGroup");
        return "sys/org/sysGroup_edit";
    }

    /**
     *
     * @param model   model
     * @param groupId group id
     * @return viewId
     */
    @RequestMapping("aboutGroup/{groupId}")
    public String aboutGroup(Model model, @PathVariable long groupId) {
        model.addAttribute("biz", groupService.getById(groupId));
        return "sys/biz_about";
    }

    /**
     *
     * @param group group
     * @return 操作结果
     */
    @RequestMapping("addGroup")
    @ResponseBody
    @UserLog(code = "addGroup", name = "新增小组", engName = "addGroup")
    public OperationResult addGroup(@HValidated SysGroup group) {
        groupService.createGroup(group);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     *
     * @param group group
     * @return 操作结果
     */
    @RequestMapping("updGroup")
    @ResponseBody
    @UserLog(code = "updateGroup", name = "修改小组", engName = "updateGroup")
    public OperationResult updateGroup(@HValidated SysGroup group) {
        groupService.editGroup(group);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     *
     * @param groupId groupId
     * @return 操作结果
     */
    @RequestMapping("delGroup/{groupId}")
    @ResponseBody
    @UserLog(code = "deleteGroup", name = "删除小组", engName = "deleteGroup")
    public OperationResult deleteGroup(@PathVariable long groupId) {
        groupService.deleteGroup(groupId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 更新小组数据。
     * @param filter filter
     * @return data
     * @since V1.0.0
     */
    @RequestMapping("updateUserGroup")
    @ResponseBody
    @UserLog(code = "updateUserGroup", name = "更新人员对应小组", engName = "updateUserGroup")
    public OperationResult updateUserGroup(SysGroupUser filter) {
        sysGroupUserService.doRefresh(filter.getUserId(), filter.getGroupIds());
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 小组选择弹窗。
     * @return page
     * @since V1.0.0
     */
    @RequestMapping("chooseSysGroupView")
    public String chooseSysGroupView() {
        return "sys/org/chooseSysGroup_view";
    }
    
    
    @HReference
    public void setSysGroupUserService(SysGroupUserService sysGroupUserService) {
        this.sysGroupUserService = sysGroupUserService;
    }

    @HReference
    public void setGroupService(SysGroupService groupService) {
        this.groupService = groupService;
    }

    @HReference
    public void setOrgService(SysOrganizationService orgService) {
        this.orgService = orgService;
    }
}

package com.hginfo.hbm.fe.mc.web.sys.org;

import static com.hginfo.hbm.fe.mc.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysGroupUserService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * position user controller.<br />
 * Created by qiujingde on 2016/12/26.
 * @author qiujingde
 */
@Controller
@RequestMapping("sys/org/groupUser")
public class SysGroupUserController {

    /**
     *
     */
    private SysGroupUserService groupUserService;

    /**
     * @param model model
     * @param groupId group id
     * @return viewId
     */
    @RequestMapping("view/{groupId}")
    public String view(Model model, @PathVariable long groupId) {
        model.addAttribute("group", groupId);
        model.addAttribute("fetchUrl", "sys/org/groupUser/list/" + groupId);
        return "sys/org/sysGroupUser_view";
    }

    /**
     *
     * @param groupId group id
     * @param pageInfo page info
     * @return page result
     */
    @RequestMapping("list/{groupId}")
    @ResponseBody
    public Page<SysGroupUser> list(@PathVariable long groupId, BasePage<SysGroupUser> pageInfo) {
        SysGroupUser filter = new SysGroupUser();
        filter.setGroupId(groupId);

        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);

        return new Page<>(groupUserService.getPageList(pageInfo, filter, "sysUser.userPosition", "sysUser.userPosition.sysOrganization"));
    }

    /**
     *
     * @param groupUser group user
     * @return op result
     */
    @RequestMapping("add")
    @ResponseBody
    @UserLog(code = "addGroupUser", name = "新增小组人员对应", engName = "addGroupUser")
    public OperationResult add(SysGroupUser groupUser) {
        groupUserService.add(groupUser);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 批量新增小组人员对应.
     * @param groupId groupId
     * @param userIds userIds
     * @return op result
     */
    @RequestMapping("addGroupToUsers")
    @ResponseBody
    @UserLog(code = "addGroupToUsers", name = "批量新增小组人员对应", engName = "addGroupToUsers")
    public OperationResult addGroupToUsers(Long groupId, Long[] userIds) {
        groupUserService.addGroupToUsers(groupId, userIds);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * delete:(批量删除用户小组对应关系). <br/>
     * @author yinyanzhen
     * @param groupUserIds groupUserIds
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("del")
    @ResponseBody
    @UserLog(code = "deleteGroupUser", name = "删除小组人员对应", engName = "deleteGroupUser")
    public OperationResult delete(Long[] groupUserIds) {
        groupUserService.deleteByIDs(groupUserIds);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     *
     * @param groupUser group user
     * @return op result
     */
    @RequestMapping("setLeader")
    @ResponseBody
    @UserLog(code = "setLeader", name = "设置组长", engName = "setLeader")
    public OperationResult setLeader(SysGroupUser groupUser) {
        groupUserService.setLeader(groupUser);
        return DEFAULT_SUCCESS_RESULT;
    }

    @HReference
    public void setGroupUserService(SysGroupUserService groupUserService) {
        this.groupUserService = groupUserService;
    }
}

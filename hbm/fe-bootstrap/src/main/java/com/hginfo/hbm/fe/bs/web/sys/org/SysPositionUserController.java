package com.hginfo.hbm.fe.bs.web.sys.org;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * position user controller.<br />
 * Created by qiujingde on 2016/12/26.
 * @author qiujingde
 */
@Controller
@RequestMapping("sys/org/posUser")
public class SysPositionUserController {
    
    /**
     *
     */
    private SysUserPositionService userPosService;
    
    /**
     * @param model model
     * @param posId position id
     * @return viewId
     */
    @RequestMapping("view/{posId}")
    public String view(Model model, @PathVariable long posId) {
        model.addAttribute("posId", posId);
        model.addAttribute("fetchUrl", "sys/org/posUser/list/" + posId);
        return "sys/org/sysOrgUser_view";
    }
    
    /**
     *
     * @param posId position id
     * @param pageInfo page info
     * @return page result
     */
    @RequestMapping("list/{posId}")
    @ResponseBody
    public Page<SysUserPosition> list(@PathVariable long posId,
        BasePage<SysUserPosition> pageInfo) {
        SysUserPosition filter = new SysUserPosition();
        filter.setPositionId(posId);
        
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        
        return new Page<>(userPosService.getPageList(pageInfo, filter, "sysUser", "sysPosition"));
    }
    
    /**
     *
     * @param userPos user position
     * @return op result
     */
    @RequestMapping("add")
    @ResponseBody
    @UserLog(code = "addPositionUser", name = "新增岗位用户对应", engName = "addPositionUser")
    public OperationResult add(SysUserPosition userPos) {
        userPosService.add(userPos);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 批量新增岗位用户对应.
     * @param positionId positionId
     * @param userIds userIds
     * @return op result
     */
    @RequestMapping("addPosToUsers")
    @ResponseBody
    @UserLog(code = "addPosToUsers", name = "批量新增岗位用户对应", engName = "addPosToUsers")
    public OperationResult addPosToUsers(Long positionId, Long[] userIds) {
        userPosService.addPosToUsers(positionId, userIds);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     *
     * @param userPositionIds user position ids
     * @return op result
     */
    @RequestMapping("del")
    @ResponseBody
    @UserLog(code = "deletePositionUser", name = "删除岗位用户对应", engName = "deletePositionUser")
    public OperationResult delete(Long[] userPositionIds) {
        userPosService.deleteByIDs(userPositionIds);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     *
     * @param userPos user position
     * @return op result
     */
    @RequestMapping("setMajor")
    @ResponseBody
    @UserLog(code = "setMajor", name = "设置主岗位", engName = "setMajor")
    public OperationResult setMajor(SysUserPosition userPos) {
        userPosService.setMajor(userPos);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    @HReference
    public void setUserPosService(SysUserPositionService userPosService) {
        this.userPosService = userPosService;
    }
}

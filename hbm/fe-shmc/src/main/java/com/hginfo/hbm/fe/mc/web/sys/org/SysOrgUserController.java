package com.hginfo.hbm.fe.mc.web.sys.org;

import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hbm.fe.mc.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 获取部门下的所有岗位信息。 <br />
 * Created by qiujingde on 2016/12/27.
 * @author qiujingde
 */
@Controller
@RequestMapping("sys/org/orgUser")
public class SysOrgUserController {

    /**
     *
     */
    private SysUserPositionService userPosService;

    /**
     * @param model model
     * @param orgId org id
     * @return viewId
     */
    @RequestMapping("view/{orgId}")
    public String view(Model model, @PathVariable long orgId) {
        model.addAttribute("orgId", orgId);
        model.addAttribute("fetchUrl", "sys/org/orgUser/list/" + orgId);
        return "sys/org/sysOrgUser_view";
    }

    /**
     *
     * @param orgId org id
     * @param pageInfo page info
     * @return page result
     */
    @RequestMapping("list/{orgId}")
    @ResponseBody
    public Page<SysUserPosition> list(@PathVariable long orgId, BasePage<SysUserPosition> pageInfo) {
        SysUserPosition filter = new SysUserPosition();
        SysPosition pos = new SysPosition();
        pos.setOrgId(orgId);
        filter.setSysPosition(pos);

        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);

        return new Page<>(userPosService.getPageList(pageInfo, filter, "sysUser", "sysPosition"));
    }

    @HReference
    public void setUserPosService(SysUserPositionService userPosService) {
        this.userPosService = userPosService;
    }
}

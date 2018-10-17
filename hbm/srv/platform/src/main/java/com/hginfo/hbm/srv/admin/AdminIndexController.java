package com.hginfo.hbm.srv.admin;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.base.service.srv.SrvLogService;
import com.hginfo.hbm.base.service.srv.SrvStatService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.DateTimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 管理后台首页。
 * Created by licheng on 2017-6-2.
 */
@Controller
@RequestMapping(RestConstants.ADMIN_PATH)
public class AdminIndexController {

    /**
     *
     */
    @HReference
    private SysUserService sysUserService;

    @HReference
    private SrvInterfaceService srvInterfaceService;

    @HReference
    private SrvLogService srvLogService;

    @HReference
    private SrvStatService srvStatService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login(HttpServletResponse response, Model model) {
        model.addAttribute("curUser", sysUserService.get(SessionUtils.getUserId()));
        return "admin/index";
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(HttpServletResponse response, Model model) {
        model.addAttribute("interfaceEffectiveCount",srvInterfaceService.getEffectiveCount());
        model.addAttribute("interfaceEnabledCount",srvInterfaceService.getEnabledCount());
        SrvLog filter = new SrvLog();
        String startTimeStr = DateTimeUtil.getDateTimeStr(DateTimeUtil.getNewDate(new Date(),-24*3600));
        filter.setStartTimeStr(startTimeStr);
        model.addAttribute("callCount", srvStatService.getCallCount(filter));
        model.addAttribute("avgProcessTime", srvStatService.getAvgProcessTime(filter));

        startTimeStr = DateTimeUtil.getDateTimeStr(DateTimeUtil.getBeginOfDay(DateTimeUtil.getNewDate(new Date(),-6*24*3600)));
        filter.setStartTimeStr(startTimeStr);
        List<Map> rs =  srvStatService.getResultGroupByDay(filter);
        return "admin/dashboard";
    }

}

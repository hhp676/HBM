package com.hginfo.hbm.fe.mc.web.sys.report;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.series.Bar;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.fe.core.utils.EchartUtil;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.Constants;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.ResponseUtil;

/**
 * 员工工作报表.
 * ClassName: SysEmployeeJobReportController <br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/report/sysEmployeeJobReport")
public class SysEmployeeJobReportController {
    /**
     */
    @HReference
    private SysUserService sysUserSerivce;
    
    /**
     * toEmployeeJobReport:(跳转到页面). <br/>
     * @author yinyanzhen
     * @param request request
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/view")
    public String toEmployeeJobReport(HttpServletRequest request) {
        request.setAttribute("year", DateTimeUtil.formatDate(new Date(), "yyyy"));
        return "sys/report/sysEmployeeJobReport_view";
    }
    
    /**
     * getUserInOutJobBar:(员工入职离职柱图报表). <br/>
     * @author yinyanzhen
     * @param vo vo
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/getUserInOutJobBar")
    public void getUserInOutJobBar(@RequestParam Map vo, HttpServletResponse response) {
        List<Map<String, Object>> inList = sysUserSerivce.getUserEntryGroup(vo);
        List<Map<String, Object>> quitList = sysUserSerivce.getUserQuitGroup(vo);
        
        //声明echart面板
        Option option = EchartUtil.getOption("员工入职离职统计", new String[] {"入职", "离职" });
        //设置echart面板的其它属性,以下例子是maginleft的距离
        option.grid().x(Constants.NUMBER_100);
        
        String[] titles = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };
        option.xAxis(EchartUtil.getAxisCategory(Arrays.asList(titles)));
        //设置X轴和Y轴定义值
        option.xAxis(new ValueAxis().name("月份"));
        option.yAxis(new ValueAxis().name("数量"));
        
        //柱状图
        Bar inbar = EchartUtil.getBar(inList, "TOTAL", "TOTAL_MONTH", Arrays.asList(titles), "入职");
        Bar quitbar = EchartUtil.getBar(quitList, "TOTAL", "TOTAL_MONTH", Arrays.asList(titles),
            "离职");
        
        option.series(inbar, quitbar);
        
        Map returnMap = new HashMap();
        returnMap.put("success", true);
        returnMap.put("data", option);
        //数据返回至前台页面(不能使用@ResponseBody,其转为json格式,echart不能解析)
        ResponseUtil.renderJson(response, returnMap);
    }
}

package com.hginfo.hbm.fe.eu.web.sys.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.code.Orient;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.code.X;
import com.github.abel533.echarts.series.Pie;
import com.hginfo.hbm.base.service.sys.report.SysEmployeeOrgReportService;
import com.hginfo.hbm.fe.core.utils.EchartUtil;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.ResponseUtil;

/**
 * ClassName: SysEmployeeOrgReportController .<br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/report/sysEmployeeOrgReport")
public class SysEmployeeOrgReportController {
    /**
     */
    @HReference
    private SysEmployeeOrgReportService sysEmployeeOrgReportService;
    
    /**
     * toOrgReport:(跳转到部门报表). <br/>
     * @author yinyanzhen
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/view")
    public String toEmployeeOrgReport() {
        return "sys/report/sysEmployeeOrgReport_view";
    }
    
    /**
     * getOrgUserPieData:(这里用一句话描述这个方法的作用). <br/>
     * @author yinyanzhen
     * @param orgCode orgCode
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/getOrgUserPieData")
    public void getOrgUserPieData(@RequestParam("orgCode") String orgCode,
        HttpServletResponse response) {
        List<Map<String, Object>> list = sysEmployeeOrgReportService.queryOrgUserTotal(orgCode);
        
        List<Object> titles = EchartUtil.getObjListFromMapList(list, "name");
        //声明echart面板
        Option option = EchartUtil.getOption("部门人员统计", titles.toArray());
        //option.title().textStyle(new TextStyle().fontSize(17));字体大小调整
        option.title().x(X.center);
        option.legend().x(X.left);
        option.legend().orient(Orient.vertical);
        option.legend().y(30);
        
        option.tooltip().trigger(Trigger.item);
        option.tooltip().formatter("{a} <br/>{b} : {c} ({d}%)");
        
        //饼状图-圆心坐标X,Y,半径值
        Pie pie = EchartUtil.getPie(list, "name", "total", "部门人员统计", 290, 220, 120);
        //添加到echart面板
        option.series(pie);
        
        Map returnMap = new HashMap();
        returnMap.put("success", true);
        returnMap.put("data", option);
        //数据返回至前台页面(不能使用@ResponseBody,其转为json格式,echart不能解析)
        ResponseUtil.renderJson(response, returnMap);
    }
    
}

package com.hginfo.hbm.srv.admin;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvStatService;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.utils.EchartUtil;
import com.hginfo.hbm.srv.toolkit.SrvControllerUtil;
import com.hginfo.hdubbo.annotation.HReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 运行监控。
 * Created by licheng on 2017-6-21.
 */
@Controller
@RequestMapping(RestConstants.ADMIN_PATH + "/SrvMonitor")
public class AdminMonitorController {


    @HReference
    private SrvStatService srvStatService;

    @RequestMapping("/view")
    public String view() {
        return "admin/SrvMonitor/SrvMonitor_view";
    }

    @RequestMapping("/callCountList")
    public void callCountList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {

        String title = SrvControllerUtil.initFilter(filter, "调用次数统计");
        List<Map<String, Object>> processTimeList = SrvControllerUtil.convert(srvStatService.getCallCountGroupByDay(filter));
        SrvControllerUtil.fillDateData(processTimeList, filter);
        Option option = EchartUtil.getOption("", new String[]{"调用次数"});
        List<Object> categoryList = EchartUtil.getObjListFromMapList(processTimeList, "beginTimeStr");
        //设置X轴和Y轴定义值
        option.grid().x(60).y(60);
        option.xAxis(EchartUtil.getAxisCategory(categoryList));
        option.xAxis(new ValueAxis().name("日期"));
        option.yAxis(new ValueAxis().name("调用次数"));

        //折线图
        Line processTimeLine = EchartUtil.getLine(processTimeList, "counts", "beginTimeStr", categoryList, "调用次数");
        //添加到echart面板
        option.series(processTimeLine);

        SrvControllerUtil.render(response, option);
    }


    @RequestMapping("/processTimeList")
    public void processTimeList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {

        String title = SrvControllerUtil.initFilter(filter, "调用平均耗时统计");
        List<Map<String, Object>> processTimeList = SrvControllerUtil.convert(srvStatService.getAvgProcessTimeGroupByDay(filter));
        SrvControllerUtil.fillDateData(processTimeList, filter);
        Option option = EchartUtil.getOption("", new String[]{"平均耗时"});
        List<Object> categoryList = EchartUtil.getObjListFromMapList(processTimeList, "beginTimeStr");
        //设置X轴和Y轴定义值
        option.grid().x(60).y(60);
        option.xAxis(EchartUtil.getAxisCategory(categoryList));
        option.xAxis(new ValueAxis().name("日期"));
        option.yAxis(new ValueAxis().name("平均耗时(ms)"));

        //折线图
        Line processTimeLine = EchartUtil.getLine(processTimeList, "avgProcessTime", "beginTimeStr", categoryList, "平均耗时(ms)");
        //添加到echart面板
        option.series(processTimeLine);

        SrvControllerUtil.render(response, option);
    }


    @RequestMapping("/resultCountList")
    public void resultCountList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {
        String title = SrvControllerUtil.initFilter(filter, "调用结果统计");
        List<Map<String, Object>> callCountList = SrvControllerUtil.convert(srvStatService.getResultGroupByDay(filter));
        SrvControllerUtil.fillDateData(callCountList, filter);
        Option option = EchartUtil.getOption("", new String[]{"成功数", "失败数"});
        List<Object> categoryList = EchartUtil.getObjListFromMapList(callCountList, "beginTimeStr");
        //设置X轴和Y轴定义值
        option.grid().x(60).y(60);
        option.xAxis(EchartUtil.getAxisCategory(categoryList));
        option.xAxis(new ValueAxis().name("日期"));
        option.yAxis(new ValueAxis().name("调用次数"));

        //折线图
        Line successLine = EchartUtil.getLine(callCountList, "sucessCounts", "beginTimeStr", categoryList, "成功");
        Line failLine = EchartUtil.getLine(callCountList, "failCounts", "beginTimeStr", categoryList, "失败");
        //添加到echart面板
        option.series(successLine, failLine);

        SrvControllerUtil.render(response, option);

    }

    @RequestMapping("/resultTotalList")
    public void resultTotalList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {
        String title = SrvControllerUtil.initFilter(filter, "调用结果合计");
        List<Map<String, Object>> resultList = SrvControllerUtil.convert(srvStatService.getResultGroupByDay(filter));
        Option option = EchartUtil.getOption("", new String[]{"成功数", "失败数"});
        option.tooltip().trigger(Trigger.item);
        option.tooltip().formatter("{a} <br/>{b} : {c} ({d}%)");
        option.title(title);
        option.getTitle().x("center");

        String nameKey = "name";
        String valKey = "counts";
        int successTotal = 0;
        int failTotal = 0;
        for (Map<String, Object> map : resultList) {
            successTotal += Integer.parseInt(map.get("sucessCounts").toString());
            failTotal += Integer.parseInt(map.get("failCounts").toString());
        }
        List<Map<String, Object>> pieList = new ArrayList<>();
        Map<String, Object> successMap = new HashMap<>();
        successMap.put(nameKey,"成功");
        successMap.put(valKey,successTotal);
        Map<String, Object> failMap = new HashMap<>();
        failMap.put(nameKey,"失败");
        failMap.put(valKey,failTotal);
        pieList.add(successMap);
        pieList.add(failMap);

        Pie pie = new Pie(title);
        for (Map<String, Object> objectMap : pieList) {
            pie.data(new PieData(String.valueOf(objectMap.get(nameKey)), objectMap.get(valKey)));
        }
        pie.center("50%", "50%").radius("65%");
        option.series(pie);

        SrvControllerUtil.render(response, option);

    }


}

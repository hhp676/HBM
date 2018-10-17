package com.hginfo.hbm.srv.admin;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.base.service.srv.SrvStatService;
import com.hginfo.hbm.fe.core.rest.RestConstants;
import com.hginfo.hbm.fe.core.utils.EchartUtil;
import com.hginfo.hbm.srv.toolkit.SrvControllerUtil;
import com.hginfo.hdubbo.annotation.HReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 统计分析。
 * Created by licheng on 2017-6-22.
 */
@Controller
@RequestMapping(RestConstants.ADMIN_PATH + "/SrvStat")
public class SrvAdminStatController {


    @HReference
    private SrvStatService srvStatService;

    @HReference
    private SrvInterfaceService srvInterfaceService;


    @RequestMapping("/countsView")
    public String countsView() {
        return "admin/SrvStat/SrvStatCounts_view";
    }

    @RequestMapping("/countsDataList")
    public void countsDataList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {

        String uriKey = "reqUri";
        String title = SrvControllerUtil.initFilter(filter, "调用次数统计");
        List<Map<String, Object>> countList = SrvControllerUtil.convert(srvStatService.getCallCountGroupByInterface(filter));
        SrvControllerUtil.parseInterface(srvInterfaceService,countList,uriKey);
        Option option = EchartUtil.getOption("", new String[]{});
        List<Object> categoryList = EchartUtil.getObjListFromMapList(countList, uriKey);
        option.tooltip().trigger(Trigger.axis);
        //设置X轴和Y轴定义值
        option.grid().x(150);
        option.yAxis(EchartUtil.getAxisCategory(categoryList));
        option.getyAxis().get(0).name("接口");
        option.xAxis(new ValueAxis().name("调用次数"));

        Bar bar = EchartUtil.getBar(countList, "counts", uriKey, categoryList, "调用次数");
        option.series(bar);

        SrvControllerUtil.render(response, option);
    }

    @RequestMapping("/resultView")
    public String resultView() {
        return "admin/SrvStat/SrvStatResult_view";
    }

    @RequestMapping("/resultDataList")
    public void resultDataList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {

        String uriKey = "reqUri";
        String title = SrvControllerUtil.initFilter(filter, "结果统计");
        List<Map<String, Object>> countList = SrvControllerUtil.convert(srvStatService.getResultGroupByInterface(filter));
        SrvControllerUtil.parseInterface(srvInterfaceService,countList,uriKey);
        Option option = EchartUtil.getOption("", new String[]{});
        List<Object> categoryList = EchartUtil.getObjListFromMapList(countList, uriKey);
        option.tooltip().trigger(Trigger.axis);
        //设置X轴和Y轴定义值
        option.grid().x(150);
        option.yAxis(EchartUtil.getAxisCategory(categoryList));
        option.getyAxis().get(0).name("接口");
        option.xAxis(new ValueAxis().name("调用次数"));

        Bar sucessBar = EchartUtil.getBar(countList, "sucessCounts", uriKey, categoryList, "调用成功次数");
        Bar failBar = EchartUtil.getBar(countList, "failCounts", uriKey, categoryList, "调用失败次数");
        option.series(sucessBar,failBar);

        SrvControllerUtil.render(response, option);
    }

    @RequestMapping("/processTimeView")
    public String processTimeView() {
        return "admin/SrvStat/SrvStatProcessTime_view";
    }

    @RequestMapping("/processTimeDataList")
    public void processTimeDataList(HttpServletRequest request, HttpServletResponse response, SrvLog filter) {

        String uriKey = "reqUri";
        String title = SrvControllerUtil.initFilter(filter, "平均耗时统计");
        List<Map<String, Object>> countList = SrvControllerUtil.convert(srvStatService.getAvgProcessTimeGroupByInterface(filter));
        SrvControllerUtil.parseInterface(srvInterfaceService,countList,uriKey);
        Option option = EchartUtil.getOption("", new String[]{});
        List<Object> categoryList = EchartUtil.getObjListFromMapList(countList, uriKey);
        option.tooltip().trigger(Trigger.axis);
        //设置X轴和Y轴定义值
        option.grid().x(150);
        option.yAxis(EchartUtil.getAxisCategory(categoryList));
        option.getyAxis().get(0).name("接口");
        option.xAxis(new ValueAxis().name("平均耗时(ms)"));

        Bar bar = EchartUtil.getBar(countList, "avgProcessTime", uriKey, categoryList, "平均耗时(ms)");
        option.series(bar);

        SrvControllerUtil.render(response, option);
    }

}

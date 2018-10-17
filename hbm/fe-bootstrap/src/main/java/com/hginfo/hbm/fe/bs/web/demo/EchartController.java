package com.hginfo.hbm.fe.bs.web.demo;


import java.util.ArrayList;
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
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.hginfo.hbm.fe.core.utils.EchartUtil;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;

/**
 * echart报表demo.
 * ClassName: EchartController <br/>
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/echart")
public class EchartController {
    
    /**
     * toEchartDemoPage:(跳转到echart报表demo页面). <br/>
     * @author yinyanzhen
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/toEchartDemoPage")
    public String toEchartDemoPage() {
        return "demo/echarts/echartsDemo_show";
    }
    
    /**
     * 
     * getEchartPie:(这里用一句话描述这个方法的作用). <br/>
     * @param vo vo
     * @param response response
     * @author yinyanzhen
     * @since V1.0.0
     */
    @RequestMapping("/getEchartPie")
    public void getEchartPie(@RequestParam Map vo, HttpServletResponse response) {
        //模拟数据 
        List<Map<String, Object>> list = new ArrayList();
        for (int i = 0; i < 10; i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("name", "类别" + i);
            map.put("total", i + 10);
            list.add(map);
        }
        
        //模拟数据的title行
        List<Object> titles = EchartUtil.getObjListFromMapList(list, "name");
        //声明echart面板
        Option option = EchartUtil.getOption("饼图示例双击饼图", titles.toArray());
        option.tooltip().trigger(Trigger.item);
        option.tooltip().formatter("{a} <br/>{b} : {c} ({d}%)");
        
        //饼状图-圆心坐标X,Y,半径值
        Pie pie = EchartUtil.getPie(list, "name", "total", "demo演示饼图", 530, 230, 100);
        //添加到echart面板
        option.series(pie);
        
        Map returnMap = new HashMap();
        returnMap.put("success", true);
        returnMap.put("data", option);
        //数据返回至前台页面(不能使用@ResponseBody,其转为json格式,echart不能解析)
        ResponseUtil.renderJson(response, returnMap);
    }
    
    /**
     * getEchartBar:(echart柱状报表). <br/>
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/getEchartBar")
    public void getEchartBar(HttpServletRequest request, HttpServletResponse response) {
        //获取前台请求参数
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        //模拟数据
        List<Map<String, Object>> list = new ArrayList();
        for (int i = 0; i < 10; i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("name", "类别" + i);
            map.put("total", i + 10);
            list.add(map);
        }
        //声明echart面板
        Option option = EchartUtil.getOption("柱图折线图结合", new String[]{"一月", "二月", "三月"});
        //设置echart面板的其它属性,以下例子是maginleft的距离
        option.grid().x(100);
        
        //柱状图类目
        List<Object> categoryList = EchartUtil.getObjListFromMapList(list, "name");
        option.xAxis(EchartUtil.getAxisCategory(categoryList));
        //设置X轴和Y轴定义值
        option.xAxis(new ValueAxis().name("类目"));
        option.yAxis(new ValueAxis().name("业务量"));
        
        //柱状图
        Bar bar = EchartUtil.getBar(list, "total", "name", categoryList, "一月");
        //可以书写多个
        Bar bar1 = EchartUtil.getBar(list, "total", "name", categoryList, "二月");
        //折线图
        Line line = EchartUtil.getLine(list, "total", "name", categoryList, "三月");
        
        //添加到echart面板
        option.series(bar, bar1, line);
        
        Map returnMap = new HashMap();
        returnMap.put("success", true);
        returnMap.put("data", option);
        //数据返回至前台页面(不能使用@ResponseBody,其转为json格式,echart不能解析)
        ResponseUtil.renderJson(response, returnMap);
    }
}

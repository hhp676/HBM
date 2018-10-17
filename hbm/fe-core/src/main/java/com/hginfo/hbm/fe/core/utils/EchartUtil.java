package com.hginfo.hbm.fe.core.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.Tooltip;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;

/**
 * echart报表工具类(该jar封装支持多种报表,当前工具类仅进行了饼线柱的封装,其它需求请自行参阅网址).
 * 参考网址:https://github.com/abel533/ECharts.
 * ClassName: EchartUtil <br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
public final class EchartUtil {
    /**
     * 
     */
    private EchartUtil() {
        
    }
    
    /**
     * getOption:(获取echart前台json对象). <br/>
     * @author yinyanzhen
     * @param title 标题
     * @param objects 工具栏显示
     * @return 报表的json对象
     * @since V1.0.0
     */
    public static Option getOption(String title, Object[] objects) {
        Option option = new Option();
        //设置标题
        option.title().text(title);
        option.tooltip().trigger(Trigger.axis);
        option.legend().data(objects);
        //设定echart默认颜色序列，循环使用
        option.color("#ff7f50", "#87cefa", "#da70d6", "#32cd32", "#6495ed", "#ff69b4", "#ba55d3",
            "#cd5c5c", "#ffa500", "#40e0d0", "#1e90ff", "#ff6347", "#7b68ee", "#00fa9a", "#ffd700",
            "#6b8e23", "#ff00ff", "#3cb371", "#b8860b", "#30e0e0");
        
        return option;
    }
    
    public static Tooltip getToolTip() {
        Tooltip tooltip = new Tooltip();
        tooltip.trigger(Trigger.item);
        tooltip.formatter("{a} <br/>{b} : {c} ({d}%)");
        return tooltip;
    }
    
    /**
     * getObjListFromMapList:(获取分类对象). <br/>
     * @author yinyanzhen
     * @param list 数据list
     * @param key  类目key值
     * @return  柱状图类目json对象
     * @since V1.0.0
     */
    public static List<Object> getObjListFromMapList(List<Map<String, Object>> list, String key) {
        //创建类目轴  
        List<Object> objList = new ArrayList<Object>();
        for (Map<String, Object> map : list) {
            objList.add(map.get(key));
        }
        return objList;
    }
    
    /**
     * getAxisCategory:(获取分类对象). <br/>
     * @author yinyanzhen
     * @param list list
     * @return CategoryAxis
     * @since V1.0.0
     */
    public static CategoryAxis getAxisCategory(List<Object> list) {
        CategoryAxis category = new CategoryAxis();
        category.setData(list);
        return category;
    }
    
    /**
     * 获取折线表json对象.
     * @author yinyanzhen
     * @param list 数据
     * @param valKey  list数据中,统计字段key值
     * @param categoryKey  list数据中categoryKey值
     * @param categoryList  categoryList
     * @param title 标题
     * @return  Line
     * @since V1.0.0
     */
    public static Line getLine(List<Map<String, Object>> list, String valKey, String categoryKey,
        List<Object> categoryList, String title) {
        List<Object> objList = new ArrayList<Object>();
        //循环数据  
        for (Object category : categoryList) {
            Object value = null;
            for (Map<String, Object> objectMap : list) {
                if (category.equals(objectMap.get(categoryKey))) {
                    value = objectMap.get(valKey);
                }
            }
            objList.add(value);
        }
        
        Line line = new Line(title);
        line.setData(objList);
        return line;
    }
    
    /**
     * getBar:(获取柱状图数据json对象). <br/>
     * @author yinyanzhen
     * @param list 数据
     * @param valKey  list数据中,统计字段key值
     * @param categoryKey  list数据中categoryKey值
     * @param categoryList  categoryList
     * @param title 标题
     * @return  柱状图json对象
     * @since V1.0.0
     */
    public static Bar getBar(List<Map<String, Object>> list, String valKey, String categoryKey,
        List<Object> categoryList, String title) {
        List<Object> objList = new ArrayList<Object>();
        //循环数据  
        for (Object category : categoryList) {
            Object value = null;
            for (Map<String, Object> objectMap : list) {
                if (category.equals(objectMap.get(categoryKey))) {
                    value = objectMap.get(valKey);
                }
            }
            objList.add(value);
        }
        
        Bar bar = new Bar(title);
        bar.setData(objList);
        return bar;
    }
    
    /**
     * getPie:(获取饼图json对象). <br/>
     * @author yinyanzhen
     * @param list 数据集
     * @param nameKey nameKey
     * @param valKey valKey
     * @param title 标题
     * @param pointMaginLeft 圆心距离左侧值
     * @param pointMaginTop 圆心距离顶部值
     * @param width 半径值
     * @return 饼图json对象
     * @since V1.0.0
     */
    public static Pie getPie(List<Map<String, Object>> list, String nameKey, String valKey,
        String title, int pointMaginLeft, int pointMaginTop, int width) {
        //饼图数据  
        Pie pie = new Pie(title);
        //循环数据  
        for (Map<String, Object> objectMap : list) {
            //饼图数据  
            pie.data(new PieData(String.valueOf(objectMap.get(nameKey)), objectMap.get(valKey)));
        }
        //饼图的圆心坐标值和半径  
        pie.center(pointMaginLeft, pointMaginTop).radius(width);
        
        return pie;
    }
}

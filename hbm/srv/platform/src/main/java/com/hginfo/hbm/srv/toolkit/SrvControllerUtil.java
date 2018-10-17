package com.hginfo.hbm.srv.toolkit;

import com.github.abel533.echarts.Option;
import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.StringUtil;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 控制层工具类。
 * Created by licheng on 2017-6-22.
 */
public class SrvControllerUtil {

    /***
     * 初始化查询对象。
     * @param filter filter
     * @param title title
     * @return title
     */
    public static String initFilter(SrvLog filter, String title) {
        setFilterTime(filter);
        if (filter.getBo().getRecentDays() != null) {
            title = String.format("近%d日", filter.getBo().getRecentDays()) + title;
            long addSeconds = -1 * filter.getBo().getRecentDays() * 24 * 3600 * 1000L;
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(new Date().getTime() + addSeconds);
            String startTimeStr = DateTimeUtil.getDateTimeStr(DateTimeUtil.getBeginOfDay(calendar.getTime()));
            filter.setStartTimeStr(startTimeStr);
        }
        return title;
    }


    /**
     * List Map转换。
     * 同时将beginTimeStr时间类型转为字符串类型。
     * @param list list
     * @return list
     */
    public static List<Map<String, Object>> convert(List<Map> list) {

        String beginTimeKey = "beginTimeStr";
        List<Map<String, Object>> newList = new ArrayList<Map<String, Object>>();
        for (Map<String, Object> map : list) {
            if (map.containsKey(beginTimeKey)) {
                Object value = map.get(beginTimeKey);
                if (value instanceof Date) {
                    map.put(beginTimeKey, DateTimeUtil.getDateStr((Date) value));
                }
            }
            newList.add(map);
        }
        return newList;
    }


    /**
     * 将时间段内日期补全。
     * @param list
     * @param filter
     */
    public static void fillDateData(List<Map<String, Object>> list, SrvLog filter) {

        String key = "beginTimeStr";
        if (!StringUtil.isEmpty(filter.getStartTimeStr())) {
            Date start = DateTimeUtil.convertDateTimeStringToDate(filter.getStartTimeStr());
            Date end = new Date();
            if (!StringUtil.isEmpty(filter.getEndTimeStr())) {
                end = DateTimeUtil.convertDateTimeStringToDate(filter.getEndTimeStr());
            }
            List<String> dateList = DateTimeUtil.getBetweenDaysStr(start, end, "yyyy-MM-dd");
            for (String date : dateList) {
                if (list.stream().filter(o -> o.get(key).equals(date)).count() == 0) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put(key, date);
                    list.add(map);
                }
            }
            list.sort((Map o1, Map o2) -> o1.get(key).toString().compareTo(o2.get(key).toString()));
        }

    }

    public static void render(HttpServletResponse response, Option option) {
        //数据返回至前台页面(不能使用@ResponseBody,其转为json格式,echart不能解析)
        Map returnMap = new HashMap();
        returnMap.put("success", true);
        returnMap.put("data", option);
        ResponseUtil.renderJson(response, returnMap);
    }


    /**
     * 设置请求查询时间。
     *
     * @param filter
     */
    public static void setFilterTime(SrvLog filter) {
        //处理接口请求时间
        if (!StringUtil.isEmpty(filter.getBo().getFilterTime())) {
            String[] filterTimeArr = filter.getBo().getFilterTime().split(" - ");
            filter.setStartTimeStr(filterTimeArr[0]);
            filter.setEndTimeStr(filterTimeArr[1]);
        }
    }

    /**
     * 针对map的接口ID增加增加接口地址URI。
     *
     * @param list
     */
    public static void parseInterface(SrvInterfaceService srvInterfaceService, List<Map<String, Object>> list, String uriKey) {

        for (Map<String, Object> map : list) {
            Long ifId = Long.parseLong(map.get("ifId").toString());
            SrvInterface srvInterface = srvInterfaceService.get(ifId);
            map.put(uriKey, srvInterface.getReqUri());
        }
    }


}

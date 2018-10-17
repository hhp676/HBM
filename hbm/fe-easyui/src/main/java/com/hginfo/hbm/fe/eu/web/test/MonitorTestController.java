package com.hginfo.hbm.fe.eu.web.test;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hginfo.hmonitor.druid.DruidStat;

@Controller
@RequestMapping(value = "/test/monitor")
public class MonitorTestController {
    
    /**
     * 测试reset方法。
     */
    @RequestMapping(value = "/reset")
    @ResponseBody
    public Map<String, Object> reset(String flag, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        if ("all".equals(flag)) {
            DruidStat.resetAll();
        } else if ("log".equals(flag)) {
            DruidStat.logAndResetDataSource();
        }
        map.put("resetFlag", flag);
        return map;
    }
    
    /**
     * 测试基本信息。
     */
    @RequestMapping(value = "/basic")
    @ResponseBody
    public Map<String, Object> basic(HttpServletRequest request, HttpServletResponse responses) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getBasicStatMap());
        map.put("json", DruidStat.getBasicStatJSON());
        return map;
    }
    

    /**
     * 测试数据源信息。
     */
    @RequestMapping(value = "/getDataSourceStatDataList")
    @ResponseBody
    public Map<String, Object> getDataSourceStatDataList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getDataSourceStatDataList());
        map.put("json", DruidStat.getDataSourceStatDataJSON());
        return map;
    }
    

    /**
     * 测试stack信息。
     */
    @RequestMapping(value = "/getActiveConnStackTraceList")
    @ResponseBody
    public Map<String, Object> getActiveConnStackTraceList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getActiveConnStackTraceMap());
        map.put("list", DruidStat.getActiveConnStackTraceList());
        map.put("json", DruidStat.getActiveConnStackTraceJSON());
        return map;
    }
    

    /**
     * 测试具体数据源信息。
     */
    @RequestMapping(value = "/getDataSourceStatDataListById")
    @ResponseBody
    public Map<String, Object> getDataSourceStatDataListById(Integer dataSourceId,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getDataSourceStatDataMap(dataSourceId));
        map.put("json", DruidStat.getDataSourceStatDataJSON(dataSourceId));
        return map;
    }
    

    /**
     * 测试连接池信息。
     */
    @RequestMapping(value = "/getPoolingConnectionInfoList")
    @ResponseBody
    public Map<String, Object> getPoolingConnectionInfoList(Integer dataSourceId,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getPoolingConnectionInfoList(dataSourceId));
        map.put("json", DruidStat.getPoolingConnectionInfoJSON(dataSourceId));
        return map;
    }
    

    /**
     * 测试具体stack信息。
     */
    @RequestMapping(value = "/getActiveConnectionStackTraceListById")
    @ResponseBody
    public Map<String, Object> getActiveConnectionStackTraceListById(Integer dataSourceId,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getActiveConnectionStackTraceMap(dataSourceId));
        map.put("list", DruidStat.getActiveConnectionStackTraceList(dataSourceId));
        map.put("json", DruidStat.getActiveConnectionStackTraceJSON(dataSourceId));
        return map;
    }
    

    /**
     * 测试sql信息。
     */
    @RequestMapping(value = "/getSqlStatDataList")
    @ResponseBody
    public Map<String, Object> getSqlStatDataList(String dataSourceId, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        Map<String, String> param = new HashMap<>();
        param.put("dataSourceId", dataSourceId);
        map.put("map", DruidStat.getSqlStatDataList(param));
        map.put("json", DruidStat.getSqlStatDataJSON(param));
        return map;
    }
    

    /**
     * 测试具体sql信息。
     */
    @RequestMapping(value = "/getSqlStatMap")
    @ResponseBody
    public Map<String, Object> getSqlStatMap(Integer sqlId, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getSqlStatMap(sqlId));
        map.put("json", DruidStat.getSqlStatJSON(sqlId));
        return map;
    }
    

    /**
     * 测试防火墙信息。
     */
    @RequestMapping(value = "/getWallStatMapByPage")
    @ResponseBody
    public Map<String, Object> getWallStatMapByPage(String dataSourceId,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        Map<String, String> param = new HashMap<>();
        param.put("dataSourceId", dataSourceId);
        map.put("map", DruidStat.getWallStatMap(param));
        map.put("json", DruidStat.getWallStatJSON(param));
        return map;
    }
    

    /**
     * 测试具体防火墙信息。
     */
    @RequestMapping(value = "/getWallStatMapById")
    @ResponseBody
    public Map<String, Object> getWallStatMapById(Integer dataSourceId,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getWallStatMap(dataSourceId));
        map.put("json", DruidStat.getWallStatJSON(dataSourceId));
        return map;
    }
    

    /**
     * 测试uri信息。
     */
    @RequestMapping(value = "/getWebURIStatDataList")
    @ResponseBody
    public Map<String, Object> getWebURIStatDataList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getWebURIStatDataList(new HashMap<>()));
        map.put("json", DruidStat.getWebURIStatDataJSON(new HashMap<>()));
        return map;
    }
    

    /**
     * 测试具体uri信息。
     */
    @RequestMapping(value = "/getWebURIStatDataMapByUri")
    @ResponseBody
    public Map<String, Object> getWebURIStatDataMapByUri(String uri, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getWebURIStatDataMap(uri));
        map.put("json", DruidStat.getWebURIStatDataJSON(uri));
        return map;
    }
    

    /**
     * 测试应用信息。
     */
    @RequestMapping(value = "/getWebAppStatDataList")
    @ResponseBody
    public Map<String, Object> getWebAppStatDataList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getWebAppStatDataList(new HashMap<>()));
        map.put("json", DruidStat.getWebAppStatDataJSON(new HashMap<>()));
        return map;
    }
    

    /**
     * 测试session信息。
     */
    @RequestMapping(value = "/getWebSessionStatDataList")
    @ResponseBody
    public Map<String, Object> getWebSessionStatDataList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getWebSessionStatDataList(new HashMap<>()));
        map.put("json", DruidStat.getWebSessionStatDataJSON(new HashMap<>()));
        return map;
    }
    

    /**
     * 测试具体session信息。
     */
    @RequestMapping(value = "/getWebSessionStatDataMapBySessionId")
    @ResponseBody
    public Map<String, Object> getWebSessionStatDataMapBySessionId(String sessionId,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getWebSessionStatDataMap(sessionId));
        map.put("json", DruidStat.getWebSessionStatDataJSON(sessionId));
        return map;
    }
    

    /**
     * 测试spring信息。
     */
    @RequestMapping(value = "/getSpringStatDataList")
    @ResponseBody
    public Map<String, Object> getSpringStatDataList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getSpringStatDataList(new HashMap<>()));
        map.put("json", DruidStat.getSpringStatDataJSON(new HashMap<>()));
        return map;
    }
    

    /**
     * 测试spring拦截方法信息。
     */
    @RequestMapping(value = "/getSpringMethodStatDataMap")
    @ResponseBody
    public Map<String, Object> getSpringMethodStatDataMap(String bizClass, String bizMethod,
        HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("map", DruidStat.getSpringMethodStatDataMap(bizClass, bizMethod));
        map.put("json", DruidStat.getSpringMethodStatDataJSON(bizClass, bizMethod));
        return map;
    }
    
}

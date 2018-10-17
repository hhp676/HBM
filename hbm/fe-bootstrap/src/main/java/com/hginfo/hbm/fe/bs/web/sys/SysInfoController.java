
package com.hginfo.hbm.fe.bs.web.sys;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.service.sys.SysInfoService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * 系统信息Controller。 <br />
 * controller 层 <br />
 *
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/info")
public class SysInfoController {
    
    /**
    * 系统Service。
    */
    
    private SysInfoService sysInfoService;
    
    /**.
     * jvm信息页面。
     * @param model model
     * @return 返回页面
     */
    @RequestMapping(value = "/jvmView")
    public String showSysJvm(Model model) {
        model.addAttribute("jvm", sysInfoService.getJvmInfo());
        return "sys/sysInfo/sysJvm_view";
    }
    
    /**
     * getJvmInfo。
     * 获取jvm信息
     * @return 设定文件
     */
    @RequestMapping(value = "/jvmInfo")
    @ResponseBody
    public Map<String, Map<String, Object>> getJvmInfo() {
        Map<String, Map<String, Object>> map = sysInfoService.getJvmInfo();
        return map;
    }
    
    /**.
     * sever信息页面
     * @param model model
     * @return 返回server信息页面
     */
    @RequestMapping(value = "/serverView")
    public String showSysServer(Model model) {
        model.addAttribute("server", sysInfoService.getServerInfo());
        return "sys/sysInfo/sysServer_view";
    }
    
    /**
     * serverInfo.
     * 获取server信息
     * @return 返回server信息
     */
    @RequestMapping(value = "/serverInfo")
    @ResponseBody
    public Map<String, Object> getServerInfo() {
        Map<String, Object> map = sysInfoService.getServerInfo();
        return map;
    }
    
    /**.
     * system信息页面
     * @param model model
     * @return 系统信息页面
     */
    @RequestMapping(value = "/systemView")
    public String showSystem(Model model) {
        model.addAttribute("system", sysInfoService.getSystemInfo());
        return "sys/sysInfo/sysSystem_view";
    }
    
    /**
     * serverInfo.
     * 获取server信息
     * @return 系统信息
     */
    @RequestMapping(value = "/systemInfo")
    @ResponseBody
    public Map<String, Object> getSystemInfo() {
        Map<String, Object> map = sysInfoService.getSystemInfo();
        return map;
    }
    
    /**
     * druid页面。
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/druidView")
    public String showDruid() {
        return "sys/sysInfo/sysDruid_view";
    }
    
    public SysInfoService getSysInfoService() {
        return sysInfoService;
    }
    
    @HReference
    public void setFileService(SysInfoService innfoService) {
        this.sysInfoService = innfoService;
    }
}

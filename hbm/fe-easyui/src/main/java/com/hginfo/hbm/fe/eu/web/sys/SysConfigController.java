/**
 * Project Name:hbm-fe-easyui
 * File Name:SysConfigController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月17日上午10:51:05
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.eu.web.sys;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysConfig;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * ClassName:SysConfigController.
 * Date: 2016年12月17日 上午10:51:05 <br/>
 * @author licheng
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysConfig")
public class SysConfigController {
    
    /**
     * Service.
     */
    @HReference
    private SysConfigService sysConfigService;
    
    /**
     * view.
     * @author licheng
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/view")
    public String showSysConfig() {
        return "sys/config/sysConfig_view";
    }
    
    /**
     * about.
     * @author licheng
     * @param sysConfig sysConfig
     * @param model model
     * @return page
     * @throws Exception 
     * @since V1.0.0
     */
    @RequestMapping(value = "/aboutOne")
    public String aboutOne(SysConfig sysConfig, Model model) throws Exception {
        model.addAttribute("biz", sysConfigService.get(sysConfig.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 分页数据。
     * @param pageInfo 分页信息
     * @param formFilter 表单过滤条件
     * @return 字典组分页数据
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysConfig> list(BasePage<SysConfig> pageInfo, SysConfig formFilter) {
        SysConfig filter = new SysConfig();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        filter.setIsCurrent(1);
        return new Page<>(sysConfigService.getPageList(pageInfo, filter));
    }
    
    /**
    * 历史版本数据。
    * @param pageInfo 分页信息
    * @param filter 过滤条件
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/hisList")
    @ResponseBody
    public Page<SysConfig> hisList(BasePage<SysConfig> pageInfo, SysConfig filter) {
        filter.setIsCurrent(0);
        return new Page<>(sysConfigService.getPageList(pageInfo, filter));
    }
    
    /**
     * create.
     * @author licheng
     * @param sysConfig sysConfig
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    @UserLog(code = "createConfig", name = "新增系统设置", engName = "createConfig")
    public OperationResult create(@HValidated SysConfig sysConfig) {
        sysConfigService.create(sysConfig);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * create.
     * @author licheng
     * @param sysConfig sysConfig
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateConfig", name = "修改系统设置", engName = "updateConfig")
    public OperationResult update(@HValidated SysConfig sysConfig) {
        sysConfigService.update(sysConfig);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * create.
     * @author licheng
     * @param sysConfig sysConfig
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteConfig", name = "删除系统设置", engName = "deleteConfig")
    public OperationResult delete(SysConfig sysConfig) {
        sysConfigService.delete(sysConfig.getConfigKey());
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    
    /**
     * 获取数据表格每页展示数据数量.
     * @author zhangdianbo
     * @param key key
     * @return List
     * @since V1.0.0
     */
    @RequestMapping(value = "/defaultPageSize/{key}")
    @ResponseBody
    public List<Map> getDefaultPageSize(@PathVariable String key) {
        List<Map> itemsList = new ArrayList<Map>();
        String[] defaultPageSize = (String[]) sysConfigService.getProperty(key).replaceAll("[\\[\\]]", "").split(",");
        for (String string : defaultPageSize) {
            LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
            map.put("pageSizeValue", string);
            itemsList.add(map);
        }
        return itemsList;
    }
    
}

/**
 * Project Name:hbm-fe-easyui
 * File Name:SysDauthController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年01月13日上午9:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.bs.web.sys;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysDauth;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysDauthService;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 数据权限Controller。 <br />
 * controller 层 <br />
 * Date: 2016年01月13日上午9:25:54 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/dauth")
public class SysDauthController {
    
    /**
     * 
     */
    private static Log      log = LogFactory.getLog(SysDauthController.class);
    
    /**
     * 数据权限Service。
     */
    @HReference
    private SysDauthService sysDauthService;
    
    /**
     * about.
     * @param dauth dauth
     * @param model model
     * @return page
     * @throws Exception 
     */
    @RequestMapping(value = "/aboutDauth")
    public String aboutDauth(SysDauth dauth, Model model) throws Exception {
        model.addAttribute("biz", sysDauthService.get(dauth.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 数据权限管理菜单。
     * @return 数据权限管理页面
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "sys/dauth/dauth_view";
    }
    
    /**
     * 数据权限分页数据。
     * @param pageInfo 分页信息
     * @return 数据权限分页数据。
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<SysDauth> list(BasePage<SysDauth> pageInfo) {
        SysDauth filter = new SysDauth();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthService.getPageList(pageInfo, filter));
    }
    
    /**
     * 数据权限选择页面。
     * @return 数据权限选择
     */
    @RequestMapping(value = "/chooseDauthView")
    public String chooseDauthView() {
        return "sys/dauth/dauthChoose_view";
    }
    
    /**
     * 数据权限选择页面分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 数据权限选择分页数据。
     */
    @RequestMapping(value = "/chooseDauthList")
    @ResponseBody
    public Page<SysDauth> chooseDauthList(BasePage<SysDauth> pageInfo, SysDauth filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysDauthService.getPageList(pageInfo, filter));
    }
    
    /**
     * 据权限详情。
     * @return 数据权限详情
     */
    @RequestMapping(value = "/detailView")
    public String detailView() {
        return "sys/dauth/dauthDetail_view";
    }
    
    /**
     * 校验数据权限页面。
     * @param dauthId dauthId
     * @param request request
     * @return 校验数据权限页面
     */
    @RequestMapping(value = "/checkView/{dauthId}")
    public String checkView(@PathVariable long dauthId, HttpServletRequest request) {
        request.setAttribute("dauthId", dauthId);
        return "sys/dauth/dauthCheck_view";
    }
    
    /**
     * 校验数据权限。
     * @param dauthId dauthId
     * @param userId userId
     * @return 操作结果
     */
    @RequestMapping(value = "/checkDauth")
    @ResponseBody
    public OperationResult checkDauth(long dauthId, long userId) {
        OperationResult result = new OperationResult();
        try {
            result.setData(sysDauthService.parseDauth(dauthId, userId));
        } catch (DauthParseException e) {
            result.setSuccess(false);
            result.setErrorMsg(e.getMessage());
            log.error(e.getMessage(), e);
        }
        return result;
    }
    
    /**
     * 新增数据权限。
     * @param dauth dauth
     * @return 操作结果
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    @UserLog(code = "addDauth", name = "新增数据权限", engName = "addDauth")
    public OperationResult add(@HValidated SysDauth dauth) {
        sysDauthService.add(dauth);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改数据权限。
     * @param dauth dauth
     * @return 操作结果
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateDauth", name = "修改数据权限", engName = "updateDauth")
    public OperationResult update(@HValidated SysDauth dauth) {
        sysDauthService.update(dauth);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除一个数据权限。
     * @param dauthId dauthId
     * @return 操作结果
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteDauth", name = "删除数据权限", engName = "deleteDauth")
    public OperationResult delete(long dauthId) {
        sysDauthService.delete(dauthId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
}

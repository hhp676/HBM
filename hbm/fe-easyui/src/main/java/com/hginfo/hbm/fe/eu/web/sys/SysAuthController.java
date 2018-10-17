/**
 * Project Name:hbm-fe-easyui
 * File Name:SysAuthController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月20日上午10:21:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.eu.web.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysAuthJoin;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysAuthJoinService;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hbm.base.service.sys.SysModelService;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hbm.core.exception.BizException;
import com.hginfo.hbm.fe.core.entity.ComboTreeModel;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * ClassName:SysAuthController. <br/>
 * Date: 2016年12月20日 上午10:21:32 <br/>
 * @author yuqing
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysAuthMenu")
public class SysAuthController {
    
    /**
     * 
     */
    private Log             log = LogFactory.getLog(getClass());
    
    /**
     * 
     */
    private SysAuthService  sysAuthService;
    
    /**
     * 
     */
    private SysModelService sysModelService;
    
    /**
     * 
     */
    private SysDictService  sysDictService;
    
    /**
     * 
     */
    private SysAuthJoinService sysAuthJoinService;
    
    /**
     * 
     * showSysAuthManage:(功能权限列表主页). <br/>
     *
     * @author yuqing
     * @return string  
     * @since V1.0.0
     */
    @RequestMapping(value = "/view")
    public String showSysAuthManage() {
        return "sys/auth/authManage_view";
    }
    
    /**
     * toAuthManageViewTabs:(跳转到列表页面套用的tabs页面). <br/>
     * @author yinyanzhen
     * @return String
     * @since V1.0.0
     */
    @RequestMapping("/authManage_view_tabs")
    public String toAuthManageViewTabs() {
        return "sys/auth/authManage_view_tabs";
    }
    
    /**
     * 获取模块树. <br/>
     * @author yinyanzhen
     * @param currModelID 当前节点id,拼装树时,当前节点向下将被忽略掉
     * @return List<ComboTreeModel>
     * @since V1.0.0
     */
    @RequestMapping("/getModelTree")
    @ResponseBody
    public List<ComboTreeModel> getModelTree(Long currModelID) {
        SysModel sysModel = new SysModel();
        sysModel.setIsDelete(0);
        sysModel.setOrderStr("sm.MODEL_ID_");
        List<SysModel> modelList = sysModelService.getList(sysModel);
        //获取根节点
        List<ComboTreeModel> modelTreeList = new ArrayList<ComboTreeModel>();
        for (SysModel model:modelList) {
            if (currModelID != null && model.getId().equals(currModelID)) {
                continue;
            }
            if (model.getFid() == null) {
                ComboTreeModel treeModel = new ComboTreeModel(); 
                treeModel.setId(model.getModelId());
                treeModel.setText(model.getModelName());
                //设置子节点
                treeModel.setChildren(getSubModelList(currModelID, treeModel.getId(), modelList));
                modelTreeList.add(treeModel);
            }
        }
        return modelTreeList;
    }
    
    /**
     * getSubModelList:(获取子节点,递归向下). <br/>
     * @author yinyanzhen
     * @param currModelID 当前节点id,拼装树时,当前节点向下将被忽略掉
     * @param fID 父节点id
     * @param modelList 模块List
     * @return List<ComboTreeModel>
     * @since V1.0.0
     */
    private List<ComboTreeModel> getSubModelList(Long currModelID, Long fID, List<SysModel> modelList) {
        List<ComboTreeModel> list = new ArrayList<ComboTreeModel>();
        for (SysModel model : modelList) {
            if (currModelID != null && model.getId().equals(currModelID)) {
                continue;
            }
            if (model.getFid() != null && fID.longValue() == model.getFid().longValue()) {
                ComboTreeModel treeModel = new ComboTreeModel();
                treeModel.setId(model.getModelId());
                treeModel.setText(model.getModelName());
                //设置子节点
                treeModel.setChildren(getSubModelList(currModelID, treeModel.getId(), modelList));
                list.add(treeModel);
            }
        }
        return list;
    }
    
    /**
     * getSysAuthList:(获得功能权限列表). <br/>
     * @author yuqing
     * @param vo 
     * @return map   
     * @since V1.0.0
     */
    @RequestMapping("/list")
    @ResponseBody
    public Map getSysAuthList(final SysAuth vo) {
        return sysAuthService.getSysAuthList(vo);
    }
    
    /**
     * getUserAuthList:(获取指定用户的用户角色权限). <br/>
     * @author yinyanzhen
     * @param userId userId
     * @return Map
     * @since V1.0.0
     */
    @RequestMapping("/getUserAuthList")
    @ResponseBody
    public Map getUserAuthList(final Long userId)throws Exception {
        List<SysAuth> resultList = new ArrayList<>();
        if (userId != null) {
            resultList = sysAuthService.getUserAuthList(userId);
        }  
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", resultList);
        map.put("total", resultList.size());
        map.put("success", true);
        return map;
    }
    
    /**
     * getUserAuthList:(获取指定用户的负授权). <br/>
     * @author yinyanzhen
     * @param userId userId
     * @return Map
     * @since V1.0.0
     */
    @RequestMapping("/getUserNAuthList")
    @ResponseBody
    public Map getUserNAuthList(final Long userId)throws Exception {
        List<SysAuth> resultList = new ArrayList<>();
        if (userId != null) {
            resultList = sysAuthService.getUserNAuthList(userId);
        }  
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", resultList);
        map.put("total", resultList.size());
        map.put("success", true);
        return map;
    }
    
    @RequestMapping("/getRoleAuthList")
    @ResponseBody
    public Map getRoleAuthList(final Long roleId)throws Exception {
        List<SysAuth> resultList = new ArrayList<>();
        if (roleId != null) {
            resultList = sysAuthService.getRoleAuthList(roleId);
        }  
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", resultList);
        map.put("total", resultList.size());
        map.put("success", true);
        return map;
    }
    
    /**
     * 
     * showSysAuthDetail:(功能权限，增，改，查页面分发). <br/>
     *
     * @author yuqing
     * @param authType 权限类型 
     * @param authId   权限ID，当authID == 0时为新增 
     * @param fid      父类ID 
     * @param request 
     * @param response 
     * @param model 
     * @return string  
     * @throws BizException 
     * @since V1.0.0
     */
    @RequestMapping(value = "/detail/{authType}/{authId}/{fid}")
    public String showSysAuthDetail(@PathVariable final int authType, @PathVariable Long authId,
        @PathVariable Long fid, HttpServletRequest request, HttpServletResponse response,
        Model model) throws BizException {
        String forward = "";
        if (authType == SysAuthConstants.MODEL_TYPE) {
            SysModel sysModel = sysModelService.getSysModelById(authId);
            //新增
            if (authId == 0) {
                sysModel.setFid(fid);
            } else {
                fid = sysModel.getFid();
            }
            sysModel.setParent(sysModelService.getSysModelById(fid));
            model.addAttribute("modelObj", sysModel);
            model.addAttribute("logicMap", sysDictService.getItemList("trueOrFalse"));
            forward = "sys/model/sysModel_detail";
        } else if (authType == SysAuthConstants.AUTH_TYPE) {
            SysAuth sysAuth = sysAuthService.getSysAuthById(authId);
            if (authId == 0) {
                sysAuth.setFid(fid);
                sysAuth.setModelId(fid);
            } else {
                fid = sysAuth.getModelId();
            }
            sysAuth.setSysModel(sysModelService.getSysModelById(fid));
            model.addAttribute("authObj", sysAuth);
            model.addAttribute("logicMap", sysDictService.getItemList("trueOrFalse"));
            forward = "sys/auth/sysAuth_detail";
        }
        return forward;
    }
    
    /**
     * 
     * createSysAuth:(新增权限). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return  封装返回结果
     * @since V1.0.0
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    @UserLog(code = "createSysAuth", name = "新增权限", engName = "createSysAuth")
    public OperationResult createSysAuth(@HValidated SysAuth sysAuth) {
        sysAuthService.createSysAuth(sysAuth);
        return new OperationResult();
    }
    
    /**
     * 
     * updateSysAuth:(更新权限). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return  封装返回结果
     * @since V1.0.0
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @UserLog(code = "updateSysAuth", name = "修改权限", engName = "updateSysAuth")
    public OperationResult updateSysAuth(@HValidated SysAuth sysAuth) {
        sysAuthService.updateSysAuth(sysAuth);
        return new OperationResult();
    }
    
    /**
     * 
     * deleteSysAuth:(删除权限). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return   封装返回结果
     * @since V1.0.0
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    @UserLog(code = "deleteSysAuth", name = "删除权限", engName = "deleteSysAuth")
    public OperationResult deleteSysAuth(@HValidated SysAuth sysAuth) {
        Integer authType = sysAuth.getAuthShowType();
        if (authType == SysAuthConstants.AUTH_TYPE) {
            sysAuthService.deleteSysAuth(sysAuth);
        } else if (authType == SysAuthConstants.MODEL_TYPE) {
            sysModelService.deleteSysModel(sysAuth.getAuthId());
        }
        return new OperationResult();
    }
    
    /**
     * 
     * 校验权限，编码、URI，不能重复,不能存在包含关系. <br/>
     *
     * @author yuqing 
     * @param sysAuth  
     * @return  封装返回结果 
     * @since V1.0.0
     */
    @RequestMapping(value = "/checkForm")
    @ResponseBody
    public OperationResult checkForm(@HValidated SysAuth sysAuth) {
        // authCode uri 为空校验应该在前台已经校验
        Integer authShowType = sysAuth.getAuthShowType();
        String data = "";
        boolean isReCode = sysAuthService.checkAuthCode(sysAuth);
        if (!isReCode) {
            if (SysAuthConstants.AUTH_TYPE == authShowType) {
                data = "编码重复或存在包含关系!<br>";
            } else if (SysAuthConstants.MODEL_TYPE == authShowType) {
                data = "编码重复!";
            }
        }
        boolean isReUri = sysAuthService.checkUri(sysAuth);
        if (!isReUri) {
            if (StringUtils.isNotEmpty(data)) {
                data = data + "";
            }
            if (SysAuthConstants.AUTH_TYPE == authShowType) {
                data = data + "URI重复或存在包含关系!";
            } else if (SysAuthConstants.MODEL_TYPE == authShowType) {
                data = data + "URI重复!";
            }
        }
        OperationResult result = new OperationResult();
        result.setData(data);
        result.setSuccess(isReCode && isReUri);
        return result;
    }
    
    /**
     * 
     * checkAuthRelation:(校验模块或权限是否与角色，用户绑定). <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @return  封装返回结果
     * @since V1.0.0
     */
    @RequestMapping(value = "/checkAuthRelation")
    @ResponseBody
    public OperationResult checkAuthRelation(@HValidated SysAuth sysAuth) {
        String data = "";
        boolean hasRelation = false;
        Long authId = sysAuth.getAuthId();
        if (SysAuthConstants.AUTH_TYPE == sysAuth.getAuthShowType()) {
            hasRelation = sysAuthService.checkAuthRelation(authId);
            if (hasRelation) {
                data = "该权限有关联关系绑定，不允许删除!";
            }
        } else if (SysAuthConstants.MODEL_TYPE == sysAuth.getAuthShowType()) {
            hasRelation = sysAuthService.checkModelRelation(authId);
            if (hasRelation) {
                data = "该模块下有相应模块或权限，不允许删除!";
            }
        }
        OperationResult result = new OperationResult();
        result.setData(data);
        result.setSuccess(!hasRelation);
        return result;
    }
    
    /**
     * 权限选择框。
     * @param request request
     * @param response response
     * @param model model
     * @return page
     * @since V1.0.0
     */
    @RequestMapping(value = "/authManageDialogView")
    public String authManageDialogView(HttpServletRequest request, HttpServletResponse response,
        Model model) {
        model.addAttribute("queryString", request.getQueryString());
        model.addAttribute("id", request.getParameter("id"));
        return "sys/auth/authManageDialog_view";
    }
    
    /**
     * 
     * 关于弹出框. <br/>
     *
     * @author yuqing
     * @param sysAuth 
     * @param request 
     * @param response 
     * @param model 
     * @return biz_about
     * @since V1.0.0
     */
    @RequestMapping(value = "/aboutDialogView")
    public String aboutDialogView(SysAuth sysAuth, HttpServletRequest request,
        HttpServletResponse response, Model model) {
        Integer authShowType = sysAuth.getAuthShowType();
        Long authId = sysAuth.getAuthId();
        if (SysAuthConstants.AUTH_TYPE == authShowType) {
            model.addAttribute("biz", sysAuthService.getSysAuthById(authId));
        } else if (SysAuthConstants.MODEL_TYPE == authShowType) {
            model.addAttribute("biz", sysModelService.getSysModelById(authId));
        }
        return "sys/biz_about";
    }
    
    
    /**
     * 主附属权限关联页面。
     * @param authCategory 1:主权限设置附属权限  2：附属权限设置主权限
     * @param map map
     * @return mainAttachAuthJoin_view
     */
    @RequestMapping(value = "/mainAttachAuthJoinView/{authCategory}")
    public String mainAuthJoinAttachAuthView(@PathVariable int authCategory, ModelMap map) {
        map.put("type", authCategory);
        return "sys/auth/mainAttachAuthJoin_view";
    }
    
    /**
     * 主附权限关联分页数据。
     * @param pageInfo 分页信息
     * @param filter 查询条件
     * @return 主附权限关联分页数据。
     */
    @RequestMapping(value = "/authJoinList")
    @ResponseBody
    public Page<SysAuthJoin> authJoinList(BasePage<SysAuthJoin> pageInfo, SysAuthJoin filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysAuthJoinService.getMainAuthPageList(pageInfo, filter, "attachSysAuth", "mainSysAuth"));
    }
    
    /**
     * 选择权限页面。
     * @param type 1:主权限设置附属权限  2：附属权限设置主权限
     * @param authId type=1:主权限Id type=2:附属权限Id
     * @param map 
     * @return chooseMainAttachAuth_view
     */
    @RequestMapping(value = "/chooseMainAttachAuthView")
    public String chooseMainAttachAuthView(int type, long authId, ModelMap map) {
        map.put("type", type);
        map.put("authId", authId);
        return "sys/auth/chooseMainAttachAuth_view";
    }
    
    /**
     * 获得功能权限列表.
     * @param authCategory 1:主权限列表  2：附属权限列表
     * @return map   
     * @since V1.0.0
     */
    @RequestMapping("/chooseMainAttachAuthList")
    @ResponseBody
    public Map chooseMainAttachAuthList(int authCategory) {
        SysAuth vo = new SysAuth();
        vo.setAuthCategory(authCategory);
        return sysAuthService.getSysAuthList(vo);
    }
    
    /**
     * 主附权限已关联分页数据。
     * @param type 1:主权限设置附属权限  2：附属权限设置主权限
     * @param authId type=1:主权限Id type=2:附属权限Id
     * @return 主附权限关联分页数据。
     */
    @RequestMapping(value = "/getMainAttachJoinedList")
    @ResponseBody
    public List<SysAuthJoin> getMainAttachJoinedList(int type, long authId) {
        SysAuthJoin vo  = new SysAuthJoin();
        if (type == 1) {
            vo.setMainAuthId(authId);
        } else {
            vo.setAttachAuthId(authId);
        }
        
        return sysAuthJoinService.getList(vo);
    }
    
    /**
     * 
     * 保存主权限关联附属权限列表. <br/>
     * @param mainAuthId 主权限Id
     * @param attachAuthIds 附属权限Id数组
     * @return OperationResult 
     */
    @RequestMapping(value = "/saveMainAuthJoinList")
    @ResponseBody
    @UserLog(code = "saveMainAuthJoinList", name = "保存主权限关联附属权限列表", engName = "saveMainAuthJoinList")
    public OperationResult saveMainAuthJoinList(Long mainAuthId, Long[] attachAuthIds) {
        sysAuthJoinService.saveMainAuthJoinList(mainAuthId, attachAuthIds);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 
     * 保存附属权限关联主权限列表. <br/>
     * @param attachAuthId 附属权限Id
     * @param mainAuthIds 主权限Id数组
     * @return OperationResult 
     */
    @RequestMapping(value = "/saveAttachAuthJoinList")
    @ResponseBody
    @UserLog(code = "saveAttachAuthJoinList", name = "保存附属权限关联主权限列表", engName = "saveAttachAuthJoinList")
    public OperationResult saveAttachAuthJoinList(Long attachAuthId, Long[] mainAuthIds) {
        sysAuthJoinService.saveAttachAuthJoinList(attachAuthId, mainAuthIds);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 
     * 批量删除主附权限关联. <br/>
     * @param joinIds 权限关联Id数组
     * @return OperationResult 
     */
    @RequestMapping(value = "/deleteBatchAuthJoin")
    @ResponseBody
    @UserLog(code = "deleteBatchAuthJoin", name = "批量删除主附权限关联", engName = "deleteBatchAuthJoin")
    public OperationResult deleteBatchAuthJoin(Long[] joinIds) {
        sysAuthJoinService.deleteBatch(joinIds);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 获取权限选择框全部数据。
     * @param request request
     * @return map
     * @since V1.0.0
     */
    @RequestMapping(value = "/authManageDialogList")
    @ResponseBody
    public Map authManageDialogList(HttpServletRequest request) {
        return sysAuthService.getAuthManageDialogList();
    }
    
    /**
     * 
     * showSysAuthManage:(功能权限列表主页). <br/>
     *
     * @author yuqing
     * @return string  
     * @since V1.0.0
     */
    @RequestMapping(value = "/menuset_view")
    public String menuset_view() {
        return "sys/auth/menuSet_view";
    }
    
    /**
     * 
     * 获得菜单树. <br/>
     *
     * @author yuqing
     * @param vo vo
     * @param response response
     * @param request request
     * @return Map Map
     * @since V1.0.0
     */
    @RequestMapping("/treeList")
    @ResponseBody
    public Map getMenuTreeList(final SysAuth vo, HttpServletResponse response,
        HttpServletRequest request) {
        return sysAuthService.getMenuTreeList(vo);
    }
    
    /**
     * 获取已授权的数据列表。
     * @param request request
     * @param filter filter
     * @return map
     * @since V1.0.0
     */
    @RequestMapping(value = "/getGrantedAuthList")
    @ResponseBody
    public List<SysAuth> getGrantedAuthList(HttpServletRequest request, SysUserAuth filter) {
        List<SysAuth> selectedAuths = new ArrayList<>();
        String roleId = request.getParameter("roleId");
        if (roleId != null) {
            selectedAuths = sysAuthService.getAuthsByRole(Long.parseLong(roleId));
        } else if (filter != null && filter.getUserId() != null) {
            selectedAuths = sysAuthService.getAuthsByUser(filter.getUserId(), filter.getAuthType());
        }
        //TODO
        return selectedAuths;
    }
    
    /**
     * 获取某一个用户的全部角色权限列表。
     * @param request request
     * @param filter filter
     * @return map
     * @since V1.0.0
     */
    @RequestMapping(value = "/getGrantedRoleAuthList")
    @ResponseBody
    public List<SysAuth> getGrantedRoleAuthList(HttpServletRequest request, SysUserRole filter) {
        List<SysAuth> selectedAuths = new ArrayList<>();
        selectedAuths = sysAuthService.getAllRoleAuthsByUser(filter.getUserId());
        return selectedAuths;
    }
    
    /**
     * updateMenuSet:(保存首页Menu设置). <br/>
     * @author yinyanzhen
     * @param sysAuthJson sysAuthJson
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping(value = "/updateMenuSet")
    @ResponseBody
    @UserLog(code = "updateMenuSet", name = "保存首页Menu设置", engName = "updateMenuSet")
    public OperationResult updateMenuSet(final String sysAuthJson) {
        List list = JSONArray.parseArray(sysAuthJson.replace("&quot;", "\""));
        sysAuthService.updateMenuSet(list);
        return new OperationResult();
    }
    
    public SysAuthService getSysAuthService() {
        return sysAuthService;
    }
    
    @HReference
    public void setSysAuthService(SysAuthService sysAuthService) {
        this.sysAuthService = sysAuthService;
    }
    
    public SysModelService getSysModelService() {
        return sysModelService;
    }
    
    @HReference
    public void setSysModelService(SysModelService sysModelService) {
        this.sysModelService = sysModelService;
    }
    
    public SysDictService getSysDictService() {
        return sysDictService;
    }
    
    @HReference
    public void setSysDictService(SysDictService sysDictService) {
        this.sysDictService = sysDictService;
    }

    public SysAuthJoinService getSysAuthJoinService() {
        return sysAuthJoinService;
    }

    @HReference
    public void setSysAuthJoinService(SysAuthJoinService sysAuthJoinService) {
        this.sysAuthJoinService = sysAuthJoinService;
    }
    
    
    
}

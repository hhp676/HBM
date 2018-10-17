/*
 * Project Name:hbm-be.
 * File Name:SysAuthServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.service.sys.SysAuthService;
import com.hginfo.hbm.base.utils.CollectionsUtil;
import com.hginfo.hbm.be.dao.sys.SysAuthDao;
import com.hginfo.hbm.be.dao.sys.SysModelDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.cache.CacheUtils;
import com.hginfo.hbm.core.constants.CacheConstants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.be.service.prop.CascadePropLoadUtil;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hbm.core.utils.SysAuthUtil;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
* 系统权限表: sys_auth. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysAuthServiceImpl extends BizService<SysAuth, SysAuthDao> implements SysAuthService {
    /**
     */
    private Log log = LogFactory.getLog(getClass());
    /**
     * 
     */
    private final String allAuthListCacheKey = "allAuthList";
    /**
     */
    private SysAuthDao sysAuthDao;
    /**
     */
    private SysModelDao sysModelDao;
    /**
     */
    private SysRoleServiceImpl sysRoleServiceImpl;
    /**
     */
    private SysUserServiceImpl sysUserServiceImpl;
    /**
     * 
     */
    private SysOperationServiceImpl sysOperationServiceImpl;
    
    /**
     * 根据权限ID获得实体.
     * @see com.hginfo.hbm.base.service.sys.SysAuthService#getSysAuthById(java.lang.Long)
     */
    @Override
    public SysAuth getSysAuthById(Long authId) {
        if (authId == 0) {
            return new SysAuth();
        }
        return super.get(authId);
    }
    
    
    @SuppressWarnings("unchecked")
    @Override
    public List<SysAuth> getAllAuthList() {
        List<SysAuth> allAuthList = CacheUtils.get(CacheConstants.SYS_AUTH, allAuthListCacheKey, List.class);
        if (allAuthList == null) {
            allAuthList = resetAuthList();
        }
        return allAuthList;
    }

    /**
     * 重置缓存列表。
     * @return List<SysAuth> 权限列表
     */
    private List<SysAuth> resetAuthList() {
        List<SysAuth> allAuthList = this.getList(new SysAuth());
        CacheUtils.cache(CacheConstants.SYS_AUTH, allAuthListCacheKey, allAuthList);
        return allAuthList;
    }
    
    /**
     * 
     * 获得权限树集合.
     */
    @Override
    public Map getSysAuthList(SysAuth vo) {
        //查询从两个表里查，一个是模块表，一个 权限表
        //获得所有权限，递归查找上层模块时使用
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(vo.getAuthCategory());
        List<SysAuth> resultList = new ArrayList<>();
        Map<Long, SysAuth> resultMap = new HashMap<>();
        //遍历查询权限集合
        vo.setIsDelete(0);
        if (vo.getAuthShowType() == null || SysAuthConstants.AUTH_TYPE == vo.getAuthShowType()) {
            searchAuthList(vo, listAll, resultMap);
        }
        //遍历查询模块集合
        if (vo.getAuthShowType() == null || SysAuthConstants.MODEL_TYPE == vo.getAuthShowType()) {
            searchModelList(vo, listAll, resultMap);
        }
        //权限模块加样式
        formatList(resultMap, resultList);

        Map<String, Object> map = new HashMap<>();
        map.put("rows", resultList);
        map.put("total", resultList.size());
        map.put("success", true);
        return map;
    }
    
    @Override
    public List<SysAuth> getUserAuthList(Long userID) {
        SysAuth vo = new SysAuth();
        vo.setAuthCategory(1);
        //获得所有权限，递归查找上层模块时使用
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(vo.getAuthCategory());
        List<SysAuth> resultList = new ArrayList<>();
        Map<Long, SysAuth> resultMap = new HashMap<>();
        //遍历查询权限集合
        vo.setIsDelete(0);
        List<SysAuth> authList = sysAuthDao.queryUserAuths(userID);

        //排除负授权
        SysUserAuth sysUserAuth = new SysUserAuth();
        sysUserAuth.setUserId(userID);
        sysUserAuth.setAuthType(-1);
        List<SysAuth> nAuthList = sysAuthDao.getAuthsByUser(sysUserAuth);
        authList.removeIf(auth -> {
            return nAuthList.stream().anyMatch(nAuth -> nAuth.getAuthId().equals(auth.getAuthId()));
        });

        fetchAuthParent(listAll, resultMap, authList);
        //权限模块加样式
        formatList(resultMap, resultList);
        return resultList;
    }

    @Override
    public List<SysAuth> getUserPAuthList(Long userID) {
        SysAuth vo = new SysAuth();
        vo.setAuthCategory(1);
        //获得所有权限，递归查找上层模块时使用
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(vo.getAuthCategory());
        List<SysAuth> resultList = new ArrayList<>();
        Map<Long, SysAuth> resultMap = new HashMap<>();
        //遍历查询权限集合
        vo.setIsDelete(0);
        List<SysAuth> authList = sysAuthDao.queryUserAuths(userID);

        fetchAuthParent(listAll, resultMap, authList);
        //权限模块加样式
        formatList(resultMap, resultList);
        return resultList;
    }

    @Override
    public List<SysAuth> getUserNAuthList(Long userID) {
        //获得所有权限，递归查找上层模块时使用
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(1);
        SysUserAuth sysUserAuth = new SysUserAuth();
        sysUserAuth.setUserId(userID);
        sysUserAuth.setAuthType(-1);
        List<SysAuth> authList = sysAuthDao.getAuthsByUser(sysUserAuth);
        
        Map<Long, SysAuth> resultMap = new HashMap<>();
        List<SysAuth> resultList = new ArrayList<>();
        //遍历查询权限集合
        fetchAuthParent(listAll, resultMap, authList);
        //权限模块加样式
        formatList(resultMap, resultList);
        
        return resultList;
    }
    
    @Override
    public List<SysAuth> getRoleAuthList(Long roleId) {
        //获得所有权限，递归查找上层模块时使用
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(1);
        List<SysAuth> roleAuthList = sysAuthDao.getAuthsByRoles(new Long[]{roleId});
        
        Map<Long, SysAuth> resultMap = new HashMap<>();
        List<SysAuth> resultList = new ArrayList<>();
        //遍历查询权限集合
        fetchAuthParent(listAll, resultMap, roleAuthList);
        //权限模块加样式
        formatList(resultMap, resultList);
        
        return resultList;
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Map getSysAuthListByUserId(Long userId) {
        
        List<SysAuth> resultList = new ArrayList<>();
        Map<Long, SysAuth> resultMap = new HashMap<>();
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(SysAuthConstants.AUTH_CATEGORY_MAIN);
        List<SysAuth> userAuthList = sysUserServiceImpl.getAllSysAuth(SysAuthConstants.AUTH_USER_AUTH_MAIN, userId);

        fetchAuthParent(listAll, resultMap, userAuthList);
        formatList(resultMap, resultList);
        
        Map<String, Object> map = new HashMap<>();
        map.put("rows", resultList);
        map.put("total", resultList.size());
        map.put("success", true);
        return map;
    }

    /**
     * 
     * sysAuth2SysModel:(将sysAuth实体转化为SysModel查询实体). <br/>
     *
     * @author yuqing
     * @param sysAuth  sysAuth
     * @return sysModel  
     * @since V1.0.0
     */
    private SysModel sysAuth2SysModel(SysAuth sysAuth) {
        SysModel sysModel = new SysModel();
        sysModel.setModelId(sysAuth.getAuthId());
        sysModel.setModelName(sysAuth.getAuthName());
        sysModel.setModelCode(sysAuth.getAuthCode());
        sysModel.setEngName(sysAuth.getEngName());
        sysModel.setI18nCode(sysAuth.getI18nCode());
        sysModel.setIconId(sysAuth.getIconId());
        sysModel.setStyle(sysAuth.getStyle());
        sysModel.setUri(sysAuth.getUri());
        sysModel.setTip(sysAuth.getTip());
        sysModel.setDescr(sysAuth.getDescr());
        sysModel.setIsDelete(sysAuth.getIsDelete());
        sysModel.setModelCodeLike(sysAuth.getAuthCodeLike());
        sysModel.setUriLike(sysAuth.getUriLike());
        return sysModel;
        
    }
    
    /**
     * 
     * sysModel2SysAuth:(将SysModel实体转化为SysAuth列表页实体). <br/>
     *
     * @author yuqing
     * @param sysModel  sysModel
     * @return sysAuth  
     * @since V1.0.0
     */
    private SysAuth sysModel2SysAuth(SysModel sysModel) {
        SysAuth sysAuth = new SysAuth();
        sysAuth.setAuthId(sysModel.getModelId());
        sysAuth.setAuthName(sysModel.getModelName());
        sysAuth.setAuthCode(sysModel.getModelCode());
        sysAuth.setEngName(sysModel.getEngName());
        sysAuth.setI18nCode(sysModel.getI18nCode());
        sysAuth.setIconId(sysModel.getIconId());
        sysAuth.setStyle(sysModel.getStyle());
        sysAuth.setUri(sysModel.getUri());
        sysAuth.setTip(sysModel.getTip());
        sysAuth.setDescr(sysModel.getDescr());
        sysAuth.setAuthShowType(SysAuthConstants.MODEL_TYPE);
        sysAuth.setSortNo(sysModel.getSortNo());
        sysAuth.setFid(sysModel.getFid());
        sysAuth.setIsTopMenu(sysModel.getIsTopMenu());
        sysAuth.setIsSubMenu(sysModel.getIsSubMenu());
        sysAuth.setIsBsTopMenu(sysModel.getIsBsTopMenu());
        sysAuth.setIsBsSubMenu(sysModel.getIsBsSubMenu());
        return sysAuth;
        
    }
    
    /**
     * 
     * recurGetParentAuth:(递归查找上层模块). <br/>
     *
     * @author yuqing
     * @param authFid       authFid
     * @param listAll       listAll
     * @param resultMap     resultMap
     * @since V1.0.0
     */
    private void recurGetParentAuth(Long authFid, List<SysAuth> listAll,
        Map<Long, SysAuth> resultMap) {
        if (authFid != null) {
            for (SysAuth auth : listAll) {
                if (auth.getAuthId() == authFid.longValue()) {
                    resultMap.putIfAbsent(authFid, auth);
                    if (auth.getFid() != null) {
                        recurGetParentAuth(auth.getFid(), listAll, resultMap);
                    }
                    
                }
            }
        }
    }
    
    /**
     * 
     * formatList:(页面初始化数据和高级查询数据的公共方法). <br/>
     *
     * @author yuqing
     * @param resultMap     resultMap
     * @param resultList    resultList
     * @since V1.0.0
     */
    private void formatList(Map<Long, SysAuth> resultMap, List<SysAuth> resultList) {
        for (Map.Entry<Long, SysAuth> entry : resultMap.entrySet()) {
            if (entry.getValue().getAuthShowType() == SysAuthConstants.MODEL_TYPE) { // 模块权限
                entry.getValue().setIconCls(SysAuthConstants.MODEL_STYLE);
            } else if (entry.getValue().getAuthShowType() == SysAuthConstants.AUTH_TYPE) { // 操作权限
                entry.getValue().setIconCls(SysAuthConstants.AUTH_STYLE);
            }
            resultList.add(entry.getValue());
        }
        resultList.sort(Comparator.comparingInt(SysAuth::getSortNo));
    }
    
    @Override
    public void createSysAuth(SysAuth sysAuth) {
        super.add(sysAuth);
        resetAuthList();
    }
    
    @Override
    public void updateSysAuth(SysAuth sysAuth) {
        super.update(sysAuth);
        resetAuthList();
    }
    
    @Override
    public void deleteSysAuth(SysAuth sysAuth) {
        super.delete(sysAuth.getAuthId());
        resetAuthList();
    }
    
    @Override
    public boolean checkUri(SysAuth sysAuth) {
        //判断是否允许
        boolean isPermitted = true;
        //获得查询URI
        String uri = sysAuth.getUri();
        if (StringUtils.isNotEmpty(uri)) {
            Integer authShowType = sysAuth.getAuthShowType();
            SysModel sysModel = sysAuth2SysModel(sysAuth);
            //将统配符替换成字条
            String urit1 = uri.replace("%d", "wildcard").replace("%s", "wildcard");
            sysAuth.setUri(urit1);
            //判断有没有相同的URI
            if (SysAuthConstants.AUTH_TYPE == authShowType) {
                isPermitted = sysAuthDao.getEqAndContainURI(sysAuth) == 0;
            } else if (SysAuthConstants.MODEL_TYPE == authShowType) {
                isPermitted = sysModelDao.getEqAndContainURI(sysModel) == 0;
            }
            //允许  再判断是否有包含关系
            if (isPermitted) {
                //取得所有URI
                List<SysAuth> list = null;
                if (SysAuthConstants.AUTH_TYPE == authShowType) {
                    list = sysAuthDao.getPreUriList(sysAuth);
                } else if (SysAuthConstants.MODEL_TYPE == authShowType) {
                    list = sysModelDao.getPreUriList(sysModel);
                }
                
                isPermitted = checkUriPermited(uri, list);
            }
        }
        
        return isPermitted;
    }
    
    @Override
    public boolean checkAuthCode(SysAuth sysAuth) {
        boolean isCheck = true;
        if (SysAuthConstants.AUTH_TYPE == sysAuth.getAuthShowType()) {
            isCheck = sysAuthDao.getEqAndContainCode(sysAuth) == 0;
        } else if (SysAuthConstants.MODEL_TYPE == sysAuth.getAuthShowType()) {
            if (StringUtils.isNotEmpty(sysAuth.getAuthCode())) {
                SysModel sysModel = sysAuth2SysModel(sysAuth);
                isCheck = sysModelDao.getEqAndContainCode(sysModel) == 0;
            }
        }
        return isCheck;
    }
    
    @Override
    public boolean checkAuthRelation(Long authId) {
        return sysAuthDao.checkAuthRelation(authId) != 0;
    }
    
    @Override
    public boolean checkModelRelation(Long authId) {
        SysAuth sysAuth = new SysAuth();
        sysAuth.setModelId(authId);
        sysAuth.setIsDelete(0);
        int authCnt = sysAuthDao.getListCount(sysAuth);
        log.debug("sysauth count : " + authCnt);
        SysModel sysModel = new SysModel();
        sysModel.setFid(authId);
        sysModel.setIsDelete(0);
        int modelCnt = sysModelDao.getListCount(sysModel);
        log.debug("sysmodel count : " + modelCnt);
        return (authCnt + modelCnt) != 0;
    }
    
    @Override
    public List<SysAuth> getAuthsByRole(Long roleId) {
        return getAuthsByRoles(new Long[] {roleId });
    }
    
    @Override
    public List<SysAuth> getAuthsByRoles(Long[] roleIds) {
        return sysAuthDao.getAuthsByRoles(roleIds);
    }
    
    @Override
    public List<SysAuth> getAuthsByUser(Long userId, Integer authType) {
        SysUserAuth filter = new SysUserAuth();
        filter.setUserId(userId);
        filter.setAuthType(authType);
        return sysAuthDao.getAuthsByUser(filter);
    }
    
    @Override
    public List<SysAuth> getAllRoleAuthsByUser(Long userId) {
        Long[] roleIds;
        List<SysAuth> auths = new ArrayList<>();
        List<SysRole> roles = sysRoleServiceImpl.getRolesByUser(userId);
        List<Long> roleIdList = roles.stream().map(SysRole::getRoleId).collect(Collectors.toList());
        if (roleIdList != null && !roleIdList.isEmpty()) {
            roleIds = roleIdList.toArray(new Long[roleIdList.size()]);
            auths = getAuthsByRoles(roleIds);
            auths.forEach(auth -> CascadePropLoadUtil.loadProps(auth, "sysRole"));
        }
        return auths;
    }
    
    /**
     * 获取主权限选择框全部数据。
     * @return Map Map
     */
    @Override
    public Map getAuthManageDialogList() {
        SysAuth vo = new SysAuth();
        vo.setAuthCategory(SysAuthConstants.AUTH_CATEGORY_MAIN);
        return getSysAuthList(vo);
    }
    
    @Override
    public List<SysModel> getMenuNavigationList(String url) {
        List<SysModel> authlist = null;
        if (StringUtils.isNotEmpty(url)) {
            //1、与 所有没有通配符的权限进行比较，如果有匹配的 返回SysAuth
            SysAuth curAuth = getPurMatchSysAuth(url);
            //2、如果没有，获得所有有通配符的权限列表，进行正则比较，返回SysAuth
            if (null == curAuth) {
                curAuth = getRegMatchSysAuth(url);
            }
            //3、根据SysAuth的modelId反查模块表，获得模块层级关系
            if (null != curAuth) {
                authlist = createSysModelNavBySysAuth(curAuth);
            }
        }
        return authlist;
    }
    
    /**
     * 
     * 根据SysAuth的modelId反查模块表，获得模块层级关系. <br/>
     *
     * @author yuqing
     * @param sysAuth  sysAuth
     * @return 按层级由高到低返回集合 
     * @since V1.0.0
     */
    private List<SysModel> createSysModelNavBySysAuth(SysAuth sysAuth) {
        List<SysModel> retSysModelList = new ArrayList<>();
        SysModel sysModel = sysModelDao.getById(sysAuth.getModelId());
        retSysModelList.add(sysModel);
        Long fid = sysModel.getFid();
        while (null != fid) {
            SysModel fSysModel = sysModelDao.getById(fid);
            if (null != fSysModel) {
                retSysModelList.add(fSysModel);
                fid = fSysModel.getFid();
            } else {
                fid = null;
            }
        }
        Collections.reverse(retSysModelList);
        return retSysModelList;
    }
    
    /**
     * 
     * 与 所有没有通配符的权限进行比较，如果有匹配的 返回SysAuth. <br/>
     *
     * @author yuqing
     * @param url url
     * @return SysAuth  
     * @since V1.0.0
     */
    private SysAuth getPurMatchSysAuth(String url) {
        SysAuth querySysAuth = new SysAuth();
        querySysAuth.setUri(url);
        SysAuth retAuth = null;
        List<SysAuth> sysList = sysAuthDao.getList(querySysAuth);
        if (CollectionUtils.isNotEmpty(sysList)) {
            retAuth = sysList.get(0);
        }
        return retAuth;
    }
    
    /**
     * 
     * 获得所有有通配符的权限列表，进行正则比较，如果有返回SysAuth. <br/>
     *
     * @author yuqing
     * @param url url
     * @return SysAuth 
     * @since V1.0.0
     */
    private SysAuth getRegMatchSysAuth(String url) {
        SysAuth querySysAuth = new SysAuth();
        querySysAuth.setFilterStr(" AND sa.URI_ LIKE '%@%%' ESCAPE '@' ");
        List<SysAuth> curUserAuthList = sysAuthDao.getList(querySysAuth);
        SysAuth retAuth = null;
        for (SysAuth sysAuth : curUserAuthList) {
            String authUri = sysAuth.getUri();
            if (StringUtils.isNotBlank(authUri)) {
                if (SysAuthUtil.checkRegex(authUri, url)) {
                    retAuth = sysAuth;
                    log.debug("success authuri : " + authUri);
                    break;
                }
            }
        }
        return retAuth;
    }
    
    @Override
    public Map getMenuTreeList(SysAuth sysAuth) {
        if (null == sysAuth) {
            sysAuth = new SysAuth();
        }
        sysAuth.setAuthShowType(SysAuthConstants.MODEL_TYPE);
        sysAuth.setIsDelete(0);
        return getMenuSetTree(sysAuth);
        
    }
    
    @Override
    public void updateMenuSet(List sysAuthList) {
        SysModel sysModel = new SysModel();
        for (Object sysAuthJson : sysAuthList) {
            if (null != sysAuthJson) {
                JSONObject sysAuth = JSON.parseObject(sysAuthJson.toString());
                sysModel.setModelId(sysAuth.getLong("authId"));
                sysModel.setIsSubMenu(sysAuth.getInteger("isSubMenu"));
                sysModel.setIsTopMenu(sysAuth.getInteger("isTopMenu"));
                sysModel.setIsBsSubMenu(sysAuth.getInteger("isBsSubMenu"));
                sysModel.setIsBsTopMenu(sysAuth.getInteger("isBsTopMenu"));
                sysModelDao.update(sysModel);
            }
        }
    }
    
    /**
     * 
     * 获得MenuSet树集合.
     * @param vo vo
     * @return map
     */
    private Map getMenuSetTree(SysAuth vo) {
        List<SysAuth> listAll = sysAuthDao.getAllSysAuthAndModel(SysAuthConstants.AUTH_CATEGORY_MAIN);
        List<SysAuth> resultList = new ArrayList<>();
        Map<Long, SysAuth> resultMap = new HashMap<>();
        //遍历查询模块集合
        if (null == vo || null == vo.getAuthShowType()
            || SysAuthConstants.MODEL_TYPE == vo.getAuthShowType()) {
            searchMenuModelList(vo, listAll, resultMap);
        }
        //权限模块加样式
        formatList(resultMap, resultList);

        Map<String, Object> map = new HashMap<>();
        map.put("rows", resultList);
        map.put("total", resultList.size());
        map.put("success", true);
        return map;
    }
    
    /**
     * 
     * MENU设置查询. <br/>
     *
     * @author yuqing
     * @param sysAuth sysAuth
     * @param listAll  listAll
     * @param resultMap  resultMap
     * @since V1.0.0
     */
    private void searchMenuModelList(SysAuth sysAuth, List<SysAuth> listAll,
        Map<Long, SysAuth> resultMap) {
        SysModel searchModel = sysAuth2SysModel(sysAuth);
        Long level = sysAuth.getFid();
        if (level == null) {
            fetchModelAuth(listAll, resultMap, sysModelDao.getList(searchModel));
        } else {
            menuSetTreeLevelSearch(searchModel, level, resultMap, listAll);
        }
    }
    
    /**
     * 
     * 首页MENU配置，有层级树查询. <br/>
     *
     * @author yuqing
     * @param searchModel  search
     * @param level       level
     * @param resultMap  resultMap
     * @param listAll    listAll
     * @since V1.0.0
     */
    private void menuSetTreeLevelSearch(SysModel searchModel, Long level,
                                        Map<Long, SysAuth> resultMap, List<SysAuth> listAll) {
        String modelName = searchModel.getModelName();
        //不是一级查询，不需要查模块名称，只需要找到fid
        if (1 != level) {
            searchModel.setModelName(null);
        }
        SysModel sysModel = sysModelDao.getTopModel(searchModel);
        if (null != sysModel) {
            SysAuth sms = sysModel2SysAuth(sysModel);
            if (1 == level) {
                resultMap.put(sms.getAuthId(), sms);
            }
            Long tempFid = sms.getAuthId();
            String searchFid = tempFid.toString();
            for (int i = 1; i < level.intValue(); i++) {
                searchModel.setFids(searchFid);
                //查询几级，在查询到相应层级时，添加查询模块名称
                if (i == level.intValue() - 1) {
                    searchModel.setModelName(modelName);
                }
                List<SysModel> sysModelList = sysModelDao.getSubMenu(searchModel);

                StringBuilder fidBuilder = new StringBuilder();

                for (SysModel sm : sysModelList) {
                    fidBuilder.append(sm.getModelId()).append(",");

                    SysAuth sms1 = sysModel2SysAuth(sm);
                    if (i == level.intValue() - 1) {
                        resultMap.put(sms1.getAuthId(), sms1);
                        if (sms1.getFid() != null) {
                            recurGetParentAuth(sms1.getFid(), listAll, resultMap);
                        }
                    }
                }
                if (fidBuilder.length() > 0) {
                    fidBuilder.setLength(fidBuilder.length() - 1);
                }
                searchFid = fidBuilder.toString();
            }
        }
    }
    
    /***
     * 动态展示配置图标. <br/>
     * 
     * @author zhangdianbo
     * @param authCode authCode
     * @since V1.0.0
     */
    @Override
    public String getIconCss(String authCode) {
        SysAuth sysAuth = new SysAuth();
        sysAuth.setAuthCode(authCode);
        List<SysAuth> authList = sysAuthDao.getList(sysAuth);
        if (authList.size() != 0) {
            return authList.get(0).getStyle();
        } else {
            return "";
        }
    }

    /**
     * uris与已有的权限uri的匹配，是否允许保存。
     * @param uris 需要校验的uri
     * @param list 权限list
     * @return 是否允许保存 true:允许  false:不允许
     */
    private boolean checkUriPermited(String uris, List<SysAuth> list) {
        if (StringUtils.isEmpty(uris)) {
            return false;
        }
        //允许  再判断是否有包含关系
        String[] uriArray = uris.split(SysAuthConstants.AUTH_URI_SEPARATOR);
        for (String uri : uriArray) {
            if (StringUtils.isBlank(uri)) {
                continue;
            }
            uri = uri.trim();
            for (SysAuth sa : list) {
                //已经存在的URI
                String authUris = null == sa ? "" : sa.getUri();
                if (StringUtils.isBlank(authUris)) {
                    continue;
                }

                String[] authUriArray = authUris.split(SysAuthConstants.AUTH_URI_SEPARATOR);
                for (String authUri : authUriArray) {
                    if (StringUtils.isBlank(authUri)) {
                        continue;
                    }
                    authUri = authUri.trim();
                    if (authUri.contains(SysAuthConstants.DIGIT_WILDCARD)
                            || authUri.contains(SysAuthConstants.STRING_WILDCARD)) {
                        //存在通配符的 根据正则表达式判断
                        String checkUri = uri.replace("%d", "1").replace("%s", "wildcard");
                        if (SysAuthUtil.checkRegex(authUri, checkUri)) {
                            log.debug("checkRege " + uri + " and " + authUri);
                            return false;
                        }
                    } else {
                        //原权限没有通配符的
                        //看新增的有没有通配符，根据正则表达式判断
                        if (uri.indexOf("%") > 0) {
                            // 存在通配符的 根据正则表达式判断
                            if (SysAuthUtil.checkRegex(uri, authUri)) {
                                log.debug("checkRege " + uri + " and " + authUri);
                                return false;
                            }
                        } else {
                            //看两边有没有包含关系,如果有，看长度是不是一样，有包含关系长度又不一样视为不相等
                            if ((uri.startsWith(authUri) || authUri.startsWith(uri))
                                    && uri.length() == authUri.length()) {
                                log.debug("checkRege " + uri + " and " + authUri);
                                return false;
                            }
                        }
                    }
                }
            }
        }
        return true;
    }


    /**
     *
     * @param listAll          listAll
     * @param resultMap        resultMap
     * @param authList         authlist
     */
    private void fetchAuthParent(List<SysAuth> listAll, Map<Long, SysAuth> resultMap, List<SysAuth> authList) {
        
        List<SysOperation> sysOperationList = sysOperationServiceImpl.getList(new SysOperation());
        Map<Long, SysOperation> sysOperationMap = CollectionsUtil.entityToMap(sysOperationList);
        SysOperation sysOperation;
        for (SysAuth bo : authList) {
            bo.setAuthShowType(SysAuthConstants.AUTH_TYPE);
            sysOperation = sysOperationMap.get(bo.getOperationId());
            if (sysOperation != null && DictConstants.OPRATION_CODE_VIEW.equals(sysOperation.getOperationCode())) {
                bo.setIsViewOperation(1);
            }
            resultMap.putIfAbsent(bo.getAuthId(), bo);
            if (bo.getFid() != null) {
                recurGetParentAuth(bo.getFid(), listAll, resultMap);
            }
        }
    }

    /**
     *
     * @param listAll           listAll
     * @param resultMap         resultMap
     * @param modelList        modeallist
     */
    private void fetchModelAuth(List<SysAuth> listAll, Map<Long, SysAuth> resultMap, List<SysModel> modelList) {
        for (SysModel sm : modelList) {
            SysAuth sms = sysModel2SysAuth(sm);
            resultMap.putIfAbsent(sms.getAuthId(), sms);
            if (sms.getFid() != null) {
                recurGetParentAuth(sms.getFid(), listAll, resultMap);
            }
        }
    }

    /**
     *
     * searchAuthList:(递归查询所有权限对应的列表). <br/>
     *
     * @author yuqing
     * @param sysAuth       sysAuth
     * @param listAll       listAll
     * @param resultMap     resultMap
     * @since V1.0.0
     */
    private void searchAuthList(SysAuth sysAuth, List<SysAuth> listAll, Map<Long, SysAuth> resultMap) {
        List<SysAuth> authList = sysAuthDao.getList(sysAuth);
        fetchAuthParent(listAll, resultMap, authList);
    }

    /**
     *
     * searchModelList:(递归查询所有模块对应的列表). <br/>
     *
     * @author yuqing
     * @param sysAuth         sysAuth
     * @param listAll         listAll
     * @param resultMap       resultMap
     * @since V1.0.0
     */
    private void searchModelList(SysAuth sysAuth, List<SysAuth> listAll,
                                 Map<Long, SysAuth> resultMap) {
        SysModel searchModel = sysAuth2SysModel(sysAuth);
        List<SysModel> modelList = sysModelDao.getList(searchModel);
        fetchModelAuth(listAll, resultMap, modelList);
    }

    @SuppressWarnings("SpringJavaAutowiredMembersInspection")
    @Autowired
    public void setSysAuthDao(SysAuthDao sysAuthDao) {
        this.sysAuthDao = sysAuthDao;
    }

    @SuppressWarnings("SpringJavaAutowiredMembersInspection")
    @Autowired
    public void setSysModelDao(SysModelDao sysModelDao) {
        this.sysModelDao = sysModelDao;
    }

    @SuppressWarnings("SpringJavaAutowiredMembersInspection")
    @Autowired
    public void setSysRoleServiceImpl(SysRoleServiceImpl sysRoleServiceImpl) {
        this.sysRoleServiceImpl = sysRoleServiceImpl;
    }

    @SuppressWarnings("SpringJavaAutowiredMembersInspection")
    @Autowired
    public void setSysUserServiceImpl(SysUserServiceImpl sysUserServiceImpl) {
        this.sysUserServiceImpl = sysUserServiceImpl;
    }


    public SysOperationServiceImpl getSysOperationServiceImpl() {
        return sysOperationServiceImpl;
    }

    @Autowired
    public void setSysOperationServiceImpl(SysOperationServiceImpl sysOperationServiceImpl) {
        this.sysOperationServiceImpl = sysOperationServiceImpl;
    }
    
    
    
}

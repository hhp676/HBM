/*
 * Project Name:hbm-be.
 * File Name:SysUserServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.hginfo.hbm.core.utils.SecurityLevelUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hutils.password.CheckResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hbm.base.BizEntity;
import com.hginfo.hbm.base.RelEntity;
import com.hginfo.hbm.base.entity.sys.SysAccount;
import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysGroupUser;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.base.entity.sys.SysOperation;
import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysStaffInfo;
import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.SysUserAuth;
import com.hginfo.hbm.base.entity.sys.SysUserPasswordFound;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysUserPasswordFoundService;
import com.hginfo.hbm.base.service.sys.SysUserService;
import com.hginfo.hbm.base.utils.CollectionsUtil;
import com.hginfo.hbm.base.vo.FrontEndType;
import com.hginfo.hbm.base.vo.SysMenu;
import com.hginfo.hbm.be.dao.sys.SysAuthDao;
import com.hginfo.hbm.be.dao.sys.SysUserDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.be.service.prop.CascadePropLoadUtil;
import com.hginfo.hbm.core.annotation.SysLog;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.core.constants.SysAuthConstants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.verification.VerificationCode;
import com.hginfo.hbm.core.verification.VerificationCodeCoordinatorSender;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.DateTimeUtil;

/**
 * 用户表: sys_user. <br />
 * service impl 层 <br />
 * Date: 2016年11月29日 下午3:43:44 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysUserServiceImpl extends BizService<SysUser, SysUserDao> implements SysUserService {

    /**
     *
     */
    private static final Log LOG = LogFactory
            .getLog(SysUserService.class);

    /**
     * 默认前端类型。
     */
    private FrontEndType frontEndType = FrontEndType.easyui;

    /**
     *
     */
    @Autowired
    private SysModelServiceImpl sysModelServiceImpl;

    /**
     *
     */
    @Autowired
    private SysOperationServiceImpl sysOperationServiceImpl;

    /**
     *
     */
    @Autowired
    private SysRoleServiceImpl sysRoleServiceImpl;

    /**
     *
     */
    @Autowired
    private SysAuthDao sysAuthDao;

    /**
     *
     */
    @Autowired
    private SysUserDao sysUserDao;

    /**
     *
     */
    @Autowired
    private SysAccountServiceImpl sysAccountServiceImpl;

    /**
     *
     */
    @Autowired
    private SysStaffInfoServiceImpl sysStaffInfoServiceImpl;

    /**
     *
     */
    @Autowired
    private SysUserAuthServiceImpl sysUserAuthServiceImpl;

    /**
     *
     */
    @Autowired
    private SysUserRoleServiceImpl sysUserRoleServiceImpl;

    /**
     *
     */
    @Autowired
    private SysUserPositionServiceImpl sysUserPositionServiceImpl;

    /**
     *
     */
    @Autowired
    private SysPositionServiceImpl sysPositionServiceImpl;

    /**
     *
     */
    @Autowired
    private SysGroupUserServiceImpl sysGroupUserServiceImpl;

    /**
     *
     */
    @Autowired
    private SysUserPasswordFoundService sysUserPasswordFoundService;

    /**
     *
     */
    @Autowired
    private SysUserProfileServiceImpl sysUserProfileServiceImpl;

    /**
     * 发送验证码。
     */
    @Autowired
    private VerificationCodeCoordinatorSender codeSender;

    @Override
    public SysUser get(Long primaryKey) {

        return super.get(primaryKey);
    }

    @Override
    public BaseEntity getProp(final String prop, final Class<?> propClass, final Long id) {
        if ("staffInfo".equals(prop)) {
            return sysStaffInfoServiceImpl.getByUserId(id);
        }
        if ("userAccount".equals(prop)) {
            return sysAccountServiceImpl.getByUserId(id);
        }
        return super.getProp(prop, propClass, id);
    }

    /**
     * 获取当前用户顶级导航菜单列表。
     * 获取有权限的全部顶部菜单，最后生成树。
     */
    @Override
    public List<SysMenu> getTopMenuList(FrontEndType feType) {
        this.frontEndType = feType;
        List<SysMenu> topMenuList = getFlatTopMenuList();
        return listToMenuTree(topMenuList, DictConstants.TOP_MODEL_FID);
    }

    /**
     * 获取当前用户顶部扁平菜单列表。
     *
     * @return 菜单列表
     * @author licheng
     * @since V1.0.0
     */
    private List<SysMenu> getFlatTopMenuList() {
        List<SysMenu> topMenuList = new ArrayList<>();

        Map<Long, SysAuth> myViewAuthMap = getViewAuthMap();
        SysModel filter = new SysModel();
        filter.setOrderStr("sm.SORT_NO_ asc");
        filter.setIsVisible(DictConstants.IS_VISIBLE_TRUE);
        this.setTopMenuFilter(filter, DictConstants.TRUE);
        List<SysModel> sysModelList = sysModelServiceImpl.getList(filter);

        for (SysModel sysModel : sysModelList) {
            if (myViewAuthMap.containsKey(sysModel.getModelId())) {
                topMenuList.add(new SysMenu(sysModel));
            }
        }
        return topMenuList;
    }

    /**
     * 获取当前类下的左侧菜单树。
     * 获取父ID菜单和子树
     */
    @Override
    public SysMenu getSubMenuList(Long parentId, FrontEndType feType) {
        this.frontEndType = feType;
        List<SysMenu> topMenuList = getFlatTopMenuList();
        List<SysMenu> thisMenuList = topMenuList.stream()
                .filter(o -> o.getModelId().equals(parentId)).collect(Collectors.toList());
        Assert.isTrue(thisMenuList != null && !thisMenuList.isEmpty());
        SysMenu parentMenu = thisMenuList.get(Constants.ZERO);

        List<SysMenu> subMenuList = new ArrayList<>();
        Map<Long, SysAuth> myViewAuthMap = getViewAuthMap();
        SysModel filter = new SysModel();
        filter.setOrderStr("sm.SORT_NO_ asc");
        filter.setIsVisible(DictConstants.IS_VISIBLE_TRUE);
        this.setSubMenuFilter(filter, DictConstants.TRUE);
        List<SysModel> sysModelList = sysModelServiceImpl.getList(filter);

        for (SysModel sysModel : sysModelList) {
            if (myViewAuthMap.containsKey(sysModel.getModelId())) {
                sysModel.setUri(myViewAuthMap.get(sysModel.getModelId()).getUri());
                subMenuList.add(new SysMenu(sysModel));
            }
        }
        List<SysMenu> sysMenuList = listToMenuTree(subMenuList, parentId);

        parentMenu.setSubMenuList(sysMenuList);
        return parentMenu;
    }

    @Override
    public List<SysMenu> getSubMenuTree(Long parentId, FrontEndType feType) {
        this.frontEndType = feType;
        List<SysMenu> subMenuList = new ArrayList<>();

        Map<Long, SysAuth> myViewAuthMap = getViewAuthMap();
        SysModel filter = new SysModel();
        filter.setOrderStr("sm.SORT_NO_ asc");
        filter.setIsVisible(DictConstants.IS_VISIBLE_TRUE);
        this.setSubMenuFilter(filter, DictConstants.TRUE);
        List<SysModel> sysModelList = sysModelServiceImpl.getList(filter);

        for (SysModel sysModel : sysModelList) {
            if (myViewAuthMap.containsKey(sysModel.getModelId())) {
                sysModel.setUri(myViewAuthMap.get(sysModel.getModelId()).getUri());
                subMenuList.add(new SysMenu(sysModel));
            }
        }
        List<SysMenu> sysMenuList = listToMenuTree(subMenuList, parentId);
        return sysMenuList;
    }

    @Override
    public List<SysMenu> getFlatMenuList(FrontEndType feType) {
        this.frontEndType = feType;
        Map<Long, SysAuth> myViewAuthMap = getViewAuthMap();
        List<SysMenu> sysMenuList = new ArrayList<>();

        SysModel filter = new SysModel();
        filter.setIsVisible(DictConstants.IS_VISIBLE_TRUE);
        this.setTopMenuFilter(filter, DictConstants.TRUE);
        List<SysModel> topMenuList = sysModelServiceImpl.getList(filter);
        this.setTopMenuFilter(filter, null);
        this.setSubMenuFilter(filter, DictConstants.TRUE);
        List<SysModel> leftMenuList = sysModelServiceImpl.getList(filter);
        List<SysModel> allMenuList = com.hginfo.hutils.CollectionsUtil.union(topMenuList,
                leftMenuList);

        for (SysModel sysModel : allMenuList) {
            if (myViewAuthMap.containsKey(sysModel.getModelId())) {
                sysModel.setUri(myViewAuthMap.get(sysModel.getModelId()).getUri());
                sysMenuList.add(new SysMenu(sysModel));
            }
        }
        return sysMenuList;
    }

    /**
     * 设置顶部菜单查询条件。
     *
     * @param filter filter
     * @param value  value
     * @author licheng
     * @since V1.0.0
     */
    private void setTopMenuFilter(SysModel filter, Integer value) {
        if (frontEndType.equals(FrontEndType.easyui)) {
            filter.setIsTopMenu(value);
        } else if (frontEndType.equals(FrontEndType.bootstrap)) {
            filter.setIsBsTopMenu(value);
        }
    }

    /**
     * 设置子菜单查询条件。
     *
     * @param filter filter
     * @param value  value
     * @author licheng
     * @since V1.0.0
     */
    private void setSubMenuFilter(SysModel filter, Integer value) {
        if (frontEndType.equals(FrontEndType.easyui)) {
            filter.setIsSubMenu(value);
        } else if (frontEndType.equals(FrontEndType.bootstrap)) {
            filter.setIsBsSubMenu(value);
        }
    }

    /**
     * 获取当前用户的访问权限：uri已经设置为第一条uri。
     *
     * @return 当权用户的访问权限 <模块ID，权限对象>
     * @author licheng
     * @since V1.0.0
     */
    private Map<Long, SysAuth> getViewAuthMap() {
        //
        Map<Long, SysAuth> sysAuthViewMap = new HashMap<>();

        List<SysAuth> sysAuthList = new ArrayList<>();
        if (sysAccountServiceImpl.isSuperAdmin(CurrentUserUtils.getUserId())) {
            SysAuth param = new SysAuth();
            param.setIsDelete(0);
            sysAuthList = sysAuthDao.getList(param);
        } else {
            sysAuthList = getAllSysAuth(SysAuthConstants.AUTH_USER_AUTH_MAIN,
                    CurrentUserUtils.getUserId());
        }
        List<SysOperation> sysOperationList = sysOperationServiceImpl.getList(new SysOperation());
        Map<Long, SysOperation> sysOperationMap = CollectionsUtil.entityToMap(sysOperationList);
        for (SysAuth sysAuth : sysAuthList) {
            SysOperation sysOperation = sysOperationMap.get(sysAuth.getOperationId());
            if (sysOperation != null
                    && DictConstants.OPRATION_CODE_VIEW.equals(sysOperation.getOperationCode())) {
                if (!sysAuthViewMap.containsKey(sysAuth.getModelId())) {
                    if (sysAuth.getUri() != null) {
                        sysAuth
                                .setUri(sysAuth.getUri().split(SysAuthConstants.AUTH_URI_SEPARATOR)[0]);
                    }
                    sysAuthViewMap.put(sysAuth.getModelId(), sysAuth);
                }
            }
        }
        return sysAuthViewMap;
    }

    /**
     * 将菜单列表转换为菜单树。
     *
     * @param menuList 菜单列表
     * @param topId    顶级ID
     * @return 菜单树
     * @author licheng
     * @since V1.0.0
     */
    private List<SysMenu> listToMenuTree(List<SysMenu> menuList, Long topId) {

        List<SysMenu> topMenuTree = new ArrayList<>();
        recursionToMenuTree(topMenuTree, menuList, topId);

        return topMenuTree;
    }

    /**
     * 递归设置树结点，深度优先。
     *
     * @param topMenuList 当前级别列表
     * @param menuList    menuList
     * @param fid         父ID
     * @author licheng
     * @since V1.0.0
     */
    private void recursionToMenuTree(List<SysMenu> topMenuList, List<SysMenu> menuList, Long fid) {
        List<SysMenu> children = menuList.stream().filter(menu -> fid.equals(menu.getFid()))
                .collect(Collectors.toList());
        if (children == null) {
            return;
        }
        for (SysMenu sysMenu : children) {
            sysMenu.setSubMenuList(new ArrayList<>());
            recursionToMenuTree(sysMenu.getSubMenuList(), menuList, sysMenu.getModelId());
            topMenuList.add(sysMenu);
        }
    }

    /**
     * 根据用户编号获取全部用户权限. <br/>
     *
     * @param userid
     * @param type   1:查询所有权限(包括附属权限)  null/其他：查询主权限
     * @return List List
     * @author Administrator
     * @since V1.0.0
     */
    @Override
    public List<SysAuth> getAllSysAuth(Integer type, long userid) {
        return sysAuthDao.getAllSysAuthByUserId(type, userid);
    }

    @Override
    public List<SysRole> getAllSysRole(long userid) {
        return sysRoleServiceImpl.getRolesByUser(userid);
    }

    @Override
    public Page<SysUser> getPageList(BasePage<SysUser> basePage, SysUser filter,
                                     final String... loadProps) {
        SysUser realFilter = filter == null ? new SysUser()
                : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, realFilter, loadProps);
    }

    @Override
    public Page<SysUser> getWinPageList(final BasePage<SysUser> pageInfo, final SysUser filter,
                                        final String... loadProps) {

        SysUser realFilter = filter == null ? new SysUser()
                : filter;
        realFilter.setIsDelete(0);
        pageInfo.setFilters(realFilter);

        Page<SysUser> pageList = getDao().pageQuery("getWinList", pageInfo);
        if (loadProps != null && loadProps.length > 0) {
            pageList.getResult().forEach(e -> CascadePropLoadUtil.loadProps(e, loadProps));
        }

        return pageList;
    }

    @Override
    public Page<SysUser> getPageListByAuthId(BasePage<SysUser> basePage, SysUserAuth formFilter) {
        Page<SysUser> pageList;
        Long authId = formFilter.getAuthId();
        if (null == authId) {
            pageList = new Page<>(basePage, 0);
        } else {
            SysUser filter = new SysUser();
            filter.setIsDelete(0);
            basePage.parseFilterRules(filter);
            String filterStr = filter.getFilterStr();
            filter.setFilterStr(filterStr + formatFilter(formFilter));
            basePage.setFilters(filter);
            pageList = getDao().pageQuery("getPageListByAuthId", basePage);
            for (SysUser sysUser : pageList.getResult()) {
                SysPosition sysPosition = sysPositionServiceImpl.get(sysUser.getPositionId(), "sysOrganization");
                sysUser.setUserPosition(sysPosition);
            }
        }
        return pageList;
    }

    /**
     * 设置创建人实体对象。
     *
     * @param list list
     * @author licheng
     * @since V1.0.0
     */
    public void setRelCrtUser(List<? extends RelEntity> list) {
        for (RelEntity entity : list) {
            entity.setCrtUser(this.get(entity.getCrtUserId()));
        }
    }

    /**
     * 设置创建人实体对象。
     *
     * @param list list
     * @author licheng
     * @since V1.0.0
     */
    public void setBizCrtUser(List<? extends BizEntity> list) {
        for (BizEntity entity : list) {
            entity.setCrtUser(this.get(entity.getCrtUserId()));
        }
    }

    /**
     * 设置更新人实体对象。
     *
     * @param list list
     * @author licheng
     * @since V1.0.0
     */
    public void setBizUpdUser(List<? extends BizEntity> list) {
        for (BizEntity entity : list) {
            entity.setUpdUser(this.get(entity.getUpdUserId()));
        }
    }

    /**
     * formatFilter. <br/>
     *
     * @param formFilter
     * @return filterStr
     * @author yuqing
     * @since V1.0.0
     */
    private String formatFilter(SysUserAuth formFilter) {
        StringBuilder sb = new StringBuilder("");
        if (null != formFilter.getAuthId()) {
            sb.append(" AND sua.AUTH_ID_ = ").append(formFilter.getAuthId()).append(" ");
        }
        if (null != formFilter.getAuthType()) {
            sb.append(" AND sua.AUTH_TYPE_ = ").append(formFilter.getAuthType()).append(" ");
        }
        return sb.toString();
    }

    @Override
    public SysUser createUser(SysUser user) {
        super.add(user);
        //增加账户信息
        SysAccount account = user.getUserAccount();
        CheckResult checkResult = SecurityLevelUtil.checkPassword(account.getLoginName(),account.getLoginPwd());
        if (!checkResult.isValid()){
            throw new BaseRuntimeException(checkResult.getMsg());
        }
        account.setLoginPwd(
                sysAccountServiceImpl.encryptPassword(account.getLoginPwd(), account.getLoginName()));
        account.setUserId(user.getUserId());
        sysAccountServiceImpl.add(account);
        //增加员工信息
        SysStaffInfo staffInfo = user.getStaffInfo();
        staffInfo.setUserId(user.getUserId());
        staffInfo.setEntryTime(DateTimeUtil.convertDateStringToDate(staffInfo.getEntryTimeStr()));
        staffInfo.setQuitTime(DateTimeUtil.convertDateStringToDate(staffInfo.getQuitTimeStr()));
        //存在离职时间,且小于当前时间时,重设在职状态
        if (staffInfo.getQuitTime() != null && staffInfo.getQuitTime().before(new Date())) {
            staffInfo.setStaffStatus(0);
        }
        sysStaffInfoServiceImpl.add(staffInfo);
        //角色
        sysUserRoleServiceImpl.doRefresh(user.getUserId(), user.getRoleIds());
        //权限
        sysUserAuthServiceImpl.doRefresh(user.getUserId(), user.getAuthIds(),
                SysAuthConstants.GRANT_AUTH_TYPE_PLUS);
        sysUserAuthServiceImpl.doRefresh(user.getUserId(), user.getnAuthIds(),
                SysAuthConstants.GRANT_AUTH_TYPE_MINUS);

        //岗位
        sysUserPositionServiceImpl.doRefresh(user.getUserId(), user.getPositionIds());
        //用户组
        sysGroupUserServiceImpl.doRefresh(user.getUserId(), user.getGroupIds());

        return user;
    }

    @Override
    public SysUser editUser(SysUser user) {
        super.update(user);
        //修改账户信息
        SysAccount account = user.getUserAccount();
        account.setLoginPwd(null);
        account.setAccountId(sysAccountServiceImpl.getByUserId(user.getUserId()).getAccountId());
        sysAccountServiceImpl.update(account);
        //修改员工信息
        SysStaffInfo staffInfo = user.getStaffInfo();
        staffInfo.setStaffId(sysStaffInfoServiceImpl.getByUserId(user.getUserId()).getStaffId());
        staffInfo.setEntryTime(DateTimeUtil.convertDateStringToDate(staffInfo.getEntryTimeStr()));
        staffInfo.setQuitTime(DateTimeUtil.convertDateStringToDate(staffInfo.getQuitTimeStr()));
        //存在离职时间,且小于当前时间时,重设在职状态
        if (staffInfo.getQuitTime() != null && staffInfo.getQuitTime().before(new Date())) {
            staffInfo.setStaffStatus(0);
        }
        sysStaffInfoServiceImpl.editSysStaffInfo(staffInfo);
        //修改角色
        sysUserRoleServiceImpl.doRefresh(user.getUserId(), user.getRoleIds());

        //修改权限
        sysUserAuthServiceImpl.doRefresh(user.getUserId(), user.getAuthIds(),
                SysAuthConstants.GRANT_AUTH_TYPE_PLUS);
        sysUserAuthServiceImpl.doRefresh(user.getUserId(), user.getnAuthIds(),
                SysAuthConstants.GRANT_AUTH_TYPE_MINUS);

        //修改岗位
        sysUserPositionServiceImpl.doRefresh(user.getUserId(), user.getPositionIds());
        //用户组
        sysGroupUserServiceImpl.doRefresh(user.getUserId(), user.getGroupIds());
        return user;
    }

    @Override
    public void delete(long id) {
        //删除岗位关联关系
        SysUserPosition userPosition = new SysUserPosition();
        userPosition.setUserId(id);
        sysUserPositionServiceImpl.deleteBatch(userPosition);

        //删除用户对应用户组信息
        SysGroupUser groupUser = new SysGroupUser();
        groupUser.setUserId(id);
        sysGroupUserServiceImpl.deleteBatch(groupUser);

        //删除用户对应角色信息
        SysUserRole userRole = new SysUserRole();
        userRole.setUserId(id);
        sysUserRoleServiceImpl.deleteBatch(userRole);

        //删除用户对应权限信息
        SysUserAuth userAuth = new SysUserAuth();
        userAuth.setUserId(id);
        sysUserAuthServiceImpl.deleteBatch(userAuth);
        //删除用户
        super.delete(id);
        SysAccount delAccount = sysAccountServiceImpl.getByUserId(id);
        sysAccountServiceImpl.delete(delAccount.getId());

    }

    @Override
    public SysUser getUserById(long userId) {
        return get(userId, "staffInfo", "userAccount");
    }

    @Override
    public void updateUserPwd(long userId, String newPwd) {
        SysAccount account = sysAccountServiceImpl.getByUserId(userId);
        CheckResult checkResult = SecurityLevelUtil.checkPassword(account.getLoginName(),newPwd);
        if (!checkResult.isValid()){
            throw new BaseRuntimeException(checkResult.getMsg());
        }
        SysAccount updateVo = new SysAccount();
        String newEncryptpwd = sysAccountServiceImpl.encryptPassword(newPwd,
                account.getLoginName());
        updateVo.setLoginPwd(newEncryptpwd);
        updateVo.setAccountId(account.getAccountId());
        sysAccountServiceImpl.update(updateVo);
    }

    @Override
    public SysUser getUserByUserName(String userName) {
        SysUser query = new SysUser();
        query.setUserName(userName);
        List<SysUser> sysUserList = this.getList(query);
        return sysUserList.isEmpty() ? null : sysUserList.get(Constants.ZERO);
    }

    @Override
    public SysUser getUserByLoginName(String loginName) {
        return sysUserDao.getUserByLoginName(loginName);
    }

    @Override
    public List<Map<String, Object>> getUserEntryGroup(Map vo) {
        return sysUserDao.getUserEntryGroup(vo);
    }

    @Override
    public List<Map<String, Object>> getUserQuitGroup(Map vo) {
        return sysUserDao.getUserQuitGroup(vo);
    }

    @Override
    @SysLog(key1 = "找回密码发送验证码")
    public void sendVfcode(SysUser sysUser, String loginName, String vfCode, String actionUrl,
                           String ip) {

        SysUserPasswordFound found = new SysUserPasswordFound();
        found.setLoginName(loginName);
        found.setEmail(sysUser.getEmail());
        found.setVerificationCode(vfCode);
        found.setIp(ip);
        sysUserPasswordFoundService.add(found);

        //发送邮件验证码
        VerificationCode code = new VerificationCode();
        code.setOperationName("申请找回密码");
        code.setVerificationCode(vfCode);
        code.setActionUrl(actionUrl);

        codeSender.send(sysUser, code);

    }

}

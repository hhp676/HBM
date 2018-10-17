
/**
* Project Name:hbm-be.
* File Name:SysRoleServiceImpl.java
* Package Name:com.hginfo.hbm.be.service.impl.sys
* Date:2016年11月29日 下午3:43:44
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysRole;
import com.hginfo.hbm.base.entity.sys.SysRoleAuth;
import com.hginfo.hbm.base.entity.sys.SysUserRole;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysRoleService;
import com.hginfo.hbm.be.dao.sys.SysRoleDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.core.annotation.SysLog;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hdubbo.annotation.HService;

/**
* 系统角色表: sys_role. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysRoleServiceImpl extends BizService<SysRole, SysRoleDao> implements SysRoleService {
    
    /**
     * 
     */
    @Autowired
    private SysRoleDao             sysRoleDao;
    
    /**
     * 
     */
    @Autowired
    private SysUserRoleServiceImpl sysUserRoleServiceImpl;
    
    /**
     * 
     */
    @Autowired
    private SysRoleAuthServiceImpl sysRoleAuthServiceImpl;
    
    @Override
    public List<SysRole> getList(SysRole filter, String... loadProps) {
        filter.setIsDelete(Constants.ZERO);
        return super.getList(filter, loadProps);
    }
    
    @Override
    public Page<SysRole> getPageList(BasePage<SysRole> basePage, SysRole filter,
        final String... loadProps) {
        filter.setIsDelete(Constants.ZERO);
        return super.getPageList(basePage, filter, loadProps);
    }
    
    @Override
    public List<SysRole> getRolesByAuth(Long authId) {
        return sysRoleDao.getRolesByAuth(authId);
    }
    
    @Override
    public List<SysRole> getRolesByUser(Long userId) {
        return sysRoleDao.getRolesByUser(userId);
    }
    
    @Override
    public Page<SysRole> getPageListByAuthId(BasePage<SysRole> basePage, SysRoleAuth formFilter) {
        Page<SysRole> pageList = null;
        Long authId = formFilter.getAuthId();
        if (null == authId) {
            pageList = new Page<SysRole>(basePage, 0);
        } else {
            SysRole filter = new SysRole();
            filter.setIsDelete(0);
            basePage.parseFilterRules(filter);
            String filterStr = filter.getFilterStr();
            filter.setFilterStr(filterStr + " AND sra.AUTH_ID_ = " + authId);
            basePage.setFilters(filter);
            pageList = sysRoleDao.pageQuery("getPageListByAuthId", basePage);
        }
        return pageList;
    }
    
    @Override
    public Page<SysRole> getPageListByUserId(BasePage<SysRole> basePage, SysUserRole formFilter) {
        
        SysRole filter = new SysRole();
        filter.setIsDelete(0);
        filter.setFilterStr(" AND sur.USER_ID_  = " + formFilter.getUserId());
        basePage.setFilters(filter);
        return sysRoleDao.pageQuery("getPageListByUserId", basePage);
        
    }
    
    @SysLog(content = "角色更新", logType = DictConstants.SYSLOG_TYPE_CALL, key1 = "KEY")
    @Override
    public void update(SysRole e) {
        super.update(e);
    }
    
    @Override
    public void delete(long id) {
        super.delete(id);
        SysUserRole userRoleFilter = new SysUserRole();
        userRoleFilter.setRoleId(id);
        sysUserRoleServiceImpl.deleteBatch(userRoleFilter);
        
        SysRoleAuth roleAuthFilter = new SysRoleAuth();
        roleAuthFilter.setRoleId(id);
        sysRoleAuthServiceImpl.deleteBatch(roleAuthFilter);
    }
    
}
